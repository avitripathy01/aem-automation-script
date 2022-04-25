# aem-automation-script
Automation script for running background jobs/workflows in AEM
To execute the script run the following command below:

#./wf-run-from-csv.sh {csv-file} {instance-url}/etc/workflow/instances {workflow-model-path} {batch-size} {batch-wait-interval}
for e.g.s
# ./wf-run-from-csv.sh example.csv http://localhost:4502/etc/workflow/instances /var/workflow/models/dam/adddamsize 1 5

The csv file could be a metadata export of the asset whose first column is the path of the asset.


