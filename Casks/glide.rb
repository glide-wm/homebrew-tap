cask "glide" do
  arch arm: "aarch64", intel: "x64"
  version "0.2.3"
  sha256 arm:   "1c24505e7b699a5d9c2196990ac054dc83aa4c64aa16f4852e383e818df746a7",
         intel: "1e3ae126d4078da3818309b18876ca53f6526b137414723651e27cc3c8172c95"

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
