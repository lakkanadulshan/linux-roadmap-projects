# Project 4: SSH Remote Server Setup

This project demonstrates the setup of a remote Linux server environment and configuring secure SSH access using multiple SSH key pairs and client aliases.

---

## 📌 Project Overview & Requirements

- Set up a remote Linux environment (GitHub Codespaces / Ubuntu).
- Generate **two separate SSH key pairs** using the modern `ed25519` algorithm.
- Configure `authorized_keys` to authenticate using both keys.
- Establish SSH connections using private keys explicitly:

  ```bash
  ssh -i ~/.ssh/id_server_key1 user@host
  ssh -i ~/.ssh/id_server_key2 user@host
  ```

- Configure `~/.ssh/config` client aliases for seamless connection without long commands:

  ```bash
  ssh server-key1
  ssh server-key2
  ```

---

## 🛠️ Step-by-Step Implementation

### 1. Generating SSH Key Pairs

Generated two separate SSH key pairs with no passphrase:

```bash
# Key Pair 1
ssh-keygen -t ed25519 -C "admin_key1" -f ~/.ssh/id_server_key1 -N ""

# Key Pair 2
ssh-keygen -t ed25519 -C "admin_key2" -f ~/.ssh/id_server_key2 -N ""
```

---

### 2. Adding Public Keys to Server

Appended both public keys to the server's `authorized_keys` file and set the correct permissions:

```bash
cat ~/.ssh/id_server_key1.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/id_server_key2.pub >> ~/.ssh/authorized_keys

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

---

### 3. Testing Authentication with Private Keys

Tested login with both private keys independently:

```bash
# Connecting with Key 1
ssh -p 2222 -i ~/.ssh/id_server_key1 $USER@localhost

# Connecting with Key 2
ssh -p 2222 -i ~/.ssh/id_server_key2 $USER@localhost
```

---

### 4. Configuring SSH Client Aliases (`~/.ssh/config`)

Configured client-side aliases in `~/.ssh/config`:

```text
Host server-key1
    HostName localhost
    Port 2222
    User lakkanadulshan
    IdentityFile ~/.ssh/id_server_key1

Host server-key2
    HostName localhost
    Port 2222
    User lakkanadulshan
    IdentityFile ~/.ssh/id_server_key2
```

Applied strict permissions to the config file:

```bash
chmod 600 ~/.ssh/config
```

---

### 5. Connecting via Aliases

Verified simplified connections using the aliases:

```bash
ssh server-key1
ssh server-key2
```

---

## ✅ Project Outcome

Successfully configured SSH authentication using two separate SSH key pairs and verified connections using both explicit private key commands and SSH client aliases.