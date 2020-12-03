ActiveAdmin.register Member do

  permit_params :name, :name_kana, :image_id, :email, :is_deleted

  filter :name

  index do
    selectable_column
    column :id
    column :name
    column :name_kana
    column :image_id
    column :email
    column :is_deleted do |member|
      if member.is_deleted == false
        "登録中"
      elsif member.is_deleted == true
        "退会中"
      end
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :name_kana
      row :image_id
      row :email
      row :is_deleted do |member|
        if member.is_deleted == false
          "登録中"
        elsif member.is_deleted == true
          "退会中"
        end
      end
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :name_kana
      f.input :image_id, :as => :file
      f.input :email
      f.input :is_deleted, as: :select,collection:{"登録中"=>false, "退会中"=>true}
    end
    f.actions
  end



  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :name_kana, :role, :is_deleted, :image_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :name_kana, :role, :is_deleted, :image_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
