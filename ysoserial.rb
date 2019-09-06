require 'formula'

class Ysoserial < Formula
  homepage 'https://github.com/frohoff/ysoserial'
  head 'https://github.com/frohoff/ysoserial', :using => :git
  url 'https://github.com/frohoff/ysoserial', :using => :git, :revision => '19514a4'
  version '0.0.5'

  depends_on "maven" => :build
  depends_on :java => "1.7+"

  def install
    ENV.java_cache

    system "mvn", "-DskipTests", "clean", "package"
    libexec.install Dir["target/ysoserial-*.jar"]
    if build.head?
      bin.write_jar_script "#{libexec}/ysoserial-*-SNAPSHOT-all.jar", "ysoserial"
    else
      bin.write_jar_script "#{libexec}/ysoserial-#{version}-all.jar", "ysoserial"
    end
  end
end
