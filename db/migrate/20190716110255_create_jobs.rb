class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title, null: true
      t.string :description, null: true
      t.string :url, null: true
      t.string :company, null: true
      t.string :company_logo, null: true   
      t.timestamps
    end
  end
end
