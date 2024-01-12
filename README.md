# Simple Blog

Simple Blog site where the user could create and publish an article. Then leave comments on the viewed article.

## Getting Started

These instructions will help you set up and run the project on your local machine.

### Prerequisites

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (version X.X.X)
- [Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails) (version X.X.X)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/NadzTiwing/Simple_blog.git
    ```

2. Change into the project directory:

    ```bash
    cd your-project
    ```

3. Install dependencies:

    ```bash
    bundle install
    ```

4. Create an account in Mailtrap(https://mailtrap.io/). Create a Domain under Sending Domains.

5. Go to Email Testing > Inboxes and view SMTP Settings tab. Click 'Show Credentials'. Copy Username, Password and Port in the .env file. Beside the settings is your inbox section where you view the sent notification messages from anyone who comments.

6. Create a `.env` file in the project root and add your environment variables:

    ```env
    MAILTRAP_USERNAME=YOUR_USERNAME
    MAILTRAP_PASSWORD=YOUR_PASSWORD
    MAILTRAP_PORT=SMTP_PORT
    ```

    then save this file.

### Database Setup

1. Run database migrations:

    ```bash
    rails db:migrate
    ```

2. (Optional) Seed the database with sample data:

    ```bash
    rails db:seed
    ```

### Running the Application

Start the Rails server:

```bash
ruby bin/rails server
