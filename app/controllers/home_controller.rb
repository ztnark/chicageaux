
class HomeController < ApplicationController
  def index


  end

  # def tweet_fetcher
  #   TweetStream.configure do |config|
  #     config.consumer_key       = 'f4VHcj4lCvhg3JpK4sEORQ'
  #     config.consumer_secret    = 'eVLGY5qoI4e3B2VAt02vHaiXy4yN0wflN2NaaV0iVdI'
  #     config.oauth_token        = '335415484-ZL0iR1tTWcNWp4Td6QU5GeVVvkBjRUolj8EHlmnX'
  #     config.oauth_token_secret = 'XXzEIZDrnHS65PlVhHQVB9SMAyjXzeNLMAh1Mhutp6c'
  #     config.auth_method        = :oauth
  #   end
  # @tweets = []
  #   TweetStream::Client.new.locations(-87.87, 41.72, -87.52, 42.02) do |status, client|
  #     puts "#{status.text}"
  #     puts "#{status[:user][:screen_name]}"
  #     puts "#{status[:geo][:coordinates]}"
  #     puts " ++++++++++++++++++++++++++"
  #     @tweets << [status[:geo][:coordinates], status.text, status[:user][:screen_name]]
  #     client.stop if @tweets.size > 2
  #   end
  #  render :json => @tweets
  # end


  # def eventful_fetcher
  #   eventful = Eventful::API.new 'FwPV5FkjRBWzvzvq',
  #                               :user => 'josephjames890',
  #                               :password => 'veveve122'

  #   results = eventful.call 'events/search',
  #                          :location => 'Chicago',
  #                          :date => Date.today,
  #                          :sort_order => 'popularity',
  #                          :page_size => 100

  #   @events = []
  #   results['events']['event'].each do |event|
  #     @events << { title: event['title'],
  #                  venue_name: event['venue_name'],
  #                  latitude: event['latitude'],
  #                  longitude: event['longitude'],
  #                  start_time: event['start_time'],
  #                  stop_time: event['stop_time'],
  #                  eventful_id: event['id']
  #                }
  #   end
  #   render :json => @events
  # end

end
