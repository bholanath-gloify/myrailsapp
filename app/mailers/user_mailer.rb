class UserMailer < ApplicationMailer
  default from: 'bholanath@gloify.com'

  def welcome_email(user)
    @user = user
    email = @user.email
    @url  = 'http://example.com/login'
    mail(to: email, subject: 'Sign Up confirmation')
  end

  def delete_user(user)
    @user = user
    email = @user.email
    mail(to: email, subject: 'User account deleted')
  end

  def update_user(user)
    @user = user
    email = @user.email
    mail(to: email, subject: 'User Details Updated')
  end


  def author_notify(book)
    @book = book
    author_id = @book.user_id
    id = author_id

    email = User.find(id).email
    mail(to: email, subject: 'Notify User for Book Assign')
  end
end
