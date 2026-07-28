cask "glimpse" do
  version "1.0.6"
  sha256 "7819520351f484c2ba57d157a87dc04dd7c027d1a9cf1a5dd65c92c1598ea90d"

  url "https://github.com/glimpse-hq/Glimpse/releases/download/v#{version}/Glimpse_#{version}_universal.dmg"
  name "Glimpse"
  desc "On-device dictation and audio/video transcription"
  homepage "https://github.com/glimpse-hq/Glimpse"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Glimpse updates itself via its built-in updater.
  auto_updates true
  depends_on macos: :sonoma

  app "Glimpse.app"
  # Same dual-boot binary the in-app installer symlinks; exposes `glimpse` on PATH.
  binary "#{appdir}/Glimpse.app/Contents/MacOS/Glimpse", target: "glimpse"

  uninstall launchctl: "Glimpse",
            quit:      "com.glimpse.data"

  zap trash: [
    "~/Library/Application Support/com.glimpse.data",
    "~/Library/Caches/com.glimpse.data",
    "~/Library/HTTPStorages/com.glimpse.data",
    "~/Library/HTTPStorages/com.glimpse.data.binarycookies",
    "~/Library/LaunchAgents/Glimpse.plist",
    "~/Library/Logs/com.glimpse.data",
    "~/Library/Preferences/com.glimpse.data.plist",
    "~/Library/Saved Application State/com.glimpse.data.savedState",
    "~/Library/WebKit/com.glimpse.data",
  ]
end
