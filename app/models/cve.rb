class Cve
  attr_accessor :data

  def initialize(params = {})
  end

  def update(params = {})
    self
  end

  def self.load(&block)
    AFMotion::XML.get("http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml") do |result|
      if result.success?
        doc   = Hpple.HTML(result.body)
        retval = doc.xpath("//entry").collect{ |e| {name: e['id'], num: rand(100)} }
        block.call(retval)
      else
        fail "FUCK"
      end
    end
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
