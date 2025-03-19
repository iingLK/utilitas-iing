# carix.bat
## project name
cari x
## brief overview
untuk yang sering make locate32, ini versi batch penggunaan CLI nya.
```
This is a Windows batch script (carix2.bat) designed to perform file searches using specific parameters and databases. Here's a brief overview:

Purpose:
The script processes input parameters to search for files in specified databases using tools like grep, sed, and locate. It generates output files containing the search results.

Key Features:

Parameter Handling:
The script accepts parameters like local, nas, omega, jargon, or all to determine the scope of the search. It also supports direct string inputs or file-based inputs.
Database Creation:
A function (:create_database_file) generates a temporary database file based on the input parameter.
Search Execution:
It uses tools like grep, sed, and locate to perform searches and format the results.
Output Management:
Results are saved to a uniquely named output file (__<number>__<timestamp>_hasil_<param>.txt) and displayed.
Dependencies:
The script relies on Unix-like tools (tr, grep, sed, gawk, etc.), likely provided by a Windows compatibility layer like Cygwin or WSL.

Error Handling:
If no parameters are provided, it displays usage instructions.

Structure:

Main Logic: Processes input parameters, creates a database, and performs searches.
Functions: Contains a labeled function (:create_database_file) to handle database file creation.
Output:
The script generates a text file with search results and cleans up temporary files afterward.

This script is tailored for advanced file searching and requires specific tools and configurations to work correctly.
```
## problem
nyari secara gui kadang kurang efisien, biasanya saya butuh batch searching secara berurutan. kalo gui satu satu
## current solution
buka gui satu persatu, banyak klik2.
## tech development
ini sebenernya make busybox dan cmd tapi bisa juga di port make full python. karena sebenernya itu cuma gitu
## propose solution
mengeksploitasi CLI nya locate32, pake carix.bat ini
## implementation
tinggal ketik carix.bat lalu baca help nya. install dulu busybox, yang dipake 
file: carix2.bat
nix:  paste tail tr gawk grep sed
win:  call del dir echo endlocal for goto if ren set setlocal start type
bat:  carix timed gawk
## evaluation
ini sih keren kata saya, state of the art lah. make labeling di batch kayak function, localize variable.
kalo bisa ngerti ini bisa manipulasi text di cmd atau dimanapun atau di luar angkasa