"""
    Sample Controller File

    A Controller should be in charge of responding to a request.
    Load models to interact with the database and load views to render them to the client.

    Create a controller using this template
"""
from system.core.controller import *
from flask import Flask, request, redirect, render_template, session, flash
import re
import os,binascii
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
NAME_REGEX = re.compile(r'^[a-zA-Z\s]+$')

class Welcome(Controller):
    def __init__(self, action):
        super(Welcome, self).__init__(action)
        """
        This is an example of loading a model.
        Every controller has access to the load_model method.
        """
        self.load_model('WelcomeModel')
        self.db = self._app.db

        """
        
        This is an example of a controller method that will load a view for the client 

        """
   
    def index(self):
        return self.load_view('index.html')

    def add(self):
        # print "REQUEST.FORM IS", request.form
        user_details = request.form
        valid=True
        # if (len(user_details['f_name']) < 2) or (not NAME_REGEX.match(user_details['f_name'])):
        # if (len(user_details['f_email']) < 1) or (not EMAIL_REGEX.match(user_details['f_email'])):
            # valid=False
            # flash("Invalid Email Address!",'error')
        if (len(user_details['f_name']) < 3) or (not NAME_REGEX.match(user_details['f_name'])):
            valid=False
            flash("Invalid name!",'error')
        if (len(user_details['f_email']) < 3):
            valid=False
            flash("Invalid Username!",'error')
        if len(user_details['f_password']) < 8: 
            valid=False
            flash("Sorry, your password is less than 8 characters",'error')
        if user_details['f_password'] != user_details['f_pw_confirmation']:
            valid=False
            flash("Passwords must match!",'error')
        if valid==False:
            return redirect('/')
        else:
            self.models['WelcomeModel'].add_one_user_m(user_details)
            message = "Successfully registered! Please log in."
            flash(message, 'success')
            return redirect('/')
    
    def logincheck(self):
        user_info = {
            "email" : request.form['f_login'],
            "password" : request.form['f_password'],
        }

        login_status = self.models['WelcomeModel'].logincheck_m(user_info)
        if login_status['status'] == True:
            session['id'] = login_status['user']['id']
            session['name']= login_status['user']['name']
            # session['alias']= login_status['user']['alias']
            session['loggedin'] =1
            return redirect('/travels')
        else:
            for message in login_status['errors']:
                flash(message, 'login_errors')
            return redirect('/')



    def travels(self):
            info = self.models['WelcomeModel'].travels_m(session['id'])
            print "WWWWWWW", info
            return self.load_view('travels.html', info=info)
    
    def addtravel1(self):
        return self.load_view('addtravel.html')

    def add_one(self):
        newtrip_info = request.form
        info = self.models['WelcomeModel'].add_one_m(session['id'],newtrip_info)
        print "WWWWWWW", newtrip_info
        return redirect('/travels')

    def tripsd(self, t_id):
        t_info = self.models['WelcomeModel'].tripsd_m(session['id'], t_id)
        return self.load_view('destination.html', t_info=t_info)

    def logout(self):
        session.clear()
        return redirect('/')

