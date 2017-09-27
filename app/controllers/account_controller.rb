class AccountController < ApplicationController

  	def index
	  end

    def signup
    @user = User.new
    if request.post?
      @user = User.new(user_params)
      if @user.save
        NotifierMailer.mail_receive(@user).deliver
       # UserMailer.welcome_email(@user).deliver_now
        flash[:notice] = "User has been saved successfully"
        redirect_to :controller => "account", :action => "login"
      else
        flash[:notice] = "Error while saving"
        render :signup
      end
    end
  end

  def login
    p "[][][][][][][][][][]"
    @user = User.new
    p @user
    if request.post?
      @user = User.authenticate(params[:user][:email],params[:user][:password])
      p "llllllllllllllllll"
      p @user
      p "llllllllllllllllll"
      if @user
        NotifierMailer.mail_receive(@user).deliver
        session[:user] = @user.id
        flash[:notice] = "User has been login successfully"
        redirect_to :controller => "account", :action => "welcome"
      else
        flash[:notice] = "Invalid username and password"
        render :login
      end
    end
  end

  def forget_password
    if request.post?
      @user = User.find_by_email(params[:user][:email])
      if @user
        new_password = [*(1..9),*('a'..'z')].sample(8).join
        @user.update(:password => new_password)
        p "000000000000000"
        p new_password
        redirect_to :controller => "account", :action => "login"
      else
        flash[:notice] = "Invalid Email"
        render :forget_password
      end
      end
  end

  def reset_password
    p "6666666666666666"
    if request.post?
      @user = User.find(session[:user])
      p "222222222222"
      p @user
      if @user
        @user.update(:password=>params[:password])
        p "88888888888888"
        p @user
        redirect_to :controller => "account", :action => "index"
      else
        render :reset_password
      end
    end
  end

  def logout
    session[:user] = nil
    flash[:notice] = "You are logged out"
    redirect_to :controller => "account", :action => "login"
  end


  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:hashed_password)
  end

end
