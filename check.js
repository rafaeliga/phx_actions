module.exports = async ({github, context}) => {
  console.log("=================================== CHECK ===================")
  console.log(`=================================== PR: ${context.payload.pull_request.number} ===================`)
  console.log(context.repo)
  console.log(context.payload.pull_request)

  await github.request(`POST /repos/${content.repo.repo}/pulls/${context.payload.pull_request.number}/comments`, {
    body: 'test action comment SCRIPT',
    commit_id: context.sha,
    line: 2,
    path: "lib/phx_actions/other_new.ex"
  })

  return context.issue.number
}
