cask "infra-eye" do
  version "1.2.0"
  sha256 "30d0b1c98317f2074634b2fcf27fc2a37eaf2b7d50b1cb0f443b8f46bdaed2c0"

  url "https://github.com/mnshchtri/infra-eye/releases/download/desktop-v#{version}/InfraEye-macOS-arm64.dmg"
  name "InfraEye"
  desc "Agentless observability platform desktop app"
  homepage "https://github.com/mnshchtri/infra-eye"

  auto_updates false
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "InfraEye.app"

  zap trash: [
    "~/Library/Application Support/InfraEye",
    "~/Library/Saved Application State/com.wails.infraeye.savedState",
  ]

  caveats <<~EOS
    InfraEye.app is ad-hoc signed (not notarized with an Apple Developer ID),
    so Gatekeeper may report it as damaged on first launch. If that happens, run:
      xattr -cr "#{appdir}/InfraEye.app"
    then open it again, or right-click the app and choose "Open".
  EOS
end
