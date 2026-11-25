cask "bibigpt" do
  arch arm: "aarch64", intel: "x86_64"
  livecheck_arch = on_arch_conditional intel: "-intel"

  on_arm do
    version "4.838.0"
    sha256 "113888938377aa9c76cdc0bc7ace4b3ff7c44902af2f5d9c2c8effbb0c5e6fcc"
  end
  on_intel do
    version "4.754.1"
    sha256 "0abc238c847c9591127bf939d32cdf966fa7d7d9de07036fd42ab59f330d6ff6"
  end

  url "https://bibigpt-apps.chatvid.ai/desktop-releases/BibiGPT-#{version}-darwin-#{arch}.dmg"
  name "BibiGPT"
  desc "AI video and audio summariser"
  homepage "https://bibigpt.co/"

  livecheck do
    url "https://bibigpt-apps.chatvid.ai/desktop-releases/latest#{livecheck_arch}.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on :macos

  app "BibiGPT.app"
  binary "#{appdir}/BibiGPT.app/Contents/MacOS/BibiGPT", target: "bibi"

  zap trash: [
    "~/.local/bin/bibi",
    "~/Library/Application Support/co.bibigpt.desktop",
    "~/Library/Caches/co.bibigpt.desktop",
    "~/Library/Preferences/co.bibigpt.desktop.plist",
    "~/Library/Saved Application State/co.bibigpt.desktop.savedState",
    "~/Library/WebKit/co.bibigpt.desktop",
  ]
end
