
## Deploy Application Using Docker Compose

```docker
docker-compose up -d 
```
## SpringBoot application snapshot
![spring](https://user-images.githubusercontent.com/86631180/196041621-ad0b30bb-a2ba-4039-ab16-52b443b1a1e9.png)

## MongoDB data stored at /data/db inside mongo container
![Screenshot from 2022-10-17 21-56-12](https://user-images.githubusercontent.com/86631180/196239233-7feea525-1069-4c30-93f1-2a99594e1191.png)

## List Docker Containers
```docker
docker ps -a
```

## To launch SpringBoot application in Kubenetes
Files Required: Dockerfile, Jenkinsfile and springbootapp.yml (deployment and service yaml file of application and mongo database )

#### Step 1

Use **AWS** EC2 instances for **Jenkins-server** and **Kops-server**

#### Step 2
Create kops cluster using 

```kops
kops create cluster --name=clustername --state=s3://S3bucketname --zones=east-us-1a,east-us-1b --node-count=2 --node-size=t2.micro --master-size=t2.medium --dns-zone= DNS name
```
#### Step 3

Update cluster

```kops
kops update cluster --name=clustername --state=s3://S3bucketname --yes --admin
```
#### Step 4

Wait for 5-6 min and validate cluster

```kops
kops validate cluster --name=clustername --state=s3://S3bucketname --yes --admin
```
#### Step 5

Login to Jenkins GUI using **localhost:8080** in web browser

Allow kops instance to inbound jenkins instance using security group

Create node and add Kops as a slave in Jenkins.

Create Jenkin job and run Jenkinsfile. 
