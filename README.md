Spree Country Pricing
================

Add pricing for Variants per country. This extension adds a currency and locale field to Countries.

We add methods to find a prices product by a country_id.

`country_price_or_default`: takes a country_id and a currency
`country_price`: takes a country_id

Both return a `Spree::Price` that belongs to a Variant.
