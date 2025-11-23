📧 Project 2: Setup Email Notification on Build Failure
🔎 Why?
Modern development workflows rely on continuous integration and deployment (CI/CD).

Developers write code → push to GitHub → Jenkins triggers build → runs tests → deploys.

If a build fails, developers must be notified immediately to fix issues before they impact production.

Jenkins can automatically send email notifications to developers when a build fails.

To enable this, Jenkins needs a valid email account configured with SMTP (Secure Mail Transfer Protocol).

This ensures fast feedback loops and keeps the team aligned.

✅ Prerequisites
Before configuring Jenkins email notifications, the following are required:

Jenkins installed and running Jenkins must be set up and connected to your GitHub repository.

SMTP details

SMTP Server: smtp.gmail.com

Port: 465 (SSL enabled)

Protocol: Secure Mail Transfer Protocol (SMTP)

App Password for Jenkins

Gmail requires an App Password instead of your regular password for security.

This password allows Jenkins to authenticate and send emails without exposing your main account.

Example: yekfmzpnzdruqwvh

Developer email addresses

Jenkins will send notifications to developers’ emails (e.g., prashant@gmail.com).

⚙️ Configuration Steps
1. Configure Jenkins Mail Server
Go to Manage Jenkins → Configure System.

Scroll to E-mail Notification section.

Enter the following details:

SMTP Server: smtp.gmail.com

Port: 465

Check Use SMTP Authentication

Username: prashantm8221@gmail.com

Password: yekfmzpnzdruqwvh (App Password)

Check Use SSL

Click Test configuration by sending test e-mail.

Send to: prashant@gmail.com

Verify that the test email is received.

2. Configure Jenkins Job
Create or open a Jenkins job.

Go to Post-build Actions.

Select E-mail Notification.

Add developer email addresses.

Choose Send e-mail for every unstable build or Send e-mail for every failed build.

📌 Why Each Step Matters
SMTP Setup: Without SMTP, Jenkins cannot send emails.

App Password: Gmail blocks direct password usage for security; App Passwords are mandatory.

SSL & Port 465: Ensures secure communication between Jenkins and Gmail servers.

Test Email: Confirms that configuration is correct before applying to jobs.

Post-build Action: Ensures notifications are tied to build outcomes (failure/unstable).

🎯 Outcome
Once configured:

Every time a build fails, Jenkins will automatically send an email notification to the developer(s).

This reduces downtime, improves collaboration, and ensures faster bug resolution.
