# arduino_class
Arduino課程展示程式
# 使用電路板

# Arduino 基本語法說明

簡介
在Arduino中，我們所編寫的草稿碼是基於C 和 C++ 進行設計改編的程式碼，而在程式結構則是基於Processing的程式語言及Writing的電子程式設計語言，來進行設計而成，而這兩框架都為開源框架。

註解
Arduino 的指令是繼承 C語言，與高階語言相似，而註解便是把所有註解內的文字省略

區塊註解
區塊註解:以/與/把註解內容包起來就好

/*
這是一段註解
*/
單行或行內註解
單行或行內註解: 在指令前使用//

//這個語法只能用於單行
//每一個新的註解都要重新使用
區塊註解:
通常我們會再一個區塊上新增一段註解來描述此程式，單行註解則用來描述特別的功能或是筆記：

//TODO: 接下來要做啥?
變數
跟其他高階語言相同，用於資料變數需具備三個元素: 名稱、數值、型態

int pin = 14;
從上面的範例可以看到，變數名稱為pin，而int是一個資料型態(下面會提到)，數值則為14。在之後的程式當中，所有的pin當中都會回到這邊來做此宣告，也就是都會過來拿取資料，而Arduino的命名規則只要在變數的第一個字不為數字即可

常數
在Arduino中當然也是有一些固定的變數名稱是內建宣告過的，以下就來進行說明:

HIGH、LOW : 在Arduino開發版使用數位腳位時，這些腳位的控制只會有兩種電壓，若有一個腳位他是輸出，當他的輸出為5V時，他為HIGH反之為LOW;而在輸入時，若輸入電壓高於3V則他則為HIGH，反之亦為LOW
false、true: 為布林變數中的對與錯
INPUT、OUPUT:代表著Arduino中的腳位輸出與輸入的狀態，INPUT為輸入，也就是將Arduino中所讀取到的內容回傳至電腦之中;而OUPUT則是將輸出電流到特定腳位之中。
資料型態
在程式語言當中有著各種資料型態的變數，而在Arduino當中也是有的，Arduino是採用標準C的資料型態。

void : 用於宣告函式，使用本關鍵字時不會回傳任何數值
void setup()
{
    //動作
}
boolean : 被定義為boolean的變數只能用有true與false兩種值
boolean ledState = false;
byte : 用於儲存8位元無號數，就是0至255間的任何數字
byte b = 0xff;
int : 用於儲存16位元or32位元的數值，並為Arduino主要儲存數值的資料型態。在特殊情況下當然也有可能用到Long、short這兩個數值型態(空間更大)
int varInt = 21423434;
long varLong = varInt;
short varShort = -1234
float : 此種資料結構用於儲存有小數點的資料，而他也稱為浮點數
float varFloat = 23.123123;
char : 此資料型態用於字元，字元也就是單[一個字母，他只占記憶體之中的1位元，在撰寫程式碼時，必須使用單引號
char myChar = 'A'
array : 被稱為陣列，他是一種可以用來儲存一堆變數的資料型態，而如果要去讀取array內的變數時，可以使用索引去讀取，他與C與C++中的陣列相同，也與python中的list相似。
int myArray[]={1,2,3};
int tempValue[5]={21,12,21,2};
char masgArray[12] = {"hello world"}
若要取值得話可以用下面方式去取值:

myArray[0]
>>> 1
masgArray[1]
>>>e
型態轉換
型態轉換用於我們想要把數值轉換成其他型態時使用，在Arduino中有以下幾種轉換方式:

char()
轉換成字元
byte()
轉換成位元
int()
轉換成整數
float()
轉換成浮點數
敘述
在Arduino中敘述部分與C相同，有著if/else、switch/case這種邏輯判斷式，也有while、gor這兩種迴圈的使用方式，下面直接將其語法寫於下方:

判斷
if else:
if(條件){}
else{}
範例:

if(a<b)
{
	println("a<b");
}
else
{
	println("a>b");
}
switch case:
switch (變數名稱或運算式) {
    case 符合數字或字元:
        陳述句一;
        break;
    case 符合數字或字元:
        陳述句二;
        break;
    default:
        陳述三;
}
範例:

switch(分數) {
        case 10:
        case 9:
        	println("A");
            break;
        case 8:
        	println("B");
            break;
        case 7:
        	println("C");
            break;
        case 6:
        	println("D");
            break;
        default:
        	println("E");
    }
迴圈
for:
for (初始值; 條件式; 更新值)
{
  指令一;
  指令二;
  指令三;
}
範例:

for(int i=0;i<=10;i++)
{
	println(i);
}
while:
while (條件式)
{
 指令一;
 指令二;
 指令三;
}
範例:

i = 0
while (i<100)
{
	println(i);
	i++;
}
函式
函式又稱為副程式，在Arduino中有一些已經幫我們定義好的函式，但是當我們遇到其他我們需要的函式但是Arduino沒有幫我們撰寫時，便需要我們自己去撰寫函式。而函式的好處便在於，可以讓我們更加輕鬆的去撰寫程式，以及在除錯時更加的快速。

以下先提供幾個Arduino所提供的函式:

setup()
在Arduino運作草稿碼時，首先會須卻引用setup函式，來將一些變數宣告、設定腳位、開發版驅動、初始化序列阜通訊等項目進行程式在執行前的準備工作都先做過一遍。而setup函式也只會在程式一開始時執行一次，後面便不會再執行，以下將以上一單元中的Blink草稿碼進行舉例:

void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
}
在setup函式中，他使用pinMode函式取指定Led的腳位狀態

