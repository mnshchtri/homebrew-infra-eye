cask "infra-eye" do
  version "1.6.8"
  sha256 "3b9c0739e23ab19d5a240e52923d6d933f430fdef76f3c033929937451c38cbe"

  url "https://github.com/mnshchtri/infra-eye/releases/download/desktop-v#{version}/InfraEye-macOS-arm64.dmg"
  name "InfraEye"
  desc "Agentless observability platform desktop app"
  homepage "https://github.com/mnshchtri/infra-eye"

  auto_updates false
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "InfraEye.app"

  # InfraEye.app carries a valid ad-hoc signature, but it is not signed with an
  # Apple Developer ID and has no notarization ticket, so Gatekeeper rejects it
  # on assessment. Homebrew flags every download with com.apple.quarantine, and
  # a quarantined app that fails assessment is what makes macOS show the
  # misleading "InfraEye.app is damaged and can't be opened" dialog on first
  # launch. Clearing the flag on the copy we just installed is exactly what the
  # old caveat asked users to run by hand; doing it here means a plain
  # `brew install --cask infra-eye` produces an app that opens.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/InfraEye.app"]
  end

  zap trash: [
    "~/Library/Application Support/InfraEye",
    "~/Library/Saved Application State/com.wails.infraeye.savedState",
  ]
end
