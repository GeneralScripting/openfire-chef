default[:openfire][:version] = '4.0.0'

default[:openfire][:release] = '1'
default[:openfire][:source_tarball] = "openfire_#{node[:openfire][:version].gsub('.','_')}.tar.gz"
# precalculated checksums: `sha256sum openfire_v_v_v.tar.gz | cut -c1-16`
default[:openfire][:source_checksums] = {
	'openfire_3_8_1.tar.gz' => '554dce3a1b0a0b88',
	'openfire_3_8_0.tar.gz' => 'd5bef61a313ee41b'
}

default[:openfire][:install_method] = case node[:platform_family]
  when 'rhel', 'centos'
    default[:openfire][:user] = 'daemon'
    default[:openfire][:group] = 'daemon'
    'rpm'
  else
    default[:openfire][:user] = 'openfire'
    default[:openfire][:group] = 'openfire'
    default[:openfire][:groups] = []
    'source'
end

default[:openfire][:base_dir] = '/opt'
default[:openfire][:log_dir] = '/var/log/openfire'

default[:openfire][:pidfile] = '/var/run/openfire.pid'

# by default, only enable secure admin port
default[:openfire][:config][:admin_console][:port] = 9090
default[:openfire][:config][:admin_console][:secure_port] = 9091

default[:openfire][:config][:locale] = 'en'
default[:openfire][:config][:network][:interface] = nil

