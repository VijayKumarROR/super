class AdminController < ApplicationController
  def login
  	if request.post?
  		#if params[:admin][:name] == "admin" && params[:admin][:password] == "vijayadmin"
  		#	session[:admin] = "admin"
  			flash[:notice] = "Admin Logged in"
  			redirect_to :controller => "stores", :action => "index"
  		else
  			flash[:notice] = "Invalid Admin"
  			render :login
  		
  	end
  end

  	def logout 
  		session[:admin] = nil
  		flash[:notice] = "Logout successfully"
  		redirect_to :controller => "admin", :action => "login"
  	end
  end
