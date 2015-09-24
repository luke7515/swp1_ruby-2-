require 'nokogiri'
require 'open-uri'

PAGE_URL = "http://joongang.joins.com/"

page = Nokogiri::HTML(open(PAGE_URL))



article_body = page.css('.bd li a')
#puts article_body

articlelink = []
PAGENAMES = []
article_body.each_with_index do |article, index|
    articlelink.push article['href'].to_s
    #puts article['href'].to_s
    PAGENAMES << index
end

articlelink.each_with_index do |newlink, index|
    PAGENAMES[index] = newlink
    #puts PAGENAMES[index]
    newpage = Nokogiri::HTML(open(PAGENAMES[index]))
    articlecontent = newpage.css('#article_body')
    puts articlecontent
    
end
