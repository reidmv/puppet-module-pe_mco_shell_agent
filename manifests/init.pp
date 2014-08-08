class pe_mco_shell_agent (
  $libdir = '/opt/puppet/libexec/mcollective',
) {
  $base = "${libdir}/mcollective"

  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { "${base}/agent/shell":
    ensure => directory,
  }
  file { "${base}/agent/shell/job.rb":
    source => "puppet:///modules/${module_name}/agent/shell/job.rb",
  }
  file { "${base}/agent/shell.ddl":
    source => "puppet:///modules/${module_name}/agent/shell.ddl",
  }
  file { "${base}/agent/shell.rb":
    source => "puppet:///modules/${module_name}/agent/shell.rb",
  }
  file { "${base}/application/shell.rb":
    source => "puppet:///modules/${module_name}/application/shell.rb",
  }
  file { "${base}/application/shell":
    ensure => directory,
  }
  file { "${base}/application/shell/prefix_stream_buf.rb":
    source => "puppet:///modules/${module_name}/application/shell/prefix_stream_buf.rb",
  }
  file { "${base}/application/shell/watcher.rb":
    source => "puppet:///modules/${module_name}/application/shell/watcher.rb",
  }

}
