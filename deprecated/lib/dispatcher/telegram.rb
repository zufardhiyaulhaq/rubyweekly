require 'telegram/bot'

class TelegramHandler
  def initialize(token, chatid)
    @token = token
    @chatid = chatid
    @client = Telegram::Bot::Client.new(@token)
  end

  def send_message(message)
    puts('Send to telegram')
    @client.send_message(
      chat_id: @chatid,
      text: message,
      parse_mode: :Markdown
    )
  end
end
