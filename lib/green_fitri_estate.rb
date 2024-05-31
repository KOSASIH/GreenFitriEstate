# Green Fitri Estate - Advanced Real Estate Management System

module GreenFitriEstate
  # Configuration module
  module Configuration
    # API keys and secrets
    API_KEY = "YOUR_API_KEY"
    API_SECRET = "YOUR_API_SECRET"

    # Database settings
    DATABASE_URL = "postgresql://user:password@localhost/green_fitri_estate"
    DATABASE_POOL_SIZE = 10

    # Email settings
    EMAIL_HOST = "smtp.gmail.com"
    EMAIL_PORT = 587
    EMAIL_USERNAME = "your_email@gmail.com"
    EMAIL_PASSWORD = "your_email_password"

    # Payment gateway settings
    PAYMENT_GATEWAY_API_KEY = "YOUR_PAYMENT_GATEWAY_API_KEY"
    PAYMENT_GATEWAY_SECRET_KEY = "YOUR_PAYMENT_GATEWAY_SECRET_KEY"

    # Social media settings
    FACEBOOK_APP_ID = "YOUR_FACEBOOK_APP_ID"
    FACEBOOK_APP_SECRET = "YOUR_FACEBOOK_APP_SECRET"
    TWITTER_API_KEY = "YOUR_TWITTER_API_KEY"
    TWITTER_API_SECRET = "YOUR_TWITTER_API_SECRET"
  end

  # Models
  class Property < ApplicationRecord
    has_many :listings
    has_many :agents
    has_many :clients
    has_many :transactions

    validates :address, presence: true
    validates :price, numericality: { greater_than: 0 }
  end

  class Listing < ApplicationRecord
    belongs_to :property
    belongs_to :agent

    validates :description, presence: true
    validates :price, numericality: { greater_than: 0 }
  end

  class Agent < ApplicationRecord
    has_many :listings
    has_many :clients

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  end

  class Client < ApplicationRecord
    has_many :listings
    has_many :agents

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  end

  class Transaction < ApplicationRecord
    belongs_to :property
    belongs_to :client
    belongs_to :agent

    validates :amount, numericality: { greater_than: 0 }
    validates :date, presence: true
  end

  # Services
  class PropertyService
    def self.search_properties(query)
      Property.where("address LIKE?", "%#{query}%")
    end

    def self.get_property(id)
      Property.find(id)
    end

    def self.create_property(params)
      Property.create!(params)
    end

    def self.update_property(id, params)
      Property.find(id).update!(params)
    end

    def self.delete_property(id)
      Property.find(id).destroy!
    end
  end

  class ListingService
    def self.search_listings(query)
      Listing.where("description LIKE?", "%#{query}%")
    end

    def self.get_listing(id)
      Listing.find(id)
    end

    def self.create_listing(params)
      Listing.create!(params)
    end

    def self.update_listing(id, params)
      Listing.find(id).update!(params)
    end

    def self.delete_listing(id)
      Listing.find(id).destroy!
    end
  end

  class AgentService
    def self.search_agents(query)
      Agent.where("name LIKE?", "%#{query}%")
    end

    def self.get_agent(id)
      Agent.find(id)
    end

    def self.create_agent(params)
      Agent.create!(params)
    end

    def self.update_agent(id, params)
      Agent.find(id).update!(params)
    end

    def self.delete_agent(id)
      Agent.find(id).destroy!
    end
  end

  class ClientService
    def self.search_clients(query)
      Client.where("name LIKE?", "%#{query}%")
    end

    def self.get_client(id)
      Client.find(id)
    end

    def self.create_client(params)
      Client.create!(params)
    end

    def self.update_client(id, params)
      Client.find(id).update!(params)
    end

    def self.delete_client(id)
      Client.find(id).destroy!
    end
  end

  class TransactionService
    def self.search_transactions(query)
      Transaction.where("amount LIKE?", "%#{query}%")
    end

    def self.get_transaction(id)
      Transaction.find(id)
    end

    def self.create_transaction(params)
      Transaction.create!(params)
    end

    def self.update_transaction(id, params)
      Transaction.find(id).update!(params)
    end

    def self.delete_transaction(id)
      Transaction.find(id).destroy!
    end
  end

  # API
  class API < Grape::API
    prefix "api"
    format :json

    resource :properties do
      desc "Get all properties"
      get do
        properties = PropertyService.search_properties(params[:query])
        present properties, with: API::Entities::Property
      end

      desc "Get a property"
      params do
        requires :id, type: Integer, desc: "Property ID"
      end
      get ":id" do
        property = PropertyService.get_property(params[:id])
        present property, with: API::Entities::Property
      end

      desc "Create a property"
      params do
        requires :address, type: String, desc: "Property address"
        requires :price, type: Float, desc: "Property price"
      end
      post do
        property = PropertyService.create_property(params)
        present property, with: API::Entities::Property
      end

      desc "Update a property"
      params do
        requires :id, type: Integer, desc: "Property ID"
        optional :address, type: String, desc: "Property address"
        optional :price, type: Float, desc: "Property price"
      end
      put ":id" do
        property = PropertyService.update_property(params[:id], params.except(:id))
        present property, with: API::Entities::Property
      end

      desc "Delete a property"
      params do
        requires :id, type: Integer, desc: "Property ID"
      end
      delete ":id" do
        PropertyService.delete_property(params[:id])
        { result: "success" }
      end
    end

    resource :listings do
      desc "Get all listings"
      get do
        listings = ListingService.search_listings(params[:query])
        present listings, with: API::Entities::Listing
      end

      desc "Get a listing"
      params do
        requires :id, type: Integer, desc: "Listing ID"
      end
      get ":id" do
        listing = ListingService.get_listing(params[:id])
        present listing, with: API::Entities::Listing
      end

      desc "Create a listing"
      params do
        requires :description, type: String, desc: "Listing description"
        requires :price, type: Float, desc: "Listing price"
        requires :property_id, type: Integer, desc: "Listing property ID"
        requires :agent_id, type: Integer, desc: "Listing agent ID"
      end
      post do
        listing = ListingService.create_listing(params)
        present listing, with: API::Entities::Listing
      end

      desc "Update a listing"
      params do
        requires :id, type: Integer, desc: "Listing ID"
        optional :description, type: String, desc: "Listing description"
        optional :price, type: Float, desc: "Listing price"
        optional :property_id, type: Integer, desc: "Listing property ID"
        optional :agent_id, type: Integer, desc: "Listing agent ID"
      end
      put ":id" do
        listing = ListingService.update_listing(params[:id], params.except(:id))
        present listing, with: API::Entities::Listing
      end

      desc "Delete a listing"
      params do
        requires :id, type: Integer, desc: "Listing ID"
      end
      delete ":id" do
        ListingService.delete_listing(params[:id])
        { result: "success" }
      end
    end

    resource :agents do
      desc "Get all agents"
      get do
        agents = AgentService.search_agents(params[:query])
        present agents, with: API::Entities::Agent
      end

      desc "Get an agent"
      params do
        requires :id, type: Integer, desc: "Agent ID"
      end
      get ":id" do
        agent = AgentService.get_agent(params[:id])
        present agent, with: API::Entities::Agent
      end

      desc "Create an agent"
      params do
        requires :name, type: String, desc: "Agent name"
        requires :email, type: String, desc: "Agent email"
      end
      post do
        agent = AgentService.create_agent(params)
        present agent, with: API::Entities::Agent
      end

      desc "Update an agent"
      params do
        requires :id, type: Integer, desc: "Agent ID"
        optional :name, type: String, desc: "Agent name"
        optional :email, type: String, desc: "Agent email"
      end
      put ":id" do
        agent = AgentService.update_agent(params[:id], params.except(:id))
        present agent, with: API::Entities::Agent
      end

      desc "Delete an agent"
      params do
        requires :id, type: Integer, desc: "Agent ID"
      end
      delete ":id" do
        AgentService.delete_agent(params[:id])
        { result: "success" }
      end
    end
  end
end
