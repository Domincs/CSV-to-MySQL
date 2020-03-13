
# Import pandas 
import pandas as pd 

import pymysql

# Open database connection
db = pymysql.connect("127.0.0.1",user="root",password="dominicd",db="lgt_survey_responses" )

  
# reading csv file  
df = pd.read_csv("adDBJ3b9E5xm283ahVxyyg.csv", encoding='ISO-8859-1') 

df2 = df.drop(['required','appearance','media::image', 'calculation'], axis=1) # remove unnecesary rows

df_dict = df2.T.to_dict().values()
group_name = None
group_label = None
skip_first = True
group_id = None
parent_id = None
prev_id = None
for i in df_dict:
    if i['type'] == "begin_group" and i['name'] != 'group_jf1xw58' and i['type'] != 'calculate':
        print('first if statement')
        print(i)
        group_name = i['name']
        group_label = i['label']
        with db.cursor() as cursor:
            # Create a new record
            sql = "INSERT INTO `questionnaire_groups` (`name`, `label`) VALUES (%s, %s)"
            cursor.execute(sql, (group_name, group_label))
            
        # connection is not autocommit by default. So you must commit to save
        # your changes.
        group_id = db.insert_id()
        db.commit()

    elif i['type'] != "begin_group" and i['type'] != "end_group" and group_label != None and i['type'] != 'start' and i['type'] != 'end' and (i['label'] != None or i['label'] != '') and i['type'] != 'calculate':
        print('send of statement')
        print(i)
        if('(a)' in i['label']):
            parent_id = prev_id
            label = i['label'].split('(a)', 1)[1]
        else:
            parent_id = None
            if '. ' in i['label']:
                label = i['label'].split('. ', 1)[1]
            else:
                label = i['label']

        with db.cursor() as cursor:
            if group_id !=None:
                if parent_id == None:
                    sql = "INSERT INTO `questionnaire` (`name`, `label`, `group_id`) VALUES (%s, %s, %s)"
                    cursor.execute(sql, (i['name'], label.strip(), group_id))
                else:
                    sql = "INSERT INTO `questionnaire` (`name`, `label`, `group_id`, `parent_id`) VALUES (%s, %s, %s, %s)"
                    cursor.execute(sql, (i['name'], label.strip(), group_id, parent_id))
        prev_id = db.insert_id()
        db.commit()
    else:
        print('print failed case')

