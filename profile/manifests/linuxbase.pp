class profile::linuxbase {
  include ntp
  include epel

  # Create standard sysops accounts
  $users = hiera(accounts)
  create_resources(accountspkg::account, $users)

  if $application =~ String[1] {
    # Grab Hiera value for disk device, then get rid of leading '/dev/' so we can do a fact lookup
    $app_disk            = regsubst(hiera("app_storage.lv-${application}.physical_volume"), '/dev/', '')
    $disk_fact           = $facts['disks'][$app_disk]
    if $disk_fact {
      $app_storage = hiera(app_storage)
      create_resources(profile::app_storage, $app_storage)
    } 
  }
}
