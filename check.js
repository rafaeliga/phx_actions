module.exports = async ({github, context}) => {
  await github.request(`POST /repos/${github.repository}/pulls/${github.event.number}/comments`, {
    body: 'SINGLE inside',
    commit_id: context.payload.pull_request.head.sha,
    line: 2,
    path: "lib/phx_actions/other_new.ex"
  })

  const fs = require('fs')

  let files = JSON.parse(
    fs.readFileSync(`${process.env.HOME}/files.json`, {encoding: 'utf8'})
  )
  
  files.forEach(file => {
    console.log(file)
    console.log(context.payload.pull_request.head.sha)

    github.request(`POST ${context.payload.pull_request.comments_url}`, {
      body: 'You missed this file to create a test',
      // commit_id: context.payload.pull_request.head.sha,
      line: 1,
      path: file
    })
  });

  return context.issue.number
}
