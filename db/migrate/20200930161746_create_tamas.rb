class CreateTamas < ActiveRecord::Migration[6.0]
  def change
    create_table :tamas do |t|
      t.string :name
      t.datetime :birthdate
      t.string :family
    end
  end
end
