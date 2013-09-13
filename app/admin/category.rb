ActiveAdmin.register Category do

  index do
    column :id
    column :Name

    column "Created At", :created_at
    column "Updated At", :updated_at
    default_actions
  end

end
