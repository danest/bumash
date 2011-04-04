module SessionsHelper
  
  def admin_user
     redirect_to(root_path) unless current_user.admin?
   end
   
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id]
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    redirect_to signin_path, :notice => "Please sign in to access this page"
  end
  

  private
  
    def user_from_token
      cookies.signed[:remember_token]
    end
  
  
end