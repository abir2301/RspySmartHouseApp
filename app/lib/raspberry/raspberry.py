import firebase_admin
from firebase_admin import credentials

cred = credentials.Certificate("iotproject-320ed-firebase-adminsdk-nanfd-0ed036f00f.json")
firebase_admin.initialize_app(cred)