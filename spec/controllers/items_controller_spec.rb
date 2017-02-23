require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  
  let (:user) { create(:user) }
  let (:item) { create(:item, user: user) }
  before do 
    sign_in user
  end

  describe "GET #create" do
    it "returns http success" do
      post :create, user_id: user.id, item: {name:"laundry"}
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      post :destroy, user_id: user.id, id: item.id
      expect(response).to have_http_status(200)
    end
  end

end