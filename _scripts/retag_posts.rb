#!/usr/bin/env ruby
# Suggests a controlled-vocabulary category for every post in _posts/, for human review.
# Does NOT write to any post file — output is a CSV to check/correct by hand, then apply
# separately once reviewed. Malayalam detection is Unicode-range based (near-certain);
# everything else is a keyword-count heuristic and should be treated as a starting guess.
#
# Usage: ruby _scripts/retag_posts.rb > _scripts/retag-suggestions.csv

require 'yaml'
require 'csv'
require 'date'

POSTS_DIR = File.join(__dir__, '..', '_posts')
CATEGORIES = %w[politics policy philosophy malayalam personal books tech].freeze

MALAYALAM_RANGE = (0x0D00..0x0D7F).freeze
MALAYALAM_CHAR_THRESHOLD = 15

KEYWORDS = {
  'politics' => %w[
    election elections government party parliament democracy vote voting
    minister ministry bjp congress rss cpm cpi caste communal religion secular
    protest rights nation nationalism governance modi gandhi nehru independence
    freedom struggle riot lynching
  ],
  'policy' => %w[
    policy bill act ordinance legislation regulation scheme subsidy welfare
    caa nrc csr law court judgment judgement constitution reservation
    lockdown vaccination pandemic budget tax
  ],
  'philosophy' => %w[
    existential meaning truth ethics moral morality philosophy philosophical
    metaphysics consciousness god atheism atheist belief rationality rational
    socrates nietzsche camus sartre absurd existence nihilism purpose
    epistemology logic reason
  ],
  'personal' => %w[
    diary letter memoir birthday wedding family friend friends college school
    exam upsc interview childhood memory memories relationship love heartbreak
    myself reflection journal grief loss
  ],
  'books' => %w[
    book books novel author read reading review chapter wrote story fiction
    literature poem poetry paperback library author novelist writer
  ],
  'tech' => %w[
    technology computer internet software code coding programming app website
    algorithm data api machine learning neural network ai artificial
    intelligence robot startup gadget device esp8266 arduino sensor
  ]
}.freeze

def malayalam_char_count(text)
  text.each_char.count { |c| MALAYALAM_RANGE.include?(c.ord) }
end

def keyword_scores(text)
  words = text.downcase.scan(/[a-z']+/)
  freq = Hash.new(0)
  words.each { |w| freq[w] += 1 }
  KEYWORDS.each_with_object({}) do |(cat, kws), scores|
    scores[cat] = kws.sum { |kw| kw.include?(' ') ? (text.downcase.scan(kw).length) : freq[kw] }
  end
end

rows = []

Dir.children(POSTS_DIR).sort.each do |fname|
  path = File.join(POSTS_DIR, fname)
  next unless File.file?(path)

  raw = File.read(path, encoding: 'UTF-8')
  parts = raw.split(/^---\s*$/, 3)
  next if parts.length < 3

  front_matter = YAML.safe_load(parts[1], permitted_classes: [Date, Time]) || {}
  body = parts[2]

  title = front_matter['title'].to_s
  existing_categories = Array(front_matter['categories']).join('|')
  existing_tags = Array(front_matter['tags']).join('|')
  date = front_matter['date'].to_s

  full_text = "#{title} #{body}"
  mal_count = malayalam_char_count(full_text)
  is_malayalam = mal_count >= MALAYALAM_CHAR_THRESHOLD

  already_classified =
    !existing_categories.empty? ||
    Array(front_matter['tags']).map(&:to_s).any? { |t| CATEGORIES.include?(t.downcase) || t.downcase == 'malayalam-1' }

  if is_malayalam
    suggestion = 'malayalam'
    method = 'unicode-detected'
    detail = "#{mal_count} Malayalam-range chars"
  else
    scores = keyword_scores(full_text)
    ranked_all = scores.sort_by { |_, v| -v }
    top_cat, top_score = ranked_all[0]
    runner_up_score = ranked_all[1][1]
    ranked = ranked_all.first(3).select { |_, v| v > 0 }
    detail = ranked.map { |c, v| "#{c}:#{v}" }.join(', ')

    if top_score == 0
      suggestion = ''
      method = 'no-match'
      detail = 'no keyword hits — needs manual read'
    elsif top_score < 3 || top_score == runner_up_score
      suggestion = ''
      method = 'weak-match'
      detail = "too close to call (#{detail}) — needs manual read"
    else
      suggestion = top_cat
      method = 'keyword-heuristic'
    end
  end

  rows << {
    'file' => fname,
    'date' => date,
    'title' => title,
    'existing_categories' => existing_categories,
    'existing_tags' => existing_tags,
    'already_classified' => already_classified,
    'suggested_category' => suggestion,
    'method' => method,
    'detail' => detail,
    'final_category' => already_classified ? existing_categories : suggestion
  }
end

CSV do |csv|
  headers = %w[file date title existing_categories existing_tags already_classified
               suggested_category method detail final_category]
  csv << headers
  rows.each { |r| csv << headers.map { |h| r[h] } }
end

needs_review = rows.count { |r| !r['already_classified'] && %w[no-match weak-match].include?(r['method']) }
warn "#{rows.length} posts processed. #{rows.count { |r| r['already_classified'] }} already classified, " \
     "#{rows.count { |r| r['suggested_category'] == 'malayalam' }} Malayalam-detected, " \
     "#{rows.count { |r| r['method'] == 'keyword-heuristic' }} keyword-suggested, " \
     "#{needs_review} need manual review (no-match or too-close-to-call)."
