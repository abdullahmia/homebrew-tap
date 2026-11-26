class CueZsh < Formula
  desc "Smart AI Zsh autocomplete, project history dropdown, and CLI assistant"
  homepage "https://github.com/abdullahmia/Cue"
  url "https://github.com/abdullahmia/Cue/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "PASTE_SHA256_HERE"
  version "0.0.1"

  depends_on "python@3.13" => :recommended

  def install
    chmod 0755, "bin/cue"
    pkgshare.install "cue.plugin.zsh", "bin", "engine", "zsh", "bash", "powershell", "install.sh", "uninstall.sh"
    bin.install_symlink pkgshare/"bin/cue"
  end

  def caveats
    <<~EOS
      To activate the Zsh plugin, add this line to your ~/.zshrc:
        source "#{opt_pkgshare}/cue.plugin.zsh"

      Then reload your shell:
        source ~/.zshrc
    EOS
  end

  test do
    system "#{bin}/cue", "--version"
  end
end