require 'rails_helper'

describe MessagesController do
    let(:group) { create(:group) }
  describe "GET #index" do
    let(:message) { create(:message) }
    let(:user) { create(:user) }
    let(:groups) { create(:groups) }
    context "user_signed_in" do
      before do
        login_user(user)
      end
      it "renders the :index template" do
        get :index, params: { group_id: group }
        expect(response).to render_template :index
      end
      it "assigns the requested group to @group" do
        get :index, params: { group_id: group }
        expect(assigns(:group)).to eq group
      end
    end
    context "not user_signed_in" do
      it "renders the :index template" do
        get :index, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "POST #create" do
    context "user_signed_in and save a message" do
      before do
        user = create(:user)
        login_user(user)
      end
      it "is saved message" do
        expect{ post :create, params: { group_id: group, message: attributes_for(:message) }}.to change(Message, :count).by(1)
      end
      it "redirect to index when failed to save a message" do
        post :create, params: { group_id: group, message: attributes_for(:message)}
          expect(response).to redirect_to group_messages_path
      end
    end
    context "not user_signed_in" do
      it "redirect to sign_up template" do
        post :create, params:{ group_id: group, message: attributes_for(:message)}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
