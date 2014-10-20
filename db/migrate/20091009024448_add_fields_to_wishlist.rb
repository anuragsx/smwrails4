class AddFieldsToWishlist < ActiveRecord::Migration
  def self.up
  	add_column :wishlists, :body, :string
  	add_column :wishlists, :min_year, :string
  	add_column :wishlists, :max_year, :string
  	add_column :wishlists, :min_price, :string
  	add_column :wishlists, :max_price, :string
  end

  def self.down
  	remove_column :wishlists, :body
  	remove_column :wishlists, :min_year
  	remove_column :wishlists, :max_year
  	remove_column :wishlists, :min_price
  	remove_column :wishlists, :max_price
  end
end
