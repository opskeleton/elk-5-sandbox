node default {
  if $operatingsystem == 'Ubuntu' {
    package{'software-properties-common':
      ensure  => present
    } -> Exec <||>

    Service {
      provider => systemd
    }
  }

  include baseline::mirror

  class{'jdk':} ->

  class { 'elasticsearch':
    repo_version     => '5.x',
    service_provider => 'systemd',
    manage_repo      => true
  }

  Apt::Source ['elasticsearch'] -> Package['kibana']

  class { 'kibana':
    manage_repo     => false,
    config          => {
      'server.port' => '8080',
      'server.host' => '0.0.0.0'
    }
  }

  # Service['elasticsearch-kibana-01'] ~> Service['kibana']

  elasticsearch::instance { 'kibana-01':
    ensure => present
  }
}
