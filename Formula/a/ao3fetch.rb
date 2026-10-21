class Ao3fetch < Formula
  desc "Tool for collecting work URLs from AO3 list views"
  homepage "https://github.com/legowerewolf/AO3fetch"
  url "https://github.com/legowerewolf/AO3fetch.git", tag: "v2.1.8", revision: "34aefde4523b69aff5f05099bca36557c5b55823"
  license "MIT"

  bottle do
    root_url "https://github.com/legowerewolf/homebrew-tap/releases/download/ao3fetch-2.1.8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "eade210e2523ef4cccd22b2eb74fcaf563036e33761b2c89e629533f78c4e09e"
    sha256 cellar: :any,                 x86_64_linux: "2d005e0d916309f829e2a4e4ebbca5d071399fd54a73cec54b9cd5ab668e6762"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/legowerewolf/AO3fetch/buildinfo.RefName=v#{version}'")
  end

  test do
    assert_includes shell_output("#{bin}/ao3fetch -version"), version
  end
end
