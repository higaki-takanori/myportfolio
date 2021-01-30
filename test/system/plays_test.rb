require "application_system_test_case"

class PlaysTest < ApplicationSystemTestCase
  setup do
    @play = plays(:one)
  end

  test "visiting the index" do
    visit plays_url
    assert_selector "h1", text: "Plays"
  end

  test "creating a Play" do
    visit plays_url
    click_on "New Play"

    fill_in "Deleted at", with: @play.deleted_at
    fill_in "Max player", with: @play.max_player
    fill_in "Min player", with: @play.min_player
    fill_in "Outline", with: @play.outline
    fill_in "Place", with: @play.place
    fill_in "Play image path", with: @play.play_image_path
    fill_in "Title", with: @play.title
    fill_in "User", with: @play.user_id
    fill_in "Winnig content", with: @play.winnig_content
    click_on "Create Play"

    assert_text "Play was successfully created"
    click_on "Back"
  end

  test "updating a Play" do
    visit plays_url
    click_on "Edit", match: :first

    fill_in "Deleted at", with: @play.deleted_at
    fill_in "Max player", with: @play.max_player
    fill_in "Min player", with: @play.min_player
    fill_in "Outline", with: @play.outline
    fill_in "Place", with: @play.place
    fill_in "Play image path", with: @play.play_image_path
    fill_in "Title", with: @play.title
    fill_in "User", with: @play.user_id
    fill_in "Winnig content", with: @play.winnig_content
    click_on "Update Play"

    assert_text "Play was successfully updated"
    click_on "Back"
  end

  test "destroying a Play" do
    visit plays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Play was successfully destroyed"
  end
end
