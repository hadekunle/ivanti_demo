#!/bin/bash
cd ~
echo "Setting up the environment...${environment}" > test.log
apt-get update
apt-get install -y python3-full python3-venv

# Create a virtual environment
python3 -m venv venv
source venv/bin/activate

# Install Flask in the virtual environment
venv/bin/pip3 install flask

# Create and Start the Flask application
echo "from flask import Flask" >> app.py
echo "app = Flask(__name__)" >> app.py
echo "@app.route('/')" >> app.py
echo "def hello_world():" >> app.py
echo "    return 'Hello World from Ade!'" >> app.py
echo "if __name__ == '__main__':" >> app.py
echo "    app.run(host='0.0.0.0', debug=True)" >> app.py
python3 app.py

