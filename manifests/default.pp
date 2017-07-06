node default {

  include baseline::mirror

  class { 'kibana':
    config => {
      'server.port' => '8080',
    }
  }

  class { 'elasticsearch':
    java_install => true,
    manage_repo  => true,
    repo_version => '5.x',
  }

  elasticsearch::instance { 'kibana-01': }
}
