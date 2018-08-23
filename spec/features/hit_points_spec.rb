# User Story 2
# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points
feature "Show Hit Points" do
  scenario "see Player 2 hit points" do
    sign_in_and_play
    expect(page).to have_content "James: 60HP"
  end
end

# As Player 1,
# So I can start to win a game of Battle,
# I want my attack to reduce Player 2's HP by 10
feature "Reduce Hit Points" do
  scenario "Player 1 attacks Player 2" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to_not have_content "James: 60HP"
    expect(page).to have_content "James: 50HP"

  end
end