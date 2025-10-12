class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.30"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.30/rocketship-darwin-arm64"
      sha256 "ae0331ac63595f470aecddf225eed67b5564c556c9470ecf0987be51ac7ad5f8"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.30/rocketship-darwin-amd64"
      sha256 "757c806e393db24843dcee0eb87d3f329ab1a890bf8af61e4b320a00c8550752"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.30/rocketship-linux-arm64"
      sha256 "f18198b1ea05bb29c950af99af80f5cbba84ca8ad7001c2ce95d6a657e29c370"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.30/rocketship-linux-amd64"
      sha256 "7aa817647dd2e30bb37e22f4ee3c7f3145fc2a0fe041663b8468a98485195bdd"
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
