class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.text :content
      t.integer :comment_id

      t.timestamps
    end
  end
end
