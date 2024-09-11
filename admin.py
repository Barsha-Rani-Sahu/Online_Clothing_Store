from flask import Flask,render_template,request,redirect,session # type: ignore
import mysql.connector

def adminlogin():
    if request.method=='GET':
        return render_template("admin/AdminLogin.html")
    else:
        aname=request.form['admin_name']
        password=request.form['password']
        con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
        cursor=con.cursor()
        sql="select count(*) from admininfo where adminname=%s and password=%s"
        val=(aname,password)
        cursor.execute(sql,val)
        count=cursor.fetchone()
        count= int(count[0])
        if count==1:
            session['name']= aname
            return redirect("/AdminHome")
        else:
            return redirect("/AdminLogin")
        
def adminhome():
    if 'name' in session:
        return render_template("admin/AdminHome.html")
    else:
        return redirect("/AdminLogin")