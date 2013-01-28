# encoding: utf-8
class UsersController < ApplicationController
	
	def create
		unless User.find_by_email(params[:user][:email])
			
			user = User.new(params[:user]) 
      
      if user.save
        session[:user_id] = user.id
        render :text => ""
      else
        render :text => "Неправильный e-mail или password"
      end
    else
      render :text => "Пользователь уже существует"
    end
	end

	def login
		user = User.find_by_email(params[:email])

    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      render :text => ''
    else
      render :text => "invalid e-mail or password"
    end
	end

	def logout
		session[:user_id] = nil
		redirect_to root_path
	end

end