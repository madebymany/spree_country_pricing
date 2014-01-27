Spree::Country.class_eval do
  has_many :prices, class_name: 'Spree::Price'
  has_many :variants, through: :prices, class_name: 'Spree::Variant'
end