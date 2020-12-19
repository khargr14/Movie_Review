class RegistrationsController < Devise::RegistrationsController
    before_action :authenticate_user!
   
      
    
  def index
    redirect_to new_user_registration_path unless logged_in?
  end

  

    private

   
  
    def sign_up_params
      params.require(:user).permit(
        :email, 
        :password, 
        :password_confirmation,
        :id
      
        )
    end
  
    def account_update_params
      params.require(:user).permit(
        :email, 
        :password, 
        :password_confirmation, 
        :current_password,
        :id
        )
    end
  end