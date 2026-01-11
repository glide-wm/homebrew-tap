cask "glide" do
  arch arm: "aarch64", intel: "x64"
  version "0.2.2"
  sha256 arm:   "03540fee2edc5cc870015e2740f813dfc30cfcb11852484f900290678619d438",
         intel: "72691d24cae4e9e98a0e9b84fe288e8d672dbe2ac610b6754b3a942e04b42bc9"

  url "https://github.com/glide-wm/glide/releases/download/v#{version}/Glide_#{version}_#{arch}.dmg",
      verified: "github.com/glide-wm/glide/"
  name "Glide"
  desc "Tiling window manager for macOS"
  homepage "https://glidewm.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Glide.app"

  binary "#{appdir}/Glide.app/Contents/MacOS/glide"

  zap trash: [
    "~/.glide/layout.ron",
  ]
  zap rmdir: [
    "~/.glide"
  ]

  caveats <<~EOS
    Glide requires Accessibility permissions to function.

    On first launch, you will be prompted to grant these permissions.
    Follow the instructions in the app to enable them in System Settings.

    To manage the current space, press Alt+Z.
    To exit Glide, press Alt+Shift+E.

    See the default configuration for key bindings:
      https://github.com/glide-wm/glide/blob/main/glide.default.toml

    You can customize settings by editing ~/.glide.toml and running:
      glide config update

    For live config updates as you save, use:
      glide config update --watch
  EOS
end
