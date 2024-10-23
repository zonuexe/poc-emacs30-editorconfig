# PoC for Emacs 30 Editorconfig indentation issue

I use Emacs 30.0.91.

```
This is GNU Emacs 30.0.91 (build 1, aarch64-apple-darwin23.6.0, NS
 appkit-2487.70 Version 14.7 (Build 23H124)) of 2024-10-22
```

The following code will disable treesit and prioritize the legacy Cc Mode-based `js-mode` and `php-mode`.

```init.el
(advice-add #'treesit-available-p :override (lambda () nil))
```

Place the following `.editorconfig` file in the directory:

```.editorconfg
root = true

[*.js]
indent_size = 4
indent_style = tab

[*.php]
indent_size = 4
indent_style = tab
```

The directory contains the following `test.js` and `test.php`.

* `test.js`

```javascript
function foo() {
	console.log("test");
}
```

* `test.php`

```php
<?php

function foo() {
	var_dump("test");
}
```

I would expect it to be displayed with **4 indents**, but in Emacs 30 it is displayed with **8 indents**.
