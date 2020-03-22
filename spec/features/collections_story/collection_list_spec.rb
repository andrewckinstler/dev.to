require "rails_helper"

RSpec.describe "Collection", type: :feature do
  describe "visit collections page" do
    before do
      user = create(:user)
      # article = create(:article, user_id: user.id)
      create(:collection, :with_articles, user: user)
      # allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(user)
    end

    it "returns colection page" do
      visit "/collections"
      expect(page).to have_content("Collections Page")
    end
  end

  #   describe "PUT reading_list_items/:id" do
  #     it "returns archives item if no param" do
  #       put "/reading_list_items/#{reaction.id}"
  #       expect(reaction.reload.status).to eq("archived")
  #     end

  #     it "unarchives an item if current_status is passed as archived" do
  #       put "/reading_list_items/#{reaction.id}", params: { current_status: "archived" }
  #       expect(reaction.reload.status).to eq("valid")
  #     end

  #     it "raises NotAuthorizedError if current_user is not the reaction user" do
  #       expect { put "/reading_list_items/#{unauthorized_reaction.id}" }.to raise_error Pundit::NotAuthorizedError
  #     end
  #   end
end
