# encoding: UTF-8

module Ncommons
  module Security
    require 'openssl'
    class Des
      class << self
        #加密
        #参数
        # key 16进制密钥
        # plaintext 明文
        # alg 算法
        # padding 是否使用 padding
        def encrypt(key,plaintext,alg='des',padding=0)
          des_encrypt_decrypt(key,plaintext,'enc',alg,padding)
        end

        #解密
        #参数
        # key 16进制密钥
        # decrypt_data 密文
        # alg 算法
        # padding 是否使用 padding
        def decrypt(key,decrypt_data,alg='des',padding=0)
          des_encrypt_decrypt(key,decrypt_data,'dec',alg,padding)
        end

        private
        def des_encrypt_decrypt(key,data,act='enc',alg='des',padding=0)
          des = OpenSSL::Cipher::Cipher.new(alg)
          des.padding = padding
          OpenSSL.errors if OpenSSL.errors
          act== 'enc' ? des.encrypt : des.decrypt
          #des.iv = "iviviviviviv"
          des.key = key
          res = des.update(data)
          res << des.final
          return res
        end
      end
    end
  end
end


if $0 == __FILE__
  require 'rubygems'
  require 'ncommons'
  include Ncommons::Security
  # plain_text = "8371|4006b841-3181-4637-9753-839534975785|9667|123456ABC|9137"
  #   key = "121212121212121212121212"
  #   p en_str = Des.encrypt(key,plain_text,'des-ede3-ofb',1)
  #   p up = en_str.unpack('H*')
  #   p up.pack('H*')
  #   puts de_tr = Des.decrypt(key,en_str,'des-ede3-ofb',1)
  p "="*80
  p key = "19890604"#.to_hex
  plain_text = %Q~
  国际歌
  起来，饥寒交迫的奴隶！
  起来，全世界受苦的人！
  满腔的热血已经沸腾，
  要为真理而斗争！
  旧世界打个落花流水，
  奴隶们起来，起来！
  不要说我们一无所有，
  我们要做天下的主人！
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  
  从来就没有什么救世主，
  也不靠神仙皇帝！
  要创造人类的幸福，
  全靠我们自己！
  我们要夺回劳动果实，
  让思想冲破牢笼！
  快把那炉火烧得通红，
  趁热打铁才会成功！
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  
  压迫的国家、空洞的法律，
  苛捐杂税榨穷苦；
  富人无务独逍遥。
  穷人的权利只是空话，
  受够了护佑下的沉沦。
  平等需要新的法律，
  没有无义务的权利，
  平等！也没有无权利的义务！
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  
  矿井和铁路的帝王，
  在神坛上奇丑无比。
  他们除了劳动，
  还抢夺过什么呢？
  在他们的保险箱里，
  劳动的创造一无所有！
  从剥削者的手里，
  他们只是讨回血债。
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  
  国王用烟雾来迷惑我们，
  我们要联合向暴君开战。
  让战士们在军队里罢工，
  停止镇压，离开暴力机器。
  如果他们坚持护卫敌人，
  让我们英勇牺牲；
  他们将会知道我们的子弹，
  会射向我们自己的将军。
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  
  是谁创造了人类世界？
  是我们劳动群众！
  一切归劳动者所有，
  哪能容得寄生虫？！
  最可恨那些毒蛇猛兽，
  吃尽了我们的血肉！
  一旦它们消灭干净，
  鲜红的太阳照遍全球！
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  这是最后的斗争，团结起来到明天，
  英特纳雄耐尔就一定要实现！
  ~
  en_str = Des.encrypt(key,plain_text,'des',1)
  p "密文: "+en_str.to_hex
#dffa11b62e171fe6bed7415159438c40cd5aa542a0a3a819d288ae1e0271625c75eecd0c87abbddf03a36c37d6d11918cae7f8a38f1dc07fda5ddcfcc16e8ea27ef83b5356c22096a0e089848267bf65bfad936fc5870594e6250174d4734a56ddb215ae4ba43acc9bc0245414b01fa1632274e6e210867f9ae4f6486497f22b3152a4e5da632c87b4ed385ea1ddb6d996e8d4af7c480fece473fb4cc3e6af1417113ee054166ec8f27f6f0eeee26b8215f660cbadb2e946704be6bee594dd99f0f0f1228a5d2574c6a2ece8d968ab9fc39fff1eae8334537f9ef8e2fb24def2adadfec0b22e4507f2fa97f50552c45b957966c5ba5c27342eb2acea880132536d0f2809fd5e2d29077997648cd54e6ef448d6217733fe59dbe4cf57f3d9665acc1a08f1ce23ff109270b3761511014c8fdda457a027c8e98b3d74a52e0a5ae19354a63c1fefe327a8a1ee10660462d13c1f424e70dd89fa608ff2e51ec3ba5fc1ae49f36519feba702d347ea8edbf8a3fbb88c48475c727518a047fbfd1cce2d1c67f8bc99c1acd893619ae5309d5217978c962581043f269fe3a651cc93212e510a15afa7e45c23d2988ae2b3f04071736c7329b1ebb831a4719ca939985110a30efa392919be23534d0f1c849a39d71c6b2c5273609deb5f7f7c9b59031c8eb35e86f5504b1b109a5a8394a179d7a5643c4b3dca05b9543e6ab74c11a62d018b25f62571d6e9980ca1544b47ab6d1f6d9acc0f4d01fd715aeb62ce94199585284a78d84915b524cc9762be1ab6eae061d8056e7f36b02c6fb8a8b13756fd932de76df3005cbbdd79db689d0ce34e5567cb7dc461d3446aa91c4cdece452fd4b064a1eae89bdf5327b6d59e21b892eb3e4f9a325743ab7b283626121ac360f2cdbbbea18426bca825adc6c2fd9ec725eec0d74f676f0fa91e745f658c4e5824bf16a60293b64f61f4e85bb6ffff48c2f76055c2f964fae8a34d70142bfebf9101428a6a0525c6d667ca23ab369bf4638aee5eace688f3be9298dd4f4c707f07b726a70691f45fbc8dd83fd3e149c96cb2630d6870a77d44ed2881847fd34ba5eeb1e1375864988faf85bead55f208527b3b0b72b2c92f51dff422024315f3fd2258bcbb7251a4ae72f40cdfc2778bd200865012f9a16ee9f168bce0d7cdb3e87158dd14bc02b3acda3e70cb2c9ad5f42412903d1f168f28fe834f323e3efa10cf7e04b95129aab0fc9b84aa51b4e4959538151edaf2bf0d9b3ca776dd9e4cf83df650fa346e271adc278221b641ea65f2098093452e28309767ae798fee943c9adae47a9de663625ff1ae01501c14967b2175013d01b78f0380cbe458c8b17668491dda64b635551894c1882cf88d8b32567280079902d006b7aa6a4ebf60f1ea0df9797db86c7fdc5c02bb543ac43bfd29132781e0ef65145fbbffc582276bb444066a12c4c56775291e36053f7b2add4281dbd3d5d71077c556fb9328f58f029652f3968317d6e8b9f14e5c12e64bd18a80f643e608c8fce0c284f825961e2c24b848e72bad16450a4053337c1313a3993f6a12a13f2c2fa148b275fc51696ad230052a639507717bce70a875f2a01a762dc09d633802b8c406ae842f4f646920294b6b3afa227d778b5b77eeb4b5b3745c578f17f8db4f451db7f4cb288794a465ff13236619a0e6afb009be92f17c37473d4d0c497697a16b9fb917ba482d1df52df6a61d282702891bba2aafa70f326a9328c02832bef46cb31a7f1a7b2452dbda8df2d26b19eb7f7edcbb747b5751e6293ed162f517223731faee019c046c759ad8a74e660a6bf4a44f01edafd365db44966183379c0cb1fdd831a214fcbf547e4e1c645fcfc5bd47c90d46331ab61e0cc34672ce64a2d8ae0dda61cbf94ac82ae94afb25b9ea1c9a69aa9bd1535cb5e62bf2bbd234932c6036291edddd8e88cd16cfd801bbf126df0508d291c9b937e3f8e70b4d260ae1705b568861ad4e06531c462d05c29ca8e9d65222d553cd3b63b404135f8a05acff0169c408c43397e96cdf55c9ad1ce47cca206a3ab5f84797c6f701330d34095c4e52784d4c410f1205746bf9cc623ec3ea3784d7ac1f9b11a234aedf212d3d89d41613e3398b184aac4da3abb2a6c6640abec250d4496742e983ba34fa0be95c4dc353d3973570ec63061512332466691aef19fd4cbbcfa250864d3e559a6368d98ade0d7fcd01f98feb2915effb55581ad0706bac902fa2897ab470b51d958f04e43bcd32e6167cf6bc02563f21d7406c791f748e52804f72359311cda267ba5ee0c1b9bc2699b291f156102cb36002ec7e36d8df8ff229230db989bb7d7aaadc7fd1dbac5abfa8a2b6a594706ad470488d959bd33aa5f04aae7553d1945e322c03388c694835893a58febaebb3ee7f7a3ed56f4947f406c263ac881c190d6481e5e32531d85aa97d0caad03ed8bdbc8291bbb3ee26186c2acae00c12ead53b0c4ee885b54498e8c40383b5e45996f9522c808728303e9faf7f91d21901f3f9c0eebb00144ae4d91d7054be2a8809bec9a86583f3026d856367f80b22f584d1840504c4b578b8827c3791a7142fcc7ead32e84cde0159eea50222a10f118c61957355dee51d3e5ea80c740d5b12d152903787050ee2185d3c27c3b85b74e4404a3df9503ed81ffae93f1707070b0cdaaba904de9d8c78ad0403d1882e72ed66986f4e5e9ebebe73ffdb51220ba1c91d3cdd80bfca97edb62292ac580d0663a39d5ab2702dee5d283968cafc3b589eadb4cbac0ef614f8c7b5155d1a39d7a3d88c474b0e2f325be52630d0c214c16eef0b9dad44dba9dd31285c45614918d291d7a01cca9e097e3cbd2bc0e73f7347fed9618b23ec3513fe4004a61f8f3d47195c2b9007fa428ef6fafcdc6a39ada9261a17892ef85bddbc79195e4dd3c9ecca1a2528c34d7c516d754cbcb3e2d4efe097ff539badb73015061c00df44d1ac0d4526a6685c6f9f99738ce2e7f72a7a028cabe847014439c3a3a2e707352205ff32bb3ada4119008c8fb2013a7d91c1d30688f0fd995c5140a492572bb43ff185d4325afd3b1a094701222b63bf82b75216be07800f661ac58a234b7c9918a61e102eece86966823cd2f46d8661578255a23a5d4bfc23be7364f14fdd4862ac6a713d5115ac1e50f17cf7905fc244b4677ec04934f2b3023a88f2d1d2339679c450496f0eb7bc324267ef2352ff4535b60ff4e7334342722c49be5bdf92a40b0272c35174abc627e2b448b3f1a1b1d6ed8a158013804f430caa6844a1050aebb4b5f68b088197662d954bddd767a05e6a783cb5113799f1f6f59ef24620d1776abf541ac40c215c03f6131b415355b4a092e7e4b6c76c71b0f793a7546108d0365811fee9154c6788c485ad1ebafc87e5a51bad4f10225e7249423bb27f05b1ce61cbd09c84e89c86c514948ca74f8afe6e607502c59ba52014892cf6e4c5af79d4ad671f79124d1a9ec52dc420a1b77b3fad47e34941402a7f7d3e3d8a53e93ae1980056467ba0003f299b7249430263f990833d074ca61766a1827f073375f3cb865a1a4c5e87d20747ca94fcada80ee9c30570e186d2a5677a6765d866085945ffb56d7f2e5c8b1bf137dc368fe9454753487c94b6785596f2858a4e66f856a00c0073bd4a8a407fe94fc3e635d4adecce80d7c1bc578941ec432e5f1875b1f2b95b052883a9daa40b1d5e3c2382ec721ac83b99ea65097be6a3f26ff0700a3929df16d1b435eee889e0919077231f4f6bbed
  puts Des.decrypt(key,en_str,"des",1)
  p "-"*80
  p 'g6AtgJul6q0='.from_base64
end
