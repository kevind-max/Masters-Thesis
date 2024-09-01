# Using OPA to enforce that all deployment manifests must have certain security configurations like resource limits, non-root user enforcement, and specific labels for tracking.

package kubernetes.admission

deny[{
  "msg": sprintf("Deployment %v must set memory and CPU limits.", [input.request.object.metadata.name])
}] {
  not input.request.object.spec.template.spec.containers[_].resources.limits.memory
  not input.request.object.spec.template.spec.containers[_].resources.limits.cpu
}

deny[{
  "msg": sprintf("Deployment %v must run as non-root user.", [input.request.object.metadata.name])
}] {
  input.request.object.spec.template.spec.containers[_].securityContext.runAsNonRoot != true
}

deny[{
  "msg": sprintf("Deployment %v must have the label 'environment' with a value of 'production' or 'staging'.", [input.request.object.metadata.name])
}] {
  input.request.object.metadata.labels["environment"] != "production"
  input.request.object.metadata.labels["environment"] != "staging"
}
