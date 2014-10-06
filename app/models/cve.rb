class Cve
  BASE_URL   = "http://0.0.0.0:3000/exposures"
  SHORT_LIST = "index_short"

  attr_accessor :data

  def initialize(params = {})
  end

  def update(params = {})
    self
  end

  def self.load_short_list(&block)
    Dispatch::Queue.concurrent.async{ get_exposures(&block) }
  end

  def self.load_one(id, &block)
    Dispatch::Queue.concurrent.async{ get_exposure(id, &block) }
  end

  def self.get_exposure(id, &block)
    client = AFMotion::Client.build(BASE_URL) do
      header "Accept", "application/json"
      response_serializer :json
    end

    client.get(id.to_s) do |result|
      if result.success?
        Dispatch::Queue.main.async{ block.call(result.object) }
      elsif result.failure?
        p result.error.localizedDescription
      end
    end
  end

  def self.get_exposures(&block)
    client = AFMotion::Client.build(BASE_URL) do
      header "Accept", "application/json"
      response_serializer :json
    end

    client.get(SHORT_LIST) do |result|
      if result.success?
        Dispatch::Queue.main.async{ block.call(result.object) }
      elsif result.failure?
        p result.error.localizedDescription
      end
    end
    # close client?
  end


  def delete
  end

  def save
    true
  end

  class << self
    def create(params = {})
      Cve.new(params).tap do |cve|
        cve.save
      end
    end

    def find(id_or_params)
    end

    def all
      Cve.find(:all)
    end
  end
end
