class profile::nginx::vhost {
  include profile::nginx::server

  nginx::resource::vhost { 'localhost':
    www_root => '/opt/html',
  } 

  file { '/opt/html':
    ensure => directory,
  }

  file { '/opt/html/index.html':
    ensure  => file,
    content => 'Hello world!',
  }

}
