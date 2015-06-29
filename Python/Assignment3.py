# -*- coding: utf-8 -*-
"""
Created on Mon Jun 29 11:39:24 2015

@author: Poonam
"""

from pandas import *
from ggplot import *
from datetime import *
from numpy import mean
from Utils import *

def plot_entries_by_hour(turnstile_weather):
    colourised_turnstile_wheather = colourise(turnstile_weather)
    p = ggplot(colourised_turnstile_wheather, aes(x='Hour', y='ENTRIESn_hourly'))
    point = geom_point(aes(colour='colour'))
    titles = ggtitle('Entries by Hour - Rain vs No-Rain') 
    return p + point + scale_x_continuous(limits=[0,23]) \
             + scale_y_continuous(limits=[0,60000]) \
             + titles \
             + xlab('Hour') + ylab('Entries')

def colourise(turnstile_whether):
    colourmap = {0: 'blue', 1: 'red'}
    turnstile_weather['colour'] = turnstile_weather['rain'].map(lambda x:  colourmap[x])
    return turnstile_weather

def getDay(dt):
    return datetime.strptime(dt, '%Y-%m-%d').strftime('%w')
    
def plot_by_days(turnstile_wheather):
    date = turnstile_wheather['DATEn']
    turnstile_wheather['Day'] = date.map(getDay)
    turnstile_whether_by_day = turnstile_wheather.groupby(['Day'], as_index=False).aggregate(mean)
    p = ggplot(turnstile_whether_by_day, aes(x='Day', y='ENTRIESn_hourly'))
    line = geom_line()
    titles = ggtitle('Entries By Hour')
    return p + line + titles + xlab('Day') + ylab('Entries')

def plot_by_temp(turnstile_wheather):
    return ""
    
turnstile_weather = read_csv(inputFile)
print plot_entries_by_hour(turnstile_weather)
print plot_by_days(turnstile_weather)