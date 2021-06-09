Get the name of any of the 249 countries listed in English US, Spanish, Brazilian Portuguese and/or Simplified Chinese.

### Usage

There's an only public method called `t` which receives the country Alpha2 code and the locale corresponding to the language in which the country name is going to be shown.

```ruby
Llaxta.t("CH", "en_us") # => "Switzerland"
Llaxta.t("CH", "es")    # => "Suiza"
Llaxta.t("CH", "pt_br") # => "Suíça"
Llaxta.t("CH", "zh_cn") # => "瑞士"
```

For convenience, and because there's only 4 supported locales, you can use the short version of the languages English (`us`), Portuguese (`br`) and Chinese (`cn`):

```ruby
Llaxta.t("CH", "us") # => "Switzerland"
Llaxta.t("CH", "br") # => "Suíça"
Llaxta.t("CH", "cn") # => "瑞士"
```
