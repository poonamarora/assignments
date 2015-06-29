# -*- coding: utf-8 -*-
"""
Created on Mon Jun 29 17:36:32 2015

@author: user
"""
import matplotlib.pyplot as plt
import pandas
import scipy

from Utils import * 

def entries_histogram(turnstile_weather):
    '''
        Entries - Rain vs No-Rain
    '''
    def ifRain(val):
        return turnstile_weather['rain'] == val

    plt.figure()
    plt.suptitle('Histogram - hourly entries (Rain vs No-Rain)')    
    plt.xlabel('Entries')
    plt.ylabel('Frequency')
    
    dataframeForNoRain = turnstile_weather['ENTRIESn_hourly'][ifRain(0)]
    dataframeForNoRain.hist(bins=200)
    dataframeForRain = turnstile_weather['ENTRIESn_hourly'][ifRain(1)]
    dataframeForRain.hist(bins=200)
    
    plt.legend(['No-Rain', 'Rain'])
    plt.axis([0, 5700, 0, 50000])
    
    return plt
 
turnstile_weather = pandas.read_csv(inputFile)   
print entries_histogram(turnstile_weather)