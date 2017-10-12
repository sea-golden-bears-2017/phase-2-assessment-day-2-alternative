class CreatePotlucks < ActiveRecord::Migration
  def change
    create_table :potlucks do |t|
      t.string :name
      t.string :location
      t.string :date_at
      t.string :time_at
      t.belongs_to :user

      t.timestamps
    end
  end
end
