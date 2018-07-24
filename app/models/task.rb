class Task < ApplicationRecord
  paginates_per 10
  belongs_to :project
  has_many :sub_tasks, dependent: :destroy
  accepts_nested_attributes_for :sub_tasks, reject_if: :all_blank, allow_destroy: true

  def self.to_csv(records)
    csv_generator = Csv::TaskExportService.new(records)
    csv_generator.generate
  end
end
