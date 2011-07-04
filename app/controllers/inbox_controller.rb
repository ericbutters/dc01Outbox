class InboxController < ApplicationController

require 'twitter' 

  def index
    ActionMailer::Base::Mail.defaults do
          retriever_method :pop3, :address    => "pop.gmail.com",
		           :port       => 995,
		           :user_name  => 'yourname@googlemail.com',
		           :password   => 'yourpasswd',
		           :enable_ssl => true
    end

    e = Mail.all
    if e.length 
      @email = e
      @nummails = e.length
    else
      @nummails = 0
    end
  end

  def twitters
     @tweets = Twitter.user_timeline("N24_News", :count => 5)
     respond_to do |format|
       format.html # show.html.erb
       format.json { render :json => @tweets }
     end
  end
  
  def show
     @tweets = Twitter.user_timeline("N24_News", :count => 5)
  end

end
