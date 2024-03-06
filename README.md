This is a take home task. We will go through the following 4 steps. All of these were done on Ubuntu Linux.

1. How many lines are in this file?
2. How many “Z” Characters are in this file ?
3. Find on which line  “Junior”, “Platform” and “Engineer” are on,not case
sensitive.
4. Change “Junior” to “Senior”.

The following steps can be done manually by running the commands in the terminal or you can write a bash script and run that. We will also look at the bash script.

1.There are 98 lines in file.txt
Getting the number of lines can be achieved in multiple ways but we'll look at two for now. 

One method is to run a one line command, naviagte to the directory where your file.txt is located and run the following:

``` wc -l file.txt```  wc=word count  -l=lines

![wc_line_count](https://github.com/ilknurm/take_home_task/blob/main/images/wc_line_count.png)

The first column represents the line count and the second is the name of the file.

A second way to achieve the same goal is by opening the file in a text editor and typing:

```:set number```

![set_number](https://github.com/ilknurm/take_home_task/blob/main/images/set_number.png)

Scroll to the bottom to see the line count.

2. There are a total of 44 capital Z's.

We can achieve this with the ``` grep ``` command. To get a list of helpful flags simply run ``` grep --help ``` in the terminal. This will show you a list of flags to run with grep.

![help](https://github.com/ilknurm/take_home_task/blob/main/images/help.png)

``` grep -o 'Z' file.txt | wc -l ```

This will give you the output 44. There are 44 capital Z's.


![44](https://github.com/ilknurm/take_home_task/blob/main/images/44.png)

To get the TOTAL number of 'Z' characters. We would need pass the -i flag to make it case insensitive.

``` grep -oi 'z' file.txt | wc -l ``` 
There are 98 Z characters (lower and upper case)

![z_count](https://github.com/ilknurm/take_home_task/blob/main/images/total_Z.png)

3.To find the lines on which the words 'Junior','platform' and 'engineer' are on again we would use the grep command.

``` grep -ion -e 'junior' -e 'platform' -e 'engineer' ```

The -e option will enable grep to search for each pattern and the -n the option will give us a number line output.

![find_words](https://github.com/ilknurm/take_home_task/blob/main/images/find_words.png)

4. Finally we need to change the word Junior to Senior. This can be achieved with the stream EDitor(sed)

``` sed -i 's/Junior/Senior/g' file.txt ``` -i = edit file in place

![Changed](https://github.com/ilknurm/take_home_task/blob/main/images/changed.png)

Again running the ```sed --help``` command will give you an output of flags that can be used with sed.


You can also write a bash script to auotmate the whole process so that you are not manullay running any commands. The script can be written in many different ways, depeding on how you choose to craft it.

The first part of the script makes sue that the file.txt is where it's supposed to be if that conditional is met then then it will continue with wc -l.
```if [ -e "$file_name" ]; then
    # Count the lines of the file
    line_count=$(wc -l < "$file_name")
    echo "1. The file $file_name has $line_count lines."```

The second part is to count the letter Z, both upper and lower

```# Count the total number of 'Z' characters
    z_count=$(grep -io 'Z' "$file_name" | wc -l)
    echo "2. Total number of 'Z' characters: $z_count/Z"
```
The third part can be done with grep as well, but if you would like to play around with it, I would recommend tyring awk, but you do not have to. You can use grep here as well.

The 'tolower' argument will convert all characters to lowercase oneach line. It then searches for the patterns junior,platform and senior.Once it has those patterns, it will print the number and entire line ($0).
```
echo "3. Lines containing 'junior,' 'platform,' and 'engineer':"
    awk 'tolower($0) ~ /(junior|platform|engineer)/ {print NR, $0}' "$file_name"
```
The final part is to change junior to senior then give us the line with the new word 'senior'.
```
sed -i 's/Junior/Senior/g' file.txt
    echo " Replacing junior with senior"
    awk 'tolower($0) ~ /(senior|platform|engineer)/ {print NR, $0}' "$file_name" ```


Once your script is written out, run ```chmod +x ``` this will make it executbale.
To run the script ```./<script_name>.sh``

The output should look like:

![script](https://github.com/ilknurm/take_home_task/blob/main/images/script.png)



That is all.
I hope you enjoyed this tutorial.








