require 'nokogiri'
require 'open-uri'

PAGE_URL = "http://joongang.joins.com/"

page = Nokogiri::HTML(open(PAGE_URL))

article_body = page.css('.bd li a')

article_body.each_with_index do |article, index|
    temp = article['href'].to_s
    newpage = Nokogiri::HTML(open(temp))
    articlecontent = newpage.css('#article_body')
    puts articlecontent
end

