Spree::Variant.class_eval do

  def country_price(country_id)
    prices.find_by(country_id: country_id)
  end

  def country_price_or_default(country_id, currency)
    country_price(country_id) ||
    prices.find_by(currency: currency) ||
    default_price
  end

end