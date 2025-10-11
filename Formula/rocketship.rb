class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.29"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.29/rocketship-darwin-arm64"
      sha256 "ad77490bf08db5519daddca060232504d50c3ccf9c55d7cc251dcef2be1d5c88"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.29/rocketship-darwin-amd64"
      sha256 "c636c94c4076ad687520b55983b4e09c5f46f88730736e1147a29b3023314d0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.29/rocketship-linux-arm64"
      sha256 "f45da2f9a0b118da666253904cbb8bad5fdc6a14cf2ad230e4c75d3dfdcdc50b"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.29/rocketship-linux-amd64"
      sha256 "e7cf6821b6319b10dca06a347dff7e1b4f31a7e1eb8f320398d3b193a50b6a83"
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
