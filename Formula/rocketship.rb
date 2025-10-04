class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.24"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.24/rocketship-darwin-arm64"
      sha256 "b80c227b34da195f9eae679270085aa603f1532e6dd77957bfa7e98d2440764b"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.24/rocketship-darwin-amd64"
      sha256 "b54344dc4680b3d58651f6821184db79667f8942971cf4db52b872ab569bd697"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.24/rocketship-linux-arm64"
      sha256 "6852610fe49cc3dae9eb92d72a9fa0a7b2ce2174b9165c582f5a5f98d962d183"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.24/rocketship-linux-amd64"
      sha256 "408c42c05aab880b5814c3928e171b342e2d85d70a6020260dee30c31112ad2f"
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
