define ['jquery', 'backbone', 'models/tweet', 'views/tweet', 'models/instagram', 'views/instagram', 'views/train', 'models/train', 'models/eventful', 'views/eventful', 'models/eventbrite', 'views/eventbrite', 'models/divvy', 'views/divvy'], ($, Backbone, Tweet, TweetView, Instagram, InstagramView, TrainView, Train, Eventful, EventfulView, Eventbrite, EventbriteView, Divvy, DivvyView) ->

  class Sockets extends Backbone.Model
    pusher: new Pusher('86bccb7dee9d1aea8897')

    initialize: ->
      instagram_channel = new WebSocketRails("#{window.location.host}:3000/websocket")
      instagram_channel.trigger('events.instagram_initialize')
      colcounter = 1
      instagram_channel.bind "events.instagram_success", (message) ->
        i = new Instagram(message)
        if colcounter is 3
          colcounter = 1
        else
          colcounter += 1
        new InstagramView(i, colcounter)

      train_channel = new WebSocketRails("#{window.location.host}:3000/websocket")
      console.log 'make it rain'
      train_channel.trigger('events.trains')
      train_channel.bind "events.success", (message) ->
        $.each message.ctatt.route, (index, value) ->
          $.each value.train, (ind, val) ->
            tr = new Train(val, ind)
            new TrainView(tr)

      eventful = new WebSocketRails("#{window.location.host}:3000/websocket")
      eventful.trigger "events.eventful"
      eventful.bind "events.eventful_success", (message) ->
        $.each message, (index, value) ->
          event = new Eventful(value)
          new EventfulView(event)
          
      eventbrite = new WebSocketRails("#{window.location.host}:3000/websocket")
      eventbrite.trigger "events.eventbrite"
      eventbrite.bind "events.eventbrite_success", (message) ->
        $.each message, (index, value) ->
          eb = new Eventbrite(value)
          new EventbriteView(eb)

      divvy = new WebSocketRails("#{window.location.host}:3000/websocket")
      divvy.trigger "events.bikes"
      divvy.bind "events.success", (message) ->
        $.each message.stationBeanList, (index, value) ->
          d = new Divvy(value)
          new DivvyView(d)

      twitter_channel = new WebSocketRails("#{window.location.host}:3000/websocket")
      twitter_channel.trigger "events.tweets"
      twitter_channel.bind 'events.tweet_success', (data) ->
        t = new Tweet(data)
        new TweetView (t)
