class role::webserver {
  include profile::nginx::vhost
  include profile::linuxbase
}
