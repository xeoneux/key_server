class CreateKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :keys do |t|
      t.datetime :keep_alive
      t.boolean :blocked, default: false

      t.timestamps
    end
  end
end
