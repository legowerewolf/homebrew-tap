class Ao3fetch < Formula
  desc "Tool for collecting work URLs from AO3 list views"
  homepage "https://github.com/legowerewolf/AO3fetch"
  url "https://github.com/legowerewolf/AO3fetch.git", tag: "v2.1.9", revision: "559c86e2e90e4600d62287eb1a83baf905f03c2c"
  license "MIT"

  bottle do
    root_url "https://github.com/legowerewolf/homebrew-tap/releases/download/ao3fetch-2.1.9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ac4109dda604139eb2f6cbd422149172c38dcb948f2c78781900ccb72cdd3716"
    sha256 cellar: :any,                 x86_64_linux: "0347ca1cb1fb380d77437c0e8999e538e814a1ba25c33c97013045ff48ca3242"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/legowerewolf/AO3fetch/buildinfo.RefName=v#{version}'")
  end

  test do
    assert_includes shell_output("#{bin}/ao3fetch -version"), version
  end
end
