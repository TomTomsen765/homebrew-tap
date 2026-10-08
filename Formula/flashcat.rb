class Flashcat < Formula
  desc "Local AI assistant for the macOS terminal (LM Studio, Ollama or llama.cpp)"
  homepage "https://tomtomsen765.github.io/flashcat/"
  url "https://github.com/TomTomsen765/flashcat/archive/refs/tags/v1.5.3.tar.gz"
  sha256 "05491c9d9fb95d8ce55319d526e3ef715cb9dd09db1c94d59a3b65e322d5ad90"
  license "MIT"

  depends_on :macos

  def install
    libexec.install "bin/flashcat", "bin/flashcat-chat.py", "bin/flashcat-cleanup"
    bin.install_symlink libexec/"flashcat"
  end

  def caveats
    <<~EOS
      Flashcat needs a local model server: LM Studio (https://lmstudio.ai/download), Ollama or llama.cpp.
      Open it once, then start Flashcat in a project folder:
        cd ~/Documents/my-project && flashcat
      The first start offers to download the default model, Gemma 4 26B (about 16 GB).
    EOS
  end

  test do
    assert_match "Flashcat #{version}", shell_output("#{bin}/flashcat --version")
  end
end
