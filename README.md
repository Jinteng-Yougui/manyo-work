# README
There are four tables for this app.

First table is for "user", which is the name of this model. It has each task's 'title: string', 'content: text', 'deadline: date', 'priority: string', 'status: string' and 'label: string.

"task"
| column   | data type |
| -------- | --------- | 
| title    | string    | 
| content  | text      |
| deadline | date      |
| priority | string    |
| status   | string    |
| label    | string    |
    
Second table is for tasks' "search", which is the name of this model. It has each task's 'title: string', 'deadline: date' and 'priority: string'.

"search"
| column   | data type |
| -------- | --------- | 
| title    | string    | 
| deadline | date      |

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
