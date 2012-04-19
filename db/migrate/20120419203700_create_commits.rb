class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.integer :report_id
      t.string :status
      t.string :sha

      t.timestamps
    end
  end
end
