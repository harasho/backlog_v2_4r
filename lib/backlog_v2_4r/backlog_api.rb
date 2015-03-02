require "httpclient"
require 'json'
# comment
class BacklogApi
  attr_accessor :hc

  BACKLOG_URL = "https://bsttchr.backlog.jp/api/v2/".freeze
  @api_key = ""
  def initialize(api_key: nil)
    @api_key = api_key
    @hc = ::HTTPClient.new
  end

  def space
    data = @hc.get_content(build_html(method: "space"))
    JSON.parse(data)
  end


  def projects
    data = @hc.get_content(build_html(method: "projects"))
    JSON.parse(data)
  end

  def issues(params)
    data = @hc.get_content(build_html(method: "issues"), params)
    JSON.parse(data)
  end

  def versions(project_id_or_key)
    data = @hc.get_content(build_html_with_action(method: "projects", arg: project_id_or_key, action: "versions"))
    JSON.parse(data)
  end

  private

  def build_html(method: nil)
    BACKLOG_URL + method + "?apiKey=" + @api_key
  end

  def build_html_with_action(method: nil, arg: nil, action: nil)
    BACKLOG_URL + method + "/" + arg + "/" + action + "?apiKey=" + @api_key
  end

end
