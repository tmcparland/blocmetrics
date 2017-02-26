require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  let (:user) { create(:user) }
  let (:registered_application) { create(:registered_application, user: user) }
  before do 
    sign_in user
  end

  describe "GET #create" do
    it "returns http success" do
      post :create, user_id: user.id, registered_application: {name:"New App", url:"abc.com"}
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      post :destroy, user_id: user.id, id: registered_application.id
      expect(response).to have_http_status(200)
    end
  end
  
  describe "PUT #update" do
  end
  
  describe "GET show" do
  end
  
end

