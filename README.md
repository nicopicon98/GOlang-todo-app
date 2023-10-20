
# Comprehensive Guide: Setting Up a Go Project with Clean Architecture

## Table of Contents

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Project Initialization](#project-initialization)
4. [Module Initialization](#module-initialization)
5. [Directory Structure](#directory-structure)
6. [Adding Code](#adding-code)
7. [Configuration](#configuration)
8. [Docker Configuration](#docker-configuration)
9. [Running the Project](#running-the-project)
10. [Testing](#testing)
11. [Building and Deployment](#building-and-deployment)

## Introduction

Clean Architecture aims for a separation of concerns among components. The core business logic is isolated from external elements like the UI, database, and third-party services. This makes the system easy to understand, modify, and test.

## Prerequisites

- **Go**: Install the latest version from [the official site](https://golang.org/dl/).
- **Git**: Install Git from [the official site](https://git-scm.com/).
- **Docker**: Install Docker from [the official site](https://www.docker.com/products/docker-desktop).

## Project Initialization

### Steps

1. **Download the `create-clean-architecture.bat` file** to your local machine.

2. **Execute the `.bat` file**: Double-click on it or run it from the command line to set up the initial directories and files.

    ```bash
    ./create-clean-architecture.bat
    ```

## Module Initialization

### Steps

1. **Navigate to the root directory** of your project in the command line.

2. **Initialize a new Go module**:

    ```bash
    go mod init <module-name>
    ```

   Replace `<module-name>` with your chosen module name, typically the repository URL (e.g., `github.com/username/repo`).

## Directory Structure

Your directory should have the following structure:

```plaintext
.
├── cmd
│   └── server
│       └── http
│           └── main.go
└── pkg
    └── api
        ├── app
        │   ├── domain
        │   ├── errors
        │   ├── interfaces
        │   │   ├── controllers
        │   │   ├── repositories
        │   │   └── services
        │   └── usecases
        ├── config
        ├── helpers
        └── middleware
```

## Adding Code

Each layer has a specific role and responsibility within the architecture. Below are guidelines and examples for each.

### Domain Layer

This layer represents the business objects of the application. 

1. **Create domain entities**: Place your domain entities under `pkg\api\app\domain`.

    ```go
    // pkg/api/app/domain/user.go
    type User struct {
        ID    string
        Name  string
        Email string
    }
    ```

### Application Layer

This layer is responsible for business rules and application logic.

1. **Implement use cases**: Add your business logic in `pkg\api\app\usecases`.

    ```go
    // pkg/api/app/usecases/user.go
    func CreateUser(user User) (User, error) {
        // Business logic here
    }
    ```

### Interface Layer

This layer handles the communication between the application and the outside world.

1. **Controllers**: Implement the controllers in `pkg\api\app\interfaces\controllers`.

    ```go
    // pkg/api/app/interfaces/controllers/user.go
    func CreateUserController(w http.ResponseWriter, r *http.Request) {
        // HTTP logic here
    }
    ```

### Infrastructure Layer

This layer includes everything that exists independently of your project.

1. **Repositories**: Implement the data access logic under `pkg\api\app\interfaces\repositories`.

    ```go
    // pkg/api/app/interfaces/repositories/user.go
    func (r *UserRepository) CreateUser(user User) (User, error) {
        // Database logic here
    }
    ```

## Configuration

Configuration settings like database credentials should be stored in environment variables or a configuration file.

1. **Create a configuration file**: Add a `config.go` file in `pkg\api\config`.

    ```go
    // pkg/api/config/config.go
    var DBHost = "localhost"
    var DBPort = "5432"
    ```

## Docker Configuration

Docker allows you to package your application into a container, making it easier to deploy and run. 

1. **Create a `Dockerfile`**: If not already created, make a `Dockerfile` in your project root.

2. **Specify the Base Image**: Start with a base Go image.

    ```Dockerfile
    FROM golang:latest
    ```

3. **Set Environment Variables**: If you have any environment variables, set them here.

    ```Dockerfile
    ENV DB_HOST=localhost
    ENV DB_PORT=5432
    ```

4. **Copy Go Mod and Sum files**: This will allow Docker to download all the dependencies.

    ```Dockerfile
    COPY go.mod go.sum ./
    RUN go mod download
    ```

5. **Copy Source Code**: Copy your source code into the Docker image.

    ```Dockerfile
    COPY . .
    ```

6. **Build the Application**: Specify the `main.go` file to build the application.

    ```Dockerfile
    RUN go build -o main ./cmd/server/http/main.go
    ```

7. **Run the Application**: Set the command to run your application.

    ```Dockerfile
    CMD ["./main"]
    ```

8. **Build the Docker Image**: Navigate to the directory containing your `Dockerfile` and run:

    ```bash
    docker build -t <image-name> .
    ```

## Running the Project

1. **Navigate to the HTTP server directory**:

    ```bash
    cd cmd/server/http
    ```

2. **Run the project**:

    ```bash
    go run main.go
    ```

## Testing

To run tests for your Go project, use the built-in `go test` command.

1. **Navigate to the root directory**:

    ```bash
    go test ./...
    ```

## Building and Deployment

1. **Build the project**:

    ```bash
    go build -o <output-name>
    ```

2. **Run the Docker Container**: After building the Docker image, run it:

    ```bash
    docker run -p <port>:<port> <image-name>
    ```

