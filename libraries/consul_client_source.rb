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
    class ConsulClientSource < Chef::Provider
      include Poise
      provides(:consul_client)

      def action_create
        include_recipe 'golang::default'
        notifying_block do
          source_dir = directory ::File.join(new_resource.install_path, 'consul', 'src') do
            recursive true
            mode '0755'
          end

          git ::File.join(source_dir.path, "consul-#{new_resource.version}") do
            repository new_resource.source_url
            reference new_resource.version
            action :checkout
          end

          golang_package 'github.com/hashicorp/consul' do
            action :install
          end

          directory ::File.join(new_resource.install_path, 'bin') do
            recursive true
            mode '0755'
          end

          link ::File.join(new_resource.install_path, 'bin', 'consul') do
            to ::File.join(source_dir.path, "consul-#{new_resource.version}", 'consul')
          end
        end
      end
    end
  end
end
