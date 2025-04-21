# Welcome to MyBaseCamp2  
***

## Task  
Extend the MyBaseCamp1 project by adding collaboration features such as file attachments, discussion threads, and messages inside threads.  
The challenge is to manage user permissions and roles, enable secure file uploads, and create a smooth user experience while keeping the project organized and scalable.

## Description  
This project builds upon MyBaseCamp1 by introducing:
- **Attachments**: Any user associated with a project can upload files (png, jpg, pdf, txt).
- **Threads**: Only project admins can start new discussion threads inside a project.
- **Messages**: Any project user can post messages inside a thread.
These features encourage collaboration and communication inside each project. We use Ruby on Rails, Tailwind CSS for styling, and ActiveStorage for file handling. The app is hosted in the cloud with role-based access controls.

## Installation 
Make sure you have the following installed:
Ruby 
Rails
PostgreSQL
Node.js & Yarn → Required for managing assets

$> npm install -g yarn 
Clone the repo and install dependencies:
git clone https://github.com/yourusername/mybasecamp2.git
cd mybasecamp2

** Install all Dependencies
bundle install
yarn install
bin/rails db:setup

** Database Setup
Run the following commands to set up the database:
$> rails db:create  
$> rails db:migrate  

** Start the Rails Server
Run the Rails server to start the application:
$> rails server
By default, the app will be available at http://localhost:3000

## Usage
Once the project is set up and running, users can interact with the application based on their roles and permissions.
1. Roles & Permissions
I have two types of Users, regular User and Admin user.
Admin Users have full access to manage other users.
Regular Users have access to their personal dashboard.
Role-based access control is implemented to restrict unauthorized actions.
2. Navigation
** Home Page: The landing page welcomes visitors and provides login/signup options.
** User Dashboard (Authenticated Users)
After logging in, users are redirected to their dashboard.
Where they can view and create a project, view and manage their profile (edit name, email, profile bio, etc.).
Any personalized content or user-specific features will be displayed here.
Admin Panel (For Admins Only)
Admins can view a list of all users.
They can delete user accounts as needed.
** LogOut
Users can log out anytime using the "Log Out" button, which redirects them back to the home page.

NB: This project has been deployed on Render, to run it locally change your database.yml
To start the Rails server and access the app:
```
$> rails server
or
On a Browser enter: https://my-basecamp-2-p0dx.onrender.com


### The Core Team
Programmer: Noah Ezekiel


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>
