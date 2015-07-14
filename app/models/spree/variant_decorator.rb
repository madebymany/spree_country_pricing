Spree::Variant.class_eval do

  def country_price(country_id, currency)
    Rails.cache.fetch(country_price_cache_key(country_id)) do
      prices.where('country_id = ? OR currency = ?', country_id, currency).first
    end
  end

  def country_price_or_default(country_id, currency)
    country_price(country_id, currency) ||
    default_price
  end

private

  def country_price_cache_key(country_id)
    "variant-#{id}-country-#{country_id}-price"
  end

end