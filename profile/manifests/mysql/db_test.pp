class profile::mysql::db_test {
  require profile::mysql::server
  $user     = hiera(profile::mysql::db_test::user)
  $password = hiera(profile::mysql::db_test::password)

  mysql::db { 'db_test':
    user     => $user,
    password => $password,
    host     => 'localhost',
    grant    => ['SELECT', 'UPDATE'],
  }
}

