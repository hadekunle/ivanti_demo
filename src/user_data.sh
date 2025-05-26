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
echo "from flask import Flask" >> /home/ubuntu/app.py
echo "app = Flask(__name__)" >> /home/ubuntu/app.py
echo "@app.route('/')" >> /home/ubuntu/app.py
echo "def hello_world():" >> /home/ubuntu/app.py
echo "    return 'Hello World from Ade!'" >> /home/ubuntu/app.py
echo "if __name__ == '__main__':" >> /home/ubuntu/app.py
echo "    app.run(host='0.0.0.0', debug=True)" >> /home/ubuntu/app.py
python3 /home/ubuntu/app.py
# echo "Flask application started successfully." >> test.log
# echo "Flask application setup complete." >> test.log
# echo "You can access the application at http://<your-server-ip>:5000" >> test.log
# echo "Flask application setup complete." >> test.log