require 'spec_helper'

describe Spree::Variant do

  # Create a variant & country
  let(:variant){ create(:variant) }
  let(:country) { create(:country) }

  describe "country_price" do
    before { @price = variant.prices.create!(country: country, amount: variant.price) }
    let(:price) { @price }

    it "has a price" do
      variant.prices.last.should == price
    end

    it "can retrieve a price by country" do
      variant.country_price(country.id).should == price
    end
  end

  context "country_price_or_default" do

    describe "only currency price" do

      before { @price = variant.prices.create!(currency: "GBP", amount: variant.price) }
      let(:price) { @price }

      it "returns a price in the specified currency" do
        variant.country_price_or_default(country.id, "GBP").should == price
      end

    end

    describe "only default price" do

      it "returns a default price if there is no country price or currency price" do
        variant.country_price_or_default(country.id, "GBP").should == variant.default_price
      end

    end
  end

end