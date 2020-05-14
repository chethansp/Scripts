#! /bin/sh

echo "This script is to remove all the files and folder except AkaMap.framework inside Aka-MAP pods"
echo "This is because during pod spec lint, cocoapod try to compile the AkaMap sample project with SIACommon framework,
      as result xcode compilation failed"
echo "SIACommon enable the Prebuild framework, this sample project duplicated inside the _Prebuild folder under GeneratedFrameworks"

echo "\n ********************************************************\n"
echo ${PWD}

remove_unwanted_filesAndFolders(){

  # echo ${PWD}
  OIFS="$IFS"
  IFS=$'\n'
  for name in *; do

  if [[ $name == "AkaMap.framework" ]]; then
      echo "Keeping ${name}"
  else
    /bin/rm -r $name
    echo "Removed -> $name"
  fi
  done
  IFS="$OIFS"
}

echo "*** Removing Started ***"

# inside the pod folder
cd Pods/Aka-Map
[ $? -eq 0 ] && remove_unwanted_filesAndFolders || echo "Aka-Map not found inside the pod folder"

# under _Prebuild folder
cd ../../pods/_Prebuild/Aka-Map
[ $? -eq 0 ] && remove_unwanted_filesAndFolders || echo "Aka-Map not found inside the _Prebuild folder"

# under GeneratedFrameworks inside _Prebuild folder
cd ../../../pods/_Prebuild/GeneratedFrameworks/Aka-MAP
[ $? -eq 0 ] && remove_unwanted_filesAndFolders || echo "Aka-Map not found in GeneratedFrameworks inside _Prebuild folder"

echo "*** Removing Ended ****"
