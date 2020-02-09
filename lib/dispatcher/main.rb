require_relative './telegram.rb'
require_relative './github.rb'

require 'erb'
require 'yaml'

github = GithubHandler.new(ENV['GITHUB_TOKEN'])

telegram = TelegramHandler.new(
    ENV['TELEGRAM_TOKEN'], 
    ENV['TELEGRAM_CHATID']
)


rubyweekly, sha = github.get_file(
    ENV['REPOSITORY'],
    './content/rubyweekly.yaml'
)

github_update = false
rubyweekly.map() do |content|
    unless content['send']
        content['send'] = true
        github_update = true

        template = ERB.new(
            File.read('template/rubyweekly.md.erb')
        )

        telegram.send_message(
            template.result_with_hash(
                content: content['content'], 
                name: content['name']
            )
        )

    end
end

if github_update
    puts("Running Rubyweekly updates github")
    github.update_file(
        ENV['REPOSITORY'],
        './content/rubyweekly.yaml',
        'update rubyweekly data',
        rubyweekly.to_yaml().gsub("---\n", ''),
        sha)
else
    puts("no update")
end