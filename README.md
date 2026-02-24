# 📘 Jenkins Complete Guide – CI/CD, Architecture, Pipeline & Projects
                                                                  
This guide covers Jenkins fundamentals, architecture, pipeline concepts, master–agent setup, and hands-on DevOps projects including Node.js application deployment.
---                                                                                                
## 🚀 What is Jenkins?                  
Jenkins is an open-source automation server written in Java.  
It is widely used to automate the entire SDLC — **Build, Test, and Deploy**.
                                                                                  
### ✔ Key Features    
- Automates CI/CD workflows  
- Integrates with any SCM (GitHub, GitLab, Bitbucket)  
- Supports **1,800+ plugins**   
- Free, open-source, self-hosted   
- Highly customizable and scalable    

---

## ❓ Why Jenkins?

| Feature       | Jenkins                          |
|---------------|----------------------------------|
| **Cost**      | Free & Open Source               |
| **Plugins**   | 1800+ integrations               |
| **Usability** | User-friendly                    |
| **Customization** | Highly flexible              |
| **Self-Hosted**   | Best for Private VPCs, secure environments |

---

## 🔄 CI vs CD (Delivery vs Deployment)

1️⃣ **Continuous Integration (CI)**  
Developers frequently merge code → Jenkins automatically builds & tests the application.  

2️⃣ **Continuous Delivery (CD)**  
System automatically builds, tests, and prepares a release → manual approval required for production.  

3️⃣ **Continuous Deployment**  
Every successful change is automatically deployed to production → no manual approval.  

---

## 🏗 Jenkins Architecture – Master / Agent (Slave)

Jenkins follows a **Master–Agent architecture**, allowing distributed workloads.

### 🖥️ Master (Controller)
Responsible for:
- Managing Jenkins configuration  
- Scheduling jobs  
- Checking node health  
- Providing Web UI  
- Distributing builds to agents  

> Master requires more CPU, RAM, and storage.

### 🖥️ Agent (Slave)
Agents perform:
- Build  
- Test  
- Deployment  

Each agent can run on Windows/Linux and supports parallel job execution.

### 🔁 How the Architecture Works
1. Developer pushes code → GitHub  
2. Jenkins Master receives trigger  
3. Master assigns job to Agent  
4. Agent executes tasks  
5. Results sent back to Master  

---

## 📘 Jenkins Terminologies

| Term        | Meaning                                      |
|-------------|----------------------------------------------|
| **Job**     | Operation performed in Jenkins               |
| **Project** | Job configuration (Freestyle / Pipeline)     |
| **Plugins** | Third-party integrations                     |
| **Workspace** | Directory where Jenkins stores job data    |
| **Build**   | Execution instance of a job                  |
| **Build Result** | Pass / Fail                             |

---

## 🛠 Create First Jenkins Job
1. Login to Jenkins  
2. Click **New Item → Freestyle project**  
3. Configure SCM, build steps, and post-build actions  

---

## 🏗 Master–Slave Setup (Project 1)

### Master Requirements
- Install Java  
- Install Jenkins  
- Install SSH Build Agents Plugin  

### Agent Requirements
- Launch EC2 instance  
- Install same Java version as master  
- Provide:  
  - Private IP  
  - Private Key  
  - Username (ubuntu/ec2-user)  

### Steps
1. Install Java on Agent  
2. Install SSH Agent Plugin on Master  
3. Add Agent in Jenkins  
4. SSH using private IP for security (within same VPC)  

---

## 📬 Project 2: Email Notification for Failed Builds

**Why Email Alerts?**  
Whenever a build fails, Jenkins should notify developers automatically.

### SMTP Configuration (Gmail)
- SMTP Server: `smtp.gmail.com`  
- Port: `465`  
- SSL: Enabled  
- Username: `<your-email>`  
- App Password: `<generated-app-password>`  

Add test email → configure → save.

---

## 🟦 Jenkins Freestyle Project for Node.js App

### Requirements
- Install: Node.js, npm, pm2 on Jenkins server  
- Install: node, npm, pm2 on deployment server  

### Jenkins Job Workflow
**Job 1: Pull Code**
```bash
Git → Repository URL
Post Build → Trigger "Install Dependency" job
```
Job 2: Install Dependencies

bash
```
cd /var/lib/jenkins/workspace/<job-name>
npm install
Job 3: Deploy Application
```
bash
```
cd /var/lib/jenkins/workspace/<job-name>
pm2 start app.js --name node-app || pm2 restart node-app
```
🧩 Troubleshooting
Jenkins workspace folder = workspace/<job-name> NOT repo name

Ensure node, npm, pm2 installed for Jenkins user

PM2 files stored inside Jenkins home: /var/lib/jenkins/.pm2

📜 Jenkins Pipeline (Declarative vs Scripted)
Pipeline = Infrastructure as Code for CI/CD.

1️⃣ Declarative Pipeline
Latest

Easy syntax

Starts with pipeline { }

Built using DSL

Example:

groovy
```
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "Building"
            }
        }
    }
}
```
2️⃣ Scripted Pipeline
Core Groovy

More complex

Starts with node { }

Example:

groovy
```
def names = ["dev", "stage", "prod"]
names.each { env ->
    println("Deploying to ${env}")
}
```
🧰 Snippet Generator
Jenkins provides autogenerated pipeline syntax for:

Git checkout

Docker build/push

Kubernetes deploy

Maven

Email

Archive artifacts

Access via: Pipeline Job → Pipeline Syntax

🚀 Project 3: Node.js App CI/CD Using Declarative Pipeline
Prerequisites
GitHub Repository

Jenkins Server

Node Application Deployment Server

Install required plugins:

Pipeline

SSH Agent

GitHub

✔ Example Declarative Pipeline (Full CI/CD)
groovy
```
pipeline {
    agent any

    stages {

        stage('Pull Code') {
            steps {
                git branch: 'main', url: 'https://github.com/user/node-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                    cd $WORKSPACE
                    npm install
                '''
            }
        }

        stage('Deploy to Server') {
            steps {
                sshagent (credentials: ['node-server']) {
                    sh '''
                        ssh ubuntu@<NODE_SERVER_IP> '
                            cd /home/ubuntu/node-app &&
                            pm2 start app.js --name node-app || pm2 restart node-app
                        '
                    '''
                }
            }
        }
    }
}
pipeline {
    agent any

    stages {

        stage('Pull Code') {
            steps {
                git branch: 'main', url: 'https://github.com/user/node-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                    cd $WORKSPACE
                    npm install
                '''
            }
        }

        stage('Deploy to Server') {
            steps {
                sshagent (credentials: ['node-server']) {
                    sh '''
                        ssh ubuntu@<NODE_SERVER_IP> '
                            cd /home/ubuntu/node-app &&
                            pm2 start app.js --name node-app || pm2 restart node-app
                        '
                    '''
                }
            }
        }
    }
}
