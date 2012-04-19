class Commit < ActiveRecord::Base
  attr_accessible :report_id, :sha, :status
end
