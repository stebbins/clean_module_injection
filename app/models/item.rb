class Item < ApplicationRecord
  def process
    sleep 5.seconds
    update(processed: true)
  end
  handle_asynchronously :process 
end
