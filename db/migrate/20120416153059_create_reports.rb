class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :status, :default => "pending"
      t.integer :project_id
      t.integer :total_commits
      t.integer :current_commit


      t.timestamps
    end
  end
end
