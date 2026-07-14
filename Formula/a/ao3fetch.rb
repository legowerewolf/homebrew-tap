class Ao3fetch < Formula
  desc "Tool for collecting work URLs from AO3 list views"
  homepage "https://github.com/legowerewolf/AO3fetch"
  url "https://github.com/legowerewolf/AO3fetch.git", tag: "v2.1.5", revision: "be9a405858cc967867b7f0074645fd1ae37516b8"
  license "MIT"

  bottle do
    root_url "https://github.com/legowerewolf/homebrew-tap/releases/download/ao3fetch-2.1.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "012b6733760c23be4d6826fe176deabef602bc45b7e20e7d1b09615084193103"
    sha256 cellar: :any,                 x86_64_linux: "4a6ddc26d19ef16abf5eb61c0c2d039955b971c8696e083831e0dcf99ec6c25c"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/legowerewolf/AO3fetch/buildinfo.RefName=v#{version}'")
  end

  test do
    assert_includes shell_output("#{bin}/ao3fetch -version"), version
  end
end
