class FixAuthTokenSpelling < ActiveRecord::Migration
  def change
  	rename_column :users, :autho_token, :auth_token
  end
end
