class Ao3fetch < Formula
  desc "Tool for collecting work URLs from AO3 list views"
  homepage "https://github.com/legowerewolf/AO3fetch"
  url "https://github.com/legowerewolf/AO3fetch.git", tag: "v2.1.7", revision: "6732a1ccb49ab6b3d5c73ff459d4ac3fb9f208e3"
  license "MIT"

  bottle do
    root_url "https://github.com/legowerewolf/homebrew-tap/releases/download/ao3fetch-2.1.7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8025dcfff05f34cc1aed72fab78169c21caedc3281a7641d94257c450af0a941"
    sha256 cellar: :any,                 x86_64_linux: "df665d8bb58658a6fcd04c1fd07a984417d547591f227c5137e2e63a709ac04a"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/legowerewolf/AO3fetch/buildinfo.RefName=v#{version}'")
  end

  test do
    assert_includes shell_output("#{bin}/ao3fetch -version"), version
  end
end
