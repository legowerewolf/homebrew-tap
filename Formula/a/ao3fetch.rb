class Ao3fetch < Formula
  desc "Tool for collecting work URLs from AO3 list views"
  homepage "https://github.com/legowerewolf/AO3fetch"
  url "https://github.com/legowerewolf/AO3fetch.git", tag: "v2.1.6", revision: "c67b323232b3bb90b13318c18e17adfc052d6e46"
  license "MIT"

  bottle do
    root_url "https://github.com/legowerewolf/homebrew-tap/releases/download/ao3fetch-2.1.6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9ceb954ab7030526e37905a5786616243fc9ab779b9b95122edf1e769c6b5f3c"
    sha256 cellar: :any,                 x86_64_linux: "0a78bce567bc7427968ebfba98d8aed0d03d10a910fd158715ec5562e620e55c"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/legowerewolf/AO3fetch/buildinfo.RefName=v#{version}'")
  end

  test do
    assert_includes shell_output("#{bin}/ao3fetch -version"), version
  end
end
