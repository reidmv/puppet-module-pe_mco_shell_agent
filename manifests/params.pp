class pe_mco_shell_agent::params {
  case $::kernel {
    'windows' : {
      $libdir  = 'C:/ProgramData/PuppetLabs/mcollective/etc/plugins/mcollective'
      $owner   = undef
      $group   = undef
      $mode    = undef
      $service = undef
    }
    'Linux' : {
      $owner  = 'root'
      $group  = 'root'
      $mode   = '0644'

      if versioncmp($::puppetversion, '4') < 0 {
        $libdir = $::osfamily ? {
          'Debian' => '/usr/share/mcollective/plugins',
          default  => '/usr/libexec/mcollective',
        }
        $service = 'pe-mcollective'
      } else {
        $libdir = '/opt/puppetlabs/mcollective/plugins'
        $service = 'mcollective'
      }
    }
  }

}
