import re
import requests
from bs4 import BeautifulSoup

site = 'https://www.sportphotogallery.com/actors/'

response = requests.get(site)

soup = BeautifulSoup(response.text, 'html.parser')
img_tags = soup.find_all('img')


urls=[]
for image in img_tags:
    v= image.get('src', image.get('dfr-src'))  # get's "src", else "dfr_src"
                                                # if both are missing - None
    if v is None:
        continue
    urls+=v



n=0
for url in urls:
	if n<100:
	    print(url)
	    filename = re.search('([\w_-]+[.](jpg|png))$', url)
	    print(filename)
	    with open(filename.group(1), 'wb') as f:
	        if 'http' not in url:
	            # sometimes an image source can be relative 
	            # if it is provide the base url which also happens 
	            # to be the site variable atm. 
	            url = '{}{}'.format(site, url)
	        response = requests.get(url)
	        f.write(response.content)
