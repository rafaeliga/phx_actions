module.exports = async ({github, context}) => {
  // console.log(process.env)
  
  // await github.request(`POST ${context.payload.pull_request._links.comments.href}`, {
  //   body: 'test action comment SCRIPT2',
  //   commit_id: context.sha,
  //   line: 2,
  //   path: "lib/phx_actions/other_new.ex"
  // })

  const fs = require('fs')

  let file = JSON.parse(
    fs.readFileSync(`${process.env.HOME}/files.json`, {encoding: 'utf8'})
  )
  console.log(file)

  return context.issue.number
}
