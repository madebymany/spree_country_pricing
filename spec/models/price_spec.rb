require 'spec_helper'

describe Spree::Price do

  # Create a variant and country
  let(:variant){ create(:variant) }
  let(:country) { create(:country) }

  describe "belongs_to country" do
    let(:price) { variant.prices.create!(country: country, amount: variant.price) }

    it "has a country" do
      price.country.should == country
    end
  end

end