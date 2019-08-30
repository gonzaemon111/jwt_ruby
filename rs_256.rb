require 'openssl'
require "jwt"
rsa_private = OpenSSL::PKey::RSA.generate 2048
rsa_public = rsa_private.public_key

payload = { data: 'test' }

token = JWT.encode payload, rsa_private, 'RS256'

# eyJhbGciOiJSUzI1NiJ9.eyJkYXRhIjoidGVzdCJ9.GplO4w1spRgvEJQ3-FOtZr-uC8L45Jt7SN0J4woBnEXG_OZBSNcZjAJWpjadVYEe2ev3oUBFDYM1N_-0BTVeFGGYvMewu8E6aMjSZvOpf1cZBew-Vt4poSq7goG2YRI_zNPt3af2lkPqXD796IKC5URrEvcgF5xFQ-6h07XRDpSRx1ECrNsUOt7UM3l1IB4doY11GzwQA5sHDTmUZ0-kBT76ZMf12Srg_N3hZwphxBtudYtN5VGZn420sVrQMdPE_7Ni3EiWT88j7WCr1xrF60l8sZT3yKCVleG7D2BEXacTntB7GktBv4Xo8OKnpwpqTpIlC05dMowMkz3rEAAYbQ
puts token

decoded_token = JWT.decode token, rsa_public, true, { algorithm: 'RS256' }

# Array
# [
#   {"data"=>"test"}, # payload
#   {"alg"=>"RS256"} # header
# ]
puts decoded_token
