class CreateCheckoutStatuses < ActiveRecord::Migration
  def self.up
    create_table :checkout_statuses do |t|
      t.integer :user_id
      t.integer :video_id

      t.timestamps
    end
  end

  def self.down
    drop_table :checkout_statuses
  end
end
