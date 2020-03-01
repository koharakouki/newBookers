class UsersController < ApplicationController

before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update]

def index
	@book = Book.new
	@user = User.find(current_user.id)
	@users = User.all
end

def create
	@book = Book.new(book_params)
	@book.user_id = current_user.id
	@user = User.find(current_user.id)
	@books = Book.all
	if @book.save
		redirect_to book_path(@book.id)
		flash[:notice] = "You have created book successfully."
	else
		redirect_to books_path
	end
end


def show
	@book = Book.new
	@user = User.find(params[:id])
	@books = @user.books.all
end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
	if @user.update(user_params)
		redirect_to user_path(@user.id)
		flash[:notice] = "You have updated user successfully."
	else
		render 'edit'
	end
end

def destroy
end

private
def user_params
	params.require(:user).permit(:name, :introduction, :profile_image)
end

def book_params
	params.require(:book).permit(:title, :body)
end

 def correct_user
    @user = User.find(params[:id])
    redirect_to(user_url(current_user)) unless @user == current_user
  end
end
