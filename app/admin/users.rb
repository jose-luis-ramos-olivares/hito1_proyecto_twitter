ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_name, :profile_photo

  # controller do
  #   alias_method :update_model, :update
  #   def update
  #     if resource.nesteds.any?
  #       resource.nesteds.each do |nested|
  #         nested.user_name = params[:user][:user_name]
  #         nested.save!
  #       end
  #     end
  #     update_model
  #     redirect_to admin_user_path
  #   end
  # end
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :user_name, :profile_photo, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :email
    column :user_name
    column "Cantidad Tweets" do |i|
      i.tweets.count
    end
    column "Cantidad Likes" do |i|
      i.likes.count
    end
    column "Cantidad Retweets" do |i|
      
    end
    actions
  end
  
end
