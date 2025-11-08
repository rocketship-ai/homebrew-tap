class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.34"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.34/rocketship-darwin-arm64"
      sha256 "d63cd5604e9eb9d1a167eb0963cdc0b9086c1e747a37872bfee28b8e112b4474"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.34/rocketship-darwin-amd64"
      sha256 "97719a2e286456f1e2ed12ce42c69f394d8ecddedc36d6104199aa0bf5506a8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.34/rocketship-linux-arm64"
      sha256 "16dda3b38d6700dbd29d20e2f9d7a5b6fab3d4e16700cb79566d42f9205bef19"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.34/rocketship-linux-amd64"
      sha256 "4b45912e974d2d0d0436c753e47dfdcf95055c67e5c89ef650637c19423d6338"
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
