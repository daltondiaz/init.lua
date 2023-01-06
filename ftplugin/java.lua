local config = {
    cmd = {
        "jdtls",
        "--jvm-arg=" .. string.format(
            "-javaagent:%s",
            require("mason-registry").get_package("jdtls"):get_install_path() .. "/lombok.jar"
        ),
    },
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
-- print(config.cmd[2])
require('jdtls').start_or_attach(config)
