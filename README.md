NRPE Plugins for Nagios/Icinga

- Overall Requirements:
	- Server: nagios3
	- Client Node: nagios-nrpe-server
	- API Checks: Openstack tenant with username and password. In these scripts a tenant: cookbook with username: admin and password: openstack has been used.

- Keystone:
	- client-os-controller-keystone/usr/lib/nagios/plugins/check_keystone

- Glance:
	- client-os-controller-glance/usr/lib/nagios/plugins/check_glance_api

- Cinder:
	- client-os-controller-cinder/usr/lib/nagios/plugins/check_cinder-api
	
- Nova:
	- client-os-controller-nova/usr/lib/nagios/plugins/check_nova-api

	- client-os-controller-nova/usr/lib/nagios/plugins/check_kvm_cpustats
	- client-os-controller-nova/usr/lib/nagios/plugins/check_kvm_instance
	- client-os-controller-nova/usr/lib/nagios/plugins/check_kvm_memstats
	
- Swift:
	- client-os-controller-nova/usr/lib/nagios/plugins/check_swift

License
	 nagios-openstack-monitoring
	 (https://github.com/rakesh-patnaik/nagios-openstack-monitoring)
	
	 nagios-openstack-monitoring is free software: you can redistribute it and/or modify
	 it under the terms of the GNU General Public License as published by
	 the Free Software Foundation, either version 3 of the License, or
	 (at your option) any later version.
	
	 nagios-openstack-monitoring is distributed in the hope that it will be useful,
	 but WITHOUT ANY WARRANTY; without even the implied warranty of
	 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	 GNU General Public License for more details.
	
	 You should have received a copy of the GNU General Public License
	 along with nagios-openstack-monitoring.  If not, see <http://www.gnu.org/licenses/>.>.
