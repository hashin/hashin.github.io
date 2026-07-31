# Writing a post on this blog — everything you can use

A reference for writing `_posts/*.markdown` files on this site (Jekyll +
kramdown, GFM input mode, rouge syntax highlighting). Covers standard
Markdown/GFM, raw HTML that's already styled by this theme, and the
site-specific custom features (footnotes, Malayalam, categories, search).

## Front matter — every field explained

```yaml
---
layout: post
title:  Some new essay.
date: '2026-07-30 10:00:00'
categories: [politics, philosophy]
image: 'https://example.com/some-image.jpg'
published: true
---
```

| Field | Required | What it actually does |
|---|---|---|
| `layout: post` | **Yes** | Everything else in this guide assumes this layout. |
| `title:` | Yes | Displayed as the `<h1>` and page `<title>`. **Does not affect the URL** — see Permalinks below, this trips people up. |
| `date:` | Yes | Determines the `/year/month/day/` part of the URL and the displayed date. Format `'YYYY-MM-DD HH:MM:SS'` (quoted). **This can differ from the date in your filename** — Jekyll uses `date:` for everything if present, the filename date is only a fallback. Keep them in sync unless you have a specific reason not to (see Permalinks). |
| `categories:` | Recommended | A YAML list, e.g. `[politics, philosophy]`. **Multiple values are fully supported** — a post can belong to more than one. Drives: the tag pills on the homepage/category pages, which `/category/<slug>/` archive pages the post appears on, and category-scoped search. Stick to the **7 controlled slugs**: `politics, policy, philosophy, malayalam, personal, books, tech`. Anything outside that list won't get a tag pill or archive page (it'll still be a valid category, just invisible in the nav). |
| `tags:` | No, don't bother | Legacy freeform field from pre-2018 posts. Still technically read and folded into search text if present, but nothing in the current UI surfaces it separately from `categories:`. Just use `categories:` going forward. |
| `image:` | Optional | **Not shown inline in the post.** Only feeds `og:image`/`twitter:image` — i.e. the preview image when the post link is shared on social media/Slack/iMessage. If you want an image to actually appear *in* the post, embed it in the body with normal Markdown image syntax (see below) — that's a separate thing from this field. |
| `published:` | Optional | `false` hides the post from the built site entirely (it still exists in the repo, just never rendered). Useful for parking a finished-but-not-ready post without moving it to `_drafts/`. Omit the field entirely (don't write `published: true`) for normal posts — `true` is the default. |

## Permalinks — how the URL is actually built

The URL is `/YYYY/MM/DD/<slug>/`, where:
- **`YYYY/MM/DD` comes from the `date:` front-matter field**, not the filename.
- **`<slug>` comes from the filename**, not the `title:` field — specifically,
  the filename with the leading `YYYY-MM-DD-` date prefix and the `.markdown`
  extension stripped.

These two facts mean the filename's date and the front-matter `date:` are
**independent** and can drift apart. This isn't hypothetical — it's already
happened on this site: `_posts/2024-12-17-pseudo-culturism-must-be-exposed.markdown`
has `date: '2024-12-07 10:51:39'` in its front matter, so the live URL is
`/2024/12/07/pseudo-culturism-must-be-exposed/` — the day is 07 in the URL
even though the filename says 17. Not a bug, just worth knowing so you're
not surprised when a post's URL doesn't match its filename or its title.

**Practical takeaway**: name your file `YYYY-MM-DD-a-short-slug.markdown`
with the date you actually want, and don't rely on the `title:` field to
predict the URL — the slug is whatever you typed in the filename.

## Standard Markdown / GFM — what's supported

kramdown is configured with `input: GFM`, so you get GitHub-Flavored
Markdown on top of standard Markdown:

- **Headings** `#` through `######` — but note `article.post` already
  renders `title:` as an `<h1>`, so **start post body headings at `##`** to
  keep the hierarchy correct.
- **Emphasis**: `*italic*`/`_italic_`, `**bold**`, `~~strikethrough~~` (GFM).
- **Lists**: ordered, unordered, nested — both render with a left margin
  (`ul, ol{ margin: 0 0 1.3em 1.4em; }`), no custom bullet styling.
- **Links**: `[text](url)` as normal. GFM autolinks (bare `https://...`
  URLs turning into links automatically) also work.
- **Blockquotes**: `> quoted text` — renders italic with a left border, a
  bit larger than body text (`font-size: 1.15rem`). Good for pull-quotes.
- **Fenced code blocks**: ```` ```ruby ... ``` ```` — syntax-highlighted via
  Rouge. **Known gap**: the `.highlight` styling in `_sass/_highlights.scss`
  is untouched from the original theme and is **not dark-mode aware** — a
  code block will render as a light-gray box (`#efefef` background) even
  when the page is in dark mode. Fine for occasional use, but don't expect
  it to match the redesign's grayscale dark palette; flag to whoever does
  the next visual pass if you use code blocks often.
- **Inline `code`**: renders in a monospace font, no background box.
- **Tables** (GFM pipe syntax) should parse — kramdown's GFM input mode
  supports them — but **there is no custom table CSS anywhere in this
  theme**, so a table will render with bare browser-default styling (no
  borders, no zebra striping, no padding). It'll be readable but plain.
  This hasn't actually been tested against a real post + real Jekyll build
  this session (see the handoff docs' note on why local Jekyll builds
  aren't possible on this machine) — if a table matters for a post, publish
  it and eyeball the live result before assuming it looks good.
- **Horizontal rule**: `---` on its own line renders as a full-width thin
  divider (`hr{ height:1px; background:$rule; margin:2.4em 0; }`), themed
  for light/dark.

## Images

Standard Markdown image syntax:
```md
![Alt text describing the image](https://example.com/photo.jpg)
```
Every image inside a post body automatically gets, with **zero extra
work from you**:
- `display:block; max-width:100%` — always contained to the column width,
  never distorted, centered.
- `loading="lazy"` — injected at build time by a Jekyll plugin
  (`_plugins/lazy_images.rb`) that post-processes every `<img>` tag site-wide.
  Don't hand-add a `loading` attribute yourself; if you do, the plugin skips
  tags that already have one, so it's harmless but redundant.

Nothing distinguishes a "hero image" from an inline image in this theme —
whatever image you put first in the body just reads as the first image in
the flow. If you want the classic hotlinking-risk conversation: images
referenced by URL (rather than committed into `/images/` in this repo) are
subject to link rot if the source ever goes down — this has already
happened to at least one old post. Consider hosting images you care about
long-term in this repo's `/images/` folder and linking to
`{{ site.baseurl }}/images/your-file.jpg` instead of an external URL,
though nothing in the current templates requires this.

## Embeds (YouTube, SoundCloud, etc.)

Paste the raw `<iframe>` HTML directly into your Markdown body — kramdown
passes raw HTML through untouched, no escaping needed.

**YouTube** gets special treatment: any iframe whose `src` contains
`youtube.com/embed` or `youtube-nocookie.com/embed` is **automatically
forced to a correct 16:9 aspect ratio** via CSS, regardless of whatever
`width`/`height` attributes you paste in from YouTube's own embed code.
Just paste YouTube's standard embed snippet as-is and don't worry about
sizing it yourself.

**Other embeds** (SoundCloud, a chart widget, anything else) only get
`max-width:100%` applied — they are **not** reshaped to any particular
aspect ratio, so a non-16:9 embed may look squashed or need its own sizing.
For those, there's a legacy responsive wrapper class already supported from
an old post:
```html
<div class="iframe-container">
  <iframe src="https://example.com/embed/..."></iframe>
</div>
```
This uses the classic padding-bottom percentage trick to force a 16:9 box
around *any* iframe, not just YouTube — reach for it if a non-YouTube embed
needs proper aspect-ratio containment.

## Footnotes (custom, click-to-expand)

Separate feature from kramdown's native `[^note]` footnote syntax — **don't
use `[^note]`**, it won't get this styling. Instead, hand-write:

```html
A claim that needs a citation<span class="fn-ref" onclick="hjToggleFn('fn1')">1</span>.

<div class="fn-content" id="fn1">
  <span class="fn-num">1.</span> The footnote text itself.
</div>
```

Click the small superscript marker to expand/collapse the footnote inline
(no jump-to-bottom-of-page behavior). For multiple footnotes in one post,
increment the id/number by hand (`fn1`, `fn2`, ...) — IDs only need to be
unique within that one post, not site-wide. Fully theme-aware (light/dark)
already. See the previous session's answer in this conversation for more
detail — this is a genuinely unused, unproven-in-production feature, so
sanity-check the rendered result on the live post after publishing.

## Malayalam content

If a post is in Malayalam script, add `malayalam` to its `categories:` list
(e.g. `categories: [malayalam, personal]`). This switches the **entire**
post title and body to the Malayalam-appropriate font stack (`Noto Serif
Malayalam`) — it's an **all-or-nothing per-post switch**, not something you
can apply to just one paragraph or word within an otherwise-English post.
If you need mixed English/Malayalam in one post with correct fonts for
each, that's not supported today — would need a new inline `.mal` span
mechanism, worth raising if it comes up.

(You may see `malayalam-1` on a handful of older posts instead of
`malayalam` — that's legacy tag sprawl, already normalized at render time
to behave identically. Use plain `malayalam` for anything new.)

## Comments

Automatic — every post gets a Disqus thread appended (`_includes/disqus.html`,
included at the bottom of `_layouts/post.html`), no front matter needed to
turn it on or off per-post. Disqus is currently a known-stale dependency
flagged for eventual replacement (see the redesign handoff docs) but is
still live and functional today.

## The excerpt — write your first paragraph deliberately

Jekyll auto-generates `page.excerpt` from **the first paragraph** of your
post (everything up to the first blank line), with no custom
`excerpt_separator` configured. This single paragraph gets reused in
**three places**:
1. The `<meta name="description">` / `og:description` social-share tags.
2. The preview text under your post's title on the homepage and category
   archive pages (truncated to 200 characters).
3. The `excerpt` field in `search.json`, shown under search results.

Write your opening paragraph as if it needs to stand alone as a summary —
it effectively is one, in three different UI surfaces, whether you intend
that or not.

## Read time

Automatically calculated as `word count ÷ 200`, rounded down, minimum 1
minute — no front matter needed, purely derived from body length at build
time.

## Drafts vs. `published: false`

Two different mechanisms, don't confuse them:
- **`_drafts/`** (44 files currently sitting there) — filename has no date
  prefix, and Jekyll **never builds these** on this site (the build command
  doesn't pass `--drafts`). Good for genuinely unfinished writing.
- **`published: false`** in `_posts/`— a fully dated, normally-named post
  that's deliberately excluded from the build. Two posts currently use this
  intentionally. Good for a finished post you're not ready to make public
  yet, or one you want to keep at a specific date for permalink purposes
  once it does go live.

## A complete example post

```markdown
---
layout: post
title:  A short walk through an old argument.
date: '2026-07-30 09:00:00'
categories: [philosophy, politics]
image: 'https://example.com/preview-card-image.jpg'
---
The argument goes back further than most people assume, and it's worth
restating plainly before adding anything new to it.

## Where it starts

Some claim that needs a citation<span class="fn-ref" onclick="hjToggleFn('fn1')">1</span>,
followed by the rest of the paragraph.

<div class="fn-content" id="fn1">
  <span class="fn-num">1.</span> Source or elaboration for the claim above.
</div>

> A relevant quote, set off as a blockquote, italic and indented.

![A relevant photo, centered and contained automatically](https://example.com/photo.jpg)

## Where it goes

The rest of the essay, using **bold**, *italic*, and [links](https://example.com)
as needed.
```
