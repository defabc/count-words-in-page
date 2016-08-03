require "open-uri"
require "nokogiri"

tags_array = ["h1","h2","h3","h4","h5","h6","p","a"]
input_url = gets

def html_parser(tag, url)
  doc = Nokogiri::HTML.parse(open(url))
  doc.xpath("//#{tag}").inner_text
end


def count_words(tags_array, url)
  number = 0
  tags_array.each do |tag|
    text = html_parser(tag, url)
    words = text.gsub(" ","").gsub("\n","")
    word_count = words.length
    number += word_count
  end
  number
end

puts count_words(tags_array, input_url)
