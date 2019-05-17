# creation of vm

resource "azurerm_virtual_machine" "learn_vm" {
    name                  = "learn_VM"
    location              = "${var.azure_location}"
    resource_group_name   = "${var.azure_resourcegroup}"
    network_interface_ids = ["${azurerm_network_interface.learn_nic.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "myvm"
        admin_username = "azureuser"
        admin_password = "Msreddy@12345"
    }

    os_profile_linux_config {
        disable_password_authentication = false
        
    }

    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.learn_mystorageaccount.primary_blob_endpoint}"
    }
    connection{
        type = "ssh"
        user = "azureuser"
        password = "Msreddy@12345"
    }
    provisioner "remote-exec"{
        inline = ["sudo apt-get update -y","sudo apt-get install apache2 -y"]
    }
}