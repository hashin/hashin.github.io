Jekyll::Hooks.register [:documents, :pages], :post_render do |item|
  next unless item.output_ext == ".html"
  item.output = item.output.gsub(/<img(?![^>]*\bloading=)([^>]*)>/) { "<img loading=\"lazy\"#{$1}>" }
end
