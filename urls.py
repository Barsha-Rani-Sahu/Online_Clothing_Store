from main import app
import category as cat
import clothing as cloth
import admin
import user

app.add_url_rule("/showallcategory",view_func=cat.showallcategory)
app.add_url_rule("/addcategory",view_func=cat.addrecord,methods=['GET','POST'])
app.add_url_rule("/delete/<categoryid>",view_func=cat.delete,methods=['GET','POST'])
app.add_url_rule("/editcategory/<categoryid>",view_func=cat.editcategory,methods=['GET','POST'])
app.add_url_rule("/DisplayClothingItem",view_func=cloth.showallcloth)
app.add_url_rule("/AddClothingItem",view_func=cloth.addcloth,methods=['GET','POST'])
app.add_url_rule("/DeleteClothingItem/<clothingid>",view_func=cloth.DeleteClothingItem,methods=['GET','POST'])
app.add_url_rule("/EditClothingItem/<clothingid>",view_func=cloth.EditClothingItem,methods=['GET','POST'])
app.add_url_rule("/AdminLogin",view_func=admin.adminlogin,methods=['GET','POST'])
app.add_url_rule("/AdminHome",view_func=admin.adminhome)


#--------User--------
app.add_url_rule("/",view_func=user.homepage)
app.add_url_rule("/showclothingitem/<categoryid>",view_func=user.showclothingitem)
app.add_url_rule("/register",view_func=user.register,methods=['GET','POST'])
app.add_url_rule("/login",view_func=user.login,methods=['GET','POST'])
app.add_url_rule("/logout",view_func=user.logout)
app.add_url_rule("/viewdetails/<clothingid>",view_func=user.viewdetails,methods=['GET','POST'])
app.add_url_rule("/showcart",view_func=user.showcart,methods=['GET','POST'])
app.add_url_rule("/makepayment",view_func=user.makepayment,methods=['GET','POST'])
app.add_url_rule("/myorder",view_func=user.myorder,methods=['GET','POST'])