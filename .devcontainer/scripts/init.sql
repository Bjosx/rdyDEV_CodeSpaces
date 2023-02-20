-- Currently, the SQLTOOLS extension does not support MySQL8 authentication, hence `mysql_native_password`
CREATE USER 'vscode'@'%' IDENTIFIED WITH mysql_native_password BY 'vscode';
GRANT ALL PRIVILEGES ON *.* TO 'vscode'@'%' WITH GRANT OPTION;
CREATE DATABASE vscode;
ALTER DATABASE vscode OWNER TO 'vscode';