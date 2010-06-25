class String  
  def unindent(options = {})
    tablength = options[:tablength] || 2
    lines = gsub("\t", " " * tablength).split("\n")

    whitespace = lines.map do |line|
      line.match(/^(\s+)/).captures.first
    end.min{ |l, r| l.length <=> r.length }

    lines.map{ |l| l.gsub /^#{whitespace}/, ''}.join("\n")
  end
end
