# homebrew-infra-eye

Homebrew tap for [InfraEye](https://github.com/mnshchtri/infra-eye) — the standalone desktop app.

## Install

```bash
brew tap mnshchtri/infra-eye
brew install --cask infra-eye
```

This installs `InfraEye.app` into `/Applications` and it opens normally — no
extra steps.

The app is ad-hoc signed rather than notarized with an Apple Developer ID, so
Gatekeeper would otherwise reject it and macOS would report it as damaged. The
cask clears the quarantine flag on the app it just installed, which is what
that `xattr -cr` workaround used to do by hand. Note that this applies to the
Homebrew install only — a `.dmg` downloaded straight from the releases page is
still quarantined and will need the manual step until the app is notarized.

## Update

```bash
brew upgrade --cask infra-eye
```

## Uninstall

```bash
brew uninstall --cask infra-eye
# also remove local data (SQLite DB, JWT secret):
brew uninstall --zap --cask infra-eye
```

## What this installs

A fully self-contained build of InfraEye — no Docker, no Postgres, no Redis. See the [main repo](https://github.com/mnshchtri/infra-eye) and [documentation](https://github.com/mnshchtri/infra-eye/blob/main/documentation.md#desktop-app) for details.
