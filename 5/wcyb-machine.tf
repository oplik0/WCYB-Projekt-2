provider "oci" {}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "ENABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Oracle Java Management Service"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	# change this if your account is in different region, or you want to try a different availability zone
	availability_domain = "VeBB:EU-FRANKFURT-1-AD-3"
	compartment_id = "<insert your compartment ocid>"
	create_vnic_details {
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		hostname_label = "projekt"
		subnet_id = "<insert subnet ocid>"
	}
	display_name = "wcyb"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	is_pv_encryption_in_transit_enabled = "true"
	metadata = {
		"ssh_authorized_keys" = "<insert your SSH public key>"
	}
	shape = "VM.Standard.A1.Flex"
	shape_config {
		memory_in_gbs = "6"
		ocpus = "1"
	}
	source_details {
		source_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaai3jwbzgf3nysjozgafwxfycsij7q6i54s3h75jgjcwjiqswttlva"
		source_type = "image"
	}
}
