
                                                # practiced shell scripting programs 

#! /bin/bash
echo "Hello World" # this is a comment
cat /etc/shells
cd Desktop/

# system defined

echo $BASH 
echo $BASH_VERSION
echo $HOME
echo $PWD

# user defined

name=Suraj
echo The name is $name

# input from user

echo "enter name:"
read inname
echo "entered name: $inname"
echo "enter 2 names:" # multiple variables
read inname1 inname2
echo "entered names: $inname1 , $inname2" 
read -p 'username: ' user_var # w/o echo command to get input
echo "username: "$user_var 
read -sp 'password: ' pass_var # to keep the text censored
echo #the o/p will be printed sequentially...acts like newline
echo "password: "$pass_var
echo "enter names: " # in take array elements
read -a names
echo "names are ${names[0]} , ${names[1]}"
read -p 'lenter: ' # when no variable is provided, result is stored in REPLY variable
echo "lenter: $REPLY"

# to take arguments

echo $1 $2 $3 '> echo $1 $2 $3' # $0 provides name of the script file and extension
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]} ${args[3]} #prints the arguments
echo $@ #prints the arguments
echo $# # number of arguements

# integer comparison

# -eq - is equal to - if [ "$a" -eq "$b" ]
# -ne - is not equal to - if [ "$a" -ne "$b" ]
# -gt - is greater than
# -ge - greater than or equal to
# -lt - less than
# -le - less than or equal to
# < - is less than - (("$a" < "$b"))
# similarly <=      >        >=

# string comparison

# = - is equal to - if [ "$a" = "$b" ]
# ==
# !=
# < - if [[ "$a" < "$b" ]]
# >
# -z - string is null


# if-then   else    elif-then
   
count=10

if [ $count -gt 10 ]
then echo "condition true"
else echo "condition false"
fi

# files

echo -e "enter filename: \c" # \c is used to present cursor in the same line instead of next line
read filename

if [ -e $filename ]
then
 echo "file exists"
else
 echo "file doesn't exist"
fi

# -f for file exists and it's a regular file
# -d for directory existence
# both of the above flags should be used inside if only

echo -e "enter filename: \c" # \c is used to present cursor in the same line instead of next line
read filename

if [ -d $filename ]
then
 echo "file exists"
else
 echo "file doesn't exist"
fi

# files are 2 types : character file and block file
# texts are character file
# music, pictures, etc are block files
# -b flag is for block file and -c flag is used for character file
# both of the above mentioned flags are used inside if only
 

mkdir dir # to create a new directory named dir

# -s flag is used inside if to check if the file has any contents or not

touch test
cat > test # to write contents inside file test

# -r      -w      -x     flags are used to check permission for read, write and execute respectively

# ls command to check what files are present in the directory
# ls -l to check the directories present
# cat > test command overwrites contents in test
# cat >> test command appends contents to test
# ls -al command is used to check the permissions of the files and directories
# ctrl+d command is used to terminate cat command

# files

echo -e "enter filename: \c" # \c is used to present cursor in the same line instead of next line
read filename

if [ -f $filename ]
then
 if [ -w $filename ]
 then
  echo "write contents to append and ctrl+d to quit"
  cat >> $filename
 else
  echo "no write permission"
 fi
else
 echo "file doesn't exist"
fi

# -a flag is used for AND logic in looping and conditional statements
# example if [ "$a" -gt 18 -a "$a" -lt 30 ]
# similarly -o flag is used for OR logic

# arithmetic operations

num1=20
num2=5

echo $(( num1 + num2 ))
echo $(expr $num1 + $num2 )

# similarly   - * % / can be performed
# note : sometimes * needs to be given as \*

man ls # gives notes on the ls command and its syntax
man bc # gives info on the bc (basic calculator) command
 
# arithmetic operations on decimals

num1=20.5
num2=5

echo "$num1+$num2" | bc
echo "$num1-$num2" | bc
echo "$num1*$num2" | bc
echo "scale=2;$num1/$num2" | bc     # output w/o scale is 4 ... output w/ scale=2 is 4.10 
echo "$num1%$num2" | bc

# square root and squares

num=4
echo "scale=2;sqrt($num)" | bc -l   # -l is similar to mathlib function library
echo "scale=2;3^3" | bc -l


# case expressions

vehicle=$1

case $vehicle in
   "car" )
       echo "cost of $vehicle is 10" ;;
   "van" )
       echo "cost of $vehicle is 20" ;;
   "bicycle" )
       echo "cost of $vehicle is 30" ;;
   "truck" )
       echo "cost of $vehicle is 40" ;;
    * )
       echo "default cost is 25" ;;
esac


LANG=C  # to identify upper case aplabets

