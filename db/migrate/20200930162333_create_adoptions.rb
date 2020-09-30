class CreateAdoptions < ActiveRecord::Migration[6.0]
  def change
    create_table :adoptions do |t|
      t.integer :user_id
      t.integer :tama_id
    end
  end
end
