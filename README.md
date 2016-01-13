# ScaleDockerDeploy
Use the repo as the bases for a Scale docker image.  When deploying Scale you will need to:

1. Deploy Unison or OpenUnison
2. Clone the source of this repo
3. Edit the environment variables to match your environment
4. Generate keystores for TLS authentication with Unison
5. Generate LastMile keys for SSO into Scale
6. Deploy your image

Each of the Scale applications is defined in this Dockerfile.  Its designed with the following assumptions:

1. Scale will be deployed in Tomcat
2. Scale war files will be downloaded from a repository, such as Nexus

This Dockerfile should be customized to match your deployment.  Each application can be broken down into:

| Component | Description | Notes |
| --------- | ----------- | ----- |
| WAR URL   | A URL (such as one from a Nexus Repository) that contains that points to the WAR | The WAR should be an overlay of the *-tomcat version of the Scale applications |
| Path      | Environment variable that describes the path in the webapps directory the application should be deployed as | If this value is scale then the folder storing the webapplication in webapps/scale. |
| context.xml | The context.xml file is copied into the META-INF directory | This file tels Scale where to find various configuration files per Scale's documentation |
| log4j.xml | Configure logging | |
| scaleConfig.xml | The configuration for the specific Scale application | See Scale's configuration documentation  |

See Scale's documentation for specifics on how to configure these options : https://www.tremolosecurity.com/docs/tremolosecurity-docs/1.0.6/scale/scale-manual-1.0.6.html
