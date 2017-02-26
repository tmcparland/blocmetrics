class RegisteredApplicationsController < ApplicationController
    
  def create
    @user = current_user
    @registered_application = @user.registered_applications.new(registered_application_params)
    
    if @registered_application.save
      flash[:notice]="The application was saved"
      redirect_to @user
    else
      flash[:alert]="Application not saved"
      redirect_to @user
    end
    
  end

  def destroy
    @user = current_user
    @registered_application = @user.registered_applications.find(params[:id])
    
    if @registered_application.destroy
      flash[:notice]="Application has been destroyed"
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
