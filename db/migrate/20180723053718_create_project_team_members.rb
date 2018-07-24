class CreateProjectTeamMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :project_team_members do |t|
      t.string :role
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
