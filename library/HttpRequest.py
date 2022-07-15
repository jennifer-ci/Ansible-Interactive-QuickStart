#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Copyright: (c) 2020, lework
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

import requests
import json
# encoding=utf8
import sys

defaultencoding = 'utf-8'
if sys.getdefaultencoding() != defaultencoding:
    reload(sys)
    sys.setdefaultencoding(defaultencoding)

from ansible.module_utils.basic import AnsibleModule

host = "https://api.github.com/repos/jenniferhuang/git-developer/issues"

head = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic amVubmlmZXJodWFuZzpnaHBfcFRhNloxemI0WFZ1bm1PT1M1SThnem1MWDJtYTJkMnlsakp1'}


def run_module():
    module = AnsibleModule(argument_spec=dict(test1=dict(type=str, required=True),
                                              test2=dict(type=str, required=True),
                                              toPost=dict(type=bool, required=False, default=False))
                           )
    toPost = bool(module.params['toPost'])
    test1 = module.params['test1']
    test2 = module.params['test2']
    data = {"title": test1, "body": test2}
    print("user param:" + data.__str__())
    response = requests.post(host, json=data, headers=head)
    print("response: \n" + response.text)
    if response.status_code == 500:
        print("success?")
        module.fail_json(msg=response.text)
    else:
        print("success?" + response.status_code)
        module.exit_json(msg=response.text)


def main():
    run_module()


if __name__ == '__main__':
    main()
