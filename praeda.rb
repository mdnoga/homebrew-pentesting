require "formula"

class Praeda < Formula
  homepage "https://github.com/percx/Praeda"
  url "https://github.com/percx/Praeda", :using => :git, :revision => "1dc2220"
  version "0.20160909"
  revision 2

  depends_on "openssl"
  depends_on "perl"

  resource "LWP" do
    url "http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/libwww-perl-6.15.tar.gz"
    sha256 "6f349d45c21b1ec0501c4437dfcb70570940e6c3d5bff783bd91d4cddead8322"
  end

  resource "HTML::TagParser" do
    url "http://search.cpan.org/CPAN/authors/id/K/KA/KAWASAKI/HTML-TagParser-0.20.tar.gz"
    sha256 "7f107815f1b615f4c05d68deb95d3f5c5a3912c79a88c39eb3699bf7cfd15f37"
  end

  resource "URI::Fetch" do
    url "http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/URI-Fetch-0.13.tar.gz"
    sha256 "0db061a05dc2b950d3468ddb2e8435ff0e891c1c2da618150a42835371ec8667"
  end

  resource "HTTP::Cookies" do
    url "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/HTTP-Cookies-6.01.tar.gz"
    sha256 "f5d3ade383ce6389d80cb0d0356b643af80435bb036afd8edce335215ec5eb20"
  end

  resource "IO::Socket" do
    url "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/IO-1.25.tar.gz"
    sha256 "89790db8b9281235dc995c1a85d532042ff68a90e1504abd39d463f05623e7b5"
  end

  resource "HTML::TableExtract" do
    url "http://search.cpan.org/CPAN/authors/id/M/MS/MSISK/HTML-TableExtract-2.13.tar.gz"
    sha256 "0a7d81a265d2d46aeeb277a9d7cd5f5e2c8e3765959b641252c8e0a175ad5106"
  end

  resource "Path::Class" do
    url "http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/Path-Class-0.36.tar.gz"
    sha256 "45e6f51329a31b3f52810eec70f2ff54e3faea8893f07bdf95028adb71dcbdf9"
  end

  resource "Try::Tiny" do
    url "http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Try-Tiny-0.28.tar.gz"
    sha256 "f1d166be8aa19942c4504c9111dade7aacb981bc5b3a2a5c5f6019646db8c146"
  end

  resource "Net::SSL" do
    url "http://search.cpan.org/CPAN/authors/id/N/NA/NANIS/Crypt-SSLeay-0.72.tar.gz"
    sha256 "f5d34f813677829857cf8a0458623db45b4d9c2311daaebe446f9e01afa9ffe8"
  end

  resource "Net::SNMP" do
    url "http://search.cpan.org/CPAN/authors/id/D/DT/DTOWN/Net-SNMP-v6.0.1.tar.gz"
    sha256 "14c37bc1cbb3f3cdc7d6c13e0f27a859f14cdcfd5ea54a0467a88bc259b0b741"
  end

  resource "NetAddr::IP" do
    url "http://search.cpan.org/CPAN/authors/id/M/MI/MIKER/NetAddr-IP-4.079.tar.gz"
    sha256 "ec5a82dfb7028bcd28bb3d569f95d87dd4166cc19867f2184ed3a59f6d6ca0e7"
  end

  resource "Class::ErrorHandler" do
    url "http://search.cpan.org/CPAN/authors/id/T/TO/TOKUHIROM/Class-ErrorHandler-0.04.tar.gz"
    sha256 "342d2dcfc797a20bee8179b1b96b85c0ae7a5b48827359523cd8c74c3e704502"
  end

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5/x86_64-linux-thread-multi"

    resources.each do |r|
      r.stage do
        #ENV["OPENSSL_INCLUDE"] = "#{HOMEBREW_PREFIX}/opt/openssl/include"
        #ENV["OPENSSL_LIB"] = "#{HOMEBREW_PREFIX}/opt/openssl/lib"
        system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
        system "make"
        system "make", "install"
      end
    end

    ENV.prepend_create_path "PERL5LIB", libexec

    inreplace "praeda.pl", 'my $dirpath =".";', 'my $dirpath ="../";'
    bin.install "praeda.pl"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
  end
end
