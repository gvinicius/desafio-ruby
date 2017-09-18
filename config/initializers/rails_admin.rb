RailsAdmin.config do |config|
  config.parent_controller = "::ApplicationController"

  config.main_app_name = ["Ruby Challenge Markplace", ""]
  ### Popular gems integration

  # == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :store
   end
   config.current_user_method(&:current_store)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show

    config.model 'Store' do 
      ["name", "website", "email", "logo", "password", "password_confirmation"].each do |field|
        field field.to_sym
      end
    end
    config.model 'Product' do 
      ["name", "price", "parcels", "image"].each do |field|
        field field.to_sym
      end
      create do
        field :store, :hidden do
          default_value do
            puts 'My email'
            puts bindings[:view]._current_store
            bindings[:view]._current_store
          end
        end
      end
    end
  end
end
