require 'spec_helper'

describe Spree::Country do

  let(:variant){ create(:variant) }
  let(:country) { create(:country) }

  describe "prices" do

    before { variant.prices.create!(country: country, amount: variant.price) }

    it "can have a price" do
      country.prices.length.should == 1
    end

  end

end