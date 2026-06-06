class Ao3fetch < Formula
  desc "Tool for collecting work URLs from AO3 list views"
  homepage "https://github.com/legowerewolf/AO3fetch"
  url "https://github.com/legowerewolf/AO3fetch.git", tag: "v2.1.4", revision: "601458263ede66bfa72ea08be97c3922da1b553b"
  license "MIT"

  bottle do
    root_url "https://github.com/legowerewolf/homebrew-tap/releases/download/ao3fetch-2.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5cc27e26dc2448ef011d3e9b4d27349529314e67bfab92cd0c1e0043f00b4daa"
    sha256 cellar: :any,                 x86_64_linux:  "7ee26ae951ee02791c6ca947ac82596dff876445b3545f249eae0706272a8e0c"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/legowerewolf/AO3fetch/buildinfo.RefName=v#{version}'")
  end

  test do
    assert_includes shell_output("#{bin}/ao3fetch -version"), version
  end
end
