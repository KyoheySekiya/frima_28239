# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.string :nickname,              null: false
      t.string :email,                 null: false
      t.string :familiy_name,          null: false
      t.string :first_name,            null: false
      t.string :familiy_name_reading,  null: false
      t.string :first_name_reading,    null: false
      t.date :birthday,                  null: false
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
