# frozen_string_literal: true

class MessageReflex < ApplicationReflex

  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com
  def submit
    current_channel = Channel.find(message_params[:channel_id])
    Rails.logger.debug("Current User #{Current.user.name}")
    message = current_channel.messages.create(message_params.merge(user: Current.user))
    message = current_channel.messages.new if message.valid?
    morph dom_id(message), render(partial: 'channels/message_form', locals: { message: message })
  end

  def message_params
    params.require(:message).permit(:channel_id, :body)
  end
end
