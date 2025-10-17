class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.31"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.31/rocketship-darwin-arm64"
      sha256 "224961563366ef9bcddcb9ad84c58ceced14fe3767f4166f7bc47f77657f1875"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.31/rocketship-darwin-amd64"
      sha256 "64d9c4014e0af0c997a17bf4f230d585d90892f9763198a7b0c5f05a989c906a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.31/rocketship-linux-arm64"
      sha256 "b841c15f66949014af5684629b0c12914941697e3297ecd957bb72ac25cc8186"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.31/rocketship-linux-amd64"
      sha256 "dd0264d828f42f559992f4297d9830d9b09464f1108480ce98c92d179151aa27"
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
