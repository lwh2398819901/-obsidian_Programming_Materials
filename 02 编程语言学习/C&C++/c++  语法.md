
# c++11~17部分新特性
## 1. > 
 c++11 之前 在模板中，编译器碰到 >> 会认为是操作符 导致编译失败
```cpp
 //c11之前
 vector<list<int> >；
 //c11之后
 vector<list<int>>；
 ```

 ## 2. nullptr
c++11 之前 空指针以NULL代表 

编译器的实现 
```cpp
#define NULL (void*)0 
```


c11之后 nullptr  类型为nullptr_t类型

内部定义为：
```cpp
typedef decltype(nullptr) nullptr_t;
```

```cpp
void func(int a)
{
    cout<<a<<endl;
}

void func(char*a)
{
    cout<<a<<endl;
}

func("");       //char *
func(0);        //int 
//func(NULL); //编译失败
func(nullptr);  //char*
```
## 3.decltype

```cpp
#include <typeinfo>
#include <iostream>
using namespace std;
#define STR(s)     #s
#define PrintfTyep(x) cout<<STR(x)<<":"<<typeid(x).name()<<endl;

/*
测试 decltypeTest

typeinfo 输出类型

bool:                     b
char:                     c
signed char:              a
unsigned char:            h
(signed) short (int):     s
unsigned short (int):     t
(signed) (int):           i
unsigned (int):           j
(signed) long (int):      l
unsigned long (int):      m
(signed) long long (int): x
unsigned long long (int): y
float:                    f
double:                   d
long double:              e

[模板] 类型模板以I开头，以E结尾；常数模板以L开头，以E结尾。只有整型变量(int、char之类的)才能做为常数模板，浮点数不行。
*/

int getSize();
//推导1
void test1()
{
    int tempA = 2;

    /*1.dclTempA为int*/
    decltype(tempA) dclTempA;

    /*2.dclTempB为int，对于getSize根本没有定义，但是程序依旧正常，因为decltype只做分析，并不调用getSize，*/
    decltype(getSize()) dclTempB;

    PrintfTyep(tempA);
    PrintfTyep(dclTempA);
    PrintfTyep(dclTempB);
}
//指针推导
void test2()
{
    double tempA = 3.0;
    const double ctempA = 5.0;
    const double *const cptrTempA = &ctempA;

    /*1.dclTempA推断为const double（保留顶层const，此处与auto不同）*/
    decltype(ctempA) dclTempA = 4.1;

    /*2.dclTempB推断为const double * const*/
    decltype(cptrTempA) dclTempB = &ctempA;

    PrintfTyep(tempA);
    PrintfTyep(ctempA);
    PrintfTyep(cptrTempA);
    PrintfTyep(dclTempA);
    PrintfTyep(dclTempB);
}
//数组推导
void test3()
{
    //当decltype作用于数组的时候 将会推导为数组
    int iarr[10] = {0};
    decltype(iarr)ib;
    PrintfTyep(iarr);
    PrintfTyep(ib);

}

//特殊示例
template<typename T, typename U>
auto add(T t, U u) -> decltype(t + u)
{                                     // C++11
    return t+u;
}

struct A { double x; };
const A* a;

void test4()
{
    decltype(a->x) y;       // y 的类型是 double（其声明类型）
    decltype((a->x)) z = y; // z 的类型是 const double&（左值表达式）
    /*
        当使用()将表达式包围时 :
            a) 若 表达式 的值类别为亡值，则 decltype 产生 T&&；
            b) 若 表达式 的值类别为左值，则 decltype 产生 T&；
            c) 若 表达式 的值类别为纯右值，则 decltype 产生 T。
    */
    PrintfTyep(y);
    PrintfTyep(z);

    auto func = [](const A& a1,const A& a2){
        return a1.x >a2.x;
    };
    //推导lambdas表达式
    set<A,decltype(func)>test(func);
}
```

