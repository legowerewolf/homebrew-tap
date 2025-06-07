class Ao3fetch < Formula
  desc "Tool for collecting work URLs from AO3 list views"
  homepage "https://github.com/legowerewolf/AO3fetch"
  url "https://github.com/legowerewolf/AO3fetch.git", tag: "v2.1.0", revision: "e96157c81e4de8fc1b7440101301d6479f621024"
  license "MIT"

  bottle do
    root_url "https://github.com/legowerewolf/homebrew-tap/releases/download/ao3fetch-2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "05ffe1e401649fa3680a357a86def53c2aa4d4ca04160e383c5a6fcbdff79138"
    sha256 cellar: :any_skip_relocation, ventura:       "2f036b552bd80df2f5f2016b0f757b9f613fa79187c88913cfa5045645f49902"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c7dcc423739fc5846190d9c5eaa295c1dc95f775c092ab9d0da20984dcac9f36"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/legowerewolf/AO3fetch/buildinfo.RefName=v#{version}'")
  end

  test do
    assert_includes shell_output("#{bin}/ao3fetch -version"), version
  end
end
