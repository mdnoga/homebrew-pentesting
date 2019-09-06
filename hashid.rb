require 'formula'

class Hashid < Formula
  homepage 'https://github.com/psypanda/hashID'
  url 'https://github.com/psypanda/hashID/archive/v3.1.4.tar.gz'
  sha256 '8c0be2390bcaaf6a39a7e239728cb74038bb44ee253f7b8d6487a95d045c03b6'
  version '3.1.4'

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    man7.install "doc/man/hashid.7"
    libexec.install "README.rst"
    libexec.install Dir["doc/*"]
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
end
