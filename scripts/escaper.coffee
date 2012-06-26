module.exports = (robot) ->
  robot.router.get "/photo/test", (req, res) ->
    params = require('url').parse(req.url, true)
    image = params["query"]["url"]
    room = params["query"]["room"]

    robot.logger.info "Request received to test image" + image
    robot.messageRoom room, image
    robot.messageRoom room, "What do you think of this image for an escape?"
    res.end "Message Sent"
