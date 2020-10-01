class CreateTamas < ActiveRecord::Migration[6.0]
  
  def change
    create_table :tamas do |t|
      t.string :name
      t.datetime :birthday, default: -> { 'CURRENT_TIMESTAMP' } # turn this into age
      t.datetime :background_timer
      t.string :family # could be variable instead???
      t.integer :fullness, default: -> {2} # should set this to a default
      t.integer :happiness, default: -> {5} # should set this to a default
    end
  end
end
