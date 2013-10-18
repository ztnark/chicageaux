var map = undefined;
$(document).ready(function(){
  map = loadMap();
  var marker;
  // getTweets();
  // events(map);
  
  var dispatcher = new WebSocketRails('localhost:3000/websocket');

  // function onOpen(evt){
  //   console.log("hello");
  // }



  
  dispatcher.trigger("events.tweets")

  dispatcher.bind("events.success", function(message){
     convertTweetsToMapObjects(message);
  })
  // dispatcher.bind('tasks.create_success', function(task) {
  // console.log('successfully created ' + task.name);
// });
})
