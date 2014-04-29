class fail2ban::jail::dropbear (
  $maxretry = 'usedefault',
  $findtime = false
) {

  $real_maxretry = $maxretry ? {
    'usedefault' => '6',
    default      => $maxretry
  }

  # Use default sshd filter from debian
  fail2ban::jail { 'dropbear':
    enabled  => 'true',
    port     => 'ssh',
    filter   => 'sshd',
    logpath  => '/var/log/dropbear',
    maxretry => $real_maxretry,
  }

  if $findtime != false {
    Fail2ban::Jail['dropbear'] {
      findtime => $findtime,
    }
  }

}
