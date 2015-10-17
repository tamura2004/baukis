class Admin::SessionsController < Admin::Base
  skip_before_action :authorize

  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = Admin::LoginForm.new(params[:admin_login_form])
    administrator = Administrator.find_by(email_for_index: @form.email.downcase)
    authenticator = Admin::Authenticator.new(administrator)

    if authenticator.authenticate!
      session[:administrator_id] = administrator.id
      session[:last_access_time] = Time.current
      flash.notice = authenticator.message
      redirect_to :admin_root

    else
      flash.now.alert = authenticator.message
      render action: "new"
    end
  end

  def destroy
    session.delete(:administrator_id)
    flash.notice = "ログアウトしました。"
    redirect_to :admin_root
  end

end
