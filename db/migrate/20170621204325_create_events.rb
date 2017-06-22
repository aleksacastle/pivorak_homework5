class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :date_time
      t.text :address

      t.timestamps
    end
  end
end
