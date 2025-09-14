# Terraform recommends triggering an error by attempting to use an invalid value in resource creation
resource "null_resource" "validate_os_version" {
  count = local.is_valid ? 0 : 1
  
  provisioner "local-exec" {
    command = "echo 'ERROR: Invalid os-version (${var.os-version}) selected for OS (${var.os})!' && exit 1"
  }
}