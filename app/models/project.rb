class Project < ActiveRecord::Base
  attr_accessible :git_repository_url, :name
  has_many :reports
end
