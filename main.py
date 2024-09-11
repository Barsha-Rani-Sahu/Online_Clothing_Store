from flask import Flask # type: ignore
app=Flask(__name__)
app.secret_key="clothingstore"
from urls import *

if __name__=="__main__":
    app.run(debug=True)