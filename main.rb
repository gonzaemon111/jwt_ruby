require 'jwt'

payload = { user_id: 1, hoge: 1 }
hmac_secret = 'waffle'

# payloadを、hmac_secret(秘密鍵)でHS256アルゴリズムで署名する
token = JWT.encode(payload, hmac_secret, 'HS256', { typ: 'JWT' })
puts token
#=> "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxfQ.K65DepuDQLTEi8RFG4htEHlMhVzMB3SOwo_mHfpoodM"

# tokenを、hmac_secret(秘密鍵)でHS256アルゴリズムで復号化する
decoded_token = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
puts decoded_token
#=> [{"user_id"=>1}, {"alg"=>"HS256", "typ"=>"JWT"}]

# トークンを手に入れたとして、オレオレ秘密鍵で復号化してみるとエラーが発生します
# decoded_token = JWT.decode(token, 'oreore-secret', true, { algorithm: 'HS256' })

# puts decoded_token
#=> JWT::VerificationError: Signature verification raised
