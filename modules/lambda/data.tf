data "archive_file" "dummy_dist" {
  output_path = "${path.module}/dummy_dis.zip"
  type        = "zip"

  source {
    content  = "Hello World"
    filename = "dummy.txt"
  }
}