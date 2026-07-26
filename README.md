# homebrew-infra-eye

Homebrew tap for [InfraEye](https://github.com/mnshchtri/infra-eye) — the standalone desktop app.

## Install

```bash
brew tap mnshchtri/infra-eye
brew install --cask infra-eye
```

This installs `InfraEye.app` into `/Applications`. On first launch, since the app is ad-hoc signed rather than notarized with an Apple Developer ID, Gatekeeper may report it as damaged — `brew install` prints the fix (`xattr -cr`) as a caveat if that happens.

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
