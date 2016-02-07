node default {

  class {'nagios::nrpe':
    nrpe_allowed_hosts   => ['127,0,0.1'],
    nrpe_conf_overwrite  => 0,
    monitor_puppet_agent => 0,
  }

 class {'nagios::server':
    engine        => 'icinga',

    httpd_user   => 'www-data',
    http_users    => {
      admin  => { 'password' => '$apr1$UZLYAJBp$SILrGdn0y5oseZ3wRcaLl.' }, # password
    },

    nd => {
      'devstack.openstack.local' => {
        'ip'       => '127.0.0.1',
        'domain'   => 'openstack.org',
        'services' => {
          'Cinder API Proc'             => { check => "check_nrpe!check_proc_1arg!1:10 1:20 'cinder-api'"},
          'Cinder Scheduler Proc'       => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "cinder-scheduler"'},
          'Cinder API'                  => { check => 'check_nrpe!check_cinder_api!"http://10.2.251.130:5000/v2.0" "demo" "demo" "password"'},
# needs root access for netstat -p
#          'Cinder Scheduler Conn'       => { check => 'check_nrpe_1arg!check_cinder_scheduler_connectivity'},
          'Glance Registry Proc'        => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "glance-registry"'},
          'Glance API Proc'             => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "glance-api"'},
          'Glance API'                  => { check => 'check_nrpe!check_glance_api!"http://127.0.0.1:5000/v2.0" "demo" "demo" "password"'},
          'Heat API Proc'               => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "heat-api"'},
          'Heat Engine Proc'            => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "heat-engine"'},
          'Keystone Proc'               => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "keystone-all"'},
          'Keystone API'                => { check => 'check_nrpe!check_keystone_api!"http://127.0.0.1:5000/v2.0" "demo" "demo" "password"'},
          'KVM Instances'               => { check => 'check_nrpe_1arg!check_kvm_instances'},
# needs gid libvirtd
#          'KVM Memory'                  => { check => 'check_nrpe!check_kvm_memory!97 100'},
#          'KVM CPU'                     => { check => 'check_nrpe!check_kvm_cpu!97 100'},
          'Nova Scheduler Proc'         => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "nova-scheduler"'},
          'Nova Conductor Proc'         => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "nova-conductor"'},
          'Nova Objectstore Proc'       => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "nova-objectstore"'},
          'Nova API Proc'               => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "nova-api"'},
          'Nova API'                    => { check => 'check_nrpe!check_nova_api!"http://127.0.0.1:5000/v2.0" "demo" "demo" "password"'},
          'Nova Cinder Volume Proc'     => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "cinder-volume"'},
          'Nova Neutron Server Proc'    => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "neutron-server"'},
          'Neutron Agent Proc'          => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "neutron-plugin-openvswitch-agent"'},
          'Neutron Agent Proc'          => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "neutron-plugin-openvswitch-agent"'},
          'Neutron API'                 => { check => 'check_nrpe!check_neutron_api!"http://127.0.0.1:5000/v2.0" "demo" "demo" "password"'},
          'Neutron Metadata Agent Proc' => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "neutron-metadata-agent"'},
          'Neutron DHCP Agent Proc'     => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "neutron-dhcp-agent"'},
          'Neutron L3 Agent Proc'       => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "neutron-l3-agent"'},
          'Nova Compute Proc'           => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "nova-compute"'},
          'Nova Network Proc'           => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "nova-network"'},
          'Nova API Metadata Proc'      => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "nova-api-metadata"'},
          'Ping'                        => { check => 'check_ping!200.0,60%!500.0,95%'},
          'Swift Proxy Server Proc'     => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "swift-proxy-server"'},
          'Swift API'                   => { check => 'check_nrpe!check_swift_api!"http://127.0.0.1:5000/v2.0" "demo" "demo" "password" "demo"'},
          'Swift Ring MD5'              => { check => 'check_nrpe_1arg!check_swift_ring_md5'},
#          'Swift Dispersion Report'     => { check => 'check_nrpe_1arg!check_swift_dispersion_report'},
#          'Swift du'                    => { check => 'check_nrpe_1arg!check_swift_du'},
          'Swift Account Server Proc'   => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "swift-account-server"'},
          'Swift Container Server Proc' => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "swift-container-server"'},
          'Swift Object Server Proc'    => { check => 'check_nrpe!check_proc_1arg!1:10 1:20 "swift-object-server"'},
        }
      }
    }
  }
}
