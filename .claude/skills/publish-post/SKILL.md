---
name: publish-post
description: Publish a markdown file as a new post on blog.hashin.me (the hashin/hashin.github.io Jekyll blog). Trigger when Hashin shares a markdown file and asks to publish it, push it to the blog, post it live, or similar — even without saying "skill".
---

Publish a shared markdown file to blog.hashin.me with as few round-trips
and as little reasoning-token spend as possible. The mechanical parts
(slug, filename, YAML) are delegated to `new_post.sh` in this same
directory — never hand-generate the frontmatter yourself, run the script.

## Known facts about this blog (don't re-derive them)

- Posts live in `_posts/`, named `YYYY-MM-DD-slug.markdown`.
- Frontmatter fields, in order: `categories: [a, b]`, blank line, `layout: post`,
  `title`, `image` (optional), `date: 'YYYY-MM-DD HH:MM:SS'`, `published: true|false`.
- The known category vocabulary (pick from these, don't invent new ones
  unless Hashin explicitly wants a new category): `politics`, `philosophy`,
  `personal`, `policy`, `books`, `malayalam`, `tech`.
- Post bodies do **not** repeat the title as an `# H1` — the title only
  lives in frontmatter.
- Pushing to `master` on `origin` (not `upstream`, which is the
  jekyll-now template fork) triggers the GitHub Actions build/deploy.
  Live URL pattern: `https://blog.hashin.me/YYYY/MM/DD/slug/`. The Fastly
  CDN caches ~10 minutes, so a fresh post may take a few minutes to
  reflect if hit right after deploy.

## Steps

1. **Read the shared file as-is.** If it has YAML frontmatter already,
   pull `image`/`date`/`published` from it directly instead of asking
   about those. If the body opens with a `# Title` line, strip that line
   from the body regardless (the title only lives in frontmatter, never
   repeated in the body) — but don't treat it, or any frontmatter `title`,
   as final; title is always confirmed with Hashin per step 2.

2. **Always ask, in exactly one AskUserQuestion call (not several
   round-trips):**
   - **Title** — every single time, even if the file already has a
     `title` in frontmatter or an `# H1` line. Offer the detected
     title (from frontmatter/H1/filename) as one option and "I'll type
     a different title" as another; Hashin can also free-type via
     "Other".
   - **Categories** — always show the *entire* known vocabulary as
     multi-select options so Hashin picks from all of them, not just a
     pre-filtered subset: `politics`, `philosophy`, `personal`,
     `policy`, `books`, `malayalam`, `tech`. If the source file already
     has `categories` in frontmatter, that's fine as a hint but still
     show all options — don't pre-decide for him.
   - **Hero image URL** (optional, allow skipping — pre-fill the
     option text with the frontmatter image if one exists).
   - **Published vs. draft.**

   Don't ask about slug/filename/date unless the title is non-Latin
   script (e.g. Malayalam) — `new_post.sh` can't transliterate that
   automatically, so ask for an explicit `--slug` only in that case.
   Default date is "now" unless Hashin wants to backdate it.

3. **Generate the post file with the script**, e.g.:

   ```bash
   .claude/skills/publish-post/new_post.sh \
     --title "Exact Title Here" \
     --categories "politics, philosophy" \
     --image "https://..." \
     --published true \
     --body-file /path/to/cleaned/body.md
   ```

   Write the cleaned body (frontmatter/title-H1 stripped) to a temp file
   in the scratchpad first, then pass that path as `--body-file`. The
   script prints the created file path on success and refuses to
   overwrite an existing file.

4. **Show a short preview** (title, categories, filename, live URL it will
   resolve to) and stage + commit locally:

   ```bash
   git add _posts/<generated-filename>.markdown
   git commit -m "Publish: <title>"
   ```

5. **Confirm before pushing.** Pushing to `origin master` deploys the post
   live and is a real, public, hard-to-quietly-reverse action — ask
   Hashin to confirm ("Push live now?") before running
   `git push origin master`, even though everything up to here can happen
   without back-and-forth. One confirmation, not several.

6. **After push**, report the live URL and, if useful,
   `gh run list --repo hashin/hashin.github.io --branch master --limit 1`
   to point at build status.

## Things to avoid

- Don't `git add -A` — only add the specific new post file.
- Don't touch `upstream` remote.
- Don't invent categories, client names, or embellish content not in the
  source markdown.
- Don't re-grep the whole `_posts/` directory for conventions each run —
  this file already has them.
