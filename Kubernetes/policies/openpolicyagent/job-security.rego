# Every CI/CD pipeline job adheres to a strict set of security validation rules before execution

package cicd.pipeline

deny[{
  "msg": sprintf("Pipeline job %v must pass security scan before deployment.", [input.job.name])
}] {
  input.job.stage == "deployment"
  not input.job.securityScan.passed
}

deny[{
  "msg": sprintf("Pipeline job %v must include a vulnerability scan result.", [input.job.name])
}] {
  not input.job.vulnerabilityScan.exists
}