require 'rails_helper'

RSpec.describe Ownership do
  describe "relationships" do
    it {should belong_to :owner}
    it {should belong_to :dog}
  end
end
