require './rubyweekly'
require './github'

require 'yaml'

# new_information = RubyweeklyHandler.new().scrape_information()
# data = []
# data.push(new_information)
# puts(data.to_yaml())

data = GithubHandler.new(ENV['GITHUB_TOKEN']).get_file('zufardhiyaulhaq/rubyweekly','./content/rubyweekly.yaml')
puts(data)