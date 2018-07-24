require 'csv'

class Csv::UserExportService

  attr_accessor :relation

  def initialize(relation)
    @relation = relation
  end

  def generate
    attributes = %w{ email first_name last_name contact
     role created_at }

    Csv.generate(headers: true) do |csv|
      csv << attributes

      @relation.each_with_index do |record, index|
        csv << attributes.map { |attr| record.send(attr) }
      end

    end
  end

User