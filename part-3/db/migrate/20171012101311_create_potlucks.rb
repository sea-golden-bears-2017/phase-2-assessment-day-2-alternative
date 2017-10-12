class CreatePotlucks < ActiveRecord::Migration
  def change
    create_table :potlucks do |t|
      t.string :name
      t.string :location
      t.string :date
      t.string :time
      t.belongs_to :user

      t.timestamps
    end
  end
end
