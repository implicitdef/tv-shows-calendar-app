class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.belongs_to :show, index: true
      t.integer :number
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :seasons, [:show_id, :number], :unique => true
  end
end
