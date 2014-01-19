$modules = @(ls .\base.js) + @(ls .\config.js) + @(ls .\hacks\*.js)
cat $modules | out-file -encoding ASCII mongo_hacker.js 
cp -force .\mongo_hacker.js ~
add-content ~\.mongorc.js "`r`nload('mongo_hacker.js')"