echo -e "enter a character: \c"
read value

case $value in
  [a-z] )
     echo "small case alphabet" ;;
  [A-Z] )
     echo "upper case alphabet" ;;
  [0-9] )
     echo "number" ;;
      ? )
     echo "special character" ;;
      * )
     echo "unknown input" ;;
esac

# ? represents all spl. symbols. refer regular expressions for more on this topic



#  variables as arrays

string=qwertyuiop
echo "${string[@]}"
echo "${string[0]}"
echo "${string[1]}"
echo "${#string[@]}"



# while loops

n=1

while [ "$n" -le 10 ]
do
  echo "$n"
  n=$(( n+1 ))
done

# when using [ ] in if or while loops, use flags like -le -ge -eq ...
#when using (( )) use < > == ....



# sleep command

n=1

while [ "$n" -le 10 ]
do
  echo "$n"
  n=$(( n+1 ))
  sleep 1  # output is stalled for 1 second...
done
 
 # to terminate infinite loops press ctrl+c



# gnome-terminal &  -- command

n=1

while [ "$n" -le 3 ]
do
  echo "$n"
  n=$(( n+1 ))
  gnome-terminal &  # 3 (loop) terminals are opened...
done
 
# similarly xterm &   --   command can be used...


# read contents of a file to include all spl characters

while IFS=' ' read -r line # IFS captures indentations and -r flag excludes escape sequences and backslashes
do
 echo $line
done < nhello.sh
 # IFS stands for Internal Field Seperator


# read contents of a file

while read line
do
 echo $line
done < nhello.sh   # path or name of file



# read contents of a file word by word

cat nhello.sh | while read line
do
 echo $line
done 



# until loop
#the statements in while is executed if condition is true
#statements in until loop is executed when the condition is false

n=1
until [ $n -gt 10 ]
do
 echo $n
 (( ++n ))
done


# for loop

for i in 1 2 3 4 5
do
 echo $i
done

for i in {1..10}  # limits
do
 echo $i
done

for i in {0..10..2} # incrementer or offset
do
 echo $i
done


for (( i=0; i<5; i++ ))
do
 echo $i
done


# for loop using commands

for command in ls pwd date
do
 echo "........................$command.........................."
 $command
done


# to print all the directories


for item in *
do
 if [ -d $item ]
 then
  echo $item
 fi
done



# select loop

select name in mark joe ryan shane andrew
do
 case $name in
   mark )
     echo mark selected ;;
   joe )
     echo joe selected ;;
   ryan )
     echo ryan selected ;;
   shane )
     echo shane selected ;;
   andrew )
     echo andrew selected ;;
 esac
done

# output:

#suraj@suraj04:~/Desktop$ ./nhello.sh
#1) mark
#2) joe
#3) ryan
#4) shane
#5) andrew
##? 3
#ryan selected
##? 5
#andrew selected
##? 1
#mark selected
##? 2
#joe selected
##? ^C
#suraj@suraj04:~/Desktop$ 

# note: to exit press ctrl+c





# functions

function print()
{
echo "hello world"
}


# functions with arguments

function print1()
{
echo $1
value=$1
echo $value
}

print
print1 args_new


#output :

#suraj@suraj04:~/Desktop$ ./nhello.sh
#hello world
#args_new
#args_new
#suraj@suraj04:~/Desktop$ 



# by default all variables (even inside functions) are global
#hence we use "local" command / keyword

function hprint()
{
name=$1
echo $name
}

name="chandler"
echo "before funct call : $name"
hprint joey
echo "after funct call : $name" 


#output :

#suraj@suraj04:~/Desktop$ ./nhello.sh
#before funct call : chandler
##joey
#after funct call : joey
#suraj@suraj04:~/Desktop$ 



# function using local keyword

function hprint()
{
local name=$1
echo $name
}

name="chandler"
echo "before funct call : $name"
hprint joey
echo "after funct call : $name" 


#output :

#suraj@suraj04:~/Desktop$ ./nhello.sh
#before funct call : chandler
#joey
#after funct call : chandler
#suraj@suraj04:~/Desktop$ 


#  $# command provides the number of arguments



# functions example

usage(){
echo "you need to provide an argument:"
echo "usage : $0 file_name"
}

function does_file_exist(){
local file=$1
if [ -f "$file" ] 
then
 return 0 
else
 return 1
fi
}


if [ $# -eq 0 ]
then
 usage
fi

if ( does_file_exist "$1")
then
 echo "file found"
else
 echo "file not found"
fi

#output :

#suraj@suraj04:~/Desktop$ ./nhello.sh file.txt
#file not found
#suraj@suraj04:~/Desktop$ ./nhello.sh file1.txt
#file found








