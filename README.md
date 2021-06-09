Get the name of any of the 249 countries listed in English US, Spanish, Brazilian Portuguese and/or Simplified Chinese.

### Usage

There's an only public method called `t` which receives the country Alpha2 code and the locale corresponding to the language in which the country name is going to be shown.

```ruby
LLaxta.t("CH", "en_us") # => "Switzerland"
LLaxta.t("CH", "es")    # => "Suiza"
LLaxta.t("CH", "pt_br") # => "Suíça"
LLaxta.t("CH", "zh_cn") # => "瑞士"
```

For convenience, and because there's only 4 supported locales, you can use the short version of the languages English (`us`), Portuguese (`br`) and Chinese (`cn`):

```ruby
LLaxta.t("CH", "us") # => "Switzerland"
LLaxta.t("CH", "br") # => "Suíça"
LLaxta.t("CH", "cn") # => "瑞士"
```
