#!/bin/bash

mysql johnsmedley_ce < /home/fiko/sites/johnsmedley-ce/.vscode/downgrade/commercedowngrade/assets/os_downgrade/mysql/delete_attributes.sql
mysql johnsmedley_ce < /home/fiko/sites/johnsmedley-ce/.vscode/downgrade/commercedowngrade/assets/os_downgrade/mysql/remove_commerce_tables.sql
mysql johnsmedley_ce < /home/fiko/sites/johnsmedley-ce/.vscode/downgrade/commercedowngrade/assets/os_downgrade/mysql/remove_setup_entries.sql
mysql johnsmedley_ce < /home/fiko/sites/johnsmedley-ce/.vscode/downgrade/commercedowngrade/assets/os_downgrade/mysql/drop_commerce_constraints.sql
mysql johnsmedley_ce < /home/fiko/sites/johnsmedley-ce/.vscode/downgrade/commercedowngrade/assets/os_downgrade/mysql/opensource_structure.sql
mysql johnsmedley_ce < /home/fiko/sites/johnsmedley-ce/.vscode/downgrade/commercedowngrade/assets/os_downgrade/mysql/add_opensource_constraints.sql
