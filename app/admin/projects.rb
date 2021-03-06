ActiveAdmin.register Project do
  permit_params :name, :status, :logo, user_ids: []

  config.sort_order = 'id_asc'
  index do
    selectable_column
    id_column
    column :name
    column :status
    column :created_at
    column "Logo" do |project|
      image_tag project.logo.url || ("/assets/yourlogo.png")
    end
    actions
  end
     form do |f|
    f.inputs do
      f.input :name
      f.input :status
      f.input :logo
      f.input :users, as: :check_boxes
    end
    f.actions
  end

    show do
    attributes_table do
      row :name
      row :status
      row :logo do |project|
        image_tag project.logo.url || ("/assets/yourlogo.png")
      end
      row :users
    end
    active_admin_comments
    end

  filter :name
  filter :status, as: :select,collection: Project.statuses

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
