class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :user_name
      t.integer :admin_fleg
      t.timestamps
    end
  end
end
