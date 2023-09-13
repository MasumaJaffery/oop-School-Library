class Nameable 
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class BaseDecorator < Nameable
    attr_accessor :nameable
  
    def initialize(nameable)
    super(nameable)
      @nameable = nameable
    end
  
    def correct_name
      @nameable.correct_name
    end
  end

  class CapitalizeDecorator < BaseDecorator
    def correct_name
      super().upcase
    end
  end
  
  class TrimmerDecorator < BaseDecorator
    def correct_name
      name = super()
      name.length > 10 ? name[0...10] : name
    end
  end
  