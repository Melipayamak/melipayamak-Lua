# melipayamak Lua

<div dir='rtl'>

### معرفی وب سرویس ملی پیامک
ملی پیامک یک وب سرویس کامل برای ارسال و دریافت پیامک و پیامک صوتی و مدیریت کامل خدمات دیگر است که براحتی میتوانید از آن استفاده کنید.

<hr>

### نصب

<p>قبل از نصب نیاز به ثبت نام در سایت ملی پیامک دارید.</p>

[**ثبت نام به همراه دریافت 200 پیامک هدیه جهت تست وبسرویس**](http://www.melipayamak.com/)

</div>

<div dir='rtl'>
  
#### نحوه استفاده

نمونه کد برای ارسال پیامک

</div>


```lua
local username = "username";
local password = "password";
local from = "5000...";
local to = "09123456789";
local text = "تست وب سرویس ملی پیامک";
local isFlash = false;
SendSimpleSMS2(username, password, to, from, text, isFlash);
//یا برای ارسال به مجموعه ای از مخاطبین
SendSimpleSMS(username, password, to, from, text, isFlash);
```

<div dir='rtl'>

از آنجا که وب سرویس ملی پیامک تنها محدود به ارسال پیامک نیست شما از طریق متدهای زیر میتوانید به وب سرویس ها دسترسی کامل داشته باشید

#### تفاوت های وب سرویس پیامک rest و soap

از آنجا که ملی پیامک وب سرویس کاملی رو در اختیار توسعه دهندگان میگزارد برای راحتی کار با وب سرویس پیامک علاوه بر وب سرویس اصلی soap وب سرویس rest رو هم در اختیار توسعه دهندگان گزاشته شده تا راحتتر بتوانند با وب سرویس کار کنند. تفاوت اصلی این دو در تعداد متد هاییست که میتوانید با آن کار کنید. برای کار های پایه میتوان از وب سرویس rest استفاده کرد برای دسترسی بیشتر و استفاده پیشرفته تر نیز باید از وب سرویس باید از وب سرویس soap استفاده کرد. جهت مطالعه بیشتر وب سرویس ها به قسمت وب سرویس پنل خود مراجعه کنید.

<hr/>


###  اطلاعات بیشتر

برای مطالعه بیشتر و دریافت راهنمای وب سرویس ها و آشنایی با پارامتر های ورودی و خروجی وب سرویس به صفحه معرفی
[وب سرویس ملی پیامک](https://github.com/Melipayamak/Webservices)
مراجعه نمایید .


<hr/>

</div>


<div dir='rtl'>

### وب سرویس پیامک

متدهای وب سرویس:

</div>

#### ارسال

```lua
Send(to, from, text, isFlash);
SendSimpleSMS(to, from, text, isFlash);
```


<div dir='rtl'>
  
### وب سرویس دفترچه تلفن

</div>

#### اضافه کردن گروه جدید
```lua
AddGroup(username, password, groupName, Descriptions, showToChilds);
```

#### اضافه کردن کاربر جدید
```lua
AddContact(username, password, options);
```

#### بررسی موجود بودن شماره در دفترچه تلفن
```lua
CheckMobileExistInContact(username, password, mobileNumber);
```

#### دریافت اطلاعات دفترچه تلفن
```lua
GetContacts(username, password, groupId, keyword, count);
```
#### دریافت گروه ها
```lua
GetGroups(username, password);
```
#### ویرایش مخاطب
```lua
ChangeContact(username, password, options);
```

#### حذف مخاطب
```lua
RemoveContact(username, password, mobilenumber);
```
#### دریافت اطلاعات مناسبت های فرد
```lua
GetContactEvents(username, password, contactId);
```

<div dir='rtl'>

### وب سرویس کاربران

</div>

#### ثبت فیش واریزی
```lua
AddPayment(username, password, options);
```

#### اضافه کردن کاربر جدید در سامانه
```lua
AddUser(username, password, options);

```

#### اضافه کردن کاربر جدید در سامانه(کامل)
```lua
AddUserComplete(username, password, options);
```

#### اضافه کردن کاربر جدید در سامانه(WithLocation)
```lua
AddUserWithLocation(username, password, options);
```
#### بدست آوردن ID کاربر
```lua
AuthenticateUser(username, password);
```
#### تغییر اعتبار
```lua
ChangeUserCredit(username, password, amount, description, targetUsername, GetTax);
```

#### فراموشی رمز عبور
```lua
ForgotPassword(username, password, mobileNumber, emailAddress, targetUsername);
```
#### دریافت تعرفه پایه کاربر
```lua
GetUserBasePrice(username, password, targetUsername);
```

#### دریافت اعتبار کاربر
```lua
GetUserCredit(username, password, targetUsername);
```

#### دریافت مشخصات کاربر
```lua
GetUserDetails(username, password, targetUsername);
```

#### دریافت شماره های کاربر
```lua
GetUserNumbers(username, password);
```

#### دریافت تراکنش های کاربر
```lua
GetUserTransactions(username, password, targetUsername, creditType, dateFrom, dateTo, keyword);
```

#### دریافت اطلاعات  کاربران
```lua
GetUsers(username, password);
```


#### دریافت اطلاعات  فیلترینگ
```lua
HasFilter(username, password, text);
```


####  حذف کاربر
```lua
RemoveUser(username, password, targetUsername);
```


#### مشاهده استان ها
```lua
GetProvinces(username, password);
```

#### مشاهده کد شهرستان 
```lua
GetCities(username, password, provinceId);
```


#### مشاهده تاریخ انقضای کاربر 
```lua
GetExpireDate(username, password);
```
