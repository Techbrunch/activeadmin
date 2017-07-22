module ActiveAdmin

  class Setting
    def self.build(setting)
      new(setting)
    end

    def initialize(setting)
      @setting = setting
    end

    def value(*_args)
      @setting
    end
  end

end