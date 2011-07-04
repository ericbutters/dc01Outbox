class OutboxController < ApplicationController

 def index
  @users = User.all();
  @to = params[:to]
  
  respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }  
  end
 end

 def send_mail
   UserMailer.sendme(params[:to],params[:subject],params[:message]).deliver
   @receiver = params[:to]
   @subject = params[:subject]
 end

end
