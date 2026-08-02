cask "infra-eye" do
  version "1.6.0"
  sha256 "f605b98dac383df39d8c0521683900c29fde7599ff7ec0c9ee77f66e97c9deeb"

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
