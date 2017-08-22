class AddConfirmableToUsers < ActiveRecord::Migration[5.1]
  def up
    execute("UPDATE users SET confirmed_at = NOW()")
  end
end
