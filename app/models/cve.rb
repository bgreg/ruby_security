class Cve
  attr_accessor :data
  CVE_SOURCE="http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml"

  def initialize(params = {})
  end

  def update(params = {})
    self
  end

  def self.load(&block)
    Dispatch::Queue.concurrent.async{ get_exposures(&block) }
  end

  def get_exposures(&block)
    AFMotion::XML.get(CVE_SOURCE) do |result|
      if result.success?
        parsed_exposures = parse_exposures(result)
        Dispatch::Queue.main.async{ yield(parsed_exposures) }
      end
    end
  end

  def parsed_exposures(unparsed_exposures)
    #
    # parse json from rails app
    #
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
