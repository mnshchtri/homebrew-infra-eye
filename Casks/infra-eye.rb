cask "infra-eye" do
  version "1.0.0"
  sha256 "621dd42370c290fa553f1c872b102454d38becad329fc8f0d7f8ab51bdf810f5"

  url "https://github.com/mnshchtri/infra-eye/releases/download/desktop-v#{version}/InfraEye-macOS-arm64.dmg"
  name "InfraEye"
  desc "Agentless observability platform — desktop app (SQLite-backed, no Docker required)"
  homepage "https://github.com/mnshchtri/infra-eye"

  auto_updates false
  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "InfraEye.app"

  caveats <<~EOS
    InfraEye.app is ad-hoc signed (not notarized with an Apple Developer ID),
    so Gatekeeper may report it as damaged on first launch. If that happens, run:
      xattr -cr "#{appdir}/InfraEye.app"
    then open it again, or right-click the app and choose "Open".
  EOS

  zap trash: [
    "~/Library/Application Support/InfraEye",
    "~/Library/Saved Application State/com.wails.infraeye.savedState",
  ]
end
