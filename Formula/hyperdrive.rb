class Hyperdrive < Formula
  desc "First-class package and dependency manager for Lando"
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"
  homepage "https://github.com/lando/hyperdrive"
  version "0.7.0-alpha.12"
  url "https://github.com/lando/hyperdrive/releases/download/v#{version}/hyperdrive-macos-#{arch}-v#{version}.tar.gz"
  sha256 "fa86e5962e6ece4b5e367675293eec91d52aa2f2f8fa8ae4a3a7bcf49b7451a1"
  license "AGPL-3.0-only"

  uses_from_macos "curl"

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "hyperdrive-macos-#{arch}-v#{version}" => "hyperdrive"
  end

  on_linux do
    depends_on "curl"
  end

  test do
    system "#{bin}/hyperdrive" "--version"
  end
end
