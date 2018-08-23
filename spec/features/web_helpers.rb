def sign_in_and_play
  visit("/")
  fill_in :p1_name, with: "Andrew"
  fill_in :p2_name, with: "James"
  click_button "Submit"
end
