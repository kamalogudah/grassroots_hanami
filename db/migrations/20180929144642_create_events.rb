Hanami::Model.migration do
  change do
    create_table :events do
      primary_key :id

      column :title, String, null: false
      column :description, String, null: false
      column :location, String, null: false
      column :start_time, DateTime, null: false
      column :end_time, DateTime, null: false


      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
