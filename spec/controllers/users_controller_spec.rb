require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  let (:user) { create(:user) }
  before do 
    sign_in user
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end
  end

end
