# book_store
Practice repository for test automation site

![CI](https://github.com/USER/REPO/actions/workflows/robot.yml/badge.svg)

![Tests](https://img.shields.io/badge/tests-passing-brightgreen)



# How to run content in this reposatory
Create virtual enviroment with

````
python -m venv venv
````

Activate it with Windows

````
venv\Scripts\activate 
````
Or on mac/Linux

````
source venv\bin\activate 
````

Install dependencies with

````
pip install -r requirements.txt
````
Then run

````
rfbrowser init
````

Run tests with command
````
robot -d results ADD_YOUR_TEST_NAME_HERE
````
