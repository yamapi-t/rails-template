# frozen_string_literal: true

class LetterOpenerComponent < ViewComponent::Base
  def render? = Rails.env.development?
end
