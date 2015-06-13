class CreateHomeapis < ActiveRecord::Migration
  def change
    create_table :homeapis do |t|

      t.timestamps null: false
    end
  end
end
