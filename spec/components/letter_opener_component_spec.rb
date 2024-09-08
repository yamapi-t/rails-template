# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LetterOpenerComponent, type: :component do
  context 'when in test environment' do
    it 'does not render' do
      expect(render_inline(described_class.new).to_html).to be_empty
    end
  end
end
