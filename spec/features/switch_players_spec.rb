# As two Players,
# So we can continue our game of Battle,
# We want to switch turns
feature "Switch Players" do
  scenario "Switch from Player 1 to Player 2" do
    sign_in_and_play
    click_button("Attack")
    click_button("Attack")
    expect(page).to have_content("James attacks Andrew")
  end
end
