class Report < ActiveRecord::Base


  attr_accessible :name, :status, :project_id, :project
  belongs_to :project

  def perform
    update_attributes(:status => "failed") and return if project.nil?


    path = "/Users/maxsilver/Projects/collectionist-worker/"

    begin
      `rm -r tmp/report-#{id}`
      `git clone #{project.git_repository_url} tmp/report-#{id}`
    rescue Exception => e
    end
    `cd tmp/report-#{id} && bundle install && bundle exec ruby #{path}scripts/roodi-all.rb`
    `cd tmp/report-#{id} && giton master && git reset HEAD`

    update_attributes(:status => "complete")
  end
end
