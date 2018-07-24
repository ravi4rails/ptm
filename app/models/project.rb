class Project < ApplicationRecord
  paginates_per 10
  has_many :tasks, dependent: :destroy
  has_many :project_team_members, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  def self.to_csv(records)
    csv_generator = Csv::ProjectExportService.new(records)
    csv_generator.generate
  end
end
