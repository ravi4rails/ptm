class SubTask < ApplicationRecord
  belongs_to :task
  paginates_per 10
  def self.to_csv(records)
    csv_generator = Csv::SubTaskExportService.new(records)
    csv_generator.generate
  end
end
