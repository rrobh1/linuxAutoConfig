PS3="Select a day (1-4): "
select i in mon tue wed exit; do
  case $i in
  mon) echo "Monday" ;;
  tue) echo "Tuesday" ;;
  wed) echo "Wednesday" ;;
  exit) exit ;;
  esac
done
