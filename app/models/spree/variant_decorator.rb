Spree::Variant.class_eval do

  def country_price(country_id)
    Rails.cache.fetch(country_price_cache_key(country_id)) do
      prices.find_by(country_id: country_id)
    end
  end

  def country_price_or_default(country_id, currency)
    country_price(country_id) ||
    prices.find_by(currency: currency) ||
    default_price
  end

private

  def country_price_cache_key(country_id)
    "variant-#{id}-country-#{country_id}-price"
  end

end