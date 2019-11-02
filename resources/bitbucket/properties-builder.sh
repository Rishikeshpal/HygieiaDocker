#!/bin/bash

echo "
===========================================
Properties file created `date`:  $PROP_FILE
Note: passwords hidden
===========================================
`cat $PROP_FILE | egrep -vi password`
===========================================
END PROPERTIES FILE
===========================================
"

exit 0
