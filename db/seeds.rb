# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
  password = 'password'

  puts "Password for all accounts: #{password}\n\n"

  if test_user = User.find_by_email('test@example.com')
    test_user.update(
      password: password,
      password_confirmation: password)
    puts "Account updated: #{test_user.email}"
  else
    test_user = User.create(
      email: 'test@example.com',
      display_name: 'Test User',
      password: password,
      password_confirmation: password)
    puts "Account created: #{test_user.email}"
  end

  if admin_user = User.find_by_email('admin@example.com')
    admin_user.update(
      password: password,
      password_confirmation: password)
    admin = Role.find_or_create_by(name: 'admin')
    admin.users << admin_user
    admin.save
    puts "Account updated: #{admin_user.email}"
  else
    admin_user = User.create(
      email: 'admin@example.com',
      display_name: 'Admin User',
      password: password,
      password_confirmation: password)
    admin = Role.find_or_create_by(name: 'admin')
    admin.users << admin_user
    admin.save
    puts "Account created: #{admin_user.email}\n\n"
  end
