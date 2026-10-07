cask "rustnotes" do
  version "0.16.0"
  sha256 "6d1042e8f8e0bb4afc43e2b9b0cc9758e88e37a821cf5eecd655b3f6696c3fb8"

  # Binario universale (arm64 + Intel in un solo file).
  url "https://github.com/sdiricco/rustnotes/releases/download/v#{version}/RustNotes_#{version}_universal.dmg"
  name "RustNotes"
  desc "Simple, local-first notes app in the spirit of Apple Notes, for every OS"
  homepage "https://github.com/sdiricco/rustnotes"

  # Dalla 0.14.1 l'app è firmata con Developer ID e notarizzata da Apple:
  # si apre senza avvisi di Gatekeeper. Dalla 0.15.0 si aggiorna anche da
  # sola (tauri-plugin-updater), ma auto_updates resta false: con true
  # `brew upgrade` salterebbe il cask senza `--greedy`, e chi ha una versione
  # precedente all'updater non riceverebbe mai la nuova.
  auto_updates false
  depends_on :macos

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
