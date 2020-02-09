require_relative './rubyweekly.rb'
require_relative './github.rb'

require 'yaml'

github = GithubHandler.new(ENV['GITHUB_TOKEN'])
rubyweekly = RubyweeklyHandler.new()

rubyweekly_new = rubyweekly.scrape_information()
rubyweekly_old, sha = github.get_file(
    ENV['REPOSITORY'],
    './content/rubyweekly.yaml'
)

update = true
rubyweekly_old.each() do |content|
    if rubyweekly_new['name'] == content['name']
        update = false
    end
end

if update
    puts("Running Rubyweekly updates")
    rubyweekly_old.push(rubyweekly_new)
    github.update_file(
        ENV['REPOSITORY'], 
        './content/rubyweekly.yaml', 
        'update rubyweekly data', 
        rubyweekly_old.to_yaml().gsub("---\n", ''),
        sha
    )
else
    puts("No Rubyweekly updates")
end

