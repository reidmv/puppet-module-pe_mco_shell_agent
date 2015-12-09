# pe_mco_shell_agent

[![Build Status](https://travis-ci.org/reidmv/puppet-module-pe_mco_shell_agent.svg?branch=master)](https://travis-ci.org/reidmv/puppet-module-pe_mco_shell_agent)

####Table of Contents

1. [Overview](#overview)
2. [Setup](#setup)
    * [What pe_mco_shell_agent affects](#what-pe_mco_shell_agent-affects)
3. [Usage](#usage)
4. [Limitations](#limitations)

##Overview

Installs the [mcollective-shell-agent](https://github.com/puppetlabs/mcollective-shell-agent) plugin for Puppet Enterprise MCollective installs.

##Setup

###What pe_mco_shell_agent affects

* Creates a plugin directory under MCollective's libdir:
  * PE <= 3.8 - `/opt/puppet/libexec/mcollective`
  * PE >= 2015.1 - `/opt/puppetlabs/mcollective/plugins/`
* Restarts the service on changes

### Configuration

* Easiest setup is adding class `pe_mco_shell_agent` to the `PE MCollective` node group

`include pe_mco_shell_agent`

## Usage

For full documentation of the plugin see https://github.com/puppetlabs/mcollective-shell-agent

Here's some examples:

### run
```bash
# su - peadmin

$ peadmin@master:~$ mco shell run 'echo Hello world'

 * [ ============================================================> ] 1 / 1

master.vm:
Hello world


Finished processing 1 / 1 hosts in 173.74 ms
```

### start

Run a script ascryonously. Returns an ID that can be `watch`ed or `kill`ed

```bash
peadmin@master:/home/vagrant$ mco shell start "sleep 5 && echo '5 seconds'"

 * [ ============================================================> ] 1 / 1

precise64.home: 116f9387-78d6-43dc-a493-232a41c1d9be

Finished processing 1 / 1 hosts in 175.77 ms
```

### list

Used to list the job ID's for jobs from `start`

```bash
peadmin@master:/home/vagrant$ mco shell start "sleep 5 && echo '5 seconds'"

 * [ ============================================================> ] 1 / 1

precise64.home: 116f9387-78d6-43dc-a493-232a41c1d9be

Finished processing 1 / 1 hosts in 175.77 ms
```

### show

Used to see the output for jobs run by `start`

```bash
peadmin@master:/home/vagrant$ mco shell watch 116f9387-78d6-43dc-a493-232a41c1d9be

 * [ ============================================================> ] 3 / 3

precise64.home stdout: 5 seconds
```

### kill

Used to see the kill a job run by `start`

```bash
peadmin@master:/home/vagrant$ mco shell kill 116f9387-78d6-43dc-a493-232a41c1d9be

 * [ ============================================================> ] 3 / 3

precise64.home stdout: 5 seconds
```

##Limitations

Primary support is for Debian-family and RedHat, but should work on all Linux flavours.

Partial Windows suport is also available
