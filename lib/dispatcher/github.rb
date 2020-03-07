# frozen_string_literal: true

require 'octokit'
require 'base64'
require 'yaml'

class GithubHandler
  def initialize(token)
    @token = token
    @client = Octokit::Client.new(access_token: @token)
  end

  def get_file(repo, path)
    content_data = @client.contents(repo, path: path)
    [YAML.safe_load(Base64.decode64(content_data[:content])), content_data[:sha]]
  end

  def update_file(repo, path, message, content, sha)
    @client.update_contents(repo,
                            path,
                            message,
                            sha,
                            content)
  end
end
