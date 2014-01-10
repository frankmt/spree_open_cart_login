class AddOpenCartCredentialsToUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :oc_password, :string
    add_column :spree_users, :oc_salt, :string
  end
end
