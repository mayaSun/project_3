class PagesController <ApplicationController

  def home
    @chapter = Chapter.first
    render '/chapters/show'
  end

  def create_admin_session
    if params[:user_name] == Rails.application.secrets.user_name && params[:password] == Rails.application.secrets.password
      set_admin
      redirect_to portions_path
    else
      flash[:error] = "user name does not match password"
      render :login
    end
  end

  def set_language
    session[:locale] = params[:locale].to_sym 
    I18n.locale = params[:locale].to_sym 
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

end