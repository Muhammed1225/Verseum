insert into authority_list
(role, author, reader)
values
('ROLE_AUTHOR',true,false),
('ROLE_READER',false,true);

insert into users
(username,password,enabled)
values
('masadov10','{noop}1225',true),
('code2ke','{noop}1234',true);

insert into authorities (username,authority) select 'masadov10',role from authority_list where author=true;
insert into authorities (username,authority) select 'code2ke',role from authority_list where reader=true;

insert into authors
(username, first_name, last_name, email)
values
('masadov10','Muhammed','Esedov','esedovmuhammed0@gmail.com');

insert into readers
(username, first_name, last_name, email)
values
('code2ke','Ibrahim','Qurbanov','code2ke@gmail.com');