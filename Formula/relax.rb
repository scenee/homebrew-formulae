class Relax < Formula
  desc "Lazy release tool for iOS developers"

  homepage "https://github.com/SCENEE/relax"

  url "https://github.com/scenee/relax/archive/0.8.2.tar.gz"
  sha256 "9f978c1c37d44f67666c95f18c47228c3a5e509c4ae5cbb234c2de17363665cd"

  head "https://github.com/SCENEE/relax.git"

  def install
    prefix.install "LICENSE", "README.md"
    prefix.install Dir["bin", "libexec", "go", "completions", "share"]
  end

  def caveats; <<~EOS
    To enable completion, add the following line to your bash profile:
      if which relax > /dev/null; then source "$(relax init completion)"; fi

    To get started:
      cd /path/to/project
      relax init
      relax dist adhoc
EOS
  end

  test do
    system "${bin}/relax", "--version"
  end
end
