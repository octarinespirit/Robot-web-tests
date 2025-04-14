Simple robot framework tests for my web page

Create a virtual environment for the project:
https://python.land/virtual-environments/virtualenv

python -m venv <name>

and install dependencies from the requirements.txt
pip install -r requirements.txt

# Robot-web-tests
Folders: 
keywords - for user key-words
resource - for locators
results - tests result files go here
tests - Folders: API, Connectivity, Security, Special, UI
webdriver - Chrome and Firefox webdrivers

URL address is asked from the user when starting to run the tests,
so it's not publicly hardcoded here to the files.
