require './rubyweekly'
require './github'

require 'yaml'

github = GithubHandler.new(ENV['GITHUB_TOKEN'])
rubyweekly = RubyweeklyHandler.new()

rubyweekly_new = rubyweekly.scrape_information()
rubyweekly_old, sha = github.get_file(ENV['REPOSITORY'],'./content/rubyweekly.yaml')

update = true
rubyweekly_old.each() do |r|
    if rubyweekly_new['name'] == r['name']
        update = false
    end
end

update = true
if update
    rubyweekly_old.push(rubyweekly_new)
    github.update_file(ENV['REPOSITORY'], './content/rubyweekly.yaml', 'update rubyweekly data', rubyweekly_old.to_yaml().gsub("---\n", ''), sha)
end

