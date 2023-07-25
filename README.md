# README
There are four tables for this app.

First table is for "tasks", which is the name of this model. It has each task's 'title: string', 'content: text', 'deadline: date', 'priority: string', 'status: string' and 'label: string.

"tasks"
| column   | data type |
| -------- | --------- | 
| title    | string    | 
| content  | text      |
| deadline | date      |
| priority | string    |
| status   | string    |
    
Second table is for "users", which is the name of this model. It has each users' 'name: string', 'email: string' and 'password: string'.

"users"
| column   | data type |
| -------- | --------- | 
| name     | string    | 
| email    | string    |
| password | string    |

Third table is for tasks' "sort", which is the name of this model. It has each task's 'deadline: date' and 'priority: string'.

"sort"
| column   | data type |
| -------- | --------- | 
| deadline | date      | 
| priority | string    |

Forth table is for tasks' "label", which is the name of this model. It has each task's 'title: string' and 'genre: string".

"label"
| column   | data type |
| -------- | --------- | 
| title    | string    | 
| genre    | string    |

The following is the procedure when you need to deploy on heroku:
1st, create the URL by typing $ heroku create
2nd, add 'net-smtp', 'net-imap' and 'net-pop' in the Gemfile and $ bundle install
3rd, $ git add . and $ git commit -m"message"
4th, $ git push heroku main