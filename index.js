const core = require('@actions/core');
const exec = require('@actions/exec');

async function run() {
    try {
        await exec.exec('julia', ['--color=yes', '--project=format/', '-e', 'using Pkg; Pkg.instantiate()']);
        await exec.exec('julia', ['--color=yes', '--project=format/', 'format/format.jl']);

        let out = '';
        const options = {};
        options.listeners = {
            stdout: data => {
                out += data.toString();
            },
        }
        await exec.exec('git', ['diff', '--name-only'], options);
        const changedFiles = out.split('\n').filter(f => f.endsWith('.jl'))
        if (changedFiles.length !== 0) {
            core.setFailed(`The following files have not been formatted: \n${changedFiles.join('\n')}`);
        }
    } catch (error) {
        core.setFailed(error.message);
    }
}

run()
