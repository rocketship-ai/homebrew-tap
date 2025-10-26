class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.33"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.33/rocketship-darwin-arm64"
      sha256 "5fb1302c9b794c4380a737feaa9d841eff9900ce20c04986097d6222ec6537ec"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.33/rocketship-darwin-amd64"
      sha256 "0656c7169a10adb54b73d8070544787e838b3e1d8a89a781ff648e5cb79ed984"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.33/rocketship-linux-arm64"
      sha256 "28d3b1b05ede380f64bcd5a72ce4d6a748e82f06c76b131039d3c7dd059d2d4f"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.33/rocketship-linux-amd64"
      sha256 "58ee0b41f82e954a075844244b95593e36f863b69fc7dbe292329d731d72e32b"
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
