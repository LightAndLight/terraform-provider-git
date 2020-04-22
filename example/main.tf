provider "local" {
  version = "~> 1.4"
}

provider "git" {
  version = "0.0.1"
}

data "git_rev_parse" "commit" {
  arg = "HEAD"
}

resource "local_file" "test_file" {
  content = "commit hash: ${data.git_rev_parse.commit.hash}"
  file_permission = "0666"
  filename = "${path.module}/test"
}
