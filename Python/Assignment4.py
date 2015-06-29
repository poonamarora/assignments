# -*- coding: utf-8 -*-
"""
Created on Mon Jun 29 19:49:02 2015

@author: Poonam
"""

import sys
import string
import logging

from Utils import mapper_output

logging.basicConfig(filename = mapper_output, format='%(message)s',
                    level = logging.INFO, filemode='w')

def mapper():    
    headers = []
    for line in sys.stdin:
        row = line.split(',')
        if not row[0]:
            headers = row
        else:
            row_with_header = filter(lambda x: (x[0] == "UNIT") or (x[0] == "ENTRIESn_hourly")
            , zip(headers, row))
            unit_entries = map(lambda x: x[1], row_with_header)
            logging.info("{0}\t{1}".format(unit_entries[0], unit_entries[1]))
        
mapper()