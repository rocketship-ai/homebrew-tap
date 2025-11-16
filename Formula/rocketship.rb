class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.36"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.36/rocketship-darwin-arm64"
      sha256 "6fc7d4cba5ff8d6dc6f04b1ce1a3a5278eb25e786e5e7464a8162e0afdfd64a2"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.36/rocketship-darwin-amd64"
      sha256 "87bac6142fcd50fbb7349e25ed9accbcd2731d4c400e1522703bba0da5dc072f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.36/rocketship-linux-arm64"
      sha256 "89b408424d284ae7d88e5e1766b1b065ed0fdce46652b20e2be0e3d7a5ba2239"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.36/rocketship-linux-amd64"
      sha256 "9bdba7c5b7e8e0f03d86924c5d62ca311fdb647619162009bb8d858f3ce08f58"
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
