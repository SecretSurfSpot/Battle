# User Story 1
# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our names and seeing them
feature "it takes 2 names in a form" do
  scenario "load the page" do
    visit("/")
    expect(page).to have_field("p1_name")
    expect(page).to have_field("p2_name")
  end
end
# Second test User Story 1 - ensuring we can see the names
feature "it shows 2 names" do
  scenario "load the page" do
    name1 = "Andrew"
    name2 = "Alex"
    visit("/")
    fill_in "p1_name", with: name1
    fill_in "p2_name", with: name2
    click_button "Submit"
    expect(page).to have_content(name1 + " vs. " + name2)
    #expect(page).to have_content("Player 2: " + name2)
  end
end

# User Story 2
# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points
feature "Show Hit Points" do
  scenario "see Player 2 hit points" do
    visit("/")
    fill_in :p1_name, with: "Andrew"
    fill_in :p2_name, with: "Alex"
    click_button "Submit"
    expect(page).to have_content "Alex: 60HP"
  end
end
