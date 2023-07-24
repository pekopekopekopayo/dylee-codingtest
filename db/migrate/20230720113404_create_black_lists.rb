class CreateBlackLists < ActiveRecord::Migration[7.0]
  def change
    create_table :black_lists do |t|
      t.string :name, null: true
      t.inet :ip_address, null: false 
      t.timestamps
    end
    
    add_index :black_lists, :ip_address, unique: true
  end
end
