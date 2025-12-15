class Ao3fetch < Formula
  desc "Tool for collecting work URLs from AO3 list views"
  homepage "https://github.com/legowerewolf/AO3fetch"
  url "https://github.com/legowerewolf/AO3fetch.git", tag: "v2.1.2", revision: "3aa9685088e7e634d7b8bda235b347b332e98bb1"
  license "MIT"

  bottle do
    root_url "https://github.com/legowerewolf/homebrew-tap/releases/download/ao3fetch-2.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "934d1814321ed4d1ffd2789009e943570ba3153cbe06d12bd0b848e17adcec4e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "307d9164007d84be384e7d3d4ef0b5ebf4248a370b20afcded7ef27296cd4b9a"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/legowerewolf/AO3fetch/buildinfo.RefName=v#{version}'")
  end

  test do
    assert_includes shell_output("#{bin}/ao3fetch -version"), version
  end
end
