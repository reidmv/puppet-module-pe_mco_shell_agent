class pe_mco_shell_agent (
  $libdir         = $pe_mco_shell_agent::params::libdir,
  $owner          = $pe_mco_shell_agent::params::owner,
  $group          = $pe_mco_shell_agent::params::group,
  $mode           = $pe_mco_shell_agent::params::mode,
  $service        = $pe_mco_shell_agent::params::service,
  $install_app    = false,
  $install_agent  = true,
) inherits pe_mco_shell_agent::params {
  $base = "${libdir}/mcollective"

  File {
    owner  => $owner,
    group  => $group,
    mode   => $mode,
    notify => Anchor['mco_shell_notify'],
  }

  if $install_app {
    $ensure_app = 'file'
  } else {
    $ensure_app = 'absent'
  }
  if $install_agent {
    $ensure_agent = 'file'
  } else {
    $ensure_agent = 'absent'
  }

  # This anchor conditionally notifies the pe-mcollective service, but only if
  # it exists. It is implemented this way to avoid a hard-dependency on
  # Service['pe-mcollective'] being defined. If the service doesn't exist in
  # the catalog this is a no-op.
  anchor { 'mco_shell_notify': } ~> Service <| title == $service |>

  file { "${base}/agent/shell":
    ensure => directory,
  }
  file { "${base}/agent/shell/job.rb":
    source => "puppet:///modules/${module_name}/agent/shell/job.rb",
  }
  file { "${base}/agent/shell.ddl":
    ensure => file,
    source => "puppet:///modules/${module_name}/agent/shell.ddl",
  }
  file { "${base}/agent/shell.rb":
    ensure => $ensure_agent,
    source => "puppet:///modules/${module_name}/agent/shell.rb",
  }
  file { "${base}/application/shell.rb":
    ensure => $ensure_app,
    source => "puppet:///modules/${module_name}/application/shell.rb",
  }
  file { "${base}/application/shell":
    ensure => directory,
  }
  file { "${base}/application/shell/prefix_stream_buf.rb":
    ensure => $ensure_app,
    source => "puppet:///modules/${module_name}/application/shell/prefix_stream_buf.rb",
  }
  file { "${base}/application/shell/watcher.rb":
    ensure => $ensure_app,
    source => "puppet:///modules/${module_name}/application/shell/watcher.rb",
  }

}
