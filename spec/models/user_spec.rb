require 'rails_helper'

RSpec.describe User, type: :model do

  
  describe 'Validations' do

    it "Saves a user when the passwords match" do
      @user = User.new({
        first_name: 'Nicolas',
        last_name: 'Cage',
        email: 'nicolasCage@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      })
  
      @user.save
      
      @found_user = User.where(first_name: 'Nicolas')
      puts "Found user: #{@found_user.inspect}"
      expect(@found_user).to exist

    end

    it "Doesn't save a user when the passwords don't match" do
      @user = User.new({
        first_name: 'SuperNicolas',
        last_name: 'Cage',
        email: 'nicolasCage@gmail.com',
        password: 'password',
        password_confirmation: 'pasword'
      })
  
      @user.save


      @found_user = User.where(first_name: 'SuperNicolas')
      puts "Found user: #{@found_user.inspect}"
      expect(@found_user).not_to exist

    end

    it "Doesn't save a user when the email isn't unique" do
      @first_user = User.new({
        first_name: 'Nicolas',
        last_name: 'Cage',
        email: 'nicolasCage@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      })
    
      @first_user.save
    
      @second_user = User.new({
        first_name: 'SuperNicolas',
        last_name: 'Cage',
        email: 'NICOLASCAGE@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      })
  
      @second_user.save


      @found_user = User.where(first_name: 'SuperNicolas')
      puts "Found user: #{@found_user.inspect}"
      expect(@found_user).not_to exist
    end

    it "Doesn't save a user when the password is less than 6 characters" do
      @user = User.new({
        first_name: 'SuperNicolas',
        last_name: 'Cage',
        email: 'thecage@gmail.com',
        password: '123',
        password_confirmation: '123'
      })

      @user.save

      @found_user = User.where(first_name: 'SuperNicolas')
      puts "Found user: #{@found_user.inspect}"
      expect(@found_user).not_to exist
    end
  end

  describe '.authenticate_with_credentials'  do

    it "properly logs in with correct email and password"  do
      @user = User.new({
        first_name: 'Nicolas',
        last_name: 'Cage',
        email: 'nicolasCage@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      })
    
      @user.save

      check_user = User.authenticate_with_credentials('nicolasCage@gmail.com', 'password')
      puts "User check: #{check_user}" 
    end
    it "properly trims whitespaces from emails"  do

      @user = User.new({
        first_name: 'Nicolas',
        last_name: 'Cage',
        email: 'nicolasCage@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      })
    
      @user.save
      check_user = User.authenticate_with_credentials('   nicolasCage@gmail.com   ', 'password')
      puts "User check: #{check_user.inspect}" 
    end
  end
end
