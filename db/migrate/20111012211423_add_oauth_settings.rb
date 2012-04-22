class AddOauthSettings < ActiveRecord::Migration
  def up
    Setting.create!(:label =>"Twitter login enabled?", :identifier => "twiter-auth", :description => "Users could login using Twitter account", :field_type =>"boolean", :value =>"0")
    Setting.create!(:label =>"OpenId login enabled?", :identifier => "openid-auth", :description => "Users could login using OpenId account", :field_type =>"boolean", :value =>"0")
    Setting.create!(:label =>"Facebook login enabled?", :identifier => "facebook-auth", :description => "Users could login using Facebook account", :field_type =>"boolean", :value =>"0")
  end

  def down
    ["twiter-auth", "openid-auth", "facebook-auth"].each do |x|
      Settings.find_by_identifier(x).destroy!
    end
  end
end