## 4.auto 
注意：不要滥用auto
```cpp
auto i1 =42; //int
auto i2 =1.0;//double 
auto i3 =&i1;//int*
auto i4 =42;

int test();

auto func=test;//函数指针
func();
auto lam =[](){};// lambda
lam();

vector<list<int>>vec;
auto it= vec.begin(); //迭代器


//推导返回值
template<class T1,class T2,class T3>
T3 testFunc(T1 a,T2 b);

//auto 返回值
template<class T1,class T2>
auto testFunc(T1 a,T2 b)->decltype(a+b); //c11

template<class T1,class T2>
auto testFunc(T1 a,T2 b); //c14
```
### 注意事项
auto 变量必须在定义时初始化，这类似于const关键字。
如果初始化表达式是引用，则去除引用语义。
```cpp
int a = 10;
int &b = a;

auto c = b;//c的类型为int而非int&（去除引用）
auto &d = b;//此时c的类型才为int&

c = 100;//a =10;
d = 100;//a =100;
```
定义在一个auto序列的变量必须始终推导成同一类型。例如：
```cpp
auto a4 = 10, a5 = 20, a6 = 30;//正确
auto b4 = 10, b5 = 20.0, b6 = 'a';//错误,没有推导为同一类型
```
使用auto关键字做类型自动推导时，依次施加一下规则：
如果初始化表达式为const或volatile（或者两者兼有），则除去const/volatile语义。
```cpp
const int a1 = 10;
auto  b1= a1;       //b1的类型为int而非const int（去除const）
const auto c1 = a1; //此时c1的类型为const int
b1 = 100;//合法
c1 = 100;//非法

如果auto关键字带上&号，则不去除const语意。
const int a2 = 10;
auto &b2 = a2;//因为auto带上&，故不去除const，b2类型为const int
b2 = 10; //非法
```

初始化表达式为数组时，auto关键字推导类型为指针。
```cpp
int a3[3] = { 1, 2, 3 };
auto b3 = a3;
```
若表达式为数组且auto带上&，则推导类型为数组类型。
```cpp
int a7[3] = { 1, 2, 3 };
auto & b7 = a7;
```

函数或者模板参数不能被声明为auto
```cpp
void func(auto a)  //错误
{
//... 
}
```
时刻要注意auto并不是一个真正的类型。
auto仅仅是一个占位符，它并不是一个真正的类型，不能使用一些以类型为操作数的操作符，如sizeof或者typeid。
```cpp
cout << sizeof(auto) << endl;//错误
cout << typeid(auto).name() << endl;//错误
```

## 5.Uniform Initialization 一致性初始化
```cpp
//类型检测
int a1 = 1.1;   // a1 = 1
int a2{1.1};    //error: type 'double' cannot be narrowed to 'int' in initializer list 
int a3{1};      // a3 = 1
int a4 = {5.1}; // error

//但是允许转换到宽类型上,或者合理的值上
char c{66};
double d{11};

int arr[]{1,2,3};
vector<int>v{1,2,3,4,5};

//设初值
int j{};        //j = 0
int *p {};      // p = nullptr

cout<<max({1,2,3,4})<<endl;
cout<<min({1,2,3,4})<<endl;
```

### std::initializer_list 模板类
initializer_list是C++11提供的新类型，定义在头文件中。
用于表示某种特定类型的值的数组，和vector一样，initializer_list也是一种模板类型。
```cpp
template< class T >
class initializer_list;
```
提供的操作如下
```cpp
initializer_list<T> lst; 
//默认初始化；T类型元素的空列表
initializer_list<T> lst{a,b,c...};
//lst的元素数量和初始值一样多；lst的元素是对应初始值的副本
lst2(lst)   
lst2=lst  
//拷贝或赋值一个initializer_list对象不会拷贝列表中的元素；拷贝后，原始列表和副本元素共享
lst.size()  //列表中的元素数量
lst.begin()  //返回指向lst中首元素的指针
lst.end()   //返回指向lst中尾元素下一位置的指针
```
需要注意的是,initializer_list对象中的元素永远是常量值，我们无法改变initializer_list对象中元素的值。并且，拷贝或赋值一个initializer_list对象不会拷贝列表中的元素，其实只是引用而已，原始列表和副本共享元素。

和使用vector一样，我们也可以使用迭代器访问initializer_list里的元素
```cpp
void error_msg(initializer_list<string> il)
{
   for(auto beg=il.begin();beg!=il.end();++beg)
      cout<<*beg<<" ";
   cout<<endl;
}
```
说了这么多，那initializer_list到底有什么应用呢？
如果类中有提供接受initializer_list 参数类型的构造函数 则初始化列表语法只能用于该构造函数
可以看一下vector和list的构造函数
```cpp
vector(initializer_list<value_type> __l,
    const allocator_type& __a = allocator_type())
: _Base(__a)
{
    _M_range_initialize(__l.begin(), __l.end(),
                        random_access_iterator_tag());
}

vector(initializer_list<value_type> __l,
   const allocator_type& __a = allocator_type())
: _Base(__a)
{
_M_range_initialize(__l.begin(), __l.end(),
		    random_access_iterator_tag());
}
```


## 6.lambdas

### 简介
lambda表达式是一个匿名内联函数，可以定义别的函数体中，其形式如下：
```cpp
[capture list](parameter list)->return type{funtion body}
```
从中可以看到，lambda只能使用尾置返回类型；

### 结构
lambda不可缺少的部分是捕获列表capture list和函数体funtion body，其他都可以忽略不写。

### parameter list
parameter list需要实参和形参互相匹配，且lambda不能有默认参数，所以两者属于也要相等。

### return type
return type会根据funtion body中的内容来推断，如果只含有一个return 语句，类型就从其推断，否则就是void。如果不是上述情况，就需要自己定义一个返回类型，防止推断为void和期望返回的类型不符合的问题。

### capture list
capture list是lambda所在函数中定义的局部变量，lambda可以对其进行捕获然后进行使用，捕获过程也分为值和引用，使用时看是否需要对捕获的变量进行修改和所捕获的变量是否支持这种操作。

>值捕获和引用捕获
值捕获需要变量能被拷贝，比如IO流是不能被拷贝，这就只能用引用。
有时可能需要返回一个lambda，当返回时，此lambda就不能用到引用，否则就会出现函数将返回一个局部变量的引用，这是不合法的。
引用捕获需要对象存在。

>变量修改
lambda在捕获的时候就对变量进行了复制(值捕获时)，所以希望能借此修改外部变量，应该时用引用。但是如果只需要就地对捕获的变量进行修改并且不想对外部修改的话，就可以在值捕获时在参数列表之后指明mutable关键字。

>隐式和显式捕获
显示就是直接写出局部变量，隐式就是不在capture list中写出名字，只写捕获方式，其中 = (代表值捕获)， & (代表引用捕获)，让编译器自己推断要使用那些变量。
```cpp
[ = ](string s1){return s1.size()>=length;}  //假设length为一个局部变量，则此时采用值捕获。
```
两者也可以混搭，这有一个要求：capture list中第一个元素必须为隐式捕获，并且显示和隐式捕获的方式必须不同。
比如：
```cpp
[ = ,&os](string &s){ os << s << tmp; } 
```
捕获列表小结：

| 列表             | 含义                                         |
|:---------------- |:-------------------------------------------- |
| []               | 空捕获列表                                   |
| [n1,&n2,n3,&n4…] | 以逗号为分隔的捕获列表，显示捕获             |
| [&]              | 隐式捕获，lambda中使用的变量全部采用引用捕获 |
| [=]              | 隐式捕获，lambda中使用的变量全部采用值捕获   |
| [&,n1,n2]        | 混和捕获，n1和n2值捕获，其余为引用捕获       |
| [=,&n1,&n2]      | 混和捕获，n1和n2引用捕获，其余为值捕获       |


使用示例
```cpp
//声明 并不是调用
[]{
    cout<<"hello world"<<endl;
};
//声明并且调用
[]{
    cout<<"hello world"<<endl;
}();
//func 是lambda对象
auto func=[]{
    cout<<"hello world"<<endl;
};
func();
```
使用示例2
```cpp
void test1()
{
    int id =0;
    auto f = [=]()mutable {
        ++id;
        cout<<id<<endl;
    };
    f();
    f();
    f();
    cout<<id<<endl; //id的值?
}
```
使用示例3
```cpp
//示例

/*
 * 
 *
template<typename _Key, typename _Compare = std::less<_Key>,
        typename _Alloc = std::allocator<_Key> >
class set{
    /*****/    
}
    
explicit
set(const _Compare& __comp,
const allocator_type& __a = allocator_type())
: _M_t(__comp, _Key_alloc_type(__a)) { }
*/

struct A { double x{}; };
void test2()
{ 
    auto func = [](const A& a1,const A& a2){
        return a1.x >a2.x;
    };
    set<A,decltype(func)>test(func);
}
```
## 7.explicit
### C++11 之前explicit的作用

禁止隐式调用类内的单参数构造函数， 这主要包括如下三层意思：

1.该关键字只能用来修饰类内部的构造函数

2.禁止隐式调用拷贝构造函数

