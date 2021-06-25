puts "Creating roles..."
roles = ["Student", "Instructor", "Admin", "Unpaid"]
roles.each do |role|
  Role.create!(category: role)
end

puts "Creating admin and instructor users..."
User.create!([
  { email: "peter@test.com", first_name: "Peter", last_name: "Jang", role_id: 3 },
  { email: "danielle@test.com", first_name: "Dani", last_name: "Zaghian", role_id: 3 },
  { email: "brian@test.com", first_name: "Brian", last_name: "Rice", role_id: 3 },
  { email: "amanda@test.com", first_name: "Amanda", last_name: "Hale", role_id: 3 },
  { email: "kevin@test.com", first_name: "Kevin", last_name: "Mitchell", role_id: 2 },
])

puts "Creating assignment versions..."
AssignmentVersion.create!(description: "version 2021")

puts "Creating assignments..."
assignment_data = []
index = 0
while index < 100
  assignment_data << {
    assignment_version_id: 1,
    title: Faker::Hipster.sentence,
    week: index / 20 + 1,
    question: Faker::Lorem.question,
    video_url: "https://youtu.be/#{Faker::Internet.password}",
    solution: Faker::Lorem.paragraph,
    video_length: Faker::Number.number(digits: 3),
    created_at: Time.now,
    updated_at: Time.now,
  }
  index += 1
end
Assignment.insert_all!(assignment_data)

puts "Creating cohorts..."
cohort_data = []
5.times do
  cohort_data << {
    assignment_version_id: 1,
    user_id: 5,
    title: Faker::Company.name,
    gmail_calendar: Faker::Internet.safe_email,
    created_at: Time.now,
    updated_at: Time.now,
  }
end
Cohort.insert_all!(cohort_data)

puts "Creating student users..."
student_data = []
Cohort.all.each do |cohort|
  rand(10..20).times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    student_data << {
      email: "#{first_name}.#{last_name}@test.com".downcase,
      first_name: first_name,
      last_name: last_name,
      role_id: 1,
      cohort_id: cohort.id,
      created_at: Time.now,
      updated_at: Time.now,
    }
  end
end
User.insert_all!(student_data)

puts "Creating submissions and comments (this takes a while)..."
submission_data = []
comment_data = []
submission_id = 1
Assignment.all.each do |assignment|
  puts "Creating submissions and comments for assignment #{assignment.id} of #{assignment_data.length}"
  User.where(role_id: 1).each do |student|
    rand(0..2).times do
      answer = Faker::Lorem.sentence
      grade = ["A", "B", "C", "R"].sample
      submission_data << {
        user_id: student.id,
        assignment_id: assignment.id,
        answer: answer,
        viewed_by_admin: true,
        grade: grade,
        created_at: Time.now,
        updated_at: Time.now,
      }
      if grade == "C" || grade == "R"
        rand(1..3).times do
          comment_data << {
            submission_id: submission_id,
            user_id: 5,
            text: Faker::Lorem.sentence,
            submission_text: answer,
            created_at: Time.now,
            updated_at: Time.now,
          }
        end
      end
      submission_id += 1
    end
  end
end
puts "Inserting data..."
Submission.insert_all!(submission_data)
Comment.insert_all!(comment_data)
