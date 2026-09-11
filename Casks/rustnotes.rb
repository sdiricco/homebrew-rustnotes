cask "rustnotes" do
  version "0.12.0"
  sha256 "a652dd9dca50f6c25b2f5ddac41f2aab6bbf2451fab4d1de9dc5bd4f728c87b0"

  # Binario universale (arm64 + Intel in un solo file).
  url "https://github.com/sdiricco/rustnotes/releases/download/v#{version}/RustNotes_#{version}_universal.dmg"
  name "RustNotes"
  desc "Simple, local-first notes app in the spirit of Apple Notes, for every OS"
  homepage "https://github.com/sdiricco/rustnotes"

  # L'app non è firmata con un certificato Apple Developer ID: al primo avvio
  # macOS mostrerà l'avviso "sviluppatore non verificato". Va aperta con
  # tasto destro > Apri, oppure eseguendo:
  #   xattr -dr com.apple.quarantine "/Applications/RustNotes.app"
  auto_updates false
  depends_on macos: :big_sur

  app "RustNotes.app"

  # Sia la cartella dati attuale sia quella delle versioni precedenti alla
  # rinomina (l'app la lascia come backup dopo la migrazione automatica).
  zap trash: [
    "~/Library/Application Support/com.movesolutions.macnotestauri",
    "~/Library/Application Support/io.github.sdiricco.rustnotes",
    "~/Library/Preferences/com.movesolutions.macnotestauri.plist",
    "~/Library/Preferences/io.github.sdiricco.rustnotes.plist",
    "~/Library/Saved Application State/com.movesolutions.macnotestauri.savedState",
    "~/Library/Saved Application State/io.github.sdiricco.rustnotes.savedState",
  ]
end
