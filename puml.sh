#!/bin/bash

# when running this directly with markdown-preview-enhanced
# in the current version, the -Djava gets converted to -djava and then is an
# invalid java runtime script

echo "@startuml
A --> B
@enduml" | java -Djava.awt.headless=true -jar plantuml.jar -pipe -tsvg -charset UTF-8

echo ""
