# frozen_string_literal: true

class ApplicationReflex < StimulusReflex::Reflex
  delegate :render, to: ApplicationController
  # Put application wide Reflex behavior in this file.
  #
  # Example:
  #
  #   # If your ActionCable connection is: `identified_by :current_user`
  delegate :current_user, to: :connection
  #
  # Learn more at: https://docs.stimulusreflex.com
  before_reflex do
    Current.user = current_user
  end
end
