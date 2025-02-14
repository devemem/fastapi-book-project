# # Use an official Python image as the base
# FROM python:3.10

# # Set the working directory inside the container
# WORKDIR /app

# # Copy requirements and install dependencies
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy the entire FastAPI project
# COPY . .

# # Expose port 8000
# EXPOSE 8000

# # Run the FastAPI application using Uvicorn
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]



# Use an official lightweight Python image
FROM python:3.9-slim

# Set work directory
WORKDIR /fastapi

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project files
COPY . .

# Expose the port FastAPI runs on
EXPOSE 8000

# Run the FastAPI application using Uvicorn
CMD ["uvicorn", "main:fastapi", "--host", "0.0.0.0", "--port", "8000"]
