class OutboxController < ApplicationController
 
 def index
 end

 def send_mail
   UserMailer.sendme(params[:receiveraddr],params[:subject],params[:message]).deliver
   @receiver = params[:receiveraddr]
   @subject = params[:subject]
 end

end
