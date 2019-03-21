# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

todos = Todo.create([
  {task: "Buy Groceries"},

  {task: "Wash the Car", done: true},

  {task: "Clean my room" },

  {task: "Do the Laundry"},

  {task: "Work on Mini-Project"},

  {task: "Walk the Dog", done: true}

   ])