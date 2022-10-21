# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Library.create([
    { name: 'ABC Library', opening_time: '10AM', closing_time: '6PM' },
    { name: 'Mark Library', opening_time: '3AM', closing_time: '2PM' },
    { name: 'Starck Library', opening_time: '5AM', closing_time: '4PM' },
    { name: 'Jhon Library', opening_time: '8AM', closing_time: '9PM' }

])
Book.create([
  { title: 'harry porter', published_at: '12.10.2002', language: 'english'}
])

Author.create([
  { name: 'Bhanu', dob: '22.10.1992'}

])