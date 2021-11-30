module.exports = async ({github, context}) => {
  console.log("original:", `/repos/${github.repository}/pulls/15/comments`);
  let from_payload = context.payload.pull_request.comments_url
  console.log("FROM: ", from_payload)

  await github.request(`POST ${from_payload}`, {
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
