use strict;
use warnings;

use Test::UseAllModules;

all_uses_ok except => qw(
  Rex::Commands::DB
  Rex::Commands::Rsync
  Rex::Group::Lookup::DBI
  Rex::Group::Lookup::INI
  Rex::Group::Lookup::XML
  Rex::Helper::DBI
  Rex::Helper::INI
  Rex::Interface::Exec::SSH
  Rex::Interface::File::SSH
  Rex::Interface::Fs::SSH
  Rex::Interface::Connection::SSH
  Rex::Interface::Exec::OpenSSH
  Rex::Interface::File::OpenSSH
  Rex::Interface::Fs::OpenSSH
  Rex::Interface::Connection::OpenSSH
  Rex::Output::JUnit
  Rex::Output
  Rex::TaskList::Parallel_ForkManager
  Rex::Cloud::Amazon
);
