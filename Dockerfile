# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file first
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy all your code & data (including .pkl files) into the container
COPY . .

# Expose the default Streamlit port
EXPOSE 8501

# Disable CORS for Streamlit (optional)
ENV STREAMLIT_SERVER_ENABLECORS=false

# Start Streamlit when the container runs
CMD ["streamlit", "run", "app.py"]
