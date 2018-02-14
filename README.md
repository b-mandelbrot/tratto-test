# About the solution

![Codeship](https://app.codeship.com/projects/65133a70-f35b-0135-1650-1aab2ce43295/status?branch=master)

#### How to run the code

  ```bash
  $ git@github.com:b-mandelbrot/tratto-test.git

  $ cd tratto-test

  $ bundle install

  $ irb
  :001 > require './lib/tratto'
  :002 > wc = WalletCentral.new
  :003 > wc.output('jon')
   => "{\"name\":\"jon\",\"wallets\":{\"EUR\":868.65,\"USD\":463.39}}"
  :004 > wc.output('sansa')
   => "{\"name\":\"sansa\",\"wallets\":{\"EUR\":1065.45,\"BRL\":586.28}}"
  :005 > wc.transfer('jon', 'sansa', 'EUR', 100)
   => true
  :006 > wc.output('jon')
  => "{\"name\":\"jon\",\"wallets\":{\"EUR\":768.65,\"USD\":463.39}}"
  :007 > wc.output('sansa')
  => "{\"name\":\"sansa\",\"wallets\":{\"EUR\":1165.45,\"BRL\":586.28}}"
  ```

#### How to run the tests

  ```bash
  $ rspec spec
  ```

# Tratto Programming Exercise

In the lib/resources directory, you'll find a csv data file:

* wallets.csv; a list of users and their relative wallets and total amount.

We want you to write a ruby plain code to load all the users and wallets, and be available to output the data in json:
* JSON as an array of objects with:

  {
    name: "Jon",
    wallets: {
      "EUR": 868.65,
      "USD": 463.69
    }
  }

And be able to exchange/transfer the wallet amounts through accounts.
For examples:
  * Jon wants to transfer 100 euros to Littlefinger, but Littlefinger don't have an Euro wallet, so he'll convert the amount to dollars and transfer the relative value to Littlefinger Dollars wallet.
  * Jon wants to transfer 500 dollars to Arya, which have a Dollars wallet, so he'll transfer the normal value.

The conversions should be applied when necessary, or just added in a simple public API, for example:
WalletCentral.transfer(jon, arya, 'USD', 500)

Test for edge cases, if Jon is trying to transfer real but don't have a wallet with this currency, what it should do?
What happens if it's trying to transfer more than his available amount?
The conversion is working correctly? Undoing it would restore the same value?


Feel free to create your own files/classes in the lib directory, and add all necessary tests, we only require a public API to be able to output data and do the transfers, such as:

WalletCentral.transfer(WalletJon, WalletArya, 'USD', 100.0)
WalletCentral.output # as json
WalletCentral.output("jon") # you can write this as you want to, we just want a filter to show the wallets and amounts for a specific user.

# Wallet Conversions resources

Feel free to define the conversions values as you want to, following as this:
* USD to BRL = 1 USD is 3.16 BRL
* USD to EUR = 1 USD is 0.80 EUR

# Publishing

Fork or clone this repository, add your modifications to your own repository and send the Github URL to us at thiago@kcapt.com.br
Please, create and write your commits as in real life, since we're going to review this too.
