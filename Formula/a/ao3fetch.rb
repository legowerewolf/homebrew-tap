class Ao3fetch < Formula
  desc "Tool for collecting work URLs from AO3 list views"
  homepage "https://github.com/legowerewolf/AO3fetch"
  url "https://github.com/legowerewolf/AO3fetch.git", tag: "v2.1.10", revision: "41b3b3090b52b03b5475f555ef73f54b09389467"
  license "MIT"

  bottle do
    root_url "https://github.com/legowerewolf/homebrew-tap/releases/download/ao3fetch-2.1.10"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "71ca1a6b0c780ee99f05608d4e33928b30494ce724e63199393045bdae13273e"
    sha256 cellar: :any,                 x86_64_linux: "cfb444ec5e7ab322e06a2dedda327ae02c90004ee03de60827143389a8a4312e"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/legowerewolf/AO3fetch/buildinfo.RefName=v#{version}'")
  end

  test do
    assert_includes shell_output("#{bin}/ao3fetch -version"), version
  end
end
