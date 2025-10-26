# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      ## Recoverable
      t.string   :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)

      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)

      # Campo obrigatório que você quer adicionar
      t.string :name, null: false, default: "" unless column_exists?(:users, :name)
    end

    # Índices do Devise
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    add_index :users, :email, unique: true unless index_exists?(:users, :email)
  end
end
