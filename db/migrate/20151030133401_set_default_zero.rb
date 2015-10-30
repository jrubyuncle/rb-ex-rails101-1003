class SetDefaultZero < ActiveRecord::Migration
  def change
    change_column :groups, :posts_count, :integer, default: 0
  end
end
