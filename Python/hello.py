from link_finder import LinkFinder
from domain import *
from general import *
import Library.Connection as CustomConnection
import requests
from bs4 import BeautifulSoup
from spider import *
from main import PRODUCT
import webbrowser
def getval(page_url) :
    try:
        r = requests.get(page_url)
        data = r.text
        #print(data)
        soup = BeautifulSoup(data, 'html.parser')
        a=[]
        b=[]
        print(soup.find('span', {"id": "productTitle"}).text)
        print(soup.find('span', {"class": "a-size-medium a-color-price"}).text)
        c=soup.find('span', {"id": "productTitle"}).text
        d=soup.find('span', {"id": "productTitle"}).text
        a.append(c)
        b.append(d)
        #if PRODUCT.lower() in c.lower():
        #    print(c)
        #    print(d)
        #    print("This is the product you are looking for.")
           # webbrowser.open(page_url)

    except:
        print("")