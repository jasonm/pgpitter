class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.belongs_to :signed_key, index: true
      t.belongs_to :signing_key, index: true

      t.timestamps
    end
  end
end
