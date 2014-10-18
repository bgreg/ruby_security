class Cve

  BASE_URL     = "http://0.0.0.0:3000/exposures"
  SHORT_LIST   = "index_short"
  RECENT_COUNT = "recent_count"

  attr_accessor :data, :client

  def initialize(params = {})
    client
  end

  def update(params = {})
    self
  end

  def load_short_list(&block)
    Dispatch::Queue.concurrent.async{ get_exposures(&block) }
  end

  def load_one(id, &block)
    Dispatch::Queue.concurrent.async{ get_exposure(id, &block) }
  end

  def client
    @client ||= begin
      AFMotion::Client.build(BASE_URL) do
        header "Accept", "application/json"
        response_serializer :json
      end
    end
  end

  def get_exposure(id, &block)
    client.get(id.to_s) do |result|
      if result.success?
        Dispatch::Queue.main.async{ block.call(result.object) }
      elsif result.failure?
        p result.error.localizedDescription
      end
    end
  end

  def get_recent_count(&block)
    client.get(RECENT_COUNT) do |result|
      if result.success?
        Dispatch::Queue.main.async{ block.call(result.object) }
      elsif result.failure?
        p "ERROR: #{result.error.localizedDescription}"
      end
    end
  end

  def get_exposures(&block)
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
