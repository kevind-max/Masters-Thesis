# Only authorized users or service accounts can trigger deployments or access sensitive data within the pipeline.

package kubernetes.admission

deny[{
  "msg": sprintf("User %v is not authorized to trigger deployment %v.", [input.request.user, input.request.object.metadata.name])
}] {
  input.request.kind.kind == "Deployment"
  user := input.request.user.username
  not user_authorized(user)
}

user_authorized(user) {
  allowed_users := {"ci-cd-admin", "devops-lead", "security-officer"}
  user in allowed_users
}
