class NotificationsController < ApplicationController

  def notify
    item_id = params[:item_id]
    message = params[:message]
    
    # Routed to file for now, intended for some sort of popup or email message
    # Meant to periodically notify when a task has reached deadline (Every minute)
    path = File.expand_path("~/Projects/todos-api/log/notif_logger.log")
    File.open(path, 'a+') {|f| f.write("Notification received for item #{item_id}: #{message}\n") }


    head :no_content
  end

  def list
    items = Item.where('deadline <= ?', DateTime.now)
    items_json = items.map do |item|
      "Task '#{item.name}' has reached its deadline! Deadline: #{item.deadline.to_datetime.strftime('%m/%d/%Y - %H:%M')}"
    end

    json_response(items_json.to_json)    
  end
end
