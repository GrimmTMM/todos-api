require 'net/http'

class CheckDeadlinesJob < ApplicationJob
  queue_as :default

  def perform
    begin
      items = Item.where('deadline <= ?', DateTime.now)
      items.each do |item|
        user = User.where("id = ?", Todo.where("id = ?", Item.where("id = ?", item.id).limit(1).pluck("todo_id")).limit(1).pluck("created_by")).limit(1).first
        send_deadline_notification(item, user)
      end
    rescue => e
      Rails.logger.error "Error in CheckDeadlinesJob: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
    end
  end

  private

  def send_deadline_notification(item, user)
    uri = URI.parse("http://127.0.0.1:3000/notify")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })

    request.body = { item_id: item.id, message: "#{item.name} deadline reached for user #{user.id} (#{user.name})" }.to_json
    response = http.request(request)
  end
end
