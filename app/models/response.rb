class Response < ApplicationRecord
  def self.random
    self.order('random()').first.body
  end
end
