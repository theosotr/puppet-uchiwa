# == Class uchiwa::params
#
# This class is meant to be called from uchiwa
# It sets variables according to platform
#
class uchiwa::params {
  case $::osfamily {
    'Debian', 'RedHat', 'Amazon': {
      $package_name = 'uchiwa'
      $service_name = 'uchiwa'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  $version         = 'latest'
  $install_repo    = true
  $repo            = 'main'
  $repo_release    = undef
  $repo_source     = undef
  $repo_key_id     = 'EE15CFF6AB6E4E290FDAB681A20F259AEB9C94BB'
  $repo_key_source = 'https://eol-repositories.sensuapp.org/apt/pubkey.gpg'
  $manage_services = true
  $manage_package  = true
  $manage_user     = true
  $log_level       = 'info'

  $sensu_api_endpoints  = [
    {
      name     =>  'sensu',
      host     => '127.0.0.1',
      ssl      =>  false,
      insecure =>  false,
      port     =>  4567,
      user     =>  'sensu',
      pass     =>  'sensu',
      path     =>  '',
      timeout  =>  5,
    }
  ]
  $host            =     '0.0.0.0'
  $port            =     3000
  $user            =     ''
  $pass            =     ''
  $refresh         =     '5'
  $users           =     []
  $auth            =     {}
  $ssl             =     {}
  $usersoptions    =     {}
}
