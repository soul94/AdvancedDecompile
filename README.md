## testing

```lua
function get_repo(user,branch,file)
    local http = (syn and syn.request) or request
    local format = string.format
    local url = format('https://raw.githubusercontent.com/%s/AdvancedDecompile-V5/%s/%s', user, branch, file)
    
    return http({ Url = url}).Body
end

local r = get_repo('soul94','main','.lua')
loadstring(r)()
```
