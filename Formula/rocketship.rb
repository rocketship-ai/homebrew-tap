class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.41"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.41/rocketship-darwin-arm64"
      sha256 "ea06fa04e97cf1cc1d94e4178d41ca5521731824e594fa0a046aea44eba49e0e"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.41/rocketship-darwin-amd64"
      sha256 "d1a90271e2455433faad537ef03305b54360607ecf7bfd829a26978b4f5a8c10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.41/rocketship-linux-arm64"
      sha256 "16dcad22654ef4e82eaa96ea62c46d720cc742714b2ab18db2a375dc12f8e191"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.41/rocketship-linux-amd64"
      sha256 "1ad149eab78e2da39d2b5f738823e06efaa5e76d68b90747fe4dc085010dea2f"
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
