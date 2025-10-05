class Rocketship < Formula
  desc "Rocketship CLI"
  homepage "https://github.com/rocketship-ai/rocketship"
  version "v0.5.25"

  on_macos do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.25/rocketship-darwin-arm64"
      sha256 "52f8c92bd32fb7f54f058277f957525d12aec17d9f3c0fe468c7e451a0762fef"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.25/rocketship-darwin-amd64"
      sha256 "c95fe0f4ed49bc0de2506c986f92e3d29fd864f754d63cc3d9d37c65dce4e4f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.25/rocketship-linux-arm64"
      sha256 "85ec99b5b96964866d862a1b05b78e085db2bb760189e88405403c82ba38a648"
    end
    on_intel do
      url "https://github.com/rocketship-ai/rocketship/releases/download/v0.5.25/rocketship-linux-amd64"
      sha256 "6b786bd8f4f8b772cd771478e217fc20da7c2ac737a3515a6f6dd49cba695431"
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
