class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.23"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.23/rocketship-darwin-arm64"
      sha256 "43320bcb1bba667432baf36049de9ca8dc0420aaac67e0f308c182658dccbb0a"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.23/rocketship-darwin-amd64"
      sha256 "c5bbedc70b23cbf03132248b04d4c13f5943ef3d2b963e744521bfe4648a7e33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.23/rocketship-linux-arm64"
      sha256 "faacd2a38a2d217ae77747a376bb038e08485979b798ec4479166969649723ee"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.23/rocketship-linux-amd64"
      sha256 "a5849592b8e99b4c73ced7e4902e4ec995f0b3a7af276d87fe4234c1b211ac13"
    end
  end

  def install
    target = if OS.mac?
              "rocketship-darwin-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
            else
              "rocketship-linux-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
            end
    bin.install target => "rocketship"
  end

  test do
    system "#{bin}/rocketship", "--version"
  end
end
