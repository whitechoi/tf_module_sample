#!groovy

import jenkins.model.*

final List<String> REQUIRED_PLUGINS = [
    "aws-credentials",
    "copyartifact",
    "git",
    "ssh-agent",
    "tap",
    "workflow-aggregator",
]
// if (Jenkins.instance.pluginManager.plugins.collect {
//         it.shortName
//     }.intersect(REQUIRED_PLUGINS).size() != REQUIRED_PLUGINS.size()) {
    REQUIRED_PLUGINS.collect {
        Jenkins.instance.updateCenter.getPlugin(it).deploy()
    }.each {
        it.get()
    }
//     Jenkins.instance.restart()
//     println 'Run this script again after restarting to create the jobs!'
//     throw new RestartRequiredException(null)
// }
