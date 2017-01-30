# Rename Bullk files.
# Renames all the files in PWD with the given extension.
#
# @param extension | jpg
# @param new_name | name
# Usage: rname jpg new_name
function rname() {
	echo "———————————————— STARTED ————————————————"

	# Counter.
	COUNTER=1

	# For do loop.
	for file in *."$1"; do
		mv "$file" "$2-$COUNTER.$1"
		COUNTER=$[$COUNTER +1]
	done
	echo "———————————————— ✔✔✔ RENAMED Every $1 file in the PWD! ✔✔✔︎ ———————————————"
}

# Bulk Resize Images in Terminal
#
# Usage: rimg size extension
# Example: rimg jpg 640
function rimg() {
	sips -Z "$2" *."$1"
}
