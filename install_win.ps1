$modules = @(ls .\base.js) + @(ls .\config.js) + @(ls .\hacks\*.js)
cat $modules | out-file -encoding ASCII mongo_hacker.js 
cp -force .\mongo_hacker.js ~
rm ~\.mongorc.js
$hacker = (resolve-path .\mongo_hacker.js).tostring()
$hacker = $hacker.replace("\", "/")
add-content ~\.mongorc.js "`r`nload('$hacker')"