3.禁止类对象之间的隐式转换
```cpp
#include <string>
#include <iostream>
using namespace std;

class Cxstring {
public:
	string _str;
	int _size;
	Cxstring(int size) {
		_size = size;
	}
	Cxstring(string str) {
		_str = str;
	}
};

int main() {
	Cxstring s1 = 1;
	Cxstring s2(2);
	Cxstring s6 = 'c';// 这样是OK的, 其实调用的是CxString(int size), 且size等于'c'的ascii码 

	string a = "aaaa";
	Cxstring s3(a);
	Cxstring s4("aae");
	Cxstring s5 = a;  //调用 Cxstring(string str) 
	s1 = s3;
}
```
上面的例子都能编译通过。但是如果我们将第一个构造函数添加了explicit：
```cpp
#include <string>
#include <iostream>
using namespace std;

class Cxstring {
public:
	string _str;
	int _size;
	explicit Cxstring(int size) {
		_size = size;
	}
	Cxstring(string str) {
		_str = str;
	}
};

int main() {
	Cxstring s1 = 1; // 这样是不OK的，explicit取消了隐式转换
	Cxstring s2(2);
	Cxstring s6 = 'c';// 这样是不OK的, explicit取消了隐式转换

	string a = "aaaa";
	Cxstring s3(a);
	Cxstring s4("aae");
	Cxstring s5 = a;
	s1 = s3;
}
````
### C++11 之后
C++11 之后explicit支持多个参数的构造函数

## 8 for 增强

遍历字符串
```cpp
std::string str = “hello, world”;  
for(auto ch : str) {  
    std::cout << ch << std::endl;  //遍历str，输出每个字符
}
```

遍历数组
```cpp
int arr[] = {1, 2, 3, 4};  
for(auto i : arr) {  
     std::cout<< i << std::endl;  //值传递 不能修改数组内数值
}  
```

遍历stl 容器
```cpp
std::vector<std::string> str_vec = {“i”, “like”,  "google”};  
for(auto& it : str_vec) {  
     it = “c++”;  //通过引用可以修改容器内容
}  
```

遍历stl map 
```cpp
std::map<int, std::string> hash_map = {{1, “c++”}, {2, “java”}, {3, “python”}};  
for(auto it : hash_map) {  
     std::cout << it.first << “\t” << it.second << std::endl;  
}  
```

## 9. =default =delete override final noexcept  
### 复习一下基础知识 
C++中，当我们设计与编写一个类时，若不显著申明，则类会默认为我们提供如下几个函数：
>（1）构造函数(A())
>（2）析构函数（~A()）
>（3）拷贝构造函数(A(A&))
>（4）拷贝赋值函数（A& operator=(A&)）
>（5）移动构造函数（A(A&&)）
>(6）移动赋值函数（A& operator=(A&&)）

注意：拷贝函数如果涉及指针就要区分浅拷贝（指针只占4字节，浅拷贝只把指针所占的那4个字节拷贝过去）和深拷贝（不仅要拷贝指针所占的字节，还要把指针所指的东西也要拷贝过去）；

以及全局的默认操作符函数
>（1）operator
>（2）operator &
>（3）operator &&
>（4）operator *
>（5）operator->
>（6）operator->*
>（7）operator new
>（8）operator delete。

何时需要自定义big—three(构造函数、拷贝构造、拷贝赋值)/big-five(新增移动构造函数、移动赋值函数)
>如果类中带有point member（指针成员），那我们就可以断定必须要给出big-three,如果不带，绝大多与情况下就不必给出big-three，用默认的就好。

### =default =delete
构造函数、拷贝构造函数、移动构造函数（右值引用）、赋值函数(operator=)、移动赋值函数等5种成员函数  
default和delete基本就作用再这5种函数上，由于c++中，如果你自定义了这5种函数，编译器就不会再为你生成默认的相关函数，但是如果我们再后边加上=default关键字，就可以重新获得并使用编译器为我们生成的默认函数（显式缺省:告知编译器即使自己定义了也要生成函数默认的缺省版本)；
具体的含义可以看这个示例

相对于上面来说则是相反的，=delete表示不要这个函数，就是说这个函数已经删除了不能用了，一旦别人使用就会报错（显式删除：告知编译器不生成函数默认的缺省版本)，引进这两种新特性的目的是为了增强对“类默认函数的控制”，从而让程序员更加精准地去控制默认版本的函数。
```cpp
class Test
{
public:
    Test()=default;
    Test(const Test&)=delete;
    //~Test()=delete;  //加上这句话可以吗?
    Test(int i):i(i) {
        cout<<i<<endl;
    }
    int i ;
};

void testDefualt{
    Test t1;//使用默认无参构造
    Test t2(1);
    Test t3=t1;//error 默认拷贝构造被删除
    Test t4;
    t4 = t2;//默认拷贝赋值
}
```
###  override final
override用于明确要重写父类的虚函数上，相当于告诉编译器这个函数就是要重写父类虚函数这样一个意图，让编译器帮忙检查，而没有这个关键字，编译器是不会帮你检查的
final新增两种功能：(1)、禁止基类被继承，(2)、禁止虚函数被重写；
```cpp
class Test
{
public:
    virtual void printInt(){};
    virtual void printInt2() final {};
};

class Test2:public Test
{
public:
    virtual void printInt(int i) override {};//error 编译错误
    virtual void printInt2() final {}; //erro 编译错误 不允许重写虚函数
};
//final
class Base
{
    /***/
}

class Base1 final : public Base
{

}
class Base2 : public Base1 //erro 编译错误 不允许继承
{

}
```
### noexcept

noexcept用于申明函数保证不会抛出异常，后面可以跟一个括号写一个条件，也就是说在某种条件满足情况下，不会抛出异常，一般异常处理流程：当程序发生异常时会将异常信息上报返回给调用者，如果有异常处理则处理，如果该调用者没有处理异常则会接着上报上一层，若到了最上层都没有处理，就会调用std::terminate()->std::abort()，然后终止程序。

语法:
```cpp
noexcept    (1)  同noexcept(true)
noexcept(expression)    (2)
```
下面两个函数声明的异常规格在语义上是相同的，都表示函数不抛出任何异常。
```cpp
void old_stytle() throw();
void new_style() noexcept;
```
它们的区别在于程序运行时的行为和编译器优化的结果。
使用throw()， 如果函数抛出异常，异常处理机制会进行栈回退，寻找(一个或多个）catch语句。
异常传递和栈回退会像以前那样继续进行。
这意味着，如果使用throw， 编译器几乎没有机会做优化。
事实上，编译器甚至会让代码变得更臃肿、庞大：
（1）栈必须被保存在回退表中；
（2）所有对象的析构函数必须被正确的调用（按照对象构建相反的顺序析构对象）；
（3）编译器可能引入新的传播栅栏（propagation barriers）、引入新的异常表入口，使得异常处理的代码变得更庞大；
（4）内联函数的异常规格（exception specification）可能无效的。

当使用noexcept时，std::teminate()函数会被立即调用,在异常处理的过程中，编译器不会回退栈，这为编译器的优化提供了更大的空间。
简而言之，如果你知道你的函数绝对不会抛出任何异常，应该使用noexcept, 而不是throw().

#### 什么时候该使用noexcept？
使用noexcept表明函数或操作不会发生异常，会给编译器更大的优化空间。然而，并不是加上noexcept就能提高效率，步子迈大了也容易扯着蛋。
以下情形鼓励使用noexcept：

移动构造函数（move constructor）
移动分配函数（move assignment）
析构函数（destructor）。这里提一句，在新版本的编译器中，析构函数是默认加上关键字noexcept的。


## 10. 作用域类枚举

这种情况将编译失败
```cpp
enum TestEnum{
    A,
    B,
    C
}
enum TestEnum2{
    A,
    B,
    C
}
```
添加关键字 class 后 编译通过（也可以使用struct）
```cpp
enum class TestEnum{
    A,
    B,
    C
}
enum struct TestEnum2{
    A,
    B,
    C
}
```
常规枚举可以自动转换为整形，但作用域内枚举不可以
int i = TestEnum::A; //编译失败
int i = int (TestEnum::A);

## 10. using

1、命名空间的使用
```cpp
using namespace std;
using std::vector;
```
2、在子类中引用基类的成员
```cpp
class T5Base {
public:
    T5Base() :value(55) {}
    virtual ~T5Base() {}
    void test1() { cout << "T5Base test1..." << endl; }
protected:
    int value;
};
 
class T5Derived : private T5Base {
public:
    using T5Base::test1;
    using T5Base::value;
    void test2() { cout << "value is " << value << endl; }
};
````
基类中成员变量value是protected，在private继承之后，对于外界这个值为private，也就是说T5Derived的对象无法使用这个value。

如果想要通过对象使用，需要在public下通过using T5Base::value来引用，这样T5Derived的对象就可以直接使用。

同样的，对于基类中的成员函数test1()，在private继承后变为private，T5Derived的对象同样无法访问，通过using T5Base::test1 就可以使用了。

注意，using只是引用，不参与形参的指定。

3、别名指定

例如：
```cpp
typedef std::map<string,map<string,int>> mmapIter;
```
而C++11中：
```cpp
using UPtrMapSS = std::map<string,map<string,int>> ;
```
或许从这个例子中，我们是看不出来明显的好处的（而于我来说，以一个第三者的角度，这个例子也难以说服我一定要用C++11的using）。
再来看下：
```cpp
typedef void (*FP) (int, const std::string&);
```
若不是特别熟悉函数指针与typedef，我相信第一眼还是很难指出FP其实是一个别名，代表着的是一个函数指针.
那么，让我们换做C++11的写法：
```cpp
using FP = void (*) (int, const std::string&);
```
从可读性来看，using也是要好于typedef的。

那么，若是从可读性的理由支持using，力度也是稍微不足的。来看第二个理由，那就是举出了一个typedef做不到，而using可以做到的例子：alias templates, 模板别名。

```cpp
template <typename T>
using Vec = MyVector<T, MyAlloc<T>>;

// usage
Vec<int> vec;
````
这一切都会非常的自然。

那么，若你使用typedef来做这一切：
```cpp
template <typename T>
typedef MyVector<T, MyAlloc<T>> Vec;

// usage
Vec<int> vec;
```
当你使用编译器编译的时候，将会得到类似：error: a typedef cannot be a template的错误信息。

## 11. 可变参数模板 variadic

variadic template 特性本身是一个很自然的需求，它完善了 C++ 的模板设计手段。原来的模板参数可以使类和函数的参数类型“任意化”，如果再加上“参数个数的任意化”，那么在参数方面的设计手段就基本上齐备了，可变参数模板显然可以让设计出来的函数或是类有更大的复用性。因为有很多处理都是与“处理对象的个数”关系不大的，比如说打屏（printf），比如说比较大小（max，min），比如函数绑定子（bind，function要对应各种可能的函数就要能“任意”参数个数和类型）。如果不能对应任意个参数，那么就总会有人无法重用已有的实现，而不得不再重复地写一个自己需要的处理，而共通库的实现者为了尽可能地让自己写的类（函数）能复用在更多的场景，也不得不重复地写很多的代码或是用诡异的技巧，宏之类的去实现有限个“任意参数”的对应。
```cpp
void show_list() //思考为什么要有一个空的函数重载?
{

}

template<typename T,typename... Types>
void show_list(const T&first,const Types&... args)
{
    cout<<"print:"<<first<<endl;
    cout<<"size:"<<sizeof...(args)<<endl;
    PrintfTyep(first);
    cout<<endl;
    show_list(args...);
}

void argsTest()
{
    show_list(1,2,"adad",12.3,'c');
}
```
可以看一下tuple的声明

```cpp
  template<typename... _Elements>
    class tuple;
```
## 12. 元组 tuple

### 基本用法
```cpp
tuple<const char*, int>tp = make_tuple(sendPack,nSendSize); //构造一个tuple
```
这个tuple等价于一个结构体
```
struct A
{
char* p;
int len;
};
```
tie创建
```cpp
auto tp = return std::tie(1, "aa", 2);
//tp的类型实际是：
std::tuple<int&,string&, int&>
```
再看看如何获取它的值：
```cpp
const char* data = tp.get<0>(); //获取第一个值
int len = tp.get<1>(); //获取第二个值
```
还有一种方法也可以获取元组的值，通过std::tie解包tuple
```cpp
int x,y;
string a;
std::tie(x,a,y) = tp; 
```
通过tie解包后，tp中三个值会自动赋值给三个变量。

解包时，我们如果只想解某个位置的值时，可以用std::ignore占位符来表示不解某个位置的值。比如我们只想解第三个值时：
```cpp
std::tie(std::ignore,std::ignore,y) = tp; //只解第三个值了
```
我们还可以通过tuple_cat连接多个tupe
```cpp
int main()
{
    std::tuple<int, std::string, float> t1(10, "Test", 3.14);
    int n = 7;
    auto t2 = std::tuple_cat(t1, std::make_pair("Foo", "bar"), t1, std::tie(n));
    n = 10;
    print(t2);
}
```
输出结果：
>(10, Test, 3.14, Foo, bar, 10, Test, 3.14, 10)

### tuple的高级用法
获取tuple中某个位置元素的类型
```cpp
//通过std::tuple_element获取元素类型。
tuple<int,double,int,string>t;
cout<<std::tuple_size<decltype(t)>::value<<endl;
using type = typename std::tuple_element<3, decltype(t)>::type;
type t2 ="314";

```
获取tuple中元素的个数：
```cpp
tuple<int,double,char> t;
>int size = std::tuple_size<decltype(t))>::value;
```
遍历tuple中的每个元素
```cpp
//因为tuple的参数是变长的，也没有for_each函数，如果我们想遍历tuple中的每个元素，需要自己写代码实现。比如我要打印tuple中的每个元素。

