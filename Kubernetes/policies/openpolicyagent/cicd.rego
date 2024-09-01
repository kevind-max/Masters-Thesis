package cicd.pipeline

deny[{
  "msg": sprintf("Pipeline job %v uses unapproved library %v.", [input.job.name, lib])
}] {
  lib := input.job.libraries[_]
  not lib_approved(lib)
}

lib_approved(lib) {
  approved_libraries := {"libssl", "libc", "libxml"}
  lib in approved_libraries
}

deny[{
  "msg": sprintf("Pipeline job %v did not perform mandatory security checks.", [input.job.name])
}] {
  not input.job.securityChecksPerformed
}

deny[{
  "msg": sprintf("Pipeline job %v failed to log critical event %v.", [input.job.name, event])
}] {
  event := input.job.criticalEvents[_]
  not event_logged(event)
}

event_logged(event) {
  logged_events := input.job.loggedEvents
  event in logged_events
}
