# Use the official Go image from the Docker Hub
FROM golang:alpine AS builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files (if they exist)
COPY hello.go .

# Build the Go app
RUN go build -o hello

# Start a new stage from scratch
FROM alpine:latest
COPY --from=builder /app/hello .

# Expose port 8080
EXPOSE 8080

# Command to run the executable
CMD ["./hello"]