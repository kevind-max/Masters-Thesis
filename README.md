# Project Name: Petclinic with Kubernetes Policies

## Overview

This project is designed to demonstrate a secure, scalable CI/CD pipeline for a Java-based Petclinic application, deployed in a Kubernetes environment. The codebase for the Petclinic application is housed in the `./Petclinic` directory, while the Kubernetes-specific policies, including network policies and Open Policy Agent (OPA) configurations, are located in the `./Kubernetes/policies` directory.

## Directory Structure

- **./Petclinic**: Contains the source code and compiled classes for the Petclinic application. Jenkinsfile is the file where the CI/CD pipeline is configured.
  - **src**: Contains the main application source code and resources.
    - **main**: Holds the main Java classes and application configuration.
    - **test**: Contains unit and integration tests.
  - **target**: The build output directory where compiled classes, resources, and packaged JAR/WAR files are placed.

- **./Kubernetes/policies**: Contains Kubernetes policies for securing the deployment.
  - **openpolicyagent**: This subdirectory includes OPA policies that enforce security and compliance within the Kubernetes cluster.
  - **network-policies**: This subdirectory contains network policies that restrict traffic between different components of the application, enhancing security.

## Pre-commit Hooks

This project uses `pre-commit` hooks to enforce code quality and security checks before committing changes. The hooks included are:

- **Trailing Whitespace**: Removes any trailing whitespace.
- **End of File Fixer**: Ensures every file ends with a newline.
- **Check YAML/JSON**: Validates the syntax of YAML and JSON files.
- **Detect Private Key**: Prevents accidental commits of files containing private keys.
- **No Commit to Branch**: Prevents commits directly to the `main` or `master` branch.
- **Maven Checkstyle**: Runs Maven's Checkstyle plugin to enforce Java coding standards.
- **ESLint**: Automatically lints and fixes JavaScript/TypeScript files.
- **Conftest**: Validates Kubernetes YAML files against the OPA policies.
- **Docker Compose Lint**: Lints Docker Compose files.
- **Black**: Formats Python files according to the `black` code style.
