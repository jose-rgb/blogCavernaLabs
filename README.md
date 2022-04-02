# Junior´s Blog

Building a blog using Bootstrap 5 with Ruby on Rails 6 in MVC pattern.

<a href="https://youtube.com/playlist?list=PLqsayW8DhUmv49CBT7AvetMplBViAcwuk">
    This repository is part of the Curso Ruby on Rails 6 MVC<span></span>
    <img align="center" src="https://cdn-icons-png.flaticon.com/512/1384/1384060.png"  height="40" width="40" />
<a>


<table>
  <tr>
    <td>Ruby version</td>
    <td>
      2.7.2
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      6.1.5
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      SQLite3 (dev) / PostgreSQL (prod)
    </td>
  </tr>
</table>

## Initial settings to run the project

```bash
# clone the project
git clone https://github.com/jose-rgb/blogCavernaLabs.git

# enter the cloned directory
cd blogCavernaLabs

# install Ruby on Rails dependencies
bundle install

# install Node dependencies
yarn install

# create the development and test databases
rails db:create

# create the tables
rails db:migrate

# run the project
rails s
```

Open the browser at the address `http://localhost:3000`

## Configuration for Production

```bash
# delete the config/credentials.yml.enc file
rm config/credentials.yml.enc

# run the command to create credentials and master key (replace 'code' if you don't use VS Code)
EDITOR="code --wait" bin/rails credentials:edit
```

Add the information below in the [credentials](https://guides.rubyonrails.org/security.html#custom-credentials) to configure the email used by the Devise
gem (replace with the values ​​you want):

```yml
# ... your content above

gmail:
  mailer_sender: 'Sender <your@email.com>'
  user_name: your@email.com
  password: your_password

exception_recipients: exceptions@example.com
```

Save and close the `config/credentials.yml.enc` file.

If you want to use another email provider, change it in the file
`config/environments/production.rb`.

To configure [Exception Notification](https://github.com/smartinez87/exception_notification), change it in the file
`config/initializers/exception_notification.rb`.

Open the browser at the address [https://juniors-blog.herokuapp.com/](https://juniors-blog.herokuapp.com/)