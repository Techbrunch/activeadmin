module ActiveAdmin

  class Setting
    def self.build(setting, type = '')
      klass = "#{type.to_s.camelcase}Setting"
      ActiveAdmin.const_defined?(klass) ? ActiveAdmin.const_get(klass).new(setting) : new(setting)
    end

    def initialize(setting)
      @setting = setting
    end

    def value(*_args)
      @setting
    end
  end

  class StringSymbolOrProcSetting < Setting
    def value(*args)
      return @setting if @setting.is_a?(String)
      (context = args.first) ? context.instance_eval(&@setting) : @setting.call
    end
  end

end
