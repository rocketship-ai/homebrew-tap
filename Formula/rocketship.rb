class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.32"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.32/rocketship-darwin-arm64"
      sha256 "733705c9eff91f6ea04abfe40f0b27610d367a2631191cc0c4af8870fdf8e6f5"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.32/rocketship-darwin-amd64"
      sha256 "3f00959897068db04b3e966715dae6fb522239b14cab0d3f793024cd6e72f6ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.32/rocketship-linux-arm64"
      sha256 "f67cca09fefc29336c487a76fa5cdacc6ad3ff1afe5b5e2805a1babbeb75eeba"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.32/rocketship-linux-amd64"
      sha256 "2c7dd8bdf900d8d279ae7563d5b267b82b50ebc7b8477576f4285740548a8a1d"
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
