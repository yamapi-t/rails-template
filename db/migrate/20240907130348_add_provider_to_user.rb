# frozen_string_literal: true

class AddProviderToUser < ActiveRecord::Migration[7.2]
  def change
    change_table :users, bulk: true do
      add_column :users, :provider, :string
      add_column :users, :uid, :string
      add_column :users, :username, :string
    end
  end
end