template<class Tuple, std::size_t N>
struct TuplePrinter {
    static void print(const Tuple& t)
    {
        TuplePrinter<Tuple, N - 1>::print(t);
        std::cout << ", " << std::get<N - 1>(t);
    }
};

template<class Tuple>
struct TuplePrinter<Tuple, 1>{
    static void print(const Tuple& t)
    {
        std::cout << std::get<0>(t);
    }
};

template<class... Args>
void PrintTuple(const std::tuple<Args...>& t)
{
    std::cout << "(";
    TuplePrinter<decltype(t), sizeof...(Args)>::print(t);
    std::cout << ")\n";
}
```
这一段代码用到了上面的可变参模板的技术,看起来已经比较的困难


下面有几个从网上摘抄下来的示例,大家有兴趣可以看一下

根据tuple元素值获取其对应的索引位置
```cpp
namespace detail
{
    template<int I, typename T, typename... Args>
    struct find_index
    {
        static int call(std::tuple<Args...> const& t, T&& val)
        {
            return (std::get<I - 1>(t) == val) ? I - 1 :
                find_index<I - 1, T, Args...>::call(t, std::forward<T>(val));
        }
    };

    template<typename T, typename... Args>
    struct find_index<0, T, Args...>
    {
        static int call(std::tuple<Args...> const& t, T&& val)
        {
            return (std::get<0>(t) == val) ? 0 : -1;
        }
    };
}

