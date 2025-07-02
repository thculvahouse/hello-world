include { READ_TEXT } from "./modules/read_text.nf"

// anonomous workflow; entry point for pipeline
workflow {
    // create a channel `file_ch` that emits all paths that match `params.input_file`
    file_ch = Channel.fromPath(params.input_file)

    // run the `READ_TEXT` process, with `file_ch` providing input
    READ_TEXT(file_ch)

    // `READ_TEXT` emits an output channel of paths named `.out.file_path`
    // store all output files in directory `params.output_dir`
    READ_TEXT.out.file_path.collectFile(storeDir: params.output_dir)
}
