package { 'libaugeas0':
  ensure => present,
}->
class { 'sysstat': }
