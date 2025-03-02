class CreateBattles < ActiveRecord::Migration[8.0]
  def change
    create_table :battles do |t|
      t.references :host_user, foreign_key: { to_table: :users }, null: false
      t.string :title, null: false
      t.datetime :apply_start_date, null: false
      t.datetime :apply_end_date, null: false
      t.datetime :battle_start_date, null: false
      t.datetime :battle_end_date, null: false
      t.integer :reword
      t.text :detail, null: false
      t.integer :achievement_rate
      t.integer :total_hp

      t.timestamps
    end
  end
end