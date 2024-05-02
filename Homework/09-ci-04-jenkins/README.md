09-ci-04-jenkins

## Подготовка к выполнению
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/cicd-jenkins1.JPG"> </div> <br>

## Основная часть
1) Сделать Freestyle Job, который будет запускать molecule test из любого вашего репозитория с ролью.
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/cicd-jenkins2.JPG"> </div> <br>
2) Сделать Declarative Pipeline Job, который будет запускать molecule test из любого вашего репозитория с ролью.
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/cicd-jenkins3.JPG"> </div> <br>

```
Started by user RoadMania
[Pipeline] Start of Pipeline
[Pipeline] node
Running on agent in /opt/jenkins_agent/workspace/Declarative Pipeline Job
[Pipeline] {
[Pipeline] stage
[Pipeline] { (git pull)
[Pipeline] git
The recommended git tool is: NONE
using credential 5867db71-4a8e-466c-af3c-e8a4f60690a2
Fetching changes from the remote Git repository
 > git rev-parse --resolve-git-dir /opt/jenkins_agent/workspace/Declarative Pipeline Job/.git # timeout=10
 > git config remote.origin.url git@github.com:RoadMania/netology_git.git # timeout=10
Fetching upstream changes from git@github.com:RoadMania/netology_git.git
 > git --version # timeout=10
 > git --version # 'git version 1.8.3.1'
using GIT_SSH to set credentials 
[INFO] Currently running in a labeled security context
[INFO] Currently SELinux is 'enforcing' on the host
 > /usr/bin/chcon --type=ssh_home_t /opt/jenkins_agent/workspace/Declarative Pipeline Job@tmp/jenkins-gitclient-ssh8513575949158157493.key
Verifying host key using known hosts file
 > git fetch --tags --progress git@github.com:RoadMania/netology_git.git +refs/heads/*:refs/remotes/origin/* # timeout=10
Checking out Revision a5ceb053a234d10f761afb245d4e2c272c52b23c (refs/remotes/origin/master)
Commit message: "Update vector-role 1.2.0"
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f a5ceb053a234d10f761afb245d4e2c272c52b23c # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D master # timeout=10
 > git checkout -b master a5ceb053a234d10f761afb245d4e2c272c52b23c # timeout=10
 > git rev-list --no-walk a5ceb053a234d10f761afb245d4e2c272c52b23c # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (molecule test)
[Pipeline] sh
+ molecule --version
molecule 3.5.2 using python 3.6 
    ansible:2.10.17
    delegated:3.5.2 from molecule
    docker:1.1.0 from molecule_docker requiring collections: community.docker>=1.9.1
    python version = 3.6.8 (default, Nov 14 2023, 16:29:52) [GCC 4.8.5 20150623 (Red Hat 4.8.5-44)]
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```

3) Перенести Declarative Pipeline в репозиторий в файл Jenkinsfile. <br>
https://github.com/RoadMania/netology_git/blob/main/Homework/09-ci-04-jenkins/Jenkinsfile <br>
