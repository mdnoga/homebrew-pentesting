require "formula"

class Libnl < Formula
  homepage 'https://www.infradead.org/~tgr/libnl/'
  url 'http://www.infradead.org/~tgr/libnl/files/libnl-3.2.25.tar.gz'
  sha256 '8beb7590674957b931de6b7f81c530b85dc7c1ad8fbda015398bc1e8d1ce8ec5'
  version '3.2.25'
  revision 3

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "bison" => :build
  depends_on "flex" => :build

  def install
    system "./configure",
           "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
