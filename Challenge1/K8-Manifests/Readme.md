1. The Directory files help to create K8s deployements in Azure aks using kubernetes yaml manifest files
2. **Snappass-redis-deployment.yaml** file contains redis as backened deployment and clusterip service
   **Command:** kubectl apply -f Snappass-redis-deployment.yaml
3. **Snappass-deployment.yaml** files contains main application logic deployment and clusterip service 
   **Commad:** kubectl apply -f Snappass-deployment.yaml
4. **snappass-nginx-deployment.yaml** files contains front nginx deployemnt and loadbalancer service to access the application
   **Command:** kubectl apply -f snappass-nginx-deployment.yaml
5. Kubectl Commands to access deployements ,services and application

**kubectl get deploy**

**kubectl get svc**

Please take the loadbalancer ip of service snappass-nginx and hit on browser **example https://20.102.34.32/** the ssl is not enabled so you may receive warning like not secure click on advance you will be able see application to share secrets.


**Note:** Try to deploy redis deployment first post snappass-app otherwise you will observe some pod restarts on application pod because the application pod try to connect to redis  backend if not avialble it will restart.
