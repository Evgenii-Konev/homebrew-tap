cask "pixpets" do
  version "0.2.2"
  sha256 "8a78976b166bcd115d46ab143982e2ca7ec402228c9275f71d58b6d3135bde1f"

  url "https://github.com/Evgenii-Konev/pixpets/releases/download/v#{version}/PixPets-#{version}.dmg"
  name "PixPets"
  desc "Menu bar app showing animated pixel pets for AI coding agent sessions"
  homepage "https://github.com/Evgenii-Konev/pixpets"

  depends_on macos: ">= :ventura"

  app "PixPets.app"

  postflight do
    ohai "Run 'pixpets --install-hooks' to set up Claude Code integration"
  end

  zap trash: "~/.pixpets"

  caveats <<~EOS
    To enable session tracking, run:
      pixpets --install-hooks

    This installs the hook script and configures Claude Code to report sessions.
  EOS
end
