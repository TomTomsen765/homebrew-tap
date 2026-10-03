class Flashcat < Formula
  desc "Local AI assistant for the macOS terminal (LM Studio or Ollama)"
  homepage "https://tomtomsen765.github.io/flashcat/"
  url "https://github.com/TomTomsen765/flashcat/archive/refs/tags/v1.3.13.tar.gz"
  sha256 "6ad4c8011f70893bba8cd7ad4583bdb80b060dc1a17a51e988cfcb0aa84ea6a0"
  license "MIT"

  depends_on :macos

  def install
    libexec.install "bin/flashcat", "bin/flashcat-chat.py", "bin/flashcat-cleanup"
    bin.install_symlink libexec/"flashcat"
  end

  def caveats
    <<~EOS
      Flashcat needs a local model server: LM Studio (https://lmstudio.ai/download) or Ollama.
      Open it once, then start Flashcat in a project folder:
        cd ~/Documents/my-project && flashcat
      The first start offers to download the default model, Gemma 4 26B (about 16 GB).
    EOS
  end

  test do
    assert_match "Flashcat #{version}", shell_output("#{bin}/flashcat --version")
  end
end
