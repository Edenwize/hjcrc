function Image(elem)
  if elem.src:match("%.svg$") then
    local png_src = elem.src:gsub("%.svg$", ".png")
    -- Convert SVG to PNG at 300 DPI for crisp print quality
    os.execute(string.format('rsvg-convert -d 300 -p 300 "%s" -o "%s"', elem.src, png_src))
    elem.src = png_src
  end
  return elem
end