class ImapController < ApplicationController
require 'net/imap'

 def index
   messages = []
   imap = Net::IMAP.new('imap.googlemail.com','993',true)
   imap.login('yourname@googlemail.com', 'yourpasswd') 
   imap.select('Inbox')
   imap.search(["BEFORE", "30-Jul-2011", "SINCE", "09-Jul-2011"]).each do |msg_id|
     env = imap.fetch(msg_id, "ENVELOPE")[0].attr["ENVELOPE"]
     messages << [env.from[0].name,env.subject]
   end
   @messages = messages
   imap.logout
   imap.disconnect
 end
end
