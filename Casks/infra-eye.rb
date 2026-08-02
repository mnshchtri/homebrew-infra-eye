cask "infra-eye" do
  version "1.5.1"
  sha256 "f158626db1ee322b2ff061c10b8eb84e7a54aa4db2675db2d0a6a23cd39b9c40"

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
