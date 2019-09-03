class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user, foreignkey: true
  end
end
