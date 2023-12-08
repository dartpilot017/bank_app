# Bank App - Flutter Mobile Application

This Flutter mobile application is a simple banking app that allows users to perform basic banking operations such as signing up, logging in, depositing money, sending money to others, and viewing transaction history. The app consumes the API provided at https://bankapi.veegil.com/.

## User Stories

1. **Sign Up and Login:**

   - Users can sign up and log in using their phone numbers as account numbers.
   - Endpoint: `/auth/signup` and `/auth/login`

2. **Deposit and Transfer:**

   - Users can deposit money into their accounts.
   - Users can send money to others.
   - Endpoints: `/accounts/transfer` and `/accounts/deposit`

3. **Visualization of Deposit and Withdrawal History:**

   - Users can view a visualization that shows their deposit and withdrawal history.
   - Endpoint: `/transactions`

4. **Transaction History:**
   - Users can view a list of their transactions.
   - Endpoint: `/transactions`

## API Documentation

### URL + Requests Structures

- **POST `/auth/signup`**

  ```json
  {
    "phoneNumber": "xx123344444",
    "password": "pass"
  }
  ```

- **POST `/auth/login`**

  ```json
  {
    "phoneNumber": "xx123344444",
    "password": "pass"
  }
  ```

- **POST `/accounts/transfer`**

  ```json
  {
    "phoneNumber": "08100xxxxxx",
    "amount": 20000
  }
  ```

- **POST `/accounts/withdraw`**

  ```json
  {
    "phoneNumber": "08100xxxxxx",
    "amount": 20000
  }
  ```

- **Get `/accounts/list`**

- **Get `/transactions`**

- **GET `/auth/users`**

## How to Run the Application

### Prerequisites

- Make sure you have Flutter installed. If not, follow the instructions [here](https://flutter.dev/docs/get-started/install).

### Steps

1. Clone the repository:

   ```bash
   git clone https://gitlab.com/pilot017/bank_app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd bank_app_flutter
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```
