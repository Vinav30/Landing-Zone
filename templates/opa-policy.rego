package terraform.analysis

default allow = false

allowed_sizes := {"Standard_D2_v2", "Standard_B2s"}

allow {
    count(violation) == 0
}

violation[msg] {
    resource := input.resource_changes[_]
    resource.type == "azurerm_virtual_machine"
    vm_size := resource.change.after.vm_size
    not allowed_sizes[vm_size]
    msg := sprintf("VM %v has an invalid size: %v", [resource.name, vm_size])
}