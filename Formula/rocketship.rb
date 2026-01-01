class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.39"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.39/rocketship-darwin-arm64"
      sha256 "a936b5c50c6fb7d550cc287e9be79e16e70c2f7bcb100e015e0f0dfa06e1bf4f"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.39/rocketship-darwin-amd64"
      sha256 "a8f17bfcbcc6b2b776053e14668c41ba7502a6d2119ef0f521d9283cc2cbd269"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.39/rocketship-linux-arm64"
      sha256 "ed1f19b561a2beb179f078fd61daeee1091dbdd565de46c630032f097a919050"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.39/rocketship-linux-amd64"
      sha256 "13cd12bff01d83f19cb9b04a5ee5df1b85e6b420b1c0c80824dcc697c40a4db2"
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
