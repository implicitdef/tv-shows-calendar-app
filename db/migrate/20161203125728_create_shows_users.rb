class CreateShowsUsers < ActiveRecord::Migration[5.0]
  def change

    create_table :shows_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :show, index: true
    end

    add_index(:shows_users, [:user_id, :show_id], :unique => true)

  end
end
