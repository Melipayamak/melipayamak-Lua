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
#### دریافت وضعیت ارسال
```perl
GetDelivery(recId);
GetDeliveries(recIds);
```

#### لیست پیامک ها

```perl
GetMessages(location, index, count, from);
getMessages(location, from, index, count);
// جهت دریافت به صورت رشته ای
GetMessagesByDate(location, from, index, count, dateFrom, dateTo);
//جهت دریافت بر اساس تاریخ
GetUsersMessagesByDate(location, from, index, count, dateFrom, dateTo);
// جهت دریافت پیام های کاربران بر اساس تاریخ 
```

#### موجودی
```perl
GetCredit();
```

#### تعرفه پایه / دریافت قیمت قبل از ارسال
```perl
GetBasePrice();
GetSmsPrice(irancellCount, mtnCount, from, text);
```
#### لیست شماره اختصاصی
```perl
GetUserNumbers();
```

#### بررسی تعداد پیامک های دریافتی
```perl
GetInboxCount(isRead);
//پیش فرض خوانده نشده 
```

#### ارسال پیامک پیشرفته
```perl
SendSms(to, from, text, isflash, udh, recId, status);
```

#### مشاهده مشخصات پیام
```perl
GetMessagesReceptions(msgId, fromRows);
```


#### حذف پیام دریافتی
```perl
RemoveMessages2(location, msgIds);
```


#### ارسال زماندار
```perl
AddSchedule(to, from, text, isflash, scheduleDateTime, period);
```

#### ارسال زماندار متناظر
```perl
AddMultipleSchedule(to, from, text, isflash, scheduleDateTime, period);
```


#### ارسال سررسید
```perl
AddNewUsance(to, from, text, isflash, scheduleStartDateTime, countRepeat, scheduleEndDateTime, periodType);
```

#### مشاهده وضعیت ارسال زماندار
```perl
GetScheduleStatus(schId);
```

#### حذف پیامک زماندار
```perl
RemoveSchedule(schId);
```


####  ارسال پیامک همراه با تماس صوتی
```perl
SendSMSWithSpeechText(smsBody, speechBody, from, to);
```

####  ارسال پیامک همراه با تماس صوتی به صورت زمانبندی
```perl
SendSMSWithSpeechTextBySchduleDate(smsBody, speechBody, from, to, scheduleDate);
```

####  دریافت وضعیت پیامک همراه با تماس صوتی 
```perl
GetSendSMSWithSpeechTextStatus(recId);
```
<div dir='rtl'>
  
### وب سرویس ارسال انبوه/منطقه ای

</div>

#### دریافت شناسه شاخه های بانک شماره
```perl
GetBranchs(owner);
```


#### اضافه کردن یک بانک شماره جدید
```perl
AddBranch(branchName, owner);
```

#### اضافه کردن شماره به بانک
```perl
AddNumber(branchId, mobileNumbers);
```

#### حذف یک بانک
```perl
RemoveBranch(branchId);
```

#### ارسال انبوه از طریق بانک
```perl
AddBulk(from, branch, bulkType, title, message, rangeFrom, rangeTo, DateToSend, requestCount, rowFrom);
```

#### تعداد شماره های موجود
```perl
GetBulkCount(branch, rangeFrom, rangeTo);
```

#### گزارش گیری از ارسال انبوه
```perl
GetBulkReceptions(bulkId, fromRows);
```


#### تعیین وضعیت ارسال 
```perl
GetBulkStatus(bulkId, sent, failed, status);
```

#### تعداد ارسال های امروز
```perl
GetTodaySent();
```

#### تعداد ارسال های کل

```perl
GetTotalSent();
```

#### حذف ارسال منطقه ای
```perl
RemoveBulk(bulkId);
```

#### ارسال متناظر
```perl
SendMultipleSMS(to, from, text, isflash, udh, recId, status);
```

#### نمایش دهنده وضعیت گزارش گیری

```perl
UpdateBulkDelivery(bulkId);
```
<div dir='rtl'>
  
### وب سرویس تیکت

</div>

#### ثبت تیکت جدید
```perl
AddTicket(title, content, aletWithSms);
```

#### جستجو و دریافت تیکت ها

```perl
GetReceivedTickets(ticketOwner, ticketType, keyword);
```

#### دریافت تعداد تیکت های کاربران
```perl
GetReceivedTicketsCount(ticketType);
```

#### دریافت تیکت های ارسال شده
```perl
GetSentTickets(ticketOwner, ticketType, keyword);
```

#### دریافت تعداد تیکت های ارسال شده
```perl
GetSentTicketsCount(ticketType);
```


#### پاسخگویی به تیکت
```perl
ResponseTicket(ticketId, type, content, alertWithSms);
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
