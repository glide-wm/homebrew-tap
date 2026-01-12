cask "glide" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.4"
  sha256 arm:   "f930218dc27c2aa7daf9b066f7b65c4b8cb77ccb7777e39c26d517e9568411da",
         intel: "454b5d345c0453fbcdd4545af6bba12b48246f1dbe83008e8b6d49f6f08f3f6f"

  url "https://github.com/glide-wm/glide/releases/download/v#{version}/Glide_#{version}_#{arch}.dmg",
      verified: "github.com/glide-wm/glide/"
  name "Glide"
  desc "Tiling window manager for macOS"
  homepage "https://glidewm.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Glide.app"
  binary "#{appdir}/Glide.app/Contents/MacOS/glide"

  zap trash: "~/.glide/layout.ron", rmdir: "~/.glide"

  caveats <<~EOS
    Glide requires Accessibility permissions to function.

    On first launch, you will be prompted to grant these permissions.
    Follow the instructions in the app to enable them in System Settings.

    To launch Glide, run:
      glide launch

    To manage the current space, press Alt+Z.
    To exit Glide, press Alt+Shift+E.

    See the default configuration for key bindings:
      https://github.com/glide-wm/glide/blob/v#{version}/glide.default.toml

    You can customize settings by editing ~/.glide.toml and running:
      glide config update
  EOS
end
