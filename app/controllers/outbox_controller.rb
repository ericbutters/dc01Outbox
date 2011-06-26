class OutboxController < ApplicationController
 
 def index
  @users = User.all();
  
   respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }  
   end
 end

 def send_mail
   user = User.find(params[:userid])
   UserMailer.sendme(user.email,params[:subject],params[:message]).deliver
   @receiver = user.email
   @subject = params[:subject]
 end

end
