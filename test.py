#!/usr/bin/python
# -*- coding: UTF-8 -*-

from hashlib import sha1 as sha
from hashlib import sha256 as sha256
from hashlib import sha512 as sha512
import hmac
from base64 import encodebytes

secret_key = "1234"
string_to_sign = "abcdef"
value = hmac.new(secret_key.encode('utf-8'), digestmod=sha)
value.update(string_to_sign.encode('utf-8'))
output = encodebytes(value.digest()).decode('utf-8').strip()
print(output)

value = hmac.new(secret_key.encode('utf-8'), digestmod=sha256)
value.update(string_to_sign.encode('utf-8'))
output = encodebytes(value.digest()).decode('utf-8').strip()
print(output)


value = hmac.new(secret_key.encode('utf-8'), digestmod=sha512)
value.update(string_to_sign.encode('utf-8'))
output = encodebytes(value.digest()).decode('utf-8').strip()
print(output)