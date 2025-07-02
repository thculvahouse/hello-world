// define a process called `READ_TEXT`
process READ_TEXT {
    input:
    path file_path_in

    output:
    path "output.txt", emit: file_path

    script:
    """
    echo "I am copying..." > output.txt
    cat ${file_path_in} >> output.txt
    """
}
