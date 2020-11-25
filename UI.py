import pymssql
from tkinter import ttk
import tkinter as tk
import tkinter.font as tkFont
from tkinter import *  # 图形界面库
import tkinter.messagebox as messagebox  # 弹窗
import time
import datetime


class StartPage:
    def __init__(self, parent_window):
        parent_window.destroy()  # 销毁子界面

        self.window = tk.Tk()  # 初始框的声明
        self.window.title('火车订票系统')
        self.window.geometry('300x470+800+280')  # 这里的乘是小x

        label = Label(self.window, text="火车订票系统", font=("Verdana", 20))
        label.pack(pady=100)  # pady=100 界面的长度

        Button(self.window, text="用户登陆", font=tkFont.Font(size=16), command=lambda: UserOrder(UserLogin(self.window)),
               width=30,
               height=2,  # UserLogin(self.window)
               fg='white', bg='gray', activebackground='black',
               activeforeground='white').pack()  # UserSelect(self.windowm,'410711199912179010')
        Button(self.window, text="管理员登陆", font=tkFont.Font(size=16), command=lambda: Admin(self.window), width=30,
               height=2, fg='white', bg='gray', activebackground='black', activeforeground='white').pack()
        Button(self.window, text="关于", font=tkFont.Font(size=16), command=lambda: AboutPage(self.window), width=30,
               height=2,
               fg='white', bg='gray', activebackground='black', activeforeground='white').pack()
        Button(self.window, text='退出系统', height=2, font=tkFont.Font(size=16), width=30, command=self.window.destroy,
               fg='white', bg='gray', activebackground='black', activeforeground='white').pack()

        self.window.mainloop()  # 主消息循环


# 用户登陆页面
class UserLogin:
    def __init__(self, parent_window):
        parent_window.destroy()  # 销毁主界面

        self.window = tk.Tk()  # 初始框的声明
        self.window.title('用户登陆')
        self.window.geometry('300x450+800+280')  # 这里的乘是小x

        label = tk.Label(self.window, text='用户登陆', bg='green', font=('Verdana', 20), width=30, height=2)
        label.pack()



        Label(self.window, text='用户账号：', font=tkFont.Font(size=14)).pack(pady=25)
        self.student_id = tk.Entry(self.window, width=20, font=tkFont.Font(size=14), bg='Ivory')
        self.student_id.pack()

        Label(self.window, text='用户密码：', font=tkFont.Font(size=14)).pack(pady=25)
        self.student_pass = tk.Entry(self.window, width=20, font=tkFont.Font(size=14), bg='Ivory', show='*')
        self.student_pass.pack()

        Button(self.window, text="登陆", width=8, font=tkFont.Font(size=12), command=self.login).pack(pady=40)
        Button(self.window, text="返回首页", width=8, font=tkFont.Font(size=12), command=self.back).pack()

        self.window.protocol("WM_DELETE_WINDOW", self.back)  # 捕捉右上角关闭点击
        self.window.mainloop()  # 进入消息循环

    def login(self):
        print(str(self.student_id.get()))
        print(str(self.student_pass.get()))
        stu_pass = None

        # 数据库操作 查询管理员表
        db = pymssql.connect(host='localhost:61647',
                             user='sa',
                             password='001104',
                             database='TrainSystem',
                             charset='utf8')
        cursor = db.cursor()  # 使用cursor()方法获取操作游标
        sql = "select * from Passenger where Telephone='%s' and Id='%s'" % (
            self.student_id.get(), self.student_pass.get())  # SQL 查询语句
        try:
            # 执行SQL语句
            cursor.execute(sql)
            # 获取所有记录列表
            results = cursor.fetchall()
            for row in results:
                stu_id = row[2]
                stu_pass = row[0]
                # 打印结果
                print("stu_id=%s,stu_pass=%s" % (stu_id, stu_pass))
        except:
            print("Error: unable to fecth data")
            messagebox.showinfo('警告！', '用户名或密码不正确！')
        db.close()  # 关闭数据库连接

        print("正在登陆学生信息查看界面")
        print("self", self.student_pass.get())
        print("local", stu_pass)

        if self.student_pass.get() == stu_pass:
            UserSelect(self.window, self.student_pass.get())  # 进入功能选择界面
        else:
            messagebox.showinfo('警告！', '用户名或密码不正确！')

    def get_image(filename,width,height):
        im = Image.open(filename).resize((width,height))
        return

    def back(self):
        StartPage(self.window)  # 显示主窗口 销毁本窗口


# 用户功能选择
class UserSelect:
    def __init__(self, parent_window, User_Id):
        parent_window.destroy()  # 销毁子界面

        self.window = tk.Tk()  # 初始框的声明
        self.window.title('用户功能选择')
        self.window.geometry('300x470+800+280')  # 这里的乘是小x

        label = Label(self.window, text="用户功能选择", font=("Verdana", 20))
        label.pack(pady=100)  # pady=100 界面的长度

        Button(self.window, text="购票", font=tkFont.Font(size=16), command=lambda: AdminManage(self.window, User_Id),
               width=30,
               height=2,
               fg='white', bg='gray', activebackground='black', activeforeground='white').pack()
        Button(self.window, text="车次信息查询", font=tkFont.Font(size=16), command=lambda: Train(self.window, User_Id),
               width=30,
               height=2,
               fg='white', bg='gray', activebackground='black', activeforeground='white').pack()
        Button(self.window, text="我的订单", font=tkFont.Font(size=16), command=lambda: UserOrder(self.window, User_Id),
               width=30,
               height=2, fg='white', bg='gray', activebackground='black', activeforeground='white').pack()
        Button(self.window, text="返回首页", font=tkFont.Font(size=16), command=lambda: StartPage(self.window),
               width=30,
               height=2, fg='white', bg='gray', activebackground='black', activeforeground='white').pack()

        self.window.protocol("WM_DELETE_WINDOW", self.back)  # 捕捉右上角关闭点击
        self.window.mainloop()  # 进入消息循环

    def back(self):
        StartPage(self.window, )  # 显示主窗口 销毁本窗口

        self.window.mainloop()  # 主消息循环


# 用户员购票界面
class AdminManage:
    def __init__(self, parent_window, User_Id):
        parent_window.destroy()  # 销毁主界面

        self.User_Id = User_Id

        self.window = Tk()  # 初始框的声明
        self.window.title('购票')
        self.window.geometry('650x700+600+200')  # 这里的乘是小x

        self.frame_left_top = tk.Frame(width=300, height=200)
        self.frame_right_top = tk.Frame(width=200, height=200)
        self.frame_center = tk.Frame(width=500, height=400)
        self.frame_bottom = tk.Frame(width=650, height=50)

        # 定义下方中心列表区域
        self.columns = ("车次", "出发时间", "到达时间", "座位等级", "票价")
        self.tree = ttk.Treeview(self.frame_center, show="headings", height=18, columns=self.columns)
        self.vbar = ttk.Scrollbar(self.frame_center, orient=VERTICAL, command=self.tree.yview)
        # 定义树形结构与滚动条
        self.tree.configure(yscrollcommand=self.vbar.set)

        # 表格的标题
        self.tree.column("车次", width=100, anchor='center')  # 表示列,不显示
        self.tree.column("出发时间", width=100, anchor='center')
        self.tree.column("到达时间", width=100, anchor='center')
        self.tree.column("座位等级", width=100, anchor='center')
        self.tree.column("票价", width=100, anchor='center')

        # 调用方法获取表格内容插入
        self.tree.grid(row=0, column=0, sticky=NSEW)
        self.vbar.grid(row=0, column=1, sticky=NS)

        # 定义顶部区域
        # 定义左上方区域
        self.top_title = Label(self.frame_left_top, text="车票查询:", font=('Verdana', 20))
        self.top_title.grid(row=0, column=0, columnspan=2, sticky=NSEW, padx=50, pady=10)

        self.left_top_frame = tk.Frame(self.frame_left_top)
        self.var_start = StringVar()  # 声明出发地
        self.var_arrive = StringVar()  # 声明目的地
        self.var_date = StringVar()  # 声明出发日期
        # 出发地
        self.right_top_start_label = Label(self.frame_left_top, text="出发地：", font=('Verdana', 15))
        self.right_top_start_entry = Entry(self.frame_left_top, textvariable=self.var_start, font=('Verdana', 15))
        self.right_top_start_label.grid(row=1, column=0)  # 位置设置
        self.right_top_start_entry.grid(row=1, column=1)
        # 目的地
        self.right_top_arrive_label = Label(self.frame_left_top, text="目的地：", font=('Verdana', 15))
        self.right_top_arrive_entry = Entry(self.frame_left_top, textvariable=self.var_arrive, font=('Verdana', 15))
        self.right_top_arrive_label.grid(row=2, column=0)  # 位置设置
        self.right_top_arrive_entry.grid(row=2, column=1)
        # 出发日期
        self.right_top_gender_label = Label(self.frame_left_top, text="出发时间：", font=('Verdana', 15))
        self.right_top_gender_entry = Entry(self.frame_left_top, textvariable=self.var_date,
                                            font=('Verdana', 15))
        self.right_top_gender_label.grid(row=3, column=0)  # 位置设置
        self.right_top_gender_entry.grid(row=3, column=1)

        self.right_top_gender_label.grid(row=4, column=0)  # 位置设置
        self.right_top_gender_entry.grid(row=4, column=1)

        # 定义右上方区域
        self.right_top_title = Label(self.frame_right_top, text="操作：", font=('Verdana', 20))

        self.tree.bind('<Button-1>', self.click)  # 左键获取位置
        self.right_top_button1 = ttk.Button(self.frame_right_top, text='查询', width=20, command=self.search)
        self.right_top_button2 = ttk.Button(self.frame_right_top, text='返回', width=20, command=self.back)

        # 位置设置
        self.right_top_title.grid(row=1, column=0, pady=10)
        self.right_top_button1.grid(row=2, column=0, padx=20, pady=10)
        self.right_top_button2.grid(row=3, column=0, padx=20, pady=10)

        # 整体区域定位
        self.frame_left_top.grid(row=0, column=0, padx=2, pady=5)
        self.frame_right_top.grid(row=0, column=1, padx=30, pady=30)
        self.frame_center.grid(row=1, column=0, columnspan=2, padx=4, pady=5)
        self.frame_bottom.grid(row=2, column=0, columnspan=2)

        self.frame_left_top.grid_propagate(0)
        self.frame_right_top.grid_propagate(0)
        self.frame_center.grid_propagate(0)
        self.frame_bottom.grid_propagate(0)

        self.frame_left_top.tkraise()  # 开始显示主菜单
        self.frame_right_top.tkraise()  # 开始显示主菜单
        self.frame_center.tkraise()  # 开始显示主菜单
        self.frame_bottom.tkraise()  # 开始显示主菜单

        self.window.protocol("WM_DELETE_WINDOW", self.back)  # 捕捉右上角关闭点击
        self.window.mainloop()  # 进入消息循环

    def back(self):
        UserSelect(self.window, self.User_Id)  # 显示主窗口 销毁本窗口

    def click(self, event):  # 点击执行购买操作
        self.col = self.tree.identify_column(event.x)  # 列
        self.row = self.tree.identify_row(event.y)  # 行

        # 获取行的信息
        self.row_info = self.tree.item(self.row, "values")
        train_number = self.row_info[0]  # 车次
        start = self.var_start.get()
        arrive = self.var_arrive.get()
        # 打开数据库连接
        db = pymssql.connect(host='localhost:61647',
                             user='sa',
                             password='001104',
                             database='TrainSystem',
                             charset='utf8')
        cursor = db.cursor()  # 使用cursor()方法获取操作游标

        sql = '''declare @rest1 int;
           exec pro_rest @tnum='%s',@tdate='%s',@type='%s',@rest=@rest1 output;
           select @rest1''' % (train_number, self.var_date.get(), self.row_info[3])
        sql1 = """exec pro_purchase @Train_Number='%s',@date='%s',@Id='%s',@Start_Location='%s',@End_Location='%s',@Purchase_Location='上海',@Ticket_price=%s,@Seat_Type=%s;commit""" \
               % (train_number, self.var_date.get(), self.User_Id, start, arrive, self.row_info[4], self.row_info[3])

        cursor.execute(sql)
        rest = cursor.fetchall()[0][0]
        if rest != 0:
            res = messagebox.askokcancel('提示', '日期：%s\n车次：%s\n%s->%s\n剩余票量为%s,是否购买？' % (
                self.var_date.get(), train_number, start, arrive, rest))
            if res == TRUE:
                cursor.execute(sql1)
                result = cursor.fetchall()
                if result[0][1] != 0:
                    messagebox.showinfo('提示', '购买成功！车厢号：%s，座位号：%s' % (result[0][1], result[0][2]))
                else:
                    messagebox.showinfo('提示', '您已经购买过当日车次，无法购买！')
        else:
            messagebox.showinfo('提示', '无余票，无法购买！')
        print('')

    def tree_sort_column(self, tv, col, reverse):  # Treeview、列名、排列方式
        l = [(tv.set(k, col), k) for k in tv.get_children('')]
        l.sort(reverse=reverse)  # 排序方式
        # rearrange items in sorted positions
        for index, (val, k) in enumerate(l):  # 根据排序后索引移动
            tv.move(k, '', index)
        tv.heading(col, command=lambda: self.tree_sort_column(tv, col, not reverse))  # 重写标题，使之成为再点倒序的标题

    def search(self):
        self.train_number = []
        self.start_time = []
        self.end_time = []
        self.mile = []
        # 删除之前的数据
        x = self.tree.get_children()
        for i in x:
            self.tree.delete(i)

        traindate = self.var_date.get()
        if (int(AdminManage.get_diff_days_2_now(traindate)) >= -11):
            # 打开数据库连接
            db = pymssql.connect(host='localhost:61647',
                                 user='sa',
                                 password='001104',
                                 database='TrainSystem',
                                 charset='utf8')
            cursor = db.cursor()  # 使用cursor()方法获取操作游标
            sql = "exec pro_select @name1='%s',@name2='%s'" % (self.var_start.get(), self.var_arrive.get())  # SQL存储过程
            try:
                # 执行SQL语句
                cursor.execute(sql)
                # 获取所有记录列表
                results = cursor.fetchall()
                for row in results:
                    self.train_number.append(row[0])
                    self.start_time.append(row[1])
                    self.end_time.append(row[2])
                    self.mile.append(row[3])

                for i in range(
                        min(len(self.train_number), len(self.start_time), len(self.end_time), len(self.mile))):  # 写入数据
                    cursor.execute("select Train_Type from Train where Train_Number='%s'" % (self.train_number[i]))
                    if (cursor.fetchall() == '高铁'):
                        self.tree.insert('', i, values=(self.train_number[i], self.start_time[i], self.end_time[i], '1',
                                                        round(self.mile[i] * 0.74, 2)))  # 高铁一等座每公里价格
                        self.tree.insert('', i, values=(self.train_number[i], self.start_time[i], self.end_time[i], '2',
                                                        round(self.mile[i] * 0.46, 2)))  # 高铁二等座每公里价格
                    else:
                        self.tree.insert('', i, values=(self.train_number[i], self.start_time[i], self.end_time[i], '1',
                                                        round(self.mile[i] * 0.37, 2)))  # 动车一等座每公里价格
                        self.tree.insert('', i, values=(self.train_number[i], self.start_time[i], self.end_time[i], '2',
                                                        round(self.mile[i] * 0.3, 2)))  # 动车二等座每公里价格

                for col in self.columns:  # 绑定函数，使表头可排序
                    self.tree.heading(col, text=col,
                                      command=lambda _col=col: self.tree_sort_column(self.tree, _col, False))

                messagebox.showinfo('提示！', '查询成功！')
            except:
                db.rollback()  # 发生错误时回滚
                messagebox.showinfo('警告！', '更新失败，数据库连接失败！')
            db.close()  # 关闭数据库连接
        else:
            messagebox.showinfo('提示！', '只预售11天内的车票！')

    def get_diff_days_2_now(date_str):
        now_time = time.localtime(time.time())
        compare_time = time.strptime(date_str, "%Y-%m-%d")
        # 比较日期
        date1 = datetime.datetime(compare_time[0], compare_time[1], compare_time[2])
        date2 = datetime.datetime(now_time[0], now_time[1], now_time[2])
        diff_days = (date2 - date1).days

        # 上面是正确的获取方法，返回一个int类型天差值，修改时间：2019年8月25日
        diff_days = str(date2 - date1)
        # # 如果相差0天单纯显示为 00:00:00 不然显示为 [diff_days] : 00:00:00
        diff_days_arr = diff_days.split(":")
        if len(diff_days_arr) == 1:
            return 0
        else:
            return diff_days_arr[0].split()[0]


# 车次信息查询
class Train:
    def __init__(self, parent_window, User_Id):
        parent_window.destroy()  # 销毁主界面

        self.User_Id = User_Id

        self.window = Tk()  # 初始框的声明
        self.window.title('车次信息查询')
        self.window.geometry('650x700+600+200')  # 这里的乘是小x

        self.frame_left_top = tk.Frame(width=300, height=100)
        self.frame_right_top = tk.Frame(width=200, height=150)
        self.frame_center = tk.Frame(width=500, height=400)
        self.frame_bottom = tk.Frame(width=650, height=50)

        # 定义下方中心列表区域
        self.columns = ("车次", "站点名", "到达时间", "发车时间", "行驶距离")
        self.tree = ttk.Treeview(self.frame_center, show="headings", height=18, columns=self.columns)
        self.vbar = ttk.Scrollbar(self.frame_center, orient=VERTICAL, command=self.tree.yview)
        # 定义树形结构与滚动条
        self.tree.configure(yscrollcommand=self.vbar.set)

        # 表格的标题
        self.tree.column("车次", width=100, anchor='center')  # 表示列,不显示
        self.tree.column("站点名", width=100, anchor='center')
        self.tree.column("到达时间", width=100, anchor='center')
        self.tree.column("发车时间", width=100, anchor='center')
        self.tree.column("行驶距离", width=100, anchor='center')

        # 调用方法获取表格内容插入
        self.tree.grid(row=0, column=0, sticky=NSEW)
        self.vbar.grid(row=0, column=1, sticky=NS)

        # 定义顶部区域
        # 定义左上方区域
        self.top_title = Label(self.frame_left_top, text="车次信息查询:", font=('Verdana', 20))
        self.top_title.grid(row=0, column=0, columnspan=2, sticky=NSEW, padx=50, pady=10)

        self.left_top_frame = tk.Frame(self.frame_left_top)
        self.var_train = StringVar()  # 声明出发地

        # 出发地
        self.right_top_start_label = Label(self.frame_left_top, text="车次：", font=('Verdana', 15))
        self.right_top_start_entry = Entry(self.frame_left_top, textvariable=self.var_train, font=('Verdana', 15))
        self.right_top_start_label.grid(row=1, column=0)  # 位置设置
        self.right_top_start_entry.grid(row=1, column=1)

        self.right_top_button1 = ttk.Button(self.frame_right_top, text='查询', width=20, command=self.search)
        # 位置设置
        self.right_top_button1.place(x=0, y=58)

        self.bottom_button1 = ttk.Button(self.frame_right_top, text='返回', width=20, command=self.back)
        # 位置设置
        self.bottom_button1.place(x=0, y=100)

        # 整体区域定位
        self.frame_left_top.grid(row=0, column=0, padx=2, pady=5)
        self.frame_right_top.grid(row=0, column=1, padx=30, pady=30)
        self.frame_center.grid(row=1, column=0, columnspan=2, padx=4, pady=5)
        self.frame_bottom.grid(row=2, column=0, columnspan=2)

        self.frame_left_top.grid_propagate(0)
        self.frame_right_top.grid_propagate(0)
        self.frame_center.grid_propagate(0)
        self.frame_bottom.grid_propagate(0)

        self.frame_left_top.tkraise()  # 开始显示主菜单
        self.frame_right_top.tkraise()  # 开始显示主菜单
        self.frame_center.tkraise()  # 开始显示主菜单
        self.frame_bottom.tkraise()  # 开始显示主菜单

        self.window.protocol("WM_DELETE_WINDOW", self.back)  # 捕捉右上角关闭点击
        self.window.mainloop()  # 进入消息循环

    def back(self):
        UserSelect(self.window, self.User_Id)  # 显示主窗口 销毁本窗口

    def tree_sort_column(self, tv, col, reverse):  # Treeview、列名、排列方式
        l = [(tv.set(k, col), k) for k in tv.get_children('')]
        l.sort(reverse=reverse)  # 排序方式
        # rearrange items in sorted positions
        for index, (val, k) in enumerate(l):  # 根据排序后索引移动
            tv.move(k, '', index)
        tv.heading(col, command=lambda: self.tree_sort_column(tv, col, not reverse))  # 重写标题，使之成为再点倒序的标题

    def search(self):
        self.train_number = []
        self.arrive_time = []
        self.start_time = []
        self.site_name = []
        self.mile = []
        # 删除之前的数据
        x = self.tree.get_children()
        for i in x:
            self.tree.delete(i)

        trainnumber = self.var_train.get()

        # 打开数据库连接
        db = pymssql.connect(host='localhost:61647',
                             user='sa',
                             password='001104',
                             database='TrainSystem',
                             charset='cp936')
        cursor = db.cursor()  # 使用cursor()方法获取操作游标
        sql = "select Train_Number,Site_Name,Arrive_Time,Start_Time,Mileage from Through A,Site B where A.Site_Number=B.Site_Number and A.Train_Number='%s'" % (
            trainnumber)  # SQL存储过程
        try:
            # 执行SQL语句
            cursor.execute(sql)
            # 获取所有记录列表
            results = cursor.fetchall()

            if len(results) == 0:
                messagebox.showinfo('提示！', '未查询到相关车次！')
            else:
                for row in results:
                    self.train_number.append(row[0])
                    self.site_name.append(row[1])
                    self.arrive_time.append(row[2])
                    self.start_time.append(row[3])
                    self.mile.append(row[4])

                for i in range(len(self.train_number)):  # 写入数据
                    self.tree.insert('', i, values=(
                        self.train_number[i], self.site_name[i], self.arrive_time[i], self.start_time[i],
                        self.mile[i]))

                for col in self.columns:  # 绑定函数，使表头可排序
                    self.tree.heading(col, text=col,
                                      command=lambda _col=col: self.tree_sort_column(self.tree, _col, False))

                messagebox.showinfo('提示！', '查询成功！')
        except:
            db.rollback()  # 发生错误时回滚
            messagebox.showinfo('警告！', '更新失败，数据库连接失败！')
        db.close()  # 关闭数据库连接


# 用户订单信息查询
class UserOrder:
    def __init__(self, parent_window, User_Id):
        parent_window.destroy()  # 销毁主界面

        self.User_Id = User_Id

        self.window = Tk()  # 初始框的声明
        self.window.title('我的订单')
        self.window.geometry('720x450+600+200')  # 这里的乘是小x

        self.frame_center = tk.Frame(width=700, height=400)
        self.frame_bottom = tk.Frame(width=650, height=50)

        # 定义下方中心列表区域
        self.columns = ("车次", "车次日期", "起点", "终点", "车厢号", "座位号", "购买点")
        self.tree = ttk.Treeview(self.frame_center, show="headings", height=18, columns=self.columns)
        self.vbar = ttk.Scrollbar(self.frame_center, orient=VERTICAL, command=self.tree.yview)
        # 定义树形结构与滚动条
        self.tree.configure(yscrollcommand=self.vbar.set)

        self.bottom_button1 = ttk.Button(self.frame_bottom, text='返回', width=20, command=self.back)
        # 位置设置
        self.bottom_button1.place(x=500, y=0)

        # 表格的标题
        self.tree.column("车次", width=100, anchor='center')  # 表示列,不显示
        self.tree.column("车次日期", width=100, anchor='center')
        self.tree.column("起点", width=100, anchor='center')
        self.tree.column("终点", width=100, anchor='center')
        self.tree.column("车厢号", width=100, anchor='center')
        self.tree.column("座位号", width=100, anchor='center')
        self.tree.column("购买点", width=100, anchor='center')

        self.tree.heading("车次", text="车次")
        self.tree.heading("车次日期", text="车次日期")
        self.tree.heading("起点", text="起点")
        self.tree.heading("终点", text="终点")
        self.tree.heading("车厢号", text="车厢号")
        self.tree.heading("座位号", text="座位号")
        self.tree.heading("购买点", text="购买点")

        # 调用方法获取表格内容插入
        self.tree.grid(row=0, column=0, sticky=NSEW)
        self.vbar.grid(row=0, column=1, sticky=NS)
        self.tree.bind('<Button-1>', self.click)  # 左键获取位置

        self.train_number = []
        self.train_date = []
        self.start = []
        self.end = []
        self.car_number = []
        self.seat_number = []
        self.purchase_location = []

        # 打开数据库连接
        db = pymssql.connect(host='localhost:61647',
                             user='sa',
                             password='001104',
                             database='TrainSystem',
                             charset='cp936')
        cursor = db.cursor()  # 使用cursor()方法获取操作游标
        sql = "exec pro_order '%s'" % (self.User_Id)  # SQL存储过程
        try:
            # 执行SQL语句
            cursor.execute(sql)
            # 获取所有记录列表
            results = cursor.fetchall()
            for row in results:
                self.train_number.append(row[0])
                self.train_date.append(row[1])
                self.start.append(row[2])
                self.end.append(row[3])
                self.car_number.append(row[4])
                self.seat_number.append(row[5])
                self.purchase_location.append(row[6])

            for i in range(len(self.train_number)):  # 写入数据
                self.tree.insert('', i, values=(self.train_number[i], self.train_date[i], self.start[i], self.end[i],
                                                self.car_number[i], self.seat_number[i], self.purchase_location[i]))

        except:
            db.rollback()  # 发生错误时回滚
            messagebox.showinfo('警告！', '更新失败，数据库连接失败！')
            db.close()  # 关闭数据库连接

        # 整体区域定位
        self.frame_center.grid(row=1, column=0, columnspan=2, padx=4, pady=5)
        self.frame_bottom.grid(row=2, column=0, columnspan=2)

        self.frame_center.grid_propagate(0)
        self.frame_bottom.grid_propagate(0)

        self.frame_center.tkraise()  # 开始显示主菜单
        self.frame_bottom.tkraise()  # 开始显示主菜单

        self.window.protocol("WM_DELETE_WINDOW", self.back)  # 捕捉右上角关闭点击
        self.window.mainloop()  # 进入消息循环

    def click(self, event):  # 点击执行退票操作

        self.col = self.tree.identify_column(event.x)  # 列
        self.row = self.tree.identify_row(event.y)  # 行

        # 获取行的信息
        self.row_info = self.tree.item(self.row, "values")
        train_number = self.row_info[0]  # 车次
        train_date = self.row_info[1]  # 车次日期

        res = messagebox.askokcancel('提示', '是否退掉车票\n日期:%s\n车次:%s' % (train_date, train_number))
        if res == TRUE:

            # 打开数据库连接
            db = pymssql.connect(host='localhost:61647',
                                 user='sa',
                                 password='001104',
                                 database='TrainSystem',
                                 charset='utf8')
            cursor = db.cursor()  # 使用cursor()方法获取操作游标

            sql = """exec pro_refund @id='%s',@Train_Number='%s',@Train_date='%s';commit""" \
                  % (self.User_Id, train_number, train_date)

            cursor.execute(sql)
            rest = cursor.fetchall()[0][0]
            cursor.close()
            if rest != None:
                self.train_number = []
                self.train_date = []
                self.start = []
                self.end = []
                self.car_number = []
                self.seat_number = []
                self.purchase_location = []

                # 删除之前的数据
                x = self.tree.get_children()
                for i in x:
                    self.tree.delete(i)

                # 再次查询改用户订票信息
                # 打开数据库连接
                db = pymssql.connect(host='localhost:61647',
                                     user='sa',
                                     password='001104',
                                     database='TrainSystem',
                                     charset='cp936')
                cursor = db.cursor()  # 使用cursor()方法获取操作游标
                # 执行SQL语句
                sql1 = "exec pro_order '%s'" % (self.User_Id)  # SQL存储过程
                cursor.execute(sql1)
                # 获取所有记录列表
                results = cursor.fetchall()
                for row in results:
                    self.train_number.append(row[0])
                    self.train_date.append(row[1])
                    self.start.append(row[2])
                    self.end.append(row[3])
                    self.car_number.append(row[4])
                    self.seat_number.append(row[5])
                    self.purchase_location.append(row[6])

                for i in range(len(self.train_number)):  # 写入数据
                    self.tree.insert('', i,
                                     values=(self.train_number[i], self.train_date[i], self.start[i], self.end[i],
                                             self.car_number[i], self.seat_number[i], self.purchase_location[i]))

                messagebox.showinfo('提示', '退票成功')
            else:
                messagebox.showinfo('提示', '退票失败')
            print('')

    def back(self):
        UserSelect(self.window, self.User_Id)  # 显示主窗口 销毁本窗口


class Admin:
    def __init__(self, parent_window):
        parent_window.destroy()  # 销毁主界面

        self.window = Tk()  # 初始框的声明
        self.window.title('当日售票情况')
        self.window.geometry('450x300+700+280')  # 这里的乘是小x

        self.frame_left_top = tk.Frame(width=300, height=200)
        self.frame_right_top = tk.Frame(width=100, height=200)

        # 定义顶部区域
        # 定义左上方区域
        self.top_title = Label(self.frame_left_top, text="当日售票情况:", font=('Verdana', 20))
        self.top_title.grid(row=0, column=0, columnspan=2, sticky=NSEW, padx=50, pady=10)

        self.left_top_frame = tk.Frame(self.frame_left_top)
        self.var_date = StringVar()  # 声明出发日期

        # 出发日期
        self.right_top_gender_label = Label(self.frame_left_top, text="日期：", font=('Verdana', 15))
        self.right_top_gender_entry = Entry(self.frame_left_top, textvariable=self.var_date,
                                            font=('Verdana', 15))

        self.right_top_gender_label.grid(row=4, column=0)  # 位置设置
        self.right_top_gender_entry.grid(row=4, column=1)

        # 定义右上方区域
        self.right_top_button1 = ttk.Button(self.frame_right_top, text='查询', width=10, command=self.search)
        # 位置设置
        self.right_top_button1.place(x=0, y=58)

        self.back_button = ttk.Button(self.window, text="返回首页", width=8, command=self.back)
        self.back_button.grid(row=5, column=1)

        # 整体区域定位
        self.frame_left_top.grid(row=0, column=0, padx=2, pady=5)
        self.frame_right_top.grid(row=0, column=1, padx=30, pady=30)

        self.frame_left_top.grid_propagate(0)
        self.frame_right_top.grid_propagate(0)

        self.frame_left_top.tkraise()  # 开始显示主菜单
        self.frame_right_top.tkraise()  # 开始显示主菜单

        self.window.protocol("WM_DELETE_WINDOW", self.back)  # 捕捉右上角关闭点击
        self.window.mainloop()  # 进入消息循环

    def search(self):
        db = pymssql.connect(host='localhost:61647',
                             user='sa',
                             password='001104',
                             database='TrainSystem',
                             charset='utf8')
        cursor = db.cursor()  # 使用cursor()方法获取操作游标

        sql = '''select Count(*),SUM(Ticket_price) from Purchase A,Ticket B where A.Ticket_Number=B.Ticket_Number and Train_date=\'%s\'''' % (
            self.var_date.get())

        cursor.execute(sql)
        result = cursor.fetchall()
        if result[0][0] == 0:
            messagebox.showinfo('结果', '%s\n没有卖出车票。' % (self.var_date.get()))
        else:
            messagebox.showinfo('结果', '日期：%s\n售卖车票：%s张\n总金额：%s元。' % (self.var_date.get(), result[0][0], result[0][1]))

    def back(self):
        StartPage(self.window)  # 显示主窗口 销毁本窗口


# About页面
class AboutPage:
    def __init__(self, parent_window):
        parent_window.destroy()  # 销毁主界面

        self.window = tk.Tk()  # 初始框的声明
        self.window.title('关于')
        self.window.geometry('300x450+800+280')  # 这里的乘是小x

        label = tk.Label(self.window, text='火车票订票系统', bg='green', font=('Verdana', 20), width=30, height=2)
        label.pack()

        Label(self.window, text='作者：刘天启', font=('Verdana', 18)).pack(pady=30)
        Label(self.window, text='2020年10月', font=('Verdana', 18)).pack(pady=5)

        Button(self.window, text="返回首页", width=8, font=tkFont.Font(size=12), command=self.back).pack(pady=100)

        self.window.protocol("WM_DELETE_WINDOW", self.back)  # 捕捉右上角关闭点击
        self.window.mainloop()  # 进入消息循环

    def back(self):
        StartPage(self.window)  # 显示主窗口 销毁本窗口


if __name__ == '__main__':
    # 实例化Application
    window = tk.Tk()
    StartPage(window)
