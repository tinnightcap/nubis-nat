
file { '/usr/local/lib/util.sh':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///nubis/files/util.sh'
}

file { '/usr/local/bin/eni-associate':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0755',
    source  => 'puppet:///nubis/files/eni-associate',
    require => File['/usr/local/lib/util.sh']
}

file { '/usr/local/bin/nat.sh':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0755',
    source  => 'puppet:///nubis/files/nat.sh',
    require => File['/usr/local/lib/util.sh']
}

file { '/etc/nubis.d/99-nat':
    ensure  => link,
    target  => '/usr/local/bin/nat.sh',
    require => File['/usr/local/bin/nat.sh'],
}