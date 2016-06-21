class profile::nginx::server {
  include nginx

  firewall { '110 accept all http':
    dport  => [80],
    proto  => tcp,
    action => accept,
  }

}
