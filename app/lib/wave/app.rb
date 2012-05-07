module Wave
  module App
    module ClassMethods
    end
    
    def self.included(child)
      child.extend ClassMethods
    end
  end
end