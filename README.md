# rdyDEV
![main](https://github.com/m0xfff/rdyDEV/actions/workflows/main.yml/badge.svg?branch=main)

This project is aimed at onboarding developers onto Ruby on Rails development, specifically Rails 4.2. The *MySMS* project is a student management system that allows the user to perform various CRUD (Create, Read, Update, and Delete) operations on students and their related data.

## Resources
- MySMS project: https://jobready.atlassian.net/wiki/spaces/RTO/pages/1763213973/Rails+Project+MySMS
- Ruby on Rails documentation: https://guides.rubyonrails.org/v4.2/
- RSpec documentation: https://rspec.info/documentation/
- MySQL documentation: https://dev.mysql.com/doc/

## Getting Started
To get started with this project, you can create a repository using this repository *rdyDEV* as a template. Once you have created your repository, you can edit the project using GitHub Codespaces, which allows you to develop and test your code in the cloud. You can also clone the repository to your local machine and work on it there, but GitHub Codespaces is recommended as abstracts away the nitty gritty details of managing your development environment.

To edit the project using GitHub Codespaces:

- Open your repository on GitHub and click on the "Code" button.
- Click on the "Open with Codespaces" button and select the "New codespace" option.
- Wait for the codespace to be created, and then you can start editing the project using the web-based IDE.

## Basic Tools
The following tools are used in this project:

- Rails console: The Rails console is a command-line tool that allows you to interact with your Rails application's models and data. You can run the Rails console by typing `bin/rails console` in the terminal.
- Rails server: The Rails server is a local web server that allows you to test your application in a web browser. You can start the Rails server by typing `bin/rails server` in the terminal.
- MySQL CLI: The MySQL CLI is a command-line tool that allows you to interact with your MySQL database. You can run the MySQL CLI by typing `mysql` in the terminal.
- RSpec: RSpec is a testing framework for Ruby that allows you to write automated tests for your application. You can run the RSpec tests by typing `bundle exec rspec <path/to/a/spec.rb>` in the terminal.

## Git Workflow
The Git workflow for this project is as follows:

1. Create a new branch off the develop branch.
2. Make changes to your code and commit them to your branch.
3. Push your branch to GitHub.
4. Create a pull request (PR) from your branch to the develop branch.
5. Assign at least two people to review your PR.
6. Once your PR has been approved by at least two people and all tests pass, you can merge your changes into the develop branch.

It is important to create a new branch for each new feature or bug fix to keep the codebase organized and to make it easier to roll back changes if needed. It is also important to write automated tests for your code to ensure that it works as expected and to catch any regressions that may be introduced by future changes.

Each task in the *MySMS* project should be completed in it's own branch.
