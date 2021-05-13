# Terraform High Availability Task

## Task
In this task, we have to create a highly available node application using IaC tools such as Terraform.

## Acceptance Criteria
- App fully working with Database


## Solution
In order to create a highly available application, an **Auto-Scaling-Group** will be used, with an **Application Load Balancer**.

Before implementing in Terraform, the ASG was implemented through the console, so that all the required components are noted.
Therefore, after completing the task with the AWS console, the following components were created:
- Launch template
- Application Launch Balancer
- Load Balancer Target Group
- Load Balancer Listener
- Auto Scaling Group
