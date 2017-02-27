require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  let (:user) { create(:user) }
  let (:registered_application) { create(:registered_application, user: user) }
  before do
    sign_in user
  end
  
## Index

  describe "GET index" do
    
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [registered_application] to @registered_applications" do
      get :index
      expect(assigns(:registered_applications)).to eq([registered_application])
    end
    
  end

## Show

  describe "GET show" do
    
    it "returns http success" do
      get :show, {id: registered_application.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, {id: registered_application.id}
      expect(response).to render_template :show
    end
 
    it "assigns my_registered_application to @registered_application" do
      get :show, {id: registered_application.id}
      expect(assigns(:registered_application)).to eq(registered_application)
    end
    
  end
  
## New

  describe "GET #new" do
    
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @registered_application" do
      get :new
      expect(assigns(:registered_application)).not_to be_nil
    end
    
  end

## Create

  describe "GET #create" do
    
    it "returns http success" do
      post :create, user_id: user.id, registered_application: {name:"New App", url:"abc.com"}
      expect(response).to have_http_status(302)
    end
    
  end

## Edit

  describe "GET #edit" do
    
    it "returns http success" do
      get :edit, {id: registered_application.id}
      expect(response).to have_http_status(:success)
    end
 
    it "renders the #edit view" do
      get :edit, {id: registered_application.id}
      expect(response).to render_template :edit
    end
 
    it "assigns registered_application to be updated to @registered_application" do
      get :edit, {id: registered_application.id}
 
      registered_application_instance = assigns(:registered_application)
 
      expect(registered_application_instance.id).to eq registered_application.id
      expect(registered_application_instance.name).to eq registered_application.name
      expect(registered_application_instance.url).to eq registered_application.url
    end
    
  end
  
## Update

  describe "PUT #update" do
    
    it "updates registered_application with expected attributes" do
      new_name = Faker::Pokemon.name
      new_url = Faker::Internet.url
      
      put :update, id: registered_application.id, registered_application: {name: new_name, url: new_url}
 
      updated_registered_application = assigns(:registered_application)
      expect(updated_registered_application.id).to eq registered_application.id
      expect(updated_registered_application.name).to eq new_name
      expect(updated_registered_application.url).to eq new_url
    end
 
    it "redirects to the updated application" do
      new_name = Faker::Pokemon.name
      new_url = Faker::Internet.url
 
      put :update, id: registered_application.id, registered_application: {name: new_name, url: new_url}
      expect(response).to redirect_to registered_application
    end
    
  end

## Destroy

  describe "DELETE destroy" do

    it "deletes the application" do
      delete :destroy, {id: registered_application.id}
      count = RegisteredApplication.where({id: registered_application.id}).size
      expect(count).to eq 0
    end
 
    it "redirects to registered_application index" do
      delete :destroy, {id: registered_application.id}
      expect(response).to redirect_to registered_applications_path
    end
  end

end
