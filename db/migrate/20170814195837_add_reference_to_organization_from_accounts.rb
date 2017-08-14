class AddReferenceToOrganizationFromAccounts < ActiveRecord::Migration[5.1]
  def change
    add_reference :organizations, :account, index: true, foreign_key: true
  end
end
