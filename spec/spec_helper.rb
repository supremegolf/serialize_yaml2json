$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'serialize_yaml2json'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:suite) do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

    silence_stream(STDOUT) do
      ActiveRecord::Schema.define(:version => 1) do
        create_table :widgets do |t|
          t.column :data, :text
        end
      end
    end

    class Widget < ActiveRecord::Base
      self.table_name = 'widgets' 
      serialize :data, SerializeYAML2JSON::Coder
    end

  end

end

