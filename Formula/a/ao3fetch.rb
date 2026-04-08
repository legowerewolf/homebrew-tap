class Ao3fetch < Formula
  desc "Tool for collecting work URLs from AO3 list views"
  homepage "https://github.com/legowerewolf/AO3fetch"
  url "https://github.com/legowerewolf/AO3fetch.git", tag: "v2.1.3", revision: "5c6334b84a0996683a4a32a72fe892b556297563"
  license "MIT"

  bottle do
    root_url "https://github.com/legowerewolf/homebrew-tap/releases/download/ao3fetch-2.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fdf725230b62af9d385eaf51017adce980b57b75bacb83972b0d428e7fecd338"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "07e7f630889be6fff6789ed3e5ec461f66201253dfcfc63c096b6cfe83532c55"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/legowerewolf/AO3fetch/buildinfo.RefName=v#{version}'")
  end

  test do
    assert_includes shell_output("#{bin}/ao3fetch -version"), version
  end
end
