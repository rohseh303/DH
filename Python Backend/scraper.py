import requests
from bs4 import BeautifulSoup

def getMenus():
    # Use requests to get the HTML of the page
    r = requests.get('http://menu.dining.ucla.edu/pages/menus')

    # Parse the HTML with BeautifulSoup
    soup = BeautifulSoup(r.text, 'html.parser')

    # Find all the restaurant elements on the page
    temp = soup.find_all("a")

    restaurants =[]
    #check if they are restaurants by checking if href starts with /Menus/
    for tag in temp:
        #print(tag)
        if str(tag).startswith('<a href="/Menus/'):
            restaurants.append(tag)

    # Create dictionary
    d = {}

    # Loop through each restaurant
    for restaurant in restaurants:
        arr = []
        # Get the name of the restaurant for the title of the txt file
        print("current restaurant: " + str(restaurant))
        name = str(restaurant)[16:]
        name = name[0:name.index('"')]

        # Combine the prestring 'http://menu.dining.ucla.edu/' and the href name of restaurant
        starting_quote = str(restaurant).index('"')
        ending_quote = str(restaurant).find('"', str(restaurant).find('"') + 1)
        link = "http://menu.dining.ucla.edu/" + str(restaurant)[starting_quote+1:ending_quote]
        
        # Use requests to get the HTML of the page
        request = requests.get(link)

        # Parse the HTML with BeautifulSoup
        parsable = BeautifulSoup(request.text, 'html.parser')
        
        # Find all the menu items in the restaurant
        items = parsable.find_all('a', class_='recipelink')
        #print(items)
        # Loop through each menu item and write the name to the file
        for item in items:
            #get only the text portion of item
            dish = str(item)
            dish = dish[dish.index('>')+1:]
            dish = dish[:dish.index('<')]
                
            if not (dish == "Small (12 oz)" or dish == "Medium (16 oz)" or dish == "Large (20 oz)" or dish == "Iced (16 oz)"):
                arr.append(dish)
        # Add array to dictionary once we are done adding all user friendly menu items
        d[name] = arr

    # Make debugging each step cleaner
    print("")

    # Return dictionary, keys = restaurant names, values = array of menu items
    return d