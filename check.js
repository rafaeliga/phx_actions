module.exports = async ({github, context}) => {
  const fs = require('fs')

  let files = JSON.parse(
    fs.readFileSync(`${process.env.HOME}/files.json`, {encoding: 'utf8'})
  )
  
  files.forEach(file => {
    github.request(`POST ${context.payload.pull_request.comments_url}`, {
      body: 'You missed this file to create a test',
      commit_id: context.payload.pull_request.head.sha,
      line: 1,
      path: file
    })
  });

  return context.issue.number
}
