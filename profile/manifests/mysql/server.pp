class profile::mysql::server { 
  $root_password = hiera(profile::mysql::server::root_password)

  class { '::mysql::server':
    root_password           => $root_password,
    remove_default_accounts => true,
    override_options => {
      mysqld => {
        log-error => '/var/log/mysqld.log',
        pid-file  => '/var/run/mysqld/mysqld.pid',
      },
      mysqld_safe => {
        log-error => '/var/log/mysqld.log',
      },
    }
  }

  firewall { '101 accept all mysql':
    port   => [3306],
    proto  => tcp,
    action => accept,
  }

}
