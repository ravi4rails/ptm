class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :project_team_members, dependent: :destroy 

  paginates_per 10
  def self.to_csv(records)
    csv_generator = Csv::UserExportService.new(records)
    csv_generator.generate
  end        
end