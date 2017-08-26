require 'rails_helper'
  describe Message do
    describe '#create' do
      context'messageを保存する' do
        it'is valid with a content' do
          message = build(:message, img:'')
          message.valid?
          expect(message).to be_valid
        end
        it'is valid with a img' do
          message = build(:message, content:'')
          message.valid?
          expect(message).to be_valid
        end
        it'is valid with a content and img' do
          message = build(:message)
          message.valid?
          expect(message).to be_valid
        end
      end
      context'messageを保存しない' do
        it'is invalid without content and img'do
          message = build(:message, content:'',img:'')
          message.valid?
            binding.pry
          expect(message.errors[:content_or_img]).to include("を入力してください")
        end
        it'is invalid without a group_id'do
          message = build(:message, group_id:'')
          message.valid?
          expect(message.errors[:group_id]).to include("を入力してください")
        end
          it'is invalid without a user_id'do
            message = build(:message, user_id: '')
            message.valid?
            expect(message.errors[:user_id]).to include("を入力してください")
        end
      end
    end
  end
end
