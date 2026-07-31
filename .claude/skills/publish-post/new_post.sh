#!/bin/bash
# Deterministically creates a Jekyll post file in _posts/ with correct
# frontmatter + filename, so the LLM doesn't have to hand-generate slugs,
# dates, or YAML. Run from anywhere; REPO_ROOT is derived from this script's
# location.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
POSTS_DIR="$REPO_ROOT/_posts"

title=""
categories=""
image=""
slug=""
date_str=""
published="true"
body_file=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --title) title="$2"; shift 2 ;;
    --categories) categories="$2"; shift 2 ;;
    --image) image="$2"; shift 2 ;;
    --slug) slug="$2"; shift 2 ;;
    --date) date_str="$2"; shift 2 ;;
    --published) published="$2"; shift 2 ;;
    --body-file) body_file="$2"; shift 2 ;;
    *) echo "Unknown arg: $1" >&2; exit 1 ;;
  esac
done

if [[ -z "$title" || -z "$categories" || -z "$body_file" ]]; then
  echo "Usage: new_post.sh --title T --categories 'a, b' --body-file path [--image URL] [--slug s] [--date 'YYYY-MM-DD HH:MM:SS'] [--published true|false]" >&2
  exit 1
fi

if [[ -z "$date_str" ]]; then
  date_str="$(date "+%Y-%m-%d %H:%M:%S")"
fi
date_only="${date_str%% *}"

if [[ -z "$slug" ]]; then
  slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -E "s/['’]//g; s/[^a-z0-9]+/-/g; s/^-+//; s/-+$//")
fi

if [[ -z "$slug" ]]; then
  echo "Could not derive a slug from the title (likely non-Latin script) — pass --slug explicitly." >&2
  exit 1
fi

out_file="$POSTS_DIR/${date_only}-${slug}.markdown"

if [[ -e "$out_file" ]]; then
  echo "Refusing to overwrite existing file: $out_file" >&2
  exit 1
fi

# Escape for a YAML double-quoted scalar.
yaml_escape() {
  printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'
}

title_esc=$(yaml_escape "$title")

{
  echo "---"
  echo "categories: [${categories}]"
  echo ""
  echo "layout: post"
  echo "title: \"${title_esc}\""
  if [[ -n "$image" ]]; then
    image_esc=$(yaml_escape "$image")
    echo "image: \"${image_esc}\""
  fi
  echo "date: '${date_str}'"
  echo "published: ${published}"
  echo "---"
  cat "$body_file"
} > "$out_file"

echo "$out_file"
