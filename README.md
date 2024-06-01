# Analyze CloudTrail logs on Splunk

## CloudTrail data
- Make sure to put the `CloudTrail logs` downloaded directly from `AWS` in the logs folder. If there are multiple folders, move them inside as well.
- In the `Makefile` there is a line to parse the CloudTrail json files

## Setup the docker container
`Note: change the splunk password from the .env file.`

Execute the following command to normalize logs, download and run splunk
```
make up
```

## Import cloudtrail data
Once the splunk instance is ready:
- Open [http:localhost:8000](http:localhost:8000) using admin/changeme as credentials.
- Click on `Add data` / `Monitor` / `Files & Directories` / `Browse`
- As the logs are already inside the instance, go the `/logs` folder, choose the file called `cloudtrail.json` and click on `Select`.
- Click `Next` / `Next` / `Review` / `Submit` / `Start searching`

Now you should be able to query the data from the `source="/logs/cloudtrail.json"`

## Notes
- It does not work on Apple Mx architectures yet
