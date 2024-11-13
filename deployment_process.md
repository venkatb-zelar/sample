# Zero-Downtime Deployment Process

## Rollout Strategy
- **Canary Release**: Gradually roll out the new version to a small subset of users and monitor for issues before complete deployment.

## Health Checks
- **Liveness Probe**: This checks if the application is alive by sending requests to `/health` on port 8080.
  - `initialDelaySeconds: 30`
  - `periodSeconds: 10`
- **Readiness Probe**: This checks if the application is ready to accept traffic, also using `/health` on port 8080.
  - `initialDelaySeconds: 5`
  - `periodSeconds: 10`

## Rollback Procedure
In case of deployment failure, follow these steps:
1. Identify the last stable image tag.
2. Rollback to the previous version using the command:
```bash
kubectl set image deployment/hello-deployment hello-container=anithayeruva/hello-app:<previous-stable-tag> --record
```
3. Monitor the deployment to ensure the rollback was successful.

## Additional Considerations
- Always use semantic versioning for your Docker image tags to simplify rollbacks.