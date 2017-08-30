require 'test_helper'

module V1
  class ContactsControllerTest < ActionDispatch::IntegrationTest
    test 'should get only contacts for bombilla labs' do
      account = accounts(:bombilla_labs)

      not_bombilla_labs_contact = contacts(:two)

      get v1_contacts_path(account_id: account.id)

      contacts = JSON.parse(@response.body)['data']
      contact_ids = contacts.map { |contact| contact['id'] }

      assert_response :success
      assert_not_includes contact_ids, not_bombilla_labs_contact.id
    end
  end
end
