require 'csv'

class Csv::ProjectExportService

  attr_accessor :relation

  def initialize(relation)
    @relation = relation
  end

  def generate
    attributes = %w{ name description created_at  }

    Csv.generate(headers: true) do |csv|
      csv << attributes

      @relation.each_with_index do |record, index|
        csv << attributes.map { |attr| record.send(attr) }
      end

    end
  end

end