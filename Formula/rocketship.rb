class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.26"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.26/rocketship-darwin-arm64"
      sha256 "921f4b53bdfedf3d8dbdd5d729670c7487a45060b17f11fdb0d5fd5c1e56737c"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.26/rocketship-darwin-amd64"
      sha256 "500c686728cfcc5cda970663adf53d0a92f831f785c66fdacccf9e5d439654fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.26/rocketship-linux-arm64"
      sha256 "252e938474ad5d3fd00a95d3d729955612d6adb9bbfe8b103cb92bde8d40f8f0"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.26/rocketship-linux-amd64"
      sha256 "c0674ace20f86791fbd54fe7fbb44f0588390d83a8476337701151f059bf766d"
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
