#!/bin/bash

# Install new requirements
echo "INSTALL NEW REQUIREMENTS"
pip install -r requirements.txt

# Collect static files
echo "COLLECT STATIC FILES"
python manage.py collectstatic --noinput

# Apply database migrations
echo "APPLY DATABASE MIGRATIONS"
python manage.py migrate

if [ ${DEBUG} == True ]
then
    # Running Tests
    echo "RUNING TESTS"
    pytest
    #TODO : stop database test after tests
fi

# Start server
echo "STARTING SERVER"
python manage.py runserver 0.0.0.0:8000