module.exports = ({github, context}) => {
  console.log("=================================== CHECK ===================")

  // await github.request(`POST /repos/${{ github.repository }}/pulls/${{ github.event.number }}/comments`, {
  //   body: 'test action comment',
  //   commit_id: "34d73a04ca39ce60f8c7be54e316a9ae8bfc3ac2",
  //   line: 2,
  //   path: "lib/phx_actions/other_new.ex"
  // })

  return context.payload.client_payload.value
}
