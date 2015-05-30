require 'rails_helper'

RSpec.describe "Drinks", type: :request do
  describe "GET /drinks" do
    it "works! (now write some real specs)" do
      get drinks_path
      expect(response).to have_http_status(200)
    end
  end
end
