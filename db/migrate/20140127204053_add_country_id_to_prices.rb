class AddCountryIdToPrices < ActiveRecord::Migration
  def change
    add_column :spree_prices, :country_id, :integer
  end
end
