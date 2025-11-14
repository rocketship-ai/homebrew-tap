class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.35"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.35/rocketship-darwin-arm64"
      sha256 "dce566d842da7d7c9d100aa60999e094c9b654fe2b8ae82d6f31afe0fd595322"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.35/rocketship-darwin-amd64"
      sha256 "63a32050461311c3e7721d833defc64885fc04918111422989037cb143bf3f88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.35/rocketship-linux-arm64"
      sha256 "b2ea8f8185e2d8b4d134e11bfab98508a4b3c8a62af96ab5eb27c9e1e14df77f"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.35/rocketship-linux-amd64"
      sha256 "1e465a7021dae6c15aeadb55b5ae7e83c0be2a898619d5dd7c18dd17e8259928"
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
