#!/bin/bash
cd ~
echo "Setting up the environment..." > test.log
apt-get update
apt-get install -y python3-full python3-venv

# Create a virtual environment
python3 -m venv /home/ubuntu/venv
source /home/ubuntu/venv/bin/activate

# Install Flask in the virtual environment
/home/ubuntu/venv/bin/pip3 install flask

# Create and Start the Flask application
echo "
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World from Ade! \n Environment: {environment}'
if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
" > /home/ubuntu/app.py

python3 /home/ubuntu/app.py