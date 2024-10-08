# 定义命令路径
let cmd = 'c:\\scoop\\shims\\curl.exe'
let local_path = 'd:/codeup/hjs/web/clash/rules'
let git_path = 'https://raw.githubusercontent.com/DustinWin/ruleset_geodata/clash-ruleset'

let name_list = [
    'ads','applications','private','microsoft-cn','apple-cn',
    'google-cn','games-cn','ai','networktest','proxy',
    'cn','telegramip','privateip','cnip','bilibili']

let args = ['-x', 'socks5h://192.168.123.7:7898'] | append ($name_list 
| each {|it| ['-o', $'($local_path)/($it).list', '-L', $'($git_path)/($it).list'] } 
| flatten )

print $'【count:($name_list | length)】'

run-external $cmd ...$args