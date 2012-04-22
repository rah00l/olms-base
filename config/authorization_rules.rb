authorization do  
  role :admin do
    has_permission_on [
      :admin_commits, 
      :admin_dashboard, 
      :admin_settings, 
      :admin_announcements, 
      :admin_delayed_jobs,
      :admin_users
    ], :to => [:manage]
    
    has_permission_on :admin_users, :to => [
      :active, :search,:pending,:reset_password,:suspended, :activate,
      :deleted, :suspend , :unsuspend, :purge, :toggle_role, :update
    ]
  end

  role :guest do
    
  end
end
  
privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end



