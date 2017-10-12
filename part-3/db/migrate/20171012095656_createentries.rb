class Createentries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title, null: false
      t.string :location, null: false
      t.string :time, null: false
      t.string :date, null: false
      t.string :host, null: false
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
