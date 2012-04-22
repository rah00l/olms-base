class AddFacebookEmailToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :facebook_email, :string
  end
end
