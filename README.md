This is a take home task. We will go through the following 4 steps. All of these were done on Ubuntu Linux.

1. How many lines are in this file?
2. How many “Z” Characters are in this file ?
3. Find on which line  “Junior”, “Platform” and “Engineer” are on,not case
sensitive.
4. Change “Junior” to “Senior”.

1.There are 98 lines in file.txt
Getting the number of lines can be achieved in multiple ways. 

One method is to run a one line command, naviagte to the directory where your file.txt is located and run the following:

``` wc -l file.txt```  wc=word count  -l=lines

![wc_line_count](https://github.com/ilknurm/take_home_task/blob/main/images/wc_line_count.png)

The first column represents the line count and the second is the name of the file.

A second way to achieve the same goal is by opening the file opening the file in a text editor and typing:

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

![z_count](https://github.com/ilknurm/take_home_task/blob/main/images/total_Z.png)

3.To find the lines on which the words 'Junior','platform' and 'engineer' are on again we would use the grep command.

``` grep -ion -e 'junior' -e 'platform' -e 'engineer' ```

The -e option will enable grep to search for each pattern and the -n the option will give us a number line output.

![find_words](https://github.com/ilknurm/take_home_task/blob/main/images/find_words.png)

4. Finally we need to change the word Junior to Senior. This can be achieved with the stream EDitor(sed)

``` sed -i 's/Junior/Senior/g' file.txt ``` -i = edit file in place

![Changed](https://github.com/ilknurm/take_home_task/blob/main/images/changed.png)

Again running the ```sed --help``` command will give you an output of flags that can be used with sed.

That is all.
I hope you enjoyed this tutorial.








