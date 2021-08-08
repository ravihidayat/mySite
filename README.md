#MySite

A simple, static portfolio website that tells a bit of who I am, built with HTML/CSS.

#Purpose

While this was made during the second semester of my study in Universiti Teknologi Malaysia, this static site
is currently being used for AWS learning purposes. This static site has been deployed in multiple services:

##EC2 and S3

Hosted in an RHEL 8 instance, with HTTPD as the web server.
The website directory itself is retrieved through an S3 bucket, by setting the IAM role for this instance to have full access to S3.

```
13.250.238.35
```
this instance also being utilized as my personal lab.

##EBS

The above instance then got backed up with the help of an EBS snapshot. It can also be made as a custom AMI, which resulted to a perfectly cloned website such as this:

```
18.141.184.157
```

##ASG and ELB

Then an ASG was created that spreads across three availability zones and three subnets, since the desired number of instances was three, with a launch template defined prior. Then, a load balancer gets created in front to improve reliability and redundancy. The whole setup itself can be accessed here through the public DNS:

```
RHEL8-VM2-ASG-1-955933795.ap-southeast-1.elb.amazonaws.com
```

##EB

Elastic beanstalk is my first step of learning how to deploy containerized applications with Docker. The Dockerfile itself defined ubuntu as the base image, and Nginx as the web server. The image itself is hosted on [Docker Hub](https://hub.docker.com/r/ravihidayat/mysite). To retrieve it, Dockerrun.aws.json config file is created with the repo and image name defined, then stored in an S3 bucket. Finally, the URL can be provided during the EB creation, and here is the final product:

```
https://imgur.com/a/dLRqu45
```

