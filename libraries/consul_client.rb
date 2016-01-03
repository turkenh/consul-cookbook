#
# Cookbook: consul
# License: Apache 2.0
#
# Copyright 2014-2016, Bloomberg Finance L.P.
#
require 'poise'

module ConsulCookbook
  module Resource
    # @since 1.4
    class ConsulClient < Chef::Resource
      include Poise
      provides(:consul_client)
      actions(:create)
      default_action(:create)

      property(:version, kind_of: String, required: true)
      property(:user, kind_of: String, default: 'consul')
      property(:group, kind_of: String, default: 'consul')
      property(:package_name, kind_of: String)
      property(:remote_url, kind_of: String)
      property(:remote_checksum, kind_of: String)
      property(:source_url, kind_of: String)
    end
  end

  module Provider
    # @since 1.4
    class ConsulClient < Chef::Provider
      include Poise
      provides(:consul_client)

      def action_create
        notifying_block do

        end
      end
    end
  end
end
