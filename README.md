
## О Программе
Программа на языке Ruby. 

Программа является классической игрой "Виселица", где вам нужно угадать загаданное слово с 7 попыток. 

[![Watch the demo](https://i.imgur.com/dH2Qt68.png)](https://asciinema.org/a/jxNT97Zz316JtFWaEPeAdESEx)

## Стек
Ruby 2.5.0+

[Colorize](https://github.com/fazibear/colorize)

## Как запустить

В консоли, в папке с программой, пропишите:

```
bundle install
``` 

После этого можно запускать программу командой:

```
bundle exec ruby main.rb <ваше слово>
```

Где <ваше слово> будет являться загаданным словом для игры. 
Если слово не указано, то будет взято случайное из файла в папке `/data/word.txt`

## Автор

[Denis Gavrilin](https://github.com/swol1)
