# DBC U Soon 

Visit the site - http://dbc-u-soon.herokuapp.com/

![Coverage Status](http://img.shields.io/coveralls/haml/haml.svg)
[![Build Status](https://travis-ci.org/aus-red-pandas-2016/Team-JTstream.svg?branch=master)](https://travis-ci.org/aus-red-pandas-2016/Team-JTstream)

## Team-JTstream

### Team Members

- Jess Bohn - jessbohn
- Tom Ho - TomHoDev
- TJ Oyeniyi - tjoye20
- Jay Pelletier - lukin41280

### Project Description

This app allows students and mentors to collaborate on times to mentor each other and change the world.  

### Installation 
To install the app to your local computer run

    git clone https://github.com/aus-red-pandas-2016/Team-JTstream.git
Switch into the app directory

    cd /dbc_mentor
Install of the necessary gems

    bundle install
Create and migrate your database

    rake db:create
    rake db:migrate

### How To Use

Users must register first.  A user can register as a student or as a mentor.  Mentors must register with an access code that is given by the school.  Once logged in, a student can view available time slots set up by mentors and other students.  Clicking the sign up button will allow the student to type in a request of items they wish to cover in their mentor session.  When sign up is complete, the appointment availibility is no longer visable in the main page.  Students may also set up their own mentor sessions to aide other students in the learning process.  Once a session is complete, both students and mentors can provide feedback to one another on how the session went.  The receiver of the feedback will be able to view comments in their profile page
