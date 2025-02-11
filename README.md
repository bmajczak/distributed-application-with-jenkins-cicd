# Distributed Application with Jenkins CI/CD

## Project Overview

This project sets up a load-balanced infrastructure consisting of two application servers, a database server, and Jenkins, all managed through Vagrant. The system is designed to create a simple, scalable environment where the load balancer distributes traffic across the application servers, and Jenkins automates the deployment process. The application itself is hosted in a separate repository, and the Jenkins pipeline is also stored there.

## Technologies Used

- **Vagrant**: To provision and manage virtual machines.
- **Bash Scripts**: For automation and server setup.
- **Load Balancer**: Distributes incoming traffic between two application servers.
- **Application Servers**: Two instances hosting the application.
- **Database Server**: A single server to handle database operations.
- **Jenkins**: For continuous integration and deployment.

## Requirements

- Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) on your machine.
- Install the **hostmanager** plugin for Vagrant to simplify hostname resolution.
  - You can install the plugin with:
    ```bash
    vagrant plugin install vagrant-hostmanager
    ```
- Ensure your system has sufficient resources (CPU, RAM, and disk space) to run multiple virtual machines.
- The application repository must be cloned to the same directory as this repository for the Jenkins pipeline to work correctly.

## Project Structure

- `Vagrantfile`: Configuration file for setting up virtual machines.
- `resources/`: Contains Bash scripts used for setting up the environment and other resources needed for provisioning. Resources are grouped by server name.
  - `<name>_setup.sh`: Initializes and configures servers.
- **Application Repository**: The application code is hosted in a separate repository. The Jenkins pipeline for deploying the application is also stored there.
