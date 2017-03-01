# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Language.destroy_all
Gathering.destroy_all
Lesson.destroy_all
Comment.destroy_all
User.destroy_all

eva = User.create!(email: "eva@gmail.com", password: "asdfjkl")


chinBeg = Language.create!(level: "Chinese Beginner", description: "Learn about simple common phrases in Chinese from Hello to days of the week.", user_id: eva.id)
chinInt = Language.create!(level: "Chinese Intermediate", description: "For those who can converse but want to create simple methods", user_id: eva.id)

chinParty = chinInt.gatherings.create!(topic: "Party", location: "Chinatown", photo_url: "https://lh4.googleusercontent.com/u66otdfjRqeMEOoQ554u5OwfA8FE5svWdf1f1J88n9QpU2qlpPwA5ed0mAGx-_Z6_yML8v1QnvGX3EjCeeJCFOOZCMJcT57x5uLGeoWEnsEbyWA_f30", description: "Party time friends welcome.", user_id: eva.id)
chinfood = chinBeg.gatherings.create!(topic: "Ordering food", location: "Chinatown", photo_url: "http://0.lushome.com/wp-content/uploads/2013/01/chinese-new-year-celebration-table-decorations-meals.jpg", description: "Lets take a trip to chinese restaurant", user_id: eva.id)

intro = chinBeg.lessons.create!(title: "Chinese Tones", photo_url: "https://resources.allsetlearning.com/pronwiki/images/thumb/a/aa/Chinese-Tones-funban.jpg/785px-Chinese-Tones-funban.jpg",link_url: "https://youtu.be/3wV8B4bx1lM", summary: "Mandarin has 4 kinds of tones that greatly affect the word or phrase you are trying to convey. It is foundational for learning Chinese.", user_id: eva.id)
lesson2 = chinInt.lessons.create!(title: "How to Address Others", photo_url: "http://www.missionalevangelism.net/wp-content/uploads/2014/10/Name.jpg", link_url: "https://youtu.be/TZfYmE-xy4g", summary: "You will learn how to ask and answer questions about your name and how to talk about last names/family names.", user_id: eva.id)


comment1 = chinParty.comments.create!(content: "This is fun", user_id: eva.id)
comment2 = chinfood.comments.create!(content: "This sounds awesome!", user_id: eva.id)
