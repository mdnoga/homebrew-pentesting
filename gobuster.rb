require "language/go"

class Gobuster < Formula
  homepage "https://github.com/OJ/gobuster"
  url "https://github.com/OJ/gobuster", :using => :git, :revision => "7a6d1c0"
  version "1.3"

  depends_on "go" => :build

  go_resource "github.com/satori/go.uuid" do
    url "https://github.com/satori/go.uuid.git", :revision => "879c588"
  end

  go_resource "golang.org/x/crypto" do
    url "https://go.googlesource.com/crypto.git", :revision => "b8a2a83"
  end

  def install
    ENV["GOPATH"] = buildpath
    Language::Go.stage_deps resources, buildpath/"src"

    system "go", "build", "-o", bin/"gobuster"
  end
end
