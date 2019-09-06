class Cowpatty < Formula
  homepage "http://www.willhackforsushi.com/?page_id=50"
  url "http://www.willhackforsushi.com/code/cowpatty/4.6/cowpatty-4.6.tgz"
  sha256 "cd3fc113e5052d3ee08ab71aa87edf772d044f760670c73fde5d5581d7803bc2"
  version "4.6"

  depends_on "openssl"

  def install
    system "make"
    bin.install "cowpatty"
  end
end
