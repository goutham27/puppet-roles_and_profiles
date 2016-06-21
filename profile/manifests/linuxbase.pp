class profile::linuxbase {
  include ntp
  include epel

  # Create standard sysops accounts
  $users = hiera(accounts)
  create_resources(accountspkg::account, $users)
}
