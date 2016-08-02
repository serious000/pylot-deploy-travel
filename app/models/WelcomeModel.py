from system.core.model import Model

from flask import Flask, request, redirect, render_template, session, flash
import re
import os,binascii
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
NAME_REGEX = re.compile(r'^[a-zA-Z]+$')

class WelcomeModel(Model):
    def __init__(self):
        super(WelcomeModel, self).__init__()

    def add_one_user_m(self, new_user_details):
            password = new_user_details['f_password']
            hashed_pw = self.bcrypt.generate_password_hash(password)
            add_query = "INSERT INTO users (name, email, pw_hash, created_at, updated_at) \
            VALUES (:spec_name, :spec_email, :spec_pw_hash, NOW(), NOW())"
            add_data = { 
            'spec_name': new_user_details['f_name'],
            'spec_email': new_user_details['f_email'],
            'spec_pw_hash': hashed_pw
            }
            return self.db.query_db(add_query, add_data)



    def logincheck_m(self, user_info):
        errors=[]
        if not user_info['email']:
            errors.append('Email cannot be blank')
        elif not EMAIL_REGEX.match(user_info['email']):
            errors.append('Email format must be valid!')
        if not user_info['password']:
            errors.append('Password cannot be blank')
        if errors:
            return {"status": False, "errors": errors}
        user_query = "SELECT * FROM users WHERE email = :email LIMIT 1"
        user_data = {'email': user_info['email']}
        user = self.db.query_db(user_query, user_data)
        if user:
           # check_password_hash() compares encrypted password in DB to one provided by user logging in
            if self.bcrypt.check_password_hash(user[0]['pw_hash'], user_info['password']):
                return {"status": True, "user": user[0]}
        errors.append('User was not found in database. Please try a different user name/password combination or click on register below')
        # Whether we did not find the email, or if the password did not match, either way return False
        return {"status": False, "errors": errors}



    def travels_m(self, user_id):
        # Find your trip schedules
        sel_query1 = "SELECT users.id, trips.destination, trips.start_date, trips.end_date, trips.description \
        FROM trips LEFT JOIN participants ON trips.id=participants.trip_id \
        LEFT JOIN users ON users.id=participants.user_id \
        WHERE users.id=:spec_id"
        sel_data1 = {'spec_id': user_id}
        trips_sched_self = self.db.query_db(sel_query1, sel_data1)
        # Find your trip schedules
        sel_query2 = "SELECT users.id, users.name, trips.destination, trips.start_date, \
        trips.end_date, trips.description, trips.id AS trip_id \
        FROM trips LEFT JOIN participants ON trips.id=participants.trip_id \
        LEFT JOIN users ON users.id=participants.user_id \
        WHERE users.id<>:spec_id"
        sel_data2 = {'spec_id': user_id}
        trips_sched_other = self.db.query_db(sel_query2, sel_data2)
        trip_info= [trips_sched_self,trips_sched_other]
        return trip_info

    def add_one_m(self, user_id, newtrip_info):
        add_query = "INSERT INTO trips (destination, description, start_date, end_date,created_at, updated_at) \
        VALUES (:spec_dest, :spec_desc, :spec_start_date, :spec_end_date, NOW(), NOW())"
        add_data = {
        'spec_dest': newtrip_info['f_dest'],
        'spec_desc': newtrip_info['f_desc'],
        'spec_start_date': newtrip_info['f_start_date'],
        'spec_end_date': newtrip_info['f_end_date']
        }
        self.db.query_db(add_query, add_data)
        return

    def tripsd_m(self, user_id, t_id):
        sel_query1 = "SELECT users.id, users.name AS planner, trips.name, trips.destination, trips.start_date, \
        trips.end_date, trips.description \
        FROM trips LEFT JOIN participants ON trips.id=participants.trip_id \
        LEFT JOIN users ON users.id=participants.user_id \
        WHERE trips.id=:spec_id LIMIT 1"
        sel_data1 = {'spec_id': t_id}
        spec_trip_info = self.db.query_db(sel_query1, sel_data1)
        print "TTTTTT", spec_trip_info
        # more_details = [spec_trip_info]
        return spec_trip_info


