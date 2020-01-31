App.site = App.cable.subscriptions.create "SiteChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    user_name = data.user.nickname
    user_id = data.user.id

    if !data.user.online
      $("#users-online").find("[data-user-id='" + data.user.id + "']").remove();

    if data.user.online && $("#users-online").find("[data-user-id='" + data.user.id + "']").length != 1
      $("#users-online").append("<p data-user-id='" + user_id + "'>" +
        "<span class=\"badge badge-success\">Online</span> " + user_name + "</p>")