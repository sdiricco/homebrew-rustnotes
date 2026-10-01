cask "rustnotes" do
  version "0.15.0"
  sha256 "7c7ddef6509c84cd5a61359c77d17e9e331d1d23ce3b2ba937eb0536079aad05"

  # Binario universale (arm64 + Intel in un solo file).
  url "https://github.com/sdiricco/rustnotes/releases/download/v#{version}/RustNotes_#{version}_universal.dmg"
  name "RustNotes"
  desc "Simple, local-first notes app in the spirit of Apple Notes, for every OS"
  homepage "https://github.com/sdiricco/rustnotes"

  # Dalla 0.14.1 l'app è firmata con Developer ID e notarizzata da Apple:
  # si apre senza avvisi di Gatekeeper. Dalla 0.15.0 si aggiorna da sola
  # (tauri-plugin-updater): `brew upgrade` la salta a meno di `--greedy`,
  # così non ricarica un'app già aggiornata in-app.
  auto_updates true
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
