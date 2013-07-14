class BirthdaysController < ApplicationController
  
  def new
    @current_user = User.find(session[:user_id])
    @token = @current_user.oauth_token
    @client = Google::APIClient.new
    @client.authorization.access_token = @token
    @calendar = @client.discovered_api('calendar', 'v3')
    debugger
    @url = @current_user.contacts_url
    doc = Nokogiri::HTML(open(@url))
    render new_birthday_path
  end

  # def add_to_calendar
    
  #   goog_event = {
  #     'summary' => @event.title,
  #     'location' => @event.location,
  #     'start' => {
  #       'dateTime' => @event.starts_at
  #     },
  #     'end' => {
  #       'dateTime' => @event.starts_at + @event.duration
  #     }
  #   }
    
  #   @result = @client.execute(:api_method => @calendar.events.insert,
  #     :parameters => {'calendarId' => 'primary'},
  #     :body => JSON.dump(goog_event),
  #     :headers => {'Content-Type' => 'application/json'}
  #   )
  # end
  

end
