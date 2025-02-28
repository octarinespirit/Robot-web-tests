"""Module to fetch content by requests"""
import requests
from bs4 import BeautifulSoup
from robot.api.deco import keyword

@keyword
def get_content_and_save(url, filename):
    """ Parse the contents of a blog page and save the texts to a file"""
    page = requests.get(url, timeout=500)
    result = BeautifulSoup(page.content, "html.parser")

    # Finding the title
    title = result.find(class_ = "entry-title")
    title_text = title.get_text(strip=True)

    # Finding the blog text
    blog = result.find(class_ = "entry-content")
    blog_text = blog.get_text(strip=True)

    # Joining together the title and blog
    joined_text = f"{title_text}\n\n" + blog_text

    # Writing the content to a text file, returning the content also
    with open(filename, 'w', encoding='utf-8') as file:
        file.write(joined_text)
    return joined_text
