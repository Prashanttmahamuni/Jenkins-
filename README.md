# 🧩 JENKINS

---

## 📘 Introduction

- **Jenkins** is an **open-source** automation server, available **free of cost**.  
- It is developed using **Java** language.  
- Jenkins is known as a **CI/CD Server**, where:
  - **CI** → Continuous Integration  
  - **CD** → Continuous Delivery 

> CI/CD is an approach to automate the **project build** and **deployment** process.

Using Jenkins, we can deploy **any type of project**, such as:
- Java
- Python
- .NET
- React
- Angular

---

## ⚙️ What is Build & Deployment?

### 🔹 Build Process
1. Take the latest code from **GitHub Repository**  
2. Build source code using **Maven**  
3. Perform **Code Review** using **SonarQube**  
4. Upload project artifact into **Nexus Repository**

### 🔹 Deployment Process
5. Deploy the code into the **Server**

> 💡 In a single day, multiple commits are made by developers to the GitHub repository, which means the build and deployment process must run multiple times.

Performing these steps **manually** is:
- **Time-consuming**
- **Error-prone**

Hence, we automate this process using **Jenkins**.

---

## 🏗️ Jenkins Setup

📄 **Setup Guide:**  
[Click here to open Jenkins Server Setup Instructions](https://github.com/Prashanttmahamuni/Jenkins-/blob/main/Installation.sh)

---

## 🧠 What is a Job in Jenkins?

A **Job** in Jenkins represents a **set of steps** that Jenkins performs to complete a task.

### Example Job Steps:
1. Take code from **Git Repository**  
2. Perform **Maven Build**  
3. Build **Docker Image**  
4. Deploy **Docker Image** into **Kubernetes Cluster**

---

## 🚀 Summary

| Feature | Description |
|----------|--------------|
| Type | Open-source CI/CD Server |
| Language | Java |
| Automation Scope | Build & Deployment |
| Supports | Java, Python, .NET, React, Angular, etc. |

---

> 🧰 **Jenkins** helps automate the complete software delivery pipeline — from **code integration** to **deployment**, ensuring speed, reliability, and consistency.
