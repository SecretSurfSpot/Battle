# User Story 1
# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our names and seeing them
feature "it shows 2 names" do
  scenario "load the page" do
    sign_in_and_play
    expect(page).to have_content("Andrew vs. James")
  end
end
