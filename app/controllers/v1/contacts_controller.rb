module V1
  class ContactsController < ApplicationController
    def index
      @contacts = current_account.contacts

      render :index, status: :ok
    end

    def create
      @contact = current_organization.contacts.build(contact_params)

      if @contact.save
        render :create, status: :created
      else
        head(:unprocessable_entity)
      end
    end

    def update
      @contact = current_organization.contacts.find(params[:id])

      if @contact.update
        render :update
      else
        head(:unprocessable_entity)
      end
    end

    def destroy
      @contact = current_organization.contacts.find(id: params[:id])

      if @contact.destroy
        head(:ok)
      else
        head(:unprocessable_entity)
      end
    end

    private

    def current_account
      @current_account ||= Account.friendly.find(params[:account_id])
    end

    def current_organization
      @current_organization ||= current_account.organization.friendly.find(params[:organization_id])
    end

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email)
    end
  end
end
