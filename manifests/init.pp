# == Class: sysstat
#
# This is the sysstat module for installing sysstat and enabling it. It has
# been tested under Ubuntu.
#
# The sysstat utilities are a collection of performance monitoring tools for
# Linux.
#
# === Parameters
#
# None.
#
# === Variables
#
# None.
#
# === Examples
#
# class { 'sysstat': }
#
# === Authors
#
# Leon Brocard <acme@astray.com>
#
# === Copyright
#
# Copyright 2013 Leon Brocard
#
class sysstat {

  package { 'sysstat':
    ensure => present,
  }

  service{ 'sysstat':
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
  }

  augeas { '/etc/default/sysstat':
    context => '/files/etc/default/sysstat/',
    changes => 'set ENABLED true',
    notify  => Service['sysstat'],
    require => Package['sysstat'],
  }

}
