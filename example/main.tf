provider "local" {
  version = "~> 1.4"
}

data "rev-parse_commit" "git_commit" {
  arg = "HEAD"
}

resource "local_file" "test_file" {
  content = "commit hash: ${data.rev-parse_commit.git_commit.hash}"
  file_permission = "0666"
  filename = "${path.module}/test"
}