class Ao3fetch < Formula
  desc "Tool for collecting work URLs from AO3 list views"
  homepage "https://github.com/legowerewolf/AO3fetch"
  url "https://github.com/legowerewolf/AO3fetch.git", tag: "v2.1.1", revision: "56e5fd9c8eee59f9c3047d1633206b58f65e8221"
  license "MIT"

  bottle do
    root_url "https://github.com/legowerewolf/homebrew-tap/releases/download/ao3fetch-2.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "88fee2206eb05b4253f10245f871b724a7466a2c61fe740798705b19445ce36e"
    sha256 cellar: :any_skip_relocation, ventura:       "4532102e4e7636b7a40eee741acab37e1f87a7c0aec84893ccafc026876902d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "56db51f38129afba49e9de8ac5d069f35941dc1944b70979eb7a5bb4b7b20c7c"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X 'github.com/legowerewolf/AO3fetch/buildinfo.RefName=v#{version}'")
  end

  test do
    assert_includes shell_output("#{bin}/ao3fetch -version"), version
  end
end
