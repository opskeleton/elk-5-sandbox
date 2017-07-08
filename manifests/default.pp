node default {

  include baseline::mirror
  include elk

  if $operatingsystem == 'Ubuntu' {
    package{'software-properties-common':
      ensure  => present
    } -> Exec <||>

    Service {
      provider => systemd
    }
  }

  class {'timezone':
    timezone => 'Australia/Sydney'
  } ~> Service<||>

  ensure_packages(['debconf-utils'],{})
}
