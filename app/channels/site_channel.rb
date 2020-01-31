class SiteChannel < ApplicationCable::Channel
  def subscribed
    stream_from "site_channel"

    current_user.update!(online: true)

    user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    current_user.update!(online: false)

    user
  end

  def user
    # logger.info "site_channel, status: #{data.inspect}"
    ActionCable.server.broadcast "site_channel", { user: current_user }
  end
end
