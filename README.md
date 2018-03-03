# HAproxy Image Builder

MAPR Demo image builder for HAproxy.

Build workflow:

1. A component in appLariat is configured with the build artifact pointing to this git repo.
2. Component builder starts and retrieves this repository.
2. Component builder updates the FROM image based on the component configuration from appLariat.
3. If a code artifact is specified, component builder retrieves and prepares the specified code artifact.
4. Component builder executes a Docker Build to generate an image based on the included Dockerfile.
5. Component builder pushes the generated image to the in-cluster repository.

#Usage:

When adding a haproxy component to an application in appLariat.  
  - On the Artifacts tab, select "Show Advanced" and change the builder artifact from the default to this repo. 
  - You can then opt to provide a code artifact. This repo is designed to work with or without a code artifact specified in appLariat. If no code artifact is provided it will use the defaults from this repo.
  - At runtime, entrypoint.sh will call create_config.sh, which will dynamically create the haproxy.cfg file based on whether or not ENV Vars are present. The defaults include
    - MCS_SVC
    - RM_SVC
    - DRILL_SVC
    - EDGE_SVC
    - DSR_SVC
  - To Override these defaults you can either branch this repo, or provide a new repo as a code artifact in appLariat component configuration that has the contents of the code directory at the root of the repo.