class ApplicationService
  def self.call(*args)
    new.call(*args)
  end

  def call(*args)
    raise NotImplementedError
  end
end