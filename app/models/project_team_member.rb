class ProjectTeamMember < ApplicationRecord
  paginates_per 10
  belongs_to :user
  belongs_to :project
end
