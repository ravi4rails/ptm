class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result

    @users = @users.order(id: :desc).page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.csv { send_data User.to_csv(@users), filename: "users-#{Date.today}.csv" }
    end
  end 

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_path(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show 
  end 

  def edit
  end

  def update 
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_user_path(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy 
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private 

    def user_params
      params.require(:user).permit(:first_name, :last_name, :contact, :company_id, :role, :email, :password, :profile_pic)
    end

    def set_user
      @user = User.find(params[:id])
    end 
end 