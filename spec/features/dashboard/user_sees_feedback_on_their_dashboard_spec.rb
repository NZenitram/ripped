require "rails_helper"

describe "dashboard", :vcr  do
  xit "a user can see feedback on dashboard" do
    user = create(:user, census_id: 55)
    solution = create(:solution, user: user)
    feedback = create(:feedback, solution: solution)
    feedback2 = create(:feedback, solution: solution)
    feedback3 = create(:feedback, solution: solution)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Feedback")
    expect(page).to have_content("Anna Dolan")
    expect(page).to have_content(feedback.comment)
    expect(page).to have_content(feedback2.comment)
    expect(page).to have_content(feedback3.comment)
  end
end
