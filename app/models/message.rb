class Message < ApplicationRecord
  include CableReady::Broadcaster
  delegate :render, to: ApplicationController
  belongs_to :user
  belongs_to :channel

  after_commit :append_message

  private

  # https://cableready.stimulusreflex.com/
  # This is how you can can update clients right from the models.
  # dom_id is a nice easy way to generate dom elements.
  # It really just helps you stay consistant
  def append_message
    component = MessageComponent.new(message: self)
    Rails.logger.debug("Append Message Message commited #{MessageChannel.channel_name}")
    cable_ready[MessageChannel.channel_name].insert_adjacent_html(
      selector: dom_id(channel, :messages),
      html: render(component)
    )
  end
end
