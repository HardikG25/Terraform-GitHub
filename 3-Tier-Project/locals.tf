locals {
  tags = {
    ManagedBy   = "Hardik Grover"
    Email       = "hardikgrover141@gmail.com"
    Designation = "DevOps Engineer"
    Experience  = "2+ Years"
  }

  projectCore        = "3-tier-arch"
  projectDescription = "3 tier architecture"

  projectName = "${var.project_prefix}-${var.environment}-${local.projectCore}"
}
