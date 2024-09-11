from flask import render_template,redirect,request,session # type: ignore
import mysql.connector
from datetime import datetime

def homepage():
    con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
    cursor = con.cursor()
    sql="select * from category"
    cursor.execute(sql)
    category=cursor.fetchall()
    sql="select * from clothing"
    cursor.execute(sql)
    cloth = cursor.fetchall()
    return render_template("user/homepage.html",category=category,cloth=cloth)

def showclothingitem(categoryid):
    con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
    cursor = con.cursor()
    sql = "select * from category"
    cursor.execute(sql)
    category=cursor.fetchall()
    sql = "select * from clothing where categoryid=%s"
    val=(categoryid,)
    cursor.execute(sql,val)
    cloth=cursor.fetchall()
    return render_template("user/showclothingitem.html",category=category,cloth=cloth)

def register():
    if request.method=='GET':
        con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
        cursor = con.cursor()
        sql="select * from category"
        cursor.execute(sql)
        category=cursor.fetchall()
        return render_template("user/register.html",category=category)
    else:
        username=request.form['username']
        password=request.form['password']
        email_id=request.form['email_id']
        con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
        cursor = con.cursor()
        sql="insert into register values(%s,%s,%s)"
        val=(username,password,email_id)
        try:
            cursor.execute(sql,val)
            con.commit()
            return redirect("/")
        except:
            return redirect("/register")
    
def login():
    if request.method=='GET':
        con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
        cursor = con.cursor()
        sql="select * from category"
        cursor.execute(sql)
        category=cursor.fetchall()
        return render_template("user/login.html",category=category)
    else:
        username=request.form['username']
        password=request.form['password']
        con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
        cursor = con.cursor()
        sql="select count(*) from register where username=%s and password=%s"
        val=(username,password)
        cursor.execute(sql,val)
        count=cursor.fetchone()
        count=int(count[0])
        if count==1:
            session['uname']=username
            return redirect("/")
        else:
            return redirect("/register")

def logout():
    session.clear()
    return redirect("/")

def viewdetails(clothingid):
    con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
    cursor = con.cursor()
    if request.method=='GET':
       
        sql="select * from category"
        cursor.execute(sql)
        cat=cursor.fetchall()
        sql="select * from cloth_cat_view where clothingid=%s"
        val=(clothingid,)
        cursor.execute(sql,val)
        cloth=cursor.fetchone()
        return render_template("user/viewdetails.html",cat=cat,cloth=cloth)
    else:
        pass
        if 'uname' in session:
            uname=session['uname']
            clothingid=request.form['clothingid']
            qty=int(request.form['qty'])

             
            sql = "select quantity from clothing where clothingid=%s"
            val=(clothingid,)
            cursor.execute(sql,val)
            quantity = cursor.fetchone()[0]

            if quantity < qty:
                return render_template("user/outofstock.html")
            sql="insert into mycart (clothingid,qty,status,username) values(%s,%s,%s,%s)"
            val=(clothingid,qty,'cart',uname)
            cursor.execute(sql,val)
            con.commit()
            return redirect("/showcart")
            
        else:
            return redirect("/login")
        
def showcart():
    con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
    cursor = con.cursor()
    if request.method=='GET':
        con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
        cursor = con.cursor()
        sql="select * from category"
        cursor.execute(sql)
        category=cursor.fetchall()
        if 'uname' in session:
            sql="select * from cart_view where username=%s"
            val=(session['uname'],)
            cursor.execute(sql,val)
            items=cursor.fetchall()
            
            sql= "select sum(subtotal) from cart_view where username=%s"
            cursor.execute(sql,val)
            total=cursor.fetchone()[0]
            session['total']= total
            
            return render_template("user/showcart.html",items=items,total=total,category=category)
        else:
            return redirect("/login")
    else:
        action= request.form['action']
        cart_id=request.form['cart_id']
        if action=='edit':
            qty=request.form['qty']
            sql="update mycart set qty=%s where cart_id=%s"
            val=(qty,cart_id)
            cursor.execute(sql,val)
            con.commit()
            return redirect("/showcart")
        else:
            sql="delete from mycart where cart_id=%s"
            val=(cart_id,)
            cursor.execute(sql,val)
            con.commit()
            return redirect("/showcart")
        
def makepayment():
    con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
    cursor = con.cursor()
    if request.method=='GET':
        sql="select * from category"
        cursor.execute(sql)
        category=cursor.fetchall()
        return render_template("user/makepayment.html",total=session['total'],category=category)
    else:
        cardno=request.form['cardno']
        cvv=request.form['cvv']
        expiry=request.form['expiry']
        con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
        cursor = con.cursor()
        sql="select count(*) from payment where cardno=%s and cvv=%s and expiry=%s"
        val=(cardno,cvv,expiry)
        cursor.execute(sql,val)
        count=int(cursor.fetchone()[0])
        if count==1:
            con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
            cursor = con.cursor()
            sql1="update payment set balance=balance+%s where cardno=%s"
            val1=(session['total'],'1001')
            sql2="update payment set balance=balance-%s where cardno=%s"
            val2=(session['total'],cardno)
            cursor.execute(sql1,val1)
            cursor.execute(sql2,val2)
            con.commit()


            sql="insert into order_master (date_of_order,amount,username) values(%s,%s,%s)"
            val=(datetime.now(),session['total'],session['uname'])
            cursor.execute(sql,val)
            con.commit()
            dd=datetime.today().strftime('%y-%m-%d')


            sql="select order_id from order_master where date_of_order=%s and amount=%s and username=%s"
            val=(dd,session['total'],session['uname'])
            cursor.execute(sql,val)
            oid=cursor.fetchone()[0]

            con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
            cursor = con.cursor()
            sql="update mycart set status='order',order_id=%s where status='cart' and username=%s"
            val=(oid,session['uname'])
            cursor.execute(sql,val)
            con.commit()

           
            sql="select clothingid,qty from mycart where status='order' and username=%s"
            val=(session['uname'],)
            cursor.execute(sql,val)
            order_item=cursor.fetchall()
            for item in order_item:
                clothingid=item[0]
                qty=item[1]
                    
                sql="update clothing set quantity=quantity-%s where clothingid=%s"
                val=(qty,clothingid)
                cursor.execute(sql,val)
                con.commit()
            return redirect("/")
        else:
            return redirect("/makepayment")
def myorder():
    if 'uname' in session:
        con=mysql.connector.connect(host="localhost",username="root",password="barsha2001@#",database="clothingstore")
        cursor = con.cursor()
        sql="select * from order_view where username=%s"
        val=(session['uname'],)
        cursor.execute(sql,val)
        order_details=cursor.fetchall()
       
        sql="select * from category"
        cursor.execute(sql)
        category=cursor.fetchall()

        return render_template("user/myorder.html",order_details=order_details,category=category)
    else:
        return redirect("/login")
    
