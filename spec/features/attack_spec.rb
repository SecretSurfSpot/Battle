# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation
feature "Player attacks" do
  scenario "Player 1 attacks Player 2" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Andrew attacks James")
  end
end

# User Story 2
# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points
feature "Show Hit Points" do
  scenario "see Player 2 hit points" do
    sign_in_and_play
    expect(page).to have_content "James: 60HP"
  end
# As Player 1,
# So I can see how close I am to losing,
# I want to see my own hit points
  scenario "see Player 1 hit points" do
    sign_in_and_play
    expect(page).to have_content "Andrew: 60HP"
  end
end

# As Player 1,
# So I can start to win a game of Battle,
# I want my attack to reduce Player 2's HP by 10
feature "Reduce Hit Points" do
  scenario "reduce Player 2 HP by 10" do
    sign_in_and_play
    click_button("Attack")
    click_button("OK")
    expect(page).to_not have_content "James: 60HP"
    expect(page).to have_content "James: 50HP"
  end

# As Player 1,
# So I can start to lose a game of Battle,
# I want Player 2's attack to reduce my HP
  scenario "reduce Player 1 HP by 10" do
    sign_in_and_play
    click_button("Attack")
    click_button("OK")
    click_button("Attack")
    click_button("OK")
    expect(page).to_not have_content "Andrew: 60HP"
    expect(page).to have_content "Andrew: 50HP"
  end

# As Player 1,
# So I can lose a game of Battle,
# I want Player 2 to attack me, and I want to get a confirmation
  scenario "PLayer 2 attacks Player 1" do
    sign_in_and_play
    click_button("Attack")
    click_button("OK")
    click_button("Attack")
    expect(page).to have_content "James attacks Andrew"
  end


end
