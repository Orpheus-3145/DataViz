# Dataset links:
#   - https://www.kaggle.com/datasets/thedevastator/impact-of-living-standards-on-dry-forest-degrada
#   - https://www.kaggle.com/datasets/konradb/eubucco-european-buildings-dataset
#   - kaggle: https://www.kaggle.com/datasets
#   - https://catalog.data.gov/dataset/national-flood-hazard-layer-nfhl
#   - https://inspire-geoportal.ec.europa.eu/overview.html?view=pdEuOverview&legislation=all
import requests
from bs4 import BeautifulSoup

def extract_data(net_url):
    l=list()
    o={}
    e={}
    d={}
    m={}
    c={}
    resp = requests.get(net_url)
    soup = BeautifulSoup(resp.text, 'html.parser')
    o["name"]=soup.find("h1", {"class":"title-title"}).text
    o["seasons"] = soup.find("span", {"class":"duration"}).text
    o["about"] = soup.find("div", {"class":"hook-text"}).text
    episodes = soup.find("ol",{"class":"episodes-container"}).find_all("li")
    for i in range(0,len(episodes)):
        print("i-esimo campo:", episodes[i])
        e["episode-title"]=episodes[i].find("h3",{"class":"episode-title"}).text
        e["episode-description"]=episodes[i].find("p",{"class":"epsiode-synopsis"}).text
        l.append(e)
        e={}
    genres = soup.find_all("span",{"class":"item-genres"})
    for x in range(0,len(genres)):
        d["genre"]=genres[x].text.replace(",","")
        l.append(d)
        d={}
    mood = soup.find_all("span",{"class":"item-mood-tag"})
    for y in range(0,len(mood)):
        m["mood"]=mood[y].text.replace(",","")
        l.append(m)
        m={}
    o["facebook"]=soup.find("a",{"data-uia":"social-link-facebook"}).get("href")
    o["twitter"]=soup.find("a",{"data-uia":"social-link-twitter"}).get("href")
    o["instagram"]=soup.find("a",{"data-uia":"social-link-instagram"}).get("href")
    cast=soup.find_all("span",{"class":"item-cast"})
    for t in range(0,len(cast)):
        c["cast"]=cast[t].text
        l.append(c)
        c={}
    l.append(o)
    for ele in l:
        print(ele)

if __name__ == "__main__":
    url = "https://www.netflix.com/in/title/80057281"
    extract_data(url)