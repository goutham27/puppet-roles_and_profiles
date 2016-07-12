define profile::app_storage(
  $ensure,
  $physical_volume,
  $volume_group,
  $filesystem_type,
  # $size,
  $mount_point,
  $owner,
  $group,
){

  lvm::volume { $title:
    ensure => $ensure,
    vg     => $volume_group,
    pv     => $physical_volume,
    fstype => $filesystem_type,
    # size => $size,
    before => Mount[$mount_point],
  }

  file { $mount_point:
    ensure => directory,
    owner  => $owner,
    group  => $group,
  }

  mount { $mount_point:
    ensure  => mounted,
    device  => "/dev/${volume_group}/${title}",
    fstype  => $filesystem_type,
  }

}
