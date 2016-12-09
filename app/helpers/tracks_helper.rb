module TracksHelper
  def ugly_lyrics(lyrics)
    formatted = ""
    lyrics.lines.each do |line|
      formatted << "&#9835; #{html_escape(line)}"
    end
    "<pre>#{formatted}</pre>".html_safe
  end

end
