require 'jsonapi/rails'

require "jsonapi_compliable/version"
require "jsonapi_compliable/errors"
require "jsonapi_compliable/dsl"
require "jsonapi_compliable/include_dsl"
require "jsonapi_compliable/scopeable"
require "jsonapi_compliable/query"
require "jsonapi_compliable/scope/base"
require "jsonapi_compliable/scope/sort"
require "jsonapi_compliable/scope/paginate"
require "jsonapi_compliable/scope/sideload"
require "jsonapi_compliable/scope/extra_fields"
require "jsonapi_compliable/scope/filterable"
require "jsonapi_compliable/scope/default_filter"
require "jsonapi_compliable/scope/filter"
require "jsonapi_compliable/stats/dsl"
require "jsonapi_compliable/stats/payload"
require "jsonapi_compliable/util/include_params"
require "jsonapi_compliable/util/field_params"
require "jsonapi_compliable/util/scoping"
require "jsonapi_compliable/util/pagination"
require "jsonapi_compliable/extensions/extra_attribute"
require "jsonapi_compliable/extensions/boolean_attribute"

module JsonapiCompliable
  autoload :Base,           'jsonapi_compliable/base'
  autoload :Deserializable, 'jsonapi_compliable/deserializable'

  def self.included(klass)
    klass.instance_eval do
      include Base
      include Deserializable
    end
  end

  def self.query
    Thread.current[:_jsonapi_query] || {}
  end

  def self.query=(val)
    Thread.current[:_jsonapi_query] = {}
  end
end
