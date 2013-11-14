
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Perl binding for Redis database",
  "AUTHOR" => "Pedro Melo <melo\@cpan.org>, Damien Krotkine <dams\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Module::Build" => "0.3601"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "Redis",
  "EXE_FILES" => [],
  "LICENSE" => "artistic_2",
  "NAME" => "Redis",
  "PREREQ_PM" => {
    "Try::Tiny" => 0
  },
  "TEST_REQUIRES" => {
    "Digest::SHA" => 0,
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IO::String" => 0,
    "IPC::Cmd" => 0,
    "IPC::Open3" => 0,
    "Test::Deep" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "0.98",
    "Test::SharedFork" => 0
  },
  "VERSION" => "1.964",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Digest::SHA" => 0,
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IO::String" => 0,
  "IPC::Cmd" => 0,
  "IPC::Open3" => 0,
  "Module::Build" => "0.3601",
  "Test::Deep" => 0,
  "Test::Fatal" => 0,
  "Test::More" => "0.98",
  "Test::SharedFork" => 0,
  "Try::Tiny" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



