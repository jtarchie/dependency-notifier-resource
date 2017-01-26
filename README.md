# Introduction

This a concourse resource based of the [dependency notifier](https://github.com/cloudfoundry/buildpacks-ci/blob/d414067c3d8f9db41c9b12d120bf7ebb938f2f98/lib/new-releases-detector.rb#L212) from the
[buildpacks-ci](https://github.com/cloudfoundry/buildpacks-ci). It is a set of
scripts that monitor source control of popular runtimes (go, Ruby, etc) for
newer versions.

This resource is a generic implementation of that.

You provide with a git repo to monitor, what tags to `grep` for, and then it
will download any assets associated with that version.

# Usage

```
resource_types:
- name: dependency-notifier
  type: docker-image
  source:
    repository: jtarchie/dependency-notifier-resource

resources:
- name: golang
  type: dependency-notifier
  source:
    git:
      access_token: {{github-access-token}}
      tag_grep: ^go
      repo: golang/go
    urls:
    - https://storage.googleapis.com/golang/:version:.linux-amd64.tar.gz 

jobs:
- name: get-golang
  plan:
  - get: golang
    trigger: true
```
