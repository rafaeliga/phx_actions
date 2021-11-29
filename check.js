module.exports = async ({github, context}) => {
  console.log(github.event)
  console.log(github.event.pull_request)
  console.log(github.pull_request)
  
  const fs = require('fs')

  let files = JSON.parse(
    fs.readFileSync(`${process.env.HOME}/files.json`, {encoding: 'utf8'})
  )
  
  // files.forEach(file => {
  //   github.request(`POST ${context.payload.pull_request.comments_url}`, {
  //     body: 'You missed this file to create a test',
  //     commit_id: context.sha,
  //     line: 1,
  //     path: file
  //   })
  // });

  return context.issue.number
}
