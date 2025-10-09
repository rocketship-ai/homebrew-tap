class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.28"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.28/rocketship-darwin-arm64"
      sha256 "77739860dd1c790984e0d5ae12ccb63f2ddda3cda494a9fd38f4bcd6b3d46107"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.28/rocketship-darwin-amd64"
      sha256 "91753e1b76461fba377fa47964f84bd0ed81f0bf9ae7141471ab4ae6fce05689"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.28/rocketship-linux-arm64"
      sha256 "dc0bdbccdb8b7173f9bf29282846d17f4cccf565c4871117397cfdbda05d2391"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.28/rocketship-linux-amd64"
      sha256 "36e9d197c3939d3cae79c332a14ebe7b9eff440b9b0c22149171bbd8a0c739c6"
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
