# New resource for the storage bucket our application will use.
resource "google_storage_bucket" "buckey" {
  name     = var.bucket_name
  location = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}