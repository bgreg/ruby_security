class Cve
  def initialize(params = {})
  end

  def update(params = {})
    self
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
