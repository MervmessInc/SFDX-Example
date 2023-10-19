# Exmaple Salesforce DX Project using GitHub Actions.

Example Salesfoce CI using GitHub actions.

* Static code scan
* Build scratch org 
* Run unit tests

## Intentionally failing workflow

The lighting app in this repo has been specififcally written to highlight the workflow's behaviour. Not implementing Salesforce best practices ultimatly leads to a failed unit test.

```
=== Apex Code Coverage for Test Run 7073G00000sJ2H1
TEST NAME                            CLASS BEING TESTED  OUTCOME  PERCENT  MESSAGE                                                       RUNTIME (MS)
───────────────────────────────────  ──────────────────  ───────  ───────  ────────────────────────────────────────────────────────────  ────────────
AncestryHelperTest.testGetAncestors  AncestryHelper      Fail     89%      System.LimitException: Too many SOQL queries: 101             
                                                                           Class.AncestryHelper.getAncestors: line 22, column 1          
                                                                           Class.AncestryHelperTest.testGetAncestors: line 23, column 1  594 
```

Looking at the action log we can see that the potential for this failure is highlighted by the static code scanner.
```
 LOCATION                                              DESCRIPTION                                           CATEGORY      U R L                                                                                      
 ───────────────────────────────────────────────────── ───────────────────────────────────────────────────── ───────────── ────────────────────────────────────────────────────────────────────────────────────────── 
 force-app/main/default/classes/AncestryHelper.cls:12    Missing ApexDoc comment                             Documentation https://pmd.github.io/pmd-6.55.0/pmd_rules_apex_documentation.html#apexdoc                 
 force-app/main/default/classes/AncestryHelper.cls:14    Validate CRUD permission before SOQL/DML operation  Security      https://pmd.github.io/pmd-6.55.0/pmd_rules_apex_security.html#apexcrudviolation            
                                                         or enforce user mode                                                                                                                                         
 force-app/main/default/classes/AncestryHelper.cls:22    Avoid Soql queries inside loops                     Performance   https://pmd.github.io/pmd-6.55.0/pmd_rules_apex_performance.html#avoidsoqlinloops
```

The _"Avoid Soql queries inside loops"_ message references the same line as the failed unit test. (force-app/main/default/classes/AncestryHelper.cls:22) 

## Salesforce CLI documentation

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
