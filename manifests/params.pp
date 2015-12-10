class pe_mco_shell_agent::params {
  case $::kernel {
    'windows' : {
      $owner   = undef
      $group   = undef
      $mode    = undef
      $service = undef
      $libdir  = 'C:/ProgramData/PuppetLabs/mcollective/etc/plugins/mcollective'
    }
    'Linux' : {
      $owner  = 'root'
      $group  = 'root'
      $mode   = '0644'
      if versioncmp($::puppetversion, '4') < 0 {
        $service = 'pe-mcollective'
        $libdir  = '/opt/puppet/libexec/mcollective',
      } else {
        $service = 'mcollective'
        $libdir  = '/opt/puppetlabs/mcollective/plugins'
      }
    }
  }

}
