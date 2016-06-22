## Wordpress + ELK Monitoring
### Getting started
#### Configuring boto
 Create a basic boto file under your home directory ``` ~/.boto``` to look like something like this

 ```
 [default]
aws_access_key_id =
aws_secret_access_key =
````
or you can use environmental variables
```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

#### Running the Project
``` bash
git clone https://github.com/aabed/cake.git
cd cake/scripts
./control.sh all
```

##### Script Options

*  start_elk_machine
* start_blog_machine
* provision_elk
* provision_blog

This will start a two new machines on AWS EC2 one for ELK, and another one for the blogging system(wordpress)
With Disks with the same name attached to them and start sending wordpress logs and Cloudwatch metrics to ELK



### Using ELK to visualize logs
Once the script is done running ansible playbooks
Go ahead and visit the IPs for the blog and finish the wordpress installation

#### Generating sample traffic
to start generating traffic on the newly created blog to get some data to visualize use the following tools
* https://asm.ca.com/en/checkit.php
* https://www.site24x7.com/check-website-availability.html
* http://check-host.net/check-http?host=54.234.171.69
* http://www.internetvista.com/en/web-site-available-check-online-submit.htm
* http://quirktools.com/screenfly/
* http://www.viewlike.us

Once you have generated enough logs go ahead and hit the ELK IP
Complete the index settings

#### Kibana sample dashboard
In Kibana go to dashboard and open saved dashboards to find a dashboard called **Dashboard for Apache Logs**

You will get this **ERROR**

```
Could not locate that index-pattern-field
```
Which means you need to refresh the index on kibana you can do that either through the UI or curl
* **Settings** > **Indices** > **Press the refresh button**
* ``` curl -XPOST 'http://IP:9200/logstash-*/_refresh' 	```

### Docker Compose
To start the same for development using docker compose

#### ELK

```
cd cake/compose
docker-compose -f elk.yml up -d
```
#### Blog

```
cd cake/compose
docker-compose -f blog.yml up -d
```
