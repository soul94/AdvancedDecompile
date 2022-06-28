## testing

```lua
local a = syn and syn.request
local b = a({ Url = 'https://raw.githubusercontent.com/soul94/AdvancedDecompile-V5/main/.lua' }).Body

local f = string.format

local c,d = pcall(loadstring, b)
if not c then
    print(f('error: %s', d))
end
```
