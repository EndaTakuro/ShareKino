ActiveAdmin.register Movie do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  #編集を許可するフィールドの定義
  permit_params :title, :introduction, :image_id

  filter :title

  index do
    selectable_column
    column :id
    column :title
    column :introduction
    column :image_id
    column :created_at
    actions
  end

    show do
      attributes_table do
        row :title
        row :introduction
        # show画面で画像を表示するためのタグを追加
        row :image_id do
          image_tag movie.image_id.url(:thumb) if movie.image_id.present?
        end
      end
    end

  form do |f|
      f.inputs "Movies" do
        f.input :title
        f.input :introduction
        f.input :image_id, :as => :file
      end
      f.actions
    end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :introduction, :image_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