template<typename T, typename... Args>
int find_index(std::tuple<Args...> const& t, T&& val)
{
    return detail::find_index<0, sizeof...(Args) - 1, T, Args...>::
           call(t, std::forward<T>(val));
}

int main()
{
    std::tuple<int, int, int, int> a(2, 3, 1, 4);
    std::cout << find_index(a, 1) << std::endl; // Prints 2
    std::cout << find_index(a, 2) << std::endl; // Prints 0
    std::cout << find_index(a, 5) << std::endl; // Prints -1 (not found)
}
```
展开tuple，并将tuple元素作为函数的参数。这样就可以根据需要对tuple元素进行处理了
```cpp
#include <tuple>
#include <type_traits>
#include <utility>

template<size_t N>
struct Apply {
template<typename F, typename T, typename... A>
static inline auto apply(F && f, T && t, A &&... a)
-> decltype(Apply<N-1>::apply(
::std::forward<F>(f), ::std::forward<T>(t),
::std::get<N-1>(::std::forward<T>(t)), 
::std::forward<A>(a)...
))
{
    return Apply<N-1>::apply(::std::forward<F>(f), 
    ::std::forward<T>(t),
    ::std::get<N-1>(::std::forward<T>(t)), 
    ::std::forward<A>(a)...
);
}
};

