require 'nokogiri'
require 'open-uri'

PAGE_URL = "http://joongang.joins.com/"

page = Nokogiri::HTML(open(PAGE_URL))

article_body = page.css('.main_article li a')

article_body.each do |article|
    temp = article['href'].to_s
    puts temp
    newpage = Nokogiri::HTML(open(temp))
    articlecontent = newpage.css('#article_body')
    puts articlecontent.text
end