loop
在setup函式執行後，Arduino便會開始執行loop函式，而loop函式正如他的名稱迴圈一樣，他會不斷地去執行一樣的動作，我們一樣以Blink草稿碼進行舉例:

p.s: loop可以直接去運用在setup已經設定好的變數。

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);                       // wait for a second
}
在上面的程式碼中，開發版會持續地去執行於loop內的程式，而已上便是持續開燈關燈的程式碼。

pinMode
在Arduino中，pinMode函式是用來做腳位設定的，而在Blink範例中，我們將LED_BUILTIN設定成OUPUT的狀態，便是pinMode函式的功能。

pinMode(LED_BUILTIN, OUTPUT);
使用腳位
在Arduino中，我們查需要去傳輸或是接收腳位的的資料，下面將提供幾個Arduino內建管理腳位的副函式

digitalWrite()
為IO腳位而設計，此功能將已經設置為output的腳位進行設定他的高低電壓，在Arduino中HIGH便式高電壓，他將輸出5V的電壓，而LOW則是低電壓，他將輸出0V，以下將進行舉例，我們將13腳位設定成HIGH的狀態
digitalWrite(13,HIGH);
digitalRead()
與digitalWrite類似，但是他的功能是讀取目前腳位的狀態
value = digitalRead(13);
analogRead()
此功能跟digitalRead一樣都會去讀取腳位的數值。但是他是用在讀取類比數位的數值，他的數值表示將以線性方式去對應到定位0到1023，而代表著0到5V的電壓

analogWrite()
此功能用在將數位訊號上產生類比輸出效果，而這種技術叫做PWM，我們將在後面介紹到，切記這個功能不能適用於所有的數位腳位，只適用於PWM腳位

自訂含式
在自訂函式部分，我們可以依造我們的目標去進行設計我們的函式，以下先給一下函示的標準式，而他跟C的副函式是相同的~

型態 函式名稱(傳入值1,傳入值2)
{
	程式1;
	程式2;
	return 回傳值;
}
在這邊我們舉一個次方的例子:

範例:

int pow(int n, int p)
{
    int r = 1;
    for(int i = 0; i < p; i++)
        r *= n;
    return r;
}
而已上便是我們一些函式的用法


參考資料取自 [Medium](https://medium.com/jeasee%E9%9A%A8%E7%AD%86/arduino-%E5%9F%BA%E6%9C%AC%E8%AA%9E%E6%B3%95-a6a580e1650b)
# 參考資料

https://cc.ee.ntu.edu.tw/~rbwu/rapid_content/course/IoT_Intro/Ch1_Arduino.pdf
