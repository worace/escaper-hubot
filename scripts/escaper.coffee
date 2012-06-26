module.exports = (robot) ->
  robot.router.get "/photo/test", (req, res) ->
    params = require('url').parse(req.url, true)
    image = params["query"]["url"]
    room = params["query"]["room"]

    robot.logger.info "Request received to test image" + image
    robot.messageRoom "515544", image
    robot.messageRoom "515544", "What do you think of this image for an escape?"

    robot.hear /yes/i, (msg) ->
      msg.send "I SHALL ADD IT TO THE LIST"
      res.writeHead 200, {'Content-Type': 'text/plain'}
      res.end "Message Sent"

    robot.hear /no/i, (msg) ->
      msg.send "IT SHALL BE STRICKEN FROM THE LIST"
      res.writeHead 200, {'Content-Type': 'text/plain'}
      res.end "Message Sent"

