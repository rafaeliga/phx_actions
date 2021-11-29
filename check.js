module.exports = async ({github, context}) => {
  // console.log(process.env)
  
  const fs = require('fs')

  let files = JSON.parse(
    fs.readFileSync(`${process.env.HOME}/files.json`, {encoding: 'utf8'})
  )
  
  files.forEach(file => {
    console.log(file)
    console.log(context.sha)

    github.request(`POST ${context.payload.pull_request._links.comments.href}`, {
      body: 'You missed this file to create a test',
      commit_id: context.sha,
      line: 1,
      path: file
    })
  });

  return context.issue.number
}
