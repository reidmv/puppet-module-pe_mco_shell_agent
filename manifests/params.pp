class pe_mco_shell_agent::params {

  case $::kernel {
    'windows' : {
      $libdir = 'C:/ProgramData/PuppetLabs/mcollective/etc/plugins/mcollective'
      $owner  = undef
      $group  = undef
      $mode   = undef
    }
    default : {
      $libdir = '/opt/puppet/libexec/mcollective'
      $owner  = 'root'
      $group  = '0'
      $mode   = '0644'
    }
  }

}
