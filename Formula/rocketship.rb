class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.43"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.43/rocketship-darwin-arm64"
      sha256 "eb4f12dcd7adc5e10a4aa6f5298939340f2710d3421f4836470c6db9aeed6d9c"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.43/rocketship-darwin-amd64"
      sha256 "b5f6bff7ef903deb5475dc0f7ca494eb7da95627e974878ed8741ed8b8055a23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.43/rocketship-linux-arm64"
      sha256 "b242ec841089d9b869de4d3efce77992012f803e60f8296555455985c05e52fb"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.43/rocketship-linux-amd64"
      sha256 "03162ef3b1578372b2fc0e192b4944894c8e908b29acb741610039c4d496fad9"
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
