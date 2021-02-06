//
//  ViewController.m
//  blcokdemo
//
//  Created by Lambent on 2020/12/16.
//

#import "ViewController.h"
#import "Person.h"
//#import "Person+rr.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    Person *p=[Person new];
//    [p fuvk];
//    [p tets];
    
//    p.num
//    p.num=2;
    /*
         延展的使用
        语法:
        @interface 本类()
        @end
        只有声明 没有实现，和本类共享一个实现
         只有一个.h文件 文件名称： 本类名_取得的文件名.h
        这个文件中只有延展的声明
         @interface Person()
         @end
         延展本质是一个特殊的分类
         延展只有声明 没有单独用的实现 和本类共享一个实现
     
        延展和分类的区别
     1 分类有名字 延展没有名字是一个匿名的分类
     2 每一个分类都有单独的声明和实现 而延展只有声明 没有单独的实现 和本类共享一个实现
     3 分类只能新增方法 而延展中可以任意的成员都可以写
     4 分类中可以写@property 但是只会生成getter setter的声明
     延展中写@property会自动生成私有属性 也会生成gettter 和 setter的声明和实现
     
     延展其实就是可以写在 @inteolention 文件上面的的 @interface（） @end
     这里都是私有属性 和 私有方法
     
     
     
     
     blcok是一个数据类型（int double char。。。）
     
     */
    // Do any additional setup after loading the view.
    //    <__NSGlobalBlock__: 0x10e907038> 全局区域(初始化和未初始化) 还有代码区域 还有堆区域 栈区域
    //<__NSMallocBlock__: 0x600001987090> 堆
    //<__NSStackBlock__: 0x600003c45ec0> 栈
    
    //==========================block的基本使用=========================================//
    /*
     blocl 是一个数据类型 所以可以声明一个block类型的变量
     声明block变量的语法格式
     返回值类型 （^blcok变量的名称）(参数列表)
     void (^myblock1)()表示声明了一个block类型的变量叫做myblock1 这个变量中
     只能存储没有返回值没有参数的代码
     
     int(^myblock2)();
     int(^myblock3)(int num1,int num2)
     
     一 初始化block变量
     代码段的书写格式
     1.
     ^返回值类型(参数列表){
      代码段
     };
     2.写一个无参数无返回值的代码段
     ^void(){
      代码段
     };
     
     3 如何执行存储在blocl变量中的代码段
      语法格式  block变量名();
     */
    /*
    int a = 10;
    void(^block)(void) = ^{
        
        NSLog(@"LD====%d",a);
    };
    block();

    NSLog(@"%@",block);
    NSLog(@"%@",^{
        
        NSLog(@"LD1====%d",a);
    });
     */
    /*
    int(^myblock)(int n1,int n2)=^int(int n1,int n2){
        
        int num =n1+n2;
        return  num;
    };
     或者下面
     */
   /*
    int(^myblock)(int n1,int n2);
    myblock=^int(int n1,int n2){
        
        int num =n1+n2;
        return  num;
    };
    
  int k =  myblock(4,3);
   */
    //===============================block的基本使用====================================//
    
    //===============================block的简写====================================//
   /* 等号右边这里的void可以省略（blcok如果没有返回值，代码段的void可以省略）
    如果代码段没有参数 代码段的小括弧也可以省略
    既void 又没有参数 可以直接^这个符号
    
    
    
    
    void(^block)(void) = ^{
        
        NSLog(@"LD====%d",a);
    };
    block();
    
    
    无论代码段中是否有返回值 在写代码的时候  可以不写返回值类型 省略 ，系统会自动确定返回值类型
    
    
    int(^myblock)(int n1,int n2)=^(int n1,int n2){
        
        int num =n1+n2;
        return  num;
    };
    */
    //===============================block的简写====================================//
    
    //===============================使用typedef将复杂的blcok定义简化====================================//
    /*
    typedef 返回值类型(^新类型) (参数列表);
    typedef  void(^newtype)()  代表重新定义了一个类型叫做
    newtype 是一个block类型 无参数无返回值的block类型
    
    newtype block1；
    newtype block2；
    
     */
    //===============================使用typedef将复杂的blcok定义简化====================================//
    
    //===============================block内部访问外部变量的问题====================================//
    /*
        在block代码块的内部可以访问定义在全局变量的值 可以访问定义在外部的局部变量的值
        在block代码块的内部可以修改定义在全局变量的值  但是不可以修改定义在外部的局部变量的值
       如果你希望在block代码块内部修改定义在外部的局部变量的值，那么在该外部局部变量前面加 __block修饰符就可以了
                */
    //===============================block内部访问外部变量的问题====================================//
    
    //===============================block作为函数的参数====================================//
    /*
        block是一个数据类型，可不可以作为函数的参数呢？当然是可以的
        如何为函数定义block类型的参数？
          a 就是在小括弧声明一个指定格式的block变量就可以了
          b  可以使用typedef来简化定义，这样看起来就不会晕了
     
        如何调用带blcok参数的函数呢？
            a 如果调用的函数的参数是blcok类型的 那么要求在调用的时候传入一个和形参blcok要求的代码段
            b 调用的时候  可以先将代码段存储到一个block变量中，然后再传递这个blcok变量，也可以直接将符合要求的代码段下载小括弧中传递
     这里是c语言写法  如果是oc的，那么blcok作为函数参数，block变量名写在外面 ，类似nsstring那样
        void test（void(^myblcok)()）{myblcok()}
      或者 typedef  void(^myblcok)()
      void test（myblock n1） { n1()}
     最后 int main {
     
      myblock n2 = ^{ nslog(===)}
       test(n2)
      或者
       test(^{ nslog(===)})
     
     }
     
     
     */
    
    
    
    //===============================block作为函数的参数====================================//
    
    //===============================block作为函数的参数应用案例一二去参考视频====================================//
    
    /**/
    
    //===============================block作为函数的参数应用案例一二去参考视频====================================//
    
    
    //===============================block作为函数的返回值===================================//
    
    /*
        当blcok作为函数的返回值时，block的类型需要用typedef去简化(也就是要变为短类型)，不然编译器会哭晕😂，认不出，编译不通过
     
     */
    //===============================block作为函数的返回值===================================//
}


@end
