from flask import Flask,render_template,request,redirect # type: ignore
import mysql.connector


def showallcategory():
    con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
    cursor = con.cursor()
    sql="select * from category"
    cursor.execute(sql)
    category = cursor.fetchall()
    return render_template("category/showallcategory.html",category=category)

def addrecord():
    con = mysql.connector.connect(host="localhost", username="root", password="barsha2001@#", database="clothingstore")
    cursor = con.cursor()
    if request.method == 'GET':
        return render_template("category/addcategory.html")
    else:
        categoryname = request.form['categoryname']
        file = request.files['image']
        sql = "insert into category(CategoryName,image) values (%s, %s)"
        val = (categoryname,file)
        cursor.execute(sql, val)
        con.commit()
        return redirect('/showallcategory')
    
def delete(categoryid):
    if request.method=='GET':
        return render_template("category/deleteconfirmation.html")
    else:
        action=request.form['action']
        if action=='yes':
            con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
            cursor = con.cursor()
            sql="delete from category where categoryid=%s"
            val=(categoryid,)
            cursor.execute(sql,val)
            con.commit()
        return redirect("/showallcategory")

def editcategory(categoryid):
    if request.method=='GET':
        con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
        cursor = con.cursor()
        sql="select * from category where categoryid=%s"
        val=(categoryid,)
        cursor.execute(sql,val)
        category=cursor.fetchone()
        return render_template("category/editcategory.html",category=category)
    else:
        categoryname=request.form['CategoryName']
        image=request.form['image']
        con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
        cursor = con.cursor()
        sql="update category set categoryname=%s,image=%s where categoryid=%s"
        val=(categoryname,image,categoryid)
        cursor.execute(sql,val)
        con.commit()
        return redirect("/showallcategory")


