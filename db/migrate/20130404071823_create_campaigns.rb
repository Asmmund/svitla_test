class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.datetime :time_start
      t.datetime :time_end
      t.text :info

      t.timestamps
    end
  end
end