template<>
struct Apply<0> {
template<typename F, typename T, typename... A>
static inline auto apply(F && f, T &&, A &&... a)
-> decltype(::std::forward<F>(f) 
(::std::forward<A>(a)...))
{
return ::std::forward<F>(f)(::std::forward<A> (a)...);
}

};

template<typename F, typename T>
inline auto apply(F && f, T && t)
-> decltype(Apply< ::std::tuple_size<
typename ::std::decay<T>::type
>::value>::apply(::std::forward<F>(f), 
::std::forward<T>(t)))
{
return Apply< ::std::tuple_size
    <typename ::std::decay<T>::type>
    ::value>::apply(::std::forward<F>(f), 
    ::std::forward<T>(t));
}

void one(int i, double d)
{
    std::cout << "function one(" << i << ", " << d << ");\n";
}
int two(int i)
{
    std::cout << "function two(" << i << ");\n";
    return i;
}

//测试代码
int main()
{
    std::tuple<int, double> tup(23, 4.5);
    apply(one, tup);

    int d = apply(two, std::make_tuple(2));

    return 0;
}
```
## 13.新增加容器 forward_list array 

### forward_list

list为双向链表 内部必然有两个指针 一个前驱指针 一个后继指针  
forward_list为单向链表 内部只有一个后继指针,所以空间肯定节省.使用方式与链表基本相同,就不在阐述

### array
```cpp
定义于头文件 <array>
template< 
    class T, 
    std::size_t N 
