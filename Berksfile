def rackspace_cookbook(name, version = '>= 0.0.0', options = {})
  cookbook(name, version, {
             git: "git@github.com:rackspace-cookbooks/#{name}.git"
           }.merge(options))
end	   
	
site :opscode

metadata

rackspace_cookbook 'rackspace_nginx'
rackspace_cookbook 'rackspace_iptables'

# Dependencies of dependencies to enable Berkshelf
# This is due to a bug in the Berkshelf 2 solver, to be resolved in Berkshelf 3
rackspace_cookbook 'rackspace_apt'
rackspace_cookbook 'rackspace_yum'
