class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = RegisteredApplication.all
  end
  
  def show
    @user = current_user
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end
  
  def new
    @user = current_user
    @registered_application = RegisteredApplication.new
  end
  
  def create
    @user = current_user
    @registered_application = @user.registered_applications.new(registered_application_params)

    if @registered_application.save
      flash[:notice]="The application was saved"
      redirect_to @registered_application
    else
      flash[:alert]="Application not saved"
      render :new
    end
  end

  def edit
    @user = current_user
    @registered_application = RegisteredApplication.find(params[:id])
  end
    
  def update
    @user = current_user
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.name = params[:registered_application][:name]
    @registered_application.url = params[:registered_application][:url]
 
    if @registered_application.save
      flash[:notice] = "Application was updated successfully."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error saving the application. Please try again."
      render :edit
    end
  end

  def destroy
    @user = current_user
    @registered_application = @user.registered_applications.find(params[:id])

    if @registered_application.destroy
      flash[:notice]="Application has been destroyed"
      redirect_to registered_applications_path
    else
      flash[:alert]="Error"
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

private
  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end
end