> struct array;
(C++11 起)

std::array 是封装固定大小数组的容器。

一种特殊情况是 array （ N == 0 ）。该情况下， array.begin() == array.end() ，
并拥有某个唯一值。在零长 array 上调用 front() 或 back() 的效应是未定义的。
```

简单来说，std::array除了有传统数组支持随机访问、效率高、存储大小固定等特点外，还支持迭代器访问、获取容量、获得原始指针等高级功能。

用std::array后，可以更简便地进行初始化、修改、遍历，这里有个例子：
```cpp
std::array<int, 10> arr = {1,2,3,4,5,6,7,8,9,0};

std::for_each(arr.begin(), arr.end(), [](int &i){
    i++;
});

for (auto i : arr) {
    std::cout << i << " ";
}
```
未介绍的容器:
unordered_map unordered_multimap unordered_set unordered_multiset


## 14 enum class 

C++11 中，枚举的关键字为 _enum class_，即在 enum 后加 class，与 C++98 的 "plain" enum 区别如下：
```cpp

enum class Color { red, green, blue };　　 

enum Color { red, green, blue };　　 
```

https://zhuanlan.zhihu.com/p/501309032
## 其他
### function 函数包装器
第一次调用
```cpp
#include <iostream>
#include <algorithm>
#include <functional>
using namespace std;
template <typename T,typename F>
T use_f(T v,F f)
{
    static int count =0;
    count++;
    std::cout<<count<<"    "<<&count<<endl;
    return  f(v);
}
class FP
{
private:
    double z_;
public:
    FP(double z=1.0):z_(z){}
    double operator()(double p){return  z_*p;}
};

class Fq
{
private:
    double z_;
public:
    Fq(double z=1.0):z_(z){}
    double operator()(double p){return  z_+p;}
};

double dub(double x){return 2.0*x;};
double square(double x){return x*x;};

int main()
{
    double y =1.21;
    use_f(y,dub);
    use_f(y,square);
    use_f(y,FP(5.0));
    use_f(y,Fq(5.0));
    use_f(y,[](double u){return u*u;});
    use_f(y,[](double u){return u+u/2.0;});

    /*  输出结果
        1    0x40c11c
        2    0x40c11c
        1    0x40c120
        1    0x40c124
        1    0x40c114
        1    0x40c118
        1    0x40c128
    */    

    //改进一下 使用函数包装器
    std::function<double(double)>fdc1 = dub;
    std::function<double(double)>fdc2 = square;
    std::function<double(double)>fdc3 = FP(5.0);
    std::function<double(double)>fdc4 = Fq(5.0);
    std::function<double(double)>fdc5 = [](double u){return u*u;};
    std::function<double(double)>fdc6 = [](double u){return u+u/2.0;};

    use_f(y,fdc1);
    use_f(y,fdc2);
    use_f(y,fdc3);
    use_f(y,fdc4);
    use_f(y,fdc5);
    use_f(y,fdc6);

    /* 输出结果
    1    0x40c114
    2    0x40c114
    3    0x40c114
    4    0x40c114
    5    0x40c114
    6    0x40c114
    */

    // 也可以结合using用
    using fdd =std::function<double(double)>;
    cout<<use_f(y,fdd(dub))<<endl;
    cout<<use_f(y,fdd(square))<<endl;
    cout<<use_f(y,fdd(FP(5.0)))<<endl;
    cout<<use_f(y,fdd(Fq(5.0)))<<endl;
    cout<<use_f(y,fdd([](double u){return u*u;}))<<endl;
    cout<<use_f(y,fdd([](double u){return u+u/2.0;}))<<endl;
    return 0;
}

```

## 私有静态对象初始化

```cpp
class A
{
public:
    A(int* a):m_b(*a){
        m_a = 0;
    }
    ~A(){
        delete []m_d;
    }


private:
    int m_a;
    int &m_b;
    //主要是这一个 私有的静态对象如何初始化
    constexpr const static int m_c[5]={0,1,2,3,4};  
    char*m_d=new char[1024];
};
```