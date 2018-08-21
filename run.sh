#
# the shell script compile the assemble code and convert to object code
#

# Args:
#     filename: the assemble code
#

if [ "$#" -ne 1 ]
then
    echo "Usage: ./run.sh file"
    exit 1
fi

if [[ "$1" =~ ^.*\.s$ ]]
then
    name=${1::(-2)}
else
    name="$1"
fi

as "$1" -o ${name}.o
ld ${name}.o -o ${name}
rm ${name}.o

echo "assemble finished, try to run ./${name}"
