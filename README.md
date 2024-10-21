# Creating Docker, RDS, S3 Bucket using CloudFormation Template

This file thorugly explains how to create an CloudFormation and stack and create resources using the template.

## Prerequisites

Before starting, ensure that:
- Access to AWS Managment Console
- IAM User with proper permissions to create and access respective resources being created usnig the template.

## Step 1: Prepare the CloudFormation Template

A CloudFormation template that created RDS instance, S3 Bucket, EC2 instance with docker a docker container running on it, Security Groups for RDS and EC2, IAM policy for EC2 to access S3 bucket and RDS instance.

## Step 2: Open the AWS Management Console

- Open your web browser and go to the [AWS Management Console](https://aws.amazon.com/console/).
- Sign in with your AWS account credentials.

## Step 2: Navigate to CloudFormation

- Once signed in, search for **CloudFormation** in the AWS services search bar.
- Click on **CloudFormation** to open the CloudFormation dashboard.

## Step 3: Create a CloudFormation Stack

- In the CloudFormation dashboard, click the **Create stack** button.
- Select **With new resources (standard)**.

## Step 4: Upload the CloudFormation Template

- Under **Specify template**, choose **Upload a template file**.
- Click **Choose file** and upload the CloudFormation template (`fielname.yml`) file you have prepared.
- Click **Next** to proceed.

## Step 5: Configure Stack Details

- **Stack name**: Enter a name for your stack (e.g., `Name for Stack`).
- **Parameters**: Provide a name for the IAM user in the **UserName** field (or leave it as the default `IAM Username (Optional)`).
- Click **Next**.

## Step 6: Configure Stack Options (Optional)

- Add tags to the stack or configure permissions, rollback settings, and notifications as needed.
- Click **Next** after configuring or skipping the options.

## Step 7: Review and Acknowledge

- Thoughly review all the information about the stack, including the template details, parameters, and options you selected.
- Scroll down to the **Capabilities** section and check the box to acknowledge that CloudFormation will create IAM resources. This is required for CloudFormation to manage IAM resources on your behalf.
- Click **Create stack** to begin the deployment.

## Step 8: Monitor Stack Creation

- After clicking **Create stack**, you will be directed to the **Stack details** page.
- In the **Events** tab, monitor the progress of the stack creation.
- Once the stack status shows **CREATE_COMPLETE**, it means the IAM user and other resources have been successfully created.

## Step 9: Verifying the resources creation

- Go to the **EC2** service by searching for "EC2" in the AWS services search bar.
- Click on **Instances** under the EC2 dashboard
- You will find the EC2 instance in running with ID inside the assigned subnet of VPC and Security Group attached with the EC2 instance.
- Similarly you can also verify other resources by heading to the RDS, S3.
- To verify the docker you will need to SSH into the instance and type in the command ```sudo docker ps``` and you will see a container running there.

## Conclusion

You have successfully created an IAM user and associated resources using AWS CloudFormation through the AWS Management Console. If necessary, you can modify the template to create additional resources or customize user permissions.
