require 'serialize_yaml2json/version'
require 'active_record'
require 'active_support/core_ext/hash/indifferent_access'

module SerializeYAML2JSON
  class Coder

    def self.dump(obj)
      ::ActiveRecord::Coders::JSON.dump(obj)
    end

    def self.load(yaml_or_json)
      if yaml_or_json.is_a?(String) && yaml_or_json =~ /^---/
        obj = ::YAML.load(yaml_or_json)
      else
        obj = ::ActiveRecord::Coders::JSON.load(yaml_or_json)
      end 
      obj.with_indifferent_access
    end

  end
end
