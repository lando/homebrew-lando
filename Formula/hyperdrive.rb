class Hyperdrive < Formula
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"
  version "v0.7.0-alpha.12"
  desc "A first-class package and dependency manager for Lando."
  homepage "https://github.com/lando/hyperdrive"
  url "https://github.com/lando/hyperdrive/releases/download/#{version}/hyperdrive-macos-#{arch}-#{version}.tar.gz"
  sha256 "fa86e5962e6ece4b5e367675293eec91d52aa2f2f8fa8ae4a3a7bcf49b7451a1"
  license "Apache"

  uses_from_macos "curl"

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "hyperdrive-macos-#{arch}-#{version}" => "hyperdrive"
  end

  on_linux do
    depends_on "curl"
  end

  test do
    system "#{bin}/hyperdrive" "--version"
  end
end
