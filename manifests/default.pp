node default {
  class { 'kibana':
    config => {
      'server.port' => '8080',
    }
  }
}
