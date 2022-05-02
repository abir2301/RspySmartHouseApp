# We will use “pip” to install the “Pyrebase” module. So, check to see if you currently have pip install by running the command in the terminal
# **pip --version
# If it is not currently installed, you can install pip by running following command
# **curl https://bootstrap.pypa.io/get-pip.py | python
# After getting sure that we have “pip” on our raspberry pi board, we will start installing “Pyrebase” by running this command, and don’t worry if it takes some time.
# **sudo pip3 install Pyrebase
# After finishing installing the “Pyrebase” module, we are now ready to write the final python script that will read data from the “Firebase database” to take some different actions according to that data.
import firebase_admin
from firebase_admin import credentials
cred = credentials.Certificate("iotproject-320ed-firebase-adminsdk-nanfd-0ed036f00f.json")
firebase_admin.initialize_app(cred)
from concurrent.futures import thread
from gc import callbacks
from sqlite3 import Time
import PRI.GPIO as GPIO 
import pyrebase
import time 
from random import randint
from datetime import datetime 
from threading import Thread
#generate the firebase connection configuration 
config = {     
  "apiKey": "AIzaSyBPA7sdq8qn7HgPKbXtTtN67gb-rpkBaJg",
  "authDomain": "iotproject-320ed.firebaseapp.com",
  "databaseURL": "https://iotproject-320ed-default-rtdb.firebaseio.com",
  "storageBucket": "iiotproject-320ed.appspot.com"
}
#initialise a firebase instance 
firebase = pyrebase.initialize_app(config)  
led1= 17
led2 =27
pirpin =26
GPIO.setwarning(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(led1,GPIO.OUT)
GPIO.setup(led1,GPIO.OUT)
GPIO.setup(pirpin,GPIO.IN)
GPIO.OUTPUT(led1,False)
GPIO.OUTPUT(led2,False)
#get the state of the lamp (led2) from the reatime data base 
def LightLed2 ():
    database = firebase.database()
    db=database.child('Home/lamp')
    lightState=db.child("state").get().val()
#using this value  to detrminate the state of the led2 at that moment then if the value is  (true ) it turn on else it turn off 
    if (lightState):
     GPIO.output(led2,True)
    else:
        GPIO.output(led2,False) 

#generate a random number to use it as an  trafic id 
def genetateID():
    return randint(1,10000000000000)


# detect the mouvement then add new trafic object to the database and  turn on the light (led1)  after 2 second it turn it  off  
def LIGHT():
    if (GPIO.input(pirpin)==1):
         print('motion detected !')
         #get the date and time of the trafic detection 
         now = str(datetime.now())
         id =str(genetateID())
    #create a trafic object as map 
         trafic ={
                'id':id,
                'date': now
                              }
    #create database instance 
         database = firebase.database()
    #create database reference to trafic storage 
         db=database.child('Home/sensor/trafic')
    #add trafic object  as map to the databese ref
         db.push().set(trafic) 
         print(' add  trafic to  database ')
         print("Light on ")
    #turn on the led1 
         GPIO.output(led1,GPIO.HIGH) # or True  
         time.sleep(2)
    #turn off the led1
         GPIO.output(led1,GPIO.LOW) # or False 
         
    time.sleep(3)    
    


time.sleep(2)
print("ready to start ")
t1=Thread(target=LIGHT)
t2=Thread(target=LightLed2)

#create two thread  
while (1):
       
        t1.start()
        t2.start()
        t1.join()
        t2.join()
        time.sleep(2)



        
