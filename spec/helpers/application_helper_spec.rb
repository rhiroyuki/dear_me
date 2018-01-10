require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe '#flash_message' do
    context 'with a key message' do
      context 'with only one message' do
        subject { helper.flash_message('error', 'name not valid') }

        it 'returns the li tag with the message' do
          expect(subject).to include('<li>')
          expect(subject).to include('name not valid')
        end
      end

      context 'with an array of messages' do
        subject do
          helper.flash_message('error', ['name not valid', 'name cannot be blank' ])
        end

        it 'returns the li tag with the message' do
          expect(subject).to include('<li>')
          expect(subject).to include('name not valid')
          expect(subject).to include('name cannot be blank')
        end
      end
    end
  end
end
