class Createcomments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.belongs_to :entries, index: true

      t.timestamps
    end
  end
end
