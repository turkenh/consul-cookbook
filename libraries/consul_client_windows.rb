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
    class ConsulClientWindows < Chef::Provider
      include Poise
      provides(:consul_client, os: 'windows')

      def action_create
        include_recipe 'chocolatey::default'

        notifying_block do
          chocolatey new_resource.package_name do
            version new_resource.version
          end
        end
      end
    end
  end
end
