#!/usr/bin/env ruby
# Inserts/replaces a `categories: [x]` line in a post's front matter without
# touching anything else in the file (no full YAML re-serialization, to avoid
# reformatting diffs across files this script didn't need to change).
#
# Usage: ruby _scripts/apply_categories.rb mapping.csv
# mapping.csv: two columns, no header — filename,category

require 'csv'
require 'yaml'
require 'date'

POSTS_DIR = File.join(__dir__, '..', '_posts')
mapping_file = ARGV[0] or abort 'usage: apply_categories.rb mapping.csv'

CSV.foreach(mapping_file) do |fname, category|
  next if fname.nil? || fname.strip.empty?

  path = File.join(POSTS_DIR, fname.strip)
  unless File.file?(path)
    warn "skip (not found): #{fname}"
    next
  end

  raw = File.read(path, encoding: 'UTF-8')
  parts = raw.split(/^---\s*$/, 3)
  if parts.length < 3
    warn "skip (no front matter): #{fname}"
    next
  end

  front = parts[1]
  body = parts[2]
  new_line = "categories: [#{category.strip}]"

  if front =~ /^categories:.*$/
    # Replace the categories: line and any following block-list items (- foo)
    front = front.sub(/^categories:.*(\n^- .*)*/, new_line)
  else
    # Always prepend at the top of front matter rather than inserting after
    # title: — some titles are YAML folded scalars spanning multiple lines,
    # and inserting mid-value there breaks the fold and produces invalid YAML.
    front = "#{new_line}\n#{front}"
  end

  # Always exactly one leading newline after the opening `---`, regardless of
  # which branch above ran — a missing newline here silently produces a
  # `---categories: [x]` line, which is invalid YAML.
  front = "\n#{front.sub(/\A\n+/, '')}"

  begin
    parsed_ok = !!YAML.safe_load(front, permitted_classes: [Date, Time])
  rescue Psych::SyntaxError => e
    parsed_ok = false
    warn "  (parse error: #{e.message})"
  end
  unless parsed_ok
    warn "skip (front matter failed to parse after edit): #{fname}"
    next
  end

  if body =~ /\A\s*---\s*\n/
    warn "note: #{fname} has a second '---' block right after front matter " \
         '(pre-existing double front-matter — check this file by hand)'
  end

  File.write(path, "---#{front}---#{body}", encoding: 'UTF-8')
  warn "updated: #{fname} -> #{category.strip}"
end
