class Permissions < Aegis::Permissions
 
  role :guest
  role :registered_user
  role :administrator, :default_permission => :allow
 
  permission :edit_place do |user, post|
    allow :registered_user do
      post.creator == user # registered users may only edit their own posts
    end
    allow :moderator # moderators may edit any post
  end
 
  permission :read_place do |user, post|
    allow :everyone
    deny :guest do
      post.private? # guests may not read private posts
    end
  end
 
end