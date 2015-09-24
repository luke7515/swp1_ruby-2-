require 'nokogiri'
require 'open-uri'

PAGE_URL = "http://joongang.joins.com/"

page = Nokogiri::HTML(open(PAGE_URL))



article_body = page.css('.bd li a')

PAGENAMES = []
article_body.each_with_index do |article, index|

    PAGENAMES << article['href'].to_s
    

    newpage = Nokogiri::HTML(open(PAGENAMES[index]))
    articlecontent = newpage.css('#article_body')
    puts articlecontent
end

