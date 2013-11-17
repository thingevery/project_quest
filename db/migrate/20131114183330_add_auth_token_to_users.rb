class AddAuthTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :autho_token, :string
  end
end
