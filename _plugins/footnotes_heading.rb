Jekyll::Hooks.register [:documents, :pages], :post_render do |item|
  next unless item.output_ext == ".html"
  item.output = item.output.gsub(
    /(<div class="footnotes"[^>]*>)\s*(?:<hr\s*\/?>\s*)?(<ol>)/,
    "\\1\n<hr>\n<h2 class=\"footnotes-heading\">Footnotes</h2>\n\\2"
  )
end
