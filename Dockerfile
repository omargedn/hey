# Use the stable Python 3.11 image (replaces runtime.txt)
FROM python:3.11-slim

# Install ffmpeg (replaces packages.txt)
RUN apt-get update && apt-get install -y ffmpeg

# Set up the working directory
WORKDIR /app

# Copy all your project files into the container
COPY . .

# Install your Python dependencies
RUN pip install -r requirements.txt

# Expose the port Streamlit runs on
EXPOSE 8501

# Command to run your app
# This tells Streamlit to be accessible from outside the container
CMD ["streamlit", "run", "website.py", "--server.address", "0.0.0.0"]
