#
# Cookbook: consul
# License: Apache 2.0
#
# Copyright 2014-2016, Bloomberg Finance L.P.
#
require 'poise'

module ConsulCookbook
  module Provider
    # @since 1.4
    class ConsulClientPackage < Chef::Provider
      include Poise
      provides(:consul_client)

      def action_create
        notifying_block do
          package new_resource.package_name do
            version new_resource.version
          end
        end
      end
    end
  end
end
