cask "infra-eye" do
  version "1.5.2"
  sha256 "67f25788e0e0615997069385abe794a58c65bcde21bf4becb4a84d9ad9a73dd3"

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
