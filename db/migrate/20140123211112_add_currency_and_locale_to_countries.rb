class AddCurrencyAndLocaleToCountries < ActiveRecord::Migration
  def change
    add_column :spree_countries, :currency, :string
    add_column :spree_countries, :locale, :string
  end
end