# -*- coding: utf-8 -*-
"""
Created on Mon Jun 29 19:51:50 2015

@author: Poonam
"""
from Utils import *

def create_master_turnstile_file(filenames, output_file):
    with open(output_file, 'w') as master_file:
        master_file.write('C/A,UNIT,SCP,DATEn,TIMEn,DESCn,ENTRIESn,EXITSn\n' )
        for filename in filenames:
               with open(filename, 'r') as inputfile:
                   inputfile.readline()
                   for inputLn in inputfile:
                       master_file.write(inputLn)

create_master_turnstile_file([file1, file2], master)