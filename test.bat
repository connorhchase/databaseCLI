@echo off
setlocal enabledelayedexpansion
echo Welcome to the database CLI interface! Note: This must be run as administrator, as the postgresql folder requires administrator permissions to change.
echo Select an option:
echo 1. Insert Data
echo 2. Delete Data
echo 3. Update Data
echo 4. Search Data
echo 5. Aggregate Functions
echo 6. Sorting
echo 7. Joins
echo 8. Grouping
echo 9. Subqueries
echo 10. Transactions
echo 11. Error Handling
echo 12. Exit
set /P choice=Enter your choice: 
if "%choice%" == "1" (
	echo You have selected: Insert.
	echo Please type the table name you would like to insert into.
	set /P insertTable=Enter: 
	echo Please type the names of the columns you would like to insert into, separated by commas, using * for all columns.
	set /P insertcols=Enter:
	if "!insertcols!" == "*" (set "insertcols=") else (set "insertcols=(!insertcols!)")
	echo Please type the values you would like to insert into those columns, in the same order as you entered the columns, separated by commas.
	set /P insertvals=Enter:
	echo psql -U postgres -d supermarket -c "INSERT INTO !insertTable!!insertcols! VALUES (!insertvals!)"
)
if "%choice%" == "2" (
	echo You have selected: Delete.
	echo Please type the table name you would like to delete from.
	set /P deleteTable=Enter: 
	echo Please type the conditions for deletion.
	set /P deleteWhere=Enter:
	echo psql -U postgres -d supermarket -c "DELETE FROM !deleteTable! WHERE !deleteWhere!"
)
if "%choice%" == "3" (
	echo You have selected: Update.
	echo Please type the table name you would like to update.
	set /P updateTable=Enter: 
	echo Please type what column(s) you would like update, and what to update the data to, using commas to separate the equalities.
	set /P updateSet=Enter:
	echo Please type the conditions for deletion.
	set /P updateWhere=Enter:
	echo psql -U postgres -d supermarket -c "UPDATE !updateTable! SET !updateSet! WHERE !updateWhere!"
)
if "%choice%" == "4" (
	echo You have selected: Search.
	echo Please type the table name you would like to search through.
	set /P searchTable=Enter: 
	echo Please type the names of the columns you would like to receive, separated by commas, using * for all columns.
	set /P searchCols=Enter:
	echo Please type the conditions for the search.
	set /P searchWhere=Enter:
	echo psql -U postgres -d supermarket -c "SELECT !searchCols! FROM !searchTable! WHERE !searchWhere!"
)
if "%choice%" == "5" (
	echo You have selected: Aggregate Functions.
	echo Please type the table name you would like to aggregate from.
	set /P aggTable=Enter: 
	echo Please type the names of the column you would like to aggregate, separated by commas, using * for all columns (count only).
	set /P aggCol=Enter:
	echo Please type the number of the aggregate function you would like to use.
	echo 1. Average
	echo 2. Count
	echo 3. Max
	echo 4. Min
	echo 5. Sum
	set /P aggFunc=Enter:
	if %aggFunc% == "1" (
		echo psql -U postgres -d supermarket -c "SELECT AVG(!aggCol!) FROM !aggTable!"
	)
	if %aggFunc% == "2" (
		echo psql -U postgres -d supermarket -c "SELECT COUNT(!aggCol!) FROM !aggTable!"
	)
	if %aggFunc% == "3" (
		echo psql -U postgres -d supermarket -c "SELECT MAX(!aggCol!) FROM !aggTable!"
	)
	if %aggFunc% == "4" (
		echo psql -U postgres -d supermarket -c "SELECT MIN(!aggCol!) FROM !aggTable!"
	)
	if %aggFunc% == "5" (
		echo psql -U postgres -d supermarket -c "SELECT SUM(!aggCol!) FROM !aggTable!"
	)
)
if "%choice%" == "6" (
	echo You have selected: Sorting.
	echo Please type the table name you would like to search through.
	set /P sortTable=Enter: 
	echo Please type the names of the columns you would like to receive, separated by commas, using * for all columns.
	set /P sortCols=Enter:
	echo Please type the name of the column you would like to sort by.
	set /P sortingCol=Enter:
	echo Please type the number of the option you would like to choose.
	echo 1. Ascending
	echo 2. Descending
	set /P ascDesc=Enter:
	if %ascDesc% == "1" (
		echo psql -U postgres -d supermarket -c "SELECT !sortCols! FROM !sortTable! ORDER BY !sortingCol! ASC"
	)
	if %ascDesc% == "2" (
		echo psql -U postgres -d supermarket -c "SELECT !sortCols! FROM !sortTable! ORDER BY !sortingCol! DESC"
	)
)
if "%choice%" == "7" (
	echo You have selected: Joins.
	echo Please type the first table name you would like to join.
	set /P joinTable=Enter: 
	echo Please type the second table name you would like to join.
	set /P joinTable2=Enter: 
	echo Please type the names of the columns you would like to receive, separated by commas, using * for all columns.
	set /P joinCols=Enter:
	echo Please choose the type of join you would like:
	echo 1. Inner Join
	echo 2. Left Join
	echo 3. Right Join
	set /P joinType=Enter:
	if %joinType% == "1" (
		echo Please choose the first column name to join on
		set /P joinCol1=Enter:
		echo Please choose the second column name to join on
		set /P joinCol2=Enter:
		echo psql -U postgres -d supermarket -c "SELECT !joinCols! FROM !joinTable! INNER JOIN !joinTable2! ON !joinTable!.!joinCol1! = !joinTable2!.!joinCol2!"
	)
	if %joinType% == "2" (
		echo Please choose the first column name to join on
		set /P joinCol1=Enter:
		echo Please choose the second column name to join on
		set /P joinCol2=Enter:
		echo psql -U postgres -d supermarket -c "SELECT !joinCols! FROM !joinTable! LEFT JOIN !joinTable2! ON !joinTable!.!joinCol1! = !joinTable2!.!joinCol2!"
	)
	if %joinType% == "3" (
		echo Please choose the first column name to join on
		set /P joinCol1=Enter:
		echo Please choose the second column name to join on
		set /P joinCol2=Enter:
		echo psql -U postgres -d supermarket -c "SELECT !joinCols! FROM !joinTable! RIGHT JOIN !joinTable2! ON !joinTable!.!joinCol1! = !joinTable2!.!joinCol2!"
	)

)
if "%choice%" == "8" (
	echo You have selected: Grouping.
)
if "%choice%" == "9" (
	echo You have selected: Subqueries.
)
if "%choice%" == "10" (
	echo You have selected: Transactions.
)
if "%choice%" == "11" (
	echo You have selected: Error Handling.
)
if "%choice%" == "12" (
	echo You have selected: Exit.
)
echo Thank you, goodbye!
cmd /k