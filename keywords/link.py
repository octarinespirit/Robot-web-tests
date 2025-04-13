"""Link checker module with python"""
import requests

def check_link(url):
    """Checks links through request, returns FAIL for broken or denied attempts"""
    try:
        response = requests.get(url, timeout=10)
        if response.status_code == 404:
            return "FAIL", f"Link {url} is broken (404 Not Found)"
        if response.status_code >= 400:
            return "FAIL", f"Link {url} returned error code {response.status_code}"
        return "PASS", "None"
    except requests.RequestException as e:
        return "FAIL", f"Error accessing {url}: {str(e)}"
