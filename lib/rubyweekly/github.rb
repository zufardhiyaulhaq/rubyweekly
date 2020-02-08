
require 'octokit'
require 'base64'
require 'yaml'

class GithubHandler
    def initialize(token)
        @token = token
        @client = Octokit::Client.new(:access_token => @token)
    end

    def get_file(repo, path)
        YAML::load(Base64.decode64(@client.contents(repo, :path => path)[:content]))
    end
end