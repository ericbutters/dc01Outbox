class GitController < ApplicationController

require 'grit'

  def index
   repo = Grit::Repo.new('/home/eric/COMPANY/DC01/public/dc01Outbox.git')
   @all = repo.commits
  end  

end
