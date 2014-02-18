class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.belongs_to :key, index: true
      t.text :body
      t.text :signed_body

      t.timestamps
    end
  end
end
