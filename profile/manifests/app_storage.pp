# Requires puppetlabs/lvm
define profile::app_storage(
  $physical_volumes,
  $volume_group,
  $filesystem_type,
  $mount_point,
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
  }

  mount { $mount_point:
    ensure => mounted,
    device => "/dev/${volume_group}/${title}",
    fstype => $filesystem_type,
  }

}
