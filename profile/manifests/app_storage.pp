define profile::app_storage(
  $physical_volumes,
  $volume_group,
  $filesystem_type,
  # $size,
  $mount_point,
  $owner,
  $group,
){

  lvm::volume { $title:
    ensure => present,
    vg     => $volume_group,
    pv     => $physical_volumes,
    fstype => $filesystem_type,
    # size   => $size,
  }

  file { $mount_point:
    ensure => directory,
    owner  => $owner,
    group  => $group,
  }

  mount { $mount_point:
    ensure => mounted,
    device => "/dev/${volume_group}/${title}",
    fstype => $filesystem_type,
  }

}
