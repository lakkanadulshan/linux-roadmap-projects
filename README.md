# Linux Roadmap Projects 🚀

This repository contains my solutions for the **[roadmap.sh Linux Projects](https://roadmap.sh/projects)** series.

---

## 📌 Projects Directory

### 1. Server Performance Stats

- **Project Page:** [Server Performance Stats](https://roadmap.sh/projects/server-stats)
- **Directory:** `./Project 1-Server Performance Stats/`
- **Script:** `server-stats.sh`
- **Description:** A lightweight Bash script designed to analyze and display essential Linux server performance metrics, including CPU utilization, memory usage, disk space, and top processes.

#### 🛠️ Quick Execution Guide

1. Navigate to the project directory:

   ```bash
   cd "Project 1-Server Performance Stats"
   ```

2. Make the script executable:

   ```bash
   chmod +x server-stats.sh
   ```

3. Run the script:

   ```bash
   ./server-stats.sh
   ```

---

### 2. Log Archive Tool

- **Project Page:** [Log Archive Tool](https://roadmap.sh/projects/log-archive-tool)
- **Directory:** `./Project 2-Log Archive Tool/`
- **Script:** `log-archive.sh`
- **Description:** A CLI tool written in Bash to archive logs from a given directory by compressing them into timestamped `.tar.gz` files and recording execution details in an archive log history.

#### 🛠️ Quick Execution Guide

1. Navigate to the project directory:

   ```bash
   cd "Project 2-Log Archive Tool"
   ```

2. Make the script executable:

   ```bash
   chmod +x log-archive.sh
   ```

3. Run the script with a target log directory:

   ```bash
   sudo ./log-archive.sh /var/log
   ```

---

### 3. Nginx Log Analyser

- **Project Page:** [Nginx Log Analyser](https://roadmap.sh/projects/nginx-log-analyser)
- **Directory:** `./Project 3-Nginx Log Analyser/`
- **Script:** `nginx-log-analyser.sh`
- **Description:** A Bash script designed to analyze Nginx access logs and provide useful insights such as request statistics, frequently accessed URLs, and client information.

#### 🛠️ Quick Execution Guide

1. Navigate to the project directory:

   ```bash
   cd "Project 3-Nginx Log Analyser"
   ```

2. Make the script executable:

   ```bash
   chmod +x nginx-log-analyser.sh
   ```

3. Run the script against an access log file:

   ```bash
   ./nginx-log-analyser.sh nginx-access.log
   ```

---

### 4. SSH Remote Server Setup

- **Project Page:** [SSH Remote Server Setup](https://roadmap.sh/projects/ssh-remote-server-setup)
- **Directory:** `./Project 4-SSH Remote Server Setup/`
- **Description:** Configuration and setup guide for securing a Linux server with multiple SSH key pairs and SSH client aliases.

#### 🛠️ Quick Execution Guide

1. Navigate to the project directory:

   ```bash
   cd "Project 4-SSH Remote Server Setup"
   ```

2. Follow the SSH setup instructions in the project's `README.md`.

3. Generate two SSH key pairs using the `ed25519` algorithm:

   ```bash
   ssh-keygen -t ed25519 -C "admin_key1" -f ~/.ssh/id_server_key1 -N ""
   ssh-keygen -t ed25519 -C "admin_key2" -f ~/.ssh/id_server_key2 -N ""
   ```

4. Test the SSH connections using both keys:

   ```bash
   ssh -i ~/.ssh/id_server_key1 user@host
   ssh -i ~/.ssh/id_server_key2 user@host
   ```

5. Connect using the configured SSH aliases:

   ```bash
   ssh server-key1
   ssh server-key2
   ```