require 'active_support/core_ext/hash/keys'
require 'httparty'
require 'nokogiri'

class RubyweeklyHandler
    def initialize()
        @url = 'https://rubyweekly.com/issues/latest?layout=bare'
    end

    private
    def parse_url(url)
        unparsed_page = HTTParty.get(url)
        Nokogiri::HTML(unparsed_page)
    end
    
    private
    def scrape_content()
        content = []
        parsed_page = parse_url(@url)
        data = parsed_page.css('div#content')

        data.css('span.mainlink').each() do |i|
            map = {
                'title' => i.text(),
                'url' => i.css('a').attr('href').value()
            }
            content.push(map)
        end

        return content
    end

    public
    def scrape_information()
        parsed_page = parse_url(@url)
        data = parsed_page.css('div#content')
        content = scrape_content()

        information = {
            'name' => 'rubyweekly '+data.css('table').text().match(/#\d+/).to_s(),
            'send' => false,
            'content' => content
        }
    end
end    