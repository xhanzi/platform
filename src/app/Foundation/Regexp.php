<?php

namespace App\Foundation;

class Regexp
{
    // 正则表达式来自 https://emailregex.com/
    const EMAIL = '^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$';
    const PASSWORD = '^(?![0-9]+$)(?![a-zA-Z]+$)[\w\x21-\x7e]{6,18}$';
    const RESOURCE_ID = '^[1-9][0-9]*$';
    const USERNAME = '^[\w\x7f-\xff]{2,20}$';
}
