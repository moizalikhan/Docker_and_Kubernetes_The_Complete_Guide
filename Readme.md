# Linux

- **chmod**: change mode for file permissions.
  - `+x`: add execute permission.
  - `$#`: arguments.
  - `0` and `1` status.
- **Cron job**: a scheduled task. Cron daemon (background process) reads a configuration file called a "crontab" (cron table) that defines the scheduled jobs.

  - `crontab -e` opens the crontab file.

  ```
  - - - - -
  | | | | |
  | | | | +---- Day of the week (0 - 7) (Sunday is both 0 and 7)
  | | | +------ Month (1 - 12)
  | +-------- Day of the month (1 - 31)
  +---------- Hour (0 - 23)
  +------------ Minute (0 - 59)
  ```

- **Common commands**:

  - `ls -a`, `cat`, `alias`, `pwd`, `ls -la`, `ls -R`
  - `cat > filename`, `cat filename1 filename > filename`
  - `ctrl + q`, `man`, `command1 | command2`: first command output acts as input for second.
  - `\`: chaining commands.
  - `mkdir -P`: create directories, `touch`, `cp`, `mv`, `rm`.
  - `sudo`: superuser.
  - `df -hg`, `du`, `diff`.
  - `locate "*.txt"`, `find . -type f -name "*.txt"`.
  - `find -nmin`, `whoami`, `-exec -it`.
  - `grep -i "text" filename`, `grep -win "text" ./*.txt`, `-winl`, `-winc`.

- **Multiple commands**: Use `;`.
- **Process management**:

  - `jobs`: processes started by the shell.
  - `apt-get`: package manager, `wget`, `hostname`, `useradd`.

- **Permissions**:

  - `rwx`: user, group, others.
  - `chmod u=rwx,g=rx,o=r filename`, `chmod 777`, `r=4,w=2,x=1`.
  - `chown root filename`.

- **Displaying environment variables**: `echo`.
- **Processes**: Any instance of a running command is a process.

  - Managing users and groups: `useradd`, `groupadd`, `usermod`.

- **System commands**: `ps`, `systemctl`, `apt`, `ifconfig`, `ping`, `curl`, `telnet`.

- **Subnet Mask**: A 32-bit number, subnetting is the practice of dividing a larger network into smaller subnets.
  - Default subnet mask: `255.0.0.0`.

---

# Docker

- **Containerization**: Create and manage containers (standardized units of software, package of code, and dependencies).

  - Containers are isolated, lightweight, and efficient compared to virtual machines.
  - Docker daemon process, Dockerfile --> Image (templates, code + tools, layer-based) --> Container (instances, extra layer on top of image).

- **Commands**:

  - `docker build`, `docker run -p 3000:3000 id`, `ps -a`, `-it`: interactive mode.
  - `docker start`, `-d`: detached mode, `logs`, `-f`: follow logs.
  - `-ai`: attach interactive mode, `docker stop`, `docker start`, `docker rm`.
  - `docker images`, `docker image prune`: remove unused images.

- **Docker registries**:

  - `docker push`, `docker pull`: latest images, `docker tag oldtag:newtag`.
  - `docker login`, `docker logout`, `docker images prune -a`.

- **Volumes**:

  - Volumes for storing data: `VOLUME["path"]`, anonymous or named volumes persist data.
  - Bind mounts allow setting the path.

- **Networking**:
  - Containers communicate through default networks, custom networks can be created with `docker network create`.
  - Use `docker run --network` to specify a network.

---

# Docker Compose

- **Managing multiple containers**:

  - Use a single YAML file to define services.
  - `docker-compose up -d`: start services in detached mode.
  - `docker-compose down`: stop and remove services.

- **Services configuration**:
  ```yaml
  version: "3.8"
  services:
    backend:
      build:
        context: ./
        dockerfile: Dockerfile
      ports:
        - "3000:80"
    mongodb:
      image: mongo
      volumes:
        - /data/db:/data/db
      environment:
        MONGO_INITDB_ROOT_USERNAME: root
        MONGO_INITDB_ROOT_PASSWORD: example
  ```

---

# Troubleshooting in DevOps

### 1. **Identify the Problem**

- Gather logs, metrics, error messages.
- Reproduce the issue to understand the scope.

### 2. **Analyze the Environment**

- Check the infrastructure: servers, networks.
- Examine dependencies: external services, APIs, databases.

### 3. **Review Code and Configuration**

- Inspect recent code changes.
- Verify configuration files are consistent.

### 4. **Monitor and Log**

- Use monitoring tools like Prometheus, Grafana for performance metrics.
- Analyze logs with ELK Stack (Elasticsearch, Logstash, Kibana).

### 5. **Collaborate and Communicate**

- Cross-functional collaboration: developers, operations, QA.
- Document findings.

### 6. **Implement Fixes**

- Apply necessary code or configuration changes.
- Rollback if necessary.

### 7. **Test the Solution**

- Run tests to ensure the fix resolves the issue.

### 8. **Deploy and Monitor**

- Deploy the changes using CI/CD pipelines.
- Monitor post-deployment to catch regressions.

### 9. **Learn and Adapt**

- Conduct post-mortems to review and document the process.
