ActiveAdmin.register User do
  permit_params :email,:username, :business_address_line_1, :business_address_line_2, :city, :zip_code, :state, :telephone, :fax
  
    index do
    selectable_column
    id_column
    column :email
    column :username
    column :business_address_line_1
    column :business_address_line_2
    column :city
    column :zip_code
    column :state
    column :telephone
    column :fax
    actions
  end
  
  filter :email
  filter :username
  filter :business_address_line_1
  filter :business_address_line_2
  filter :city
  filter :zip_code 
  filter :state
  filter :telephone
  filter :fax

   form do |f|
    inputs 'Users'do 
    
    end
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :username, :reset_password_token, :reset_password_sent_at, :remember_created_at, :business_address_line_1, :business_address_line_2, :city, :zip_code, :state, :telephone, :fax
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :username, :reset_password_token, :reset_password_sent_at, :remember_created_at, :business_address_line_1, :business_address_line_2, :city, :zip_code, :state, :telephone, :fax]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
