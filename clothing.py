from flask import Flask,render_template,request,redirect # type: ignore
import mysql.connector
from werkzeug.utils import secure_filename # type: ignore

def showallcloth():
    con = mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
    cursor=con.cursor()
    sql="select * from cloth_cat_view"
    cursor.execute(sql)
    cloth=cursor.fetchall()
    return render_template("clothing/DisplayClothingItem.html",clothing=cloth)

def addcloth():
    con = mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
    cursor = con.cursor()

    if request.method == "GET":
        sql = "select * from category"
        cursor.execute(sql)
        category = cursor.fetchall()
        return render_template("Clothing/AddClothingItem.html",category=category)
    else: 
        clothingname=request.form['clothingname']
        price=request.form['price']
        description=request.form['description']
        categoryid=request.form['cat']
        file =request.files['image_url']
        filename=secure_filename(file.filename)
        filename="static/images/"+file.filename
        file.save(filename)
        filename="images/"+file.filename
        quantity=request.form['quantity']
        sql = "insert into Clothing(clothingname,price,description,image_url,categoryid,quantity) values (%s,%s,%s,%s,%s,%s)"
        val = (clothingname,price,description,filename,categoryid,quantity)
        cursor.execute(sql,val)
        con.commit()
        return redirect("/DisplayClothingItem")
    
def DeleteClothingItem(clothingid):
    if request.method=='GET':
        return render_template("clothing/DeleteClothingItem.html")
    else:
        action=request.form['action']
        if action=='yes':
            con = mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
            cursor=con.cursor()
            sql="delete from clothing where clothingid=%s "
            val=(clothingid,)
            cursor.execute(sql,val)
            con.commit()
        return redirect("/DisplayClothingItem")
    
def EditClothingItem(clothingid):
    con = mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
    cursor=con.cursor()
    if request.method=='GET':
        sql="select * from cloth_cat_view where clothingid=%s"
        val=(clothingid,)
        cursor.execute(sql,val)
        clothing=cursor.fetchone()
        cursor.execute("select * from category")
        categories = cursor.fetchall()
        return render_template("clothing/EditClothingItem.html",clothing=clothing,categories=categories)
    else:
        clothingname=request.form['clothingname']
        price=request.form['price']
        description=request.form['description']
        categoryid=request.form['categoryid']
        file =request.files['image_url']
        filename=secure_filename(file.filename)
        filename="static/images/"+file.filename
        file.save(filename)
        filename="images/"+file.filename
        quantity=request.form['quantity']
        sql="update clothing set clothingname=%s,price=%s,description=%s,image_url=%s,categoryid=%s,quantity=%s where clothingid=%s"
        val=(clothingname,price,description,filename,categoryid,quantity,clothingid)
        cursor.execute(sql,val)
        con.commit()
        return redirect("/DisplayClothingItem")



    


