class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.40"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.40/rocketship-darwin-arm64"
      sha256 "6251e895e2fcef96adc2b6450913a6e7a2c996dce57d12c97880329754d0e552"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.40/rocketship-darwin-amd64"
      sha256 "988995e8aa6b6f0e775dff0945b06be7a143904685e71f9130302d4f3449455b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.40/rocketship-linux-arm64"
      sha256 "d6b1afd655ae4d3d5d16a4e9d2dd4c564bdc1710b3080de06933badcdd0ddd6e"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.40/rocketship-linux-amd64"
      sha256 "05ce7132eda9dc3373a7daeba6bbb8a5c57611657c1de3268ef2abe8387e3c05"
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
