# GLPI 10.0.6 Installation in Docker

This guide will walk you through the process of setting up GLPI 10.0.6, an open-source IT asset management and helpdesk software, using Docker containers. Docker allows for easy and isolated deployment of GLPI and its dependencies.

## Prerequisites

Before you start, ensure that you have the following installed on your system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. Clone this repository to your local machine:

    ```
    git clone https://github.com/victorgrytsunyak/GLPI.git
    ```

2. Change your working directory to the project folder:

    ```
    cd glpi
    ```

3. Create a .env file to configure environment variables for GLPI. You can use the provided example.env as a template:

    ```
    cp example.env .env
    ```

4. Edit the .env file with your preferred settings. You can configure parameters such as the database password, GLPI version, and more.

5. Start the Docker containers by running the following command:

    ```
    docker-compose up -d
    ```
	This command will download the required Docker images and launch the GLPI application.

6. Access GLPI by opening your web browser and navigating to:

   http://localhost

   You should see the GLPI setup page.

7. Follow the on-screen instructions to complete the GLPI setup. Ensure you use the database and user credentials configured in your .env file. After completing the setup, you can log in to your GLPI instance using the provided credentials.

8. Stopping and Cleaning Up

	To stop and remove the GLPI Docker containers, run the following command in your project directory:
	
	```
    docker-compose down
    ```

	This will stop and remove the containers, but it won't delete the database or any data volumes created by Docker. If you want to remove all data, use the -v flag:
    
	```
    docker-compose down -v
    ```
	
9. Troubleshooting

	If you encounter any issues during installation or setup, please refer to the official GLPI documentation.

## Contributors
Viktor Hrytsuniak

# License

This project is licensed under the MIT License - see the LICENSE file for details.