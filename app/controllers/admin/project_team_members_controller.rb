class Admin::ProjectTeamMembersController < AdminController
  before_action :set_project_team, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @q = ProjectTeamMember.ransack(params[:q])
    @project_team_members = @q.result

    @project_team_members = @project_team_members.order(id: :desc).page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.csv { send_data ProjectTeamMember.to_csv(@projects), filename: "projects-#{Date.today}.csv" }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project_team_member = ProjectTeamMember.new
    @project = Project.all
    @user = User.all
  end

  # GET /projects/1/edit
  def edit
    @project = Project.all
    @user = User.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @project_team_member = ProjectTeamMember.new(project_team_params)

    respond_to do |format|
      if @project_team_member.save
        format.html { redirect_to admin_project_team_member_path(@project_team_member), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project_team_member }
      else
        format.html { render :new }
        format.json { render json: @project_team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project_team_member.update(project_team_params)
        format.html { redirect_to admin_project_team_member_path(@project_team_member), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_team_member }
      else
        format.html { render :edit }
        format.json { render json: @project_team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project_team_member.destroy
    respond_to do |format|
      format.html { redirect_to admin_project_team_members_url, notice: 'Project team member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_team
      @project_team_member = ProjectTeamMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_team_params
      params.require(:project_team_member).permit(:role, :project_id, :user_id)
    end
end
