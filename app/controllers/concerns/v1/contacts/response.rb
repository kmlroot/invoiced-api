module V1
  module Contacts
    module Response
      extend ActiveSupport::Concern

      def update_and_render_contact(contact, params)
        contact.update(params) && render(:update, locals: { contact: contact })
      end

      def create_and_render_contact(contact)
        contact.save && render(:create, status: :created, locals: { contact: contact })
      end

      def destroy_and_render_contact(contact)
        contact.destroy && head(:ok)
      end

      def render_invalid_response
        head(:unprocessable_entity)
      end
    end
  end
end
