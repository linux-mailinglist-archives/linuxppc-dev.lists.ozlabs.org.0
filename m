Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D3B255BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 18:37:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457hJH0N01zDqQt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 02:37:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="jfhi1r0V"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457hGy0zKFzDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 02:36:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 457hGn2Jb9z9v1S0;
 Tue, 21 May 2019 18:36:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jfhi1r0V; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tzkFtkuiH0MJ; Tue, 21 May 2019 18:36:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 457hGn106Dz9v1Rw;
 Tue, 21 May 2019 18:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558456577; bh=63Cy0jFNoRjK4GaBaJeTdumVS+/bcqc4YgC2cAsrwUc=;
 h=To:Cc:From:Subject:Date:From;
 b=jfhi1r0Ve/+01DtEHbXpLLBTgbyUnL1l/017Eme4pYph4A5u0aF+fB9vsxlCYGYBk
 fDLt+WB+rpGXts3w9TItVnO1HML1qm+uqmGRNFmquae5WkbxlJt95JeujbWFRxINbV
 3dh2ASLW03GQN5PWwXOkT2Ff3s5/6Do0T+vnnjPY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C702B8B815;
 Tue, 21 May 2019 18:36:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id e26M1Tzc3J53; Tue, 21 May 2019 18:36:18 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 819E58B814;
 Tue, 21 May 2019 18:36:17 +0200 (CEST)
To: Eric Biggers <ebiggers@google.com>, linux-crypto@vger.kernel.org
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Extra selftests failure on Talitos SEC1 hash algs - how can I
 identify the issue ?
Message-ID: <3442471b-cfc1-885d-980a-0be576ac81fb@c-s.fr>
Date: Tue, 21 May 2019 16:35:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

With the new selftests I get the following failures with Talitos on SEC1 
(mpc885).

I don't get those failures with Talitos on SEC2 (mpc8321E), but the 
driver is slightly different for SEC1 as it doesn't support S/G operations.

How can I identify what problem to look for based on the below logs ? (I 
have modified the testmgr to return 0 instead of -EINVAL on wrong hash 
result in order to have the tests run up to the end).

There are four successive startups.

Thanks
Christophe

[   44.001833] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=2715 ksize=0", cfg="random: use_finup 
src_divs=[<flush,nosimd>2.19%@+14, <flush>70.54%@+8554, 27.27%@+15]"
[   44.108062] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=860 ksize=0", cfg="random: use_final nosimd 
src_divs=[<reimport>34.53%@+6281, <flush>32.30%@+16375, 33.17%@+9323] 
dst_divs=[72.16%@+13710, 18.5%@+14, 9.79%@+16338]"
[   44.192174] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=19109 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[<reimport>70.8%@+31, <flush>6.44%@+5996, 23.48%@+16307]"
[   44.227768] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=2713 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[6.7%@+1661, <flush>90.5%@+12507, 
1.2%@alignmask+16306, <flush>2.86%@+16309] iv_offset=49"
[   44.456440] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=584 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[84.77%@+9, 10.43%@+10, <reimport>4.2%@+2817, 0.78%@+13809]"
[   44.679193] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=11637 ksize=0", cfg="random: inplace use_final 
src_divs=[<reimport>71.87%@+19, <flush>14.59%@+4039, 13.54%@+23] 
iv_offset=43"
[   44.829884] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=140 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[<flush>12.38%@+16262, <reimport>49.7%@+16280, 
38.55%@+17]"
[   44.937608] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=15581 ksize=0", cfg="random: inplace use_final 
src_divs=[<flush,nosimd>63.2%@+5723, <reimport>26.27%@+0, 10.71%@+16336]"
[   45.161565] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=602 ksize=0", cfg="random: may_sleep use_final 
src_divs=[<flush>40.26%@+16371, <reimport>26.4%@+7851, 
20.91%@alignmask+16336, 12.79%@+13696] dst_divs=[100.0%@+16285] 
iv_offset=24"
[   45.185838] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=225 ksize=0", cfg="random: use_finup 
src_divs=[8.53%@+8836, <flush,nosimd>57.48%@alignmask+10, 33.99%@+3781] 
dst_divs=[100.0%@+13601]"
[   45.255888] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=535 ksize=0", cfg="random: may_sleep use_final 
src_divs=[69.27%@+6420, <flush>25.64%@+16364, 5.9%@+16359] iv_offset=44"
[   45.540747] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=6123 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[13.47%@+24, <flush>68.88%@+1540, 17.65%@+16312] 
iv_offset=38"
[   45.564728] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=131 ksize=0", cfg="random: use_finup 
src_divs=[<flush,nosimd>63.96%@+2313, <reimport>12.3%@+1, 19.49%@+7, 
4.52%@+388] iv_offset=48"
[   45.651347] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=802 ksize=0", cfg="random: may_sleep use_final 
src_divs=[<reimport>52.62%@alignmask+26, <reimport>25.69%@+16350, 
16.79%@+16276, <reimport>4.90%@+5] dst_divs=[72.18%@+12892, 
27.82%@alignmask+5] iv_offset=59"
[   45.757169] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=742 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[32.14%@+14908, 11.80%@+24, <reimport>26.47%@+13, 
29.59%@alignmask+26] dst_divs=[100.0%@+11250] iv_offset=3"
[   45.909272] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=19022 ksize=0", cfg="random: use_finup nosimd 
src_divs=[45.28%@+14, 18.41%@alignmask+16331, <reimport>20.9%@+8817, 
13.65%@+10854, 2.1%@+10, <flush>0.29%@+0, <flush,nosimd>0.27%@+16350] 
iv_offset=35"
[   45.959169] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=2449 ksize=0", cfg="random: inplace use_final 
nosimd src_divs=[65.95%@+8789, <flush>6.91%@alignmask+16363, 27.14%@+15] 
iv_offset=22"
[   45.995863] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=963 ksize=0", cfg="random: use_final nosimd 
src_divs=[52.18%@+8311, <reimport>45.55%@+13735, 2.27%@+16371] iv_offset=5"
[   46.366870] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=2591 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[21.73%@+16354, <flush>37.20%@alignmask+16302, 
41.7%@+5145] iv_offset=57"
[   46.411039] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=417 ksize=0", cfg="random: may_sleep use_final 
src_divs=[<reimport>8.51%@+11479, <reimport>53.54%@alignmask+11025, 
<reimport>5.97%@+15807, 31.98%@+8761] dst_divs=[29.29%@+7, 
5.13%@alignmask+31, 38.82%@+15248, 2"
[   46.654804] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 3, cfg="random: may_sleep use_final 
src_divs=[<reimport>38.33%@+16317, <reimport>19.68%@+16291, 
41.99%@+10303] dst_divs=[100.0%@alignmask+16267] iv_offset=10"
[   46.679722] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 3, cfg="random: use_finup src_divs=[55.59%@+17, 
<flush,nosimd>40.97%@+18, 3.44%@+28] iv_offset=32"
[   46.704303] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 3, cfg="random: use_final nosimd src_divs=[31.59%@+13746, 
<flush>12.48%@+14769, 55.93%@alignmask+8586] dst_divs=[66.66%@+11, 
33.34%@+1627] iv_offset=38"
[   46.768049] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: inplace use_final nosimd 
src_divs=[10.26%@+15, <flush>11.20%@+19, 78.54%@+3] iv_offset=12"
[   46.786389] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: inplace may_sleep use_final 
src_divs=[22.92%@alignmask+16282, 12.4%@alignmask+16321, 
<reimport>35.1%@+23, <flush>4.16%@+16303, 23.72%@+4674, 1.83%@+10681, 
<flush>0.20%@+14, 0.12%@alig"
[   46.824112] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: inplace may_sleep use_final 
src_divs=[20.49%@+28, 47.91%@+9987, <reimport>12.18%@+16295, 
19.42%@alignmask+7480] iv_offset=38"
[   46.845067] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: use_finup src_divs=[61.73%@+16285, 
<flush,nosimd>21.48%@+1, 16.79%@+16326]"
[   46.865716] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: inplace may_sleep use_finup 
src_divs=[<reimport>24.68%@+10, <reimport>32.69%@+9557, 
<reimport>32.98%@+16324, 9.45%@+2459, <flush>0.10%@+6662, 
<reimport>0.7%@alignmask+6341, 0.3%@+1504"
[   46.905543] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: may_sleep use_finup src_divs=[25.1%@+16336, 
<reimport>65.73%@+8962, 5.1%@alignmask+16319, 
<reimport>4.9%@alignmask+16361, 0.6%@+4975, 0.10%@+16362] 
dst_divs=[100.0%@+16189]"
[   47.212499] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=29628 ksize=0", cfg="random: may_sleep 
use_final src_divs=[<flush>23.50%@+16381, <flush>44.49%@+11558, 
32.1%@+16314]"
[   47.237945] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=19339 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[<flush>2.83%@+11622, <reimport>21.57%@+10, 
46.27%@+14, 29.33%@+16342]"
[   47.268254] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=12169 ksize=0", cfg="random: use_finup 
src_divs=[76.2%@+5100, 11.63%@+16257, <reimport>2.91%@alignmask+4, 
<flush>2.84%@+4, 6.60%@alignmask+1] dst_divs=[19.66%@alignmask+4, 
80.34%@+29]"
[   47.362565] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=386 ksize=0", cfg="random: inplace use_finup 
src_divs=[31.67%@alignmask+16383, <flush,nosimd>55.53%@+13892, 
<reimport>9.98%@+10, 2.82%@+14102]"
[   47.454257] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=112 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<reimport>10.29%@alignmask+2012, 
<reimport>74.31%@+25, 15.40%@+2] iv_offset=61"
[   47.475835] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=236 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<reimport>41.88%@+9258, <flush>21.56%@+15501, 
36.56%@+16290] dst_divs=[74.15%@+15826, 25.85%@+4204] iv_offset=16"
[   47.504591] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=6900 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<flush>35.37%@+11, 37.57%@+3362, 
<reimport>10.21%@+454, 16.69%@+24, 0.16%@+19] iv_offset=50"
[   47.762886] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=7393 ksize=0", cfg="random: may_sleep 
use_final src_divs=[<reimport>79.62%@+2386, 0.75%@+27, 
<reimport>13.37%@+14859, 6.26%@+16372]"
[   47.839055] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=161 ksize=0", cfg="random: inplace use_finup 
src_divs=[32.5%@+16301, <flush,nosimd>16.72%@+22, 41.11%@+9, 
<reimport>6.76%@+14, <flush,nosimd>3.36%@+1270]"
[   48.283344] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=428 ksize=0", cfg="random: use_final 
src_divs=[40.47%@+16284, <reimport>5.9%@+17, 23.88%@+4163, 
<flush,nosimd>7.44%@+8562, <flush>16.3%@alignmask+538, 7.9%@+16298] 
dst_divs=[100.0%@alignmask+3387]"
[   48.658139] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=22780 ksize=0", cfg="random: inplace 
use_finup src_divs=[<flush,nosimd>81.51%@alignmask+23, 
<reimport>10.71%@+28, 7.78%@+7514]"
[   48.896532] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=29843 ksize=0", cfg="random: inplace 
use_finup nosimd src_divs=[<reimport>5.36%@+4568, <flush>46.31%@+12, 
48.33%@+16382]"
[   48.936870] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=724 ksize=0", cfg="random: use_finup 
src_divs=[72.5%@+11441, 19.74%@+16275, <flush>5.39%@alignmask+54, 
2.82%@+10287] dst_divs=[100.0%@+12809] iv_offset=13"
[   49.050320] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=190 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[25.37%@alignmask+8, <flush>33.68%@+16351, 
<reimport>23.85%@+11340, 17.10%@alignmask+8] iv_offset=34"
[   49.226812] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=523 ksize=0", cfg="random: use_final nosimd 
src_divs=[<reimport>5.59%@alignmask+16319, <reimport>91.53%@+3563, 
1.45%@+16370, <reimport,nosimd>1.43%@alignmask+16283]"
[   49.272256] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=27700 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[26.96%@alignmask+1720, <reimport>57.82%@+13449, 
10.86%@+3880, 0.76%@+13918, 2.69%@+16350, 
<reimport>0.37%@alignmask+16382, 0.54%@+4084] iv_offset=58"
[   49.419216] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=21795 ksize=0", cfg="random: inplace 
use_finup src_divs=[<reimport,nosimd>17.99%@+16270, 
<reimport>54.74%@+16327, 6.35%@+28, <reimport,nosimd>14.66%@+26, 
6.26%@+14415]"
[   49.466684] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=222 ksize=0", cfg="random: inplace use_finup 
src_divs=[19.6%@alignmask+20, <flush>8.5%@+2069, 72.89%@alignmask+30] 
iv_offset=57"
[   49.595343] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=16234 ksize=0", cfg="random: use_final nosimd 
src_divs=[59.48%@+16289, <flush>13.4%@+8, 1.88%@+16279, 20.97%@+10, 
<reimport,nosimd>4.63%@alignmask+16383] dst_divs=[9.0%@+13, 91.0%@+9269] 
iv_offset=41"
[   49.671122] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=387 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<reimport>73.5%@+6, <reimport>18.58%@+16351, 
<reimport>4.61%@+9514, 0.53%@alignmask+23, 0.59%@alignmask+16282, 
2.64%@+16292] dst_divs=[98.52%@+16381, 0.9"
[   49.736671] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=25904 ksize=0", cfg="random: inplace 
use_finup src_divs=[<reimport>79.19%@+1445, <reimport,nosimd>4.9%@+8544, 
16.72%@+16300]"
[   49.791913] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=30297 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[<flush>34.59%@+15887, 
<flush>11.30%@+15552, 49.85%@+11, 4.26%@+16381]"
[   49.891188] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=25509 ksize=0", cfg="random: inplace 
may_sleep use_finup src_divs=[<flush>68.2%@+8, <reimport>24.32%@+16257, 
6.97%@+22, <reimport>0.6%@+16291, 0.15%@+26, 0.48%@+6267]"
[   49.963164] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=776 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<flush>57.38%@+13203, <flush>17.18%@+5, 
25.44%@alignmask+12063] iv_offset=15"
[   50.003408] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=14540 ksize=0", cfg="random: use_final nosimd 
src_divs=[50.68%@+3, <flush,nosimd>30.62%@+21, 1.11%@alignmask+3645, 
<flush,nosimd>17.59%@+18] dst_divs=[100.0%@alignmask+16292] iv_offset=54"
[   50.192409] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=7893 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[49.88%@+14734, 5.5%@+16296, <reimport>37.8%@+16335, 
2.14%@+16264, 4.86%@+9411, 0.99%@+16277]"
[   50.473857] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_finup src_divs=[8.41%@+8, 
<reimport,nosimd>53.84%@+16303, <flush,nosimd>30.37%@+16299, 
7.38%@+7084] iv_offset=9"
[   50.494337] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: use_finup src_divs=[20.4%@+28, 
<flush,nosimd>39.52%@+4, <flush,nosimd>21.43%@+16280, 19.1%@+12319] 
iv_offset=29"
[   50.538417] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace may_sleep use_finup 
src_divs=[<reimport>21.8%@+11573, <reimport>26.79%@alignmask+16353, 
52.13%@+15]"
[   50.763803] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=387 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[48.25%@alignmask+16323, <flush>13.58%@+20, 
38.17%@+10444] iv_offset=27"
[   51.090739] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=217 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>4.37%@+4021, <reimport>19.0%@+21, 
53.11%@+16295, <flush>19.34%@alignmask+9, <flush>4.18%@+515] iv_offset=14"
[   51.223871] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=18755 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[<flush>44.6%@+21, <flush>26.42%@+15566, 
<reimport>24.24%@alignmask+24, 5.28%@+23]"
[   51.310169] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=13599 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[39.4%@+16280, <flush>43.7%@+16344, 
<flush>4.12%@+5998, <flush>4.53%@alignmask+23, 9.24%@alignmask+23] 
iv_offset=5"
[   51.758218] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=28054 ksize=0", cfg="random: inplace 
use_finup src_divs=[<reimport>17.24%@+16333, <flush,nosimd>8.65%@+30, 
74.11%@+7] iv_offset=25"
[   51.802009] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=415 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<flush>62.51%@+12552, <reimport>8.61%@+1, 
13.48%@alignmask+16273, 15.40%@alignmask+13346] iv_offset=59"
[   51.882957] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=440 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<flush>72.70%@+19, <reimport>3.65%@+8995, 
23.65%@+2845] iv_offset=9"
[   52.146550] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=12409 ksize=0", cfg="random: may_sleep 
use_final src_divs=[91.38%@+10549, <flush>6.40%@alignmask+14307, 
0.94%@+16363, <flush>1.8%@+14, <flush>0.20%@alignmask+13] iv_offset=12"
[   52.231246] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=7142 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[<flush>8.38%@+16334, <flush>66.53%@alignmask+16293, 
5.81%@+16344, <reimport>19.28%@+12255] iv_offset=54"
[   52.581090] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=130 ksize=0", cfg="random: use_final nosimd 
src_divs=[48.24%@+11614, <flush,nosimd>20.56%@alignmask+1236, 
31.20%@alignmask+12] iv_offset=13"
[   52.803481] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=27603 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[<flush>91.61%@+13, <reimport>4.29%@+5, 
3.98%@+20, <flush>0.5%@+12387, 0.7%@+8] iv_offset=41"
[   53.106767] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=13722 ksize=0", cfg="random: inplace 
may_sleep use_finup src_divs=[9.26%@+16288, <flush>51.47%@+16295, 
39.27%@+6] iv_offset=42"
[   53.332945] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=339 ksize=0", cfg="random: use_finup nosimd 
src_divs=[15.74%@+5293, 14.39%@+1437, <reimport>47.67%@+19, 
13.60%@alignmask+23, 8.60%@+6] dst_divs=[84.65%@+16338, 15.35%@+2]"
[   53.447269] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=226 ksize=0", cfg="random: use_finup 
src_divs=[<flush>83.75%@+12, <reimport>9.5%@+5, 7.20%@alignmask+9194]"
[   53.560647] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=729 ksize=0", cfg="random: inplace use_final 
src_divs=[<flush,nosimd>77.8%@alignmask+2547, 
<flush,nosimd>15.67%@alignmask+7022, 7.25%@+8]"
[   53.846697] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_final nosimd 
src_divs=[54.55%@+16344, 22.94%@+0, 1.94%@+31, <reimport>2.11%@+16314, 
18.46%@+5825]"
[   53.874599] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: use_finup src_divs=[17.36%@+10804, 
<reimport>23.99%@+4823, 17.56%@+4601, 41.9%@+26] dst_divs=[100.0%@+27]"
[   53.894769] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_finup 
src_divs=[<reimport>4.37%@+16354, <reimport,nosimd>6.8%@+4403, 
89.55%@alignmask+9821]"
[   53.915321] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_finup nosimd 
src_divs=[38.31%@+16383, 2.46%@+14, <flush>29.53%@+4729, 
<reimport>20.62%@+17, 9.8%@alignmask+13]"
[   53.940766] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: use_finup nosimd 
src_divs=[<reimport,nosimd>33.23%@+6, <reimport,nosimd>12.94%@+14348, 
29.9%@+9892, <reimport>24.74%@alignmask+11]"
[   54.293394] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=20181 ksize=0", cfg="random: may_sleep 
use_final src_divs=[<reimport>46.52%@+2, <reimport>8.52%@+5390, 
44.96%@+15219] dst_divs=[55.54%@+5, 40.48%@+15188, 3.98%@+18]"
[   54.362659] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=20912 ksize=0", cfg="random: inplace 
use_finup nosimd src_divs=[<reimport>60.60%@+12146, <reimport>25.25%@+3, 
14.15%@+16270] iv_offset=11"
[   54.389003] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=685 ksize=0", cfg="random: use_final nosimd 
src_divs=[<flush,nosimd>39.44%@+16337, <reimport,nosimd>24.98%@+4110, 
15.47%@+8249, <flush>20.11%@+26] iv_offset=49"
[   54.912029] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=198 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[14.64%@+16263, <flush>79.81%@alignmask+2202, 
4.29%@alignmask+14649, <reimport>1.26%@+16315]"
[   55.080049] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=12892 ksize=0", cfg="random: inplace 
may_sleep use_finup src_divs=[56.5%@+24, <flush>0.40%@+14208, 
43.55%@+10] iv_offset=4"
[   55.535374] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=3963 ksize=0", cfg="random: inplace use_finup 
nosimd src_divs=[<flush>24.1%@+16372, 
<flush,nosimd>60.62%@alignmask+16364, <flush>11.17%@+12949, 1.50%@+0, 
<flush>1.74%@+3760, 0.29%@+17, 0.41%@+31, 0.26%@+575]"
[   55.595475] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=627 ksize=0", cfg="random: use_finup nosimd 
src_divs=[3.45%@+8104, 44.5%@+13607, <reimport>36.28%@+8, 
<reimport>4.25%@+15, 5.95%@+19, 6.2%@+16360] dst_divs=[100.0%@+16326] 
iv_offset=3"
[   55.675811] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=18672 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<reimport>87.28%@+7, <reimport>8.22%@+7480, 4.50%@+23] 
dst_divs=[100.0%@+7725]"
[   56.031668] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=383 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[15.91%@+11, <reimport>56.86%@+3595, 
<flush>10.81%@+2, 3.41%@+16342, 13.1%@+12530] iv_offset=38"
[   56.117922] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=30715 ksize=0", cfg="random: inplace 
use_finup nosimd src_divs=[<flush,nosimd>48.94%@+2105, 
<reimport,nosimd>2.79%@+25, 13.95%@+564, 
<reimport,nosimd>34.32%@alignmask+16274]"
[   56.227808] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=9868 ksize=0", cfg="random: use_final 
src_divs=[<reimport,nosimd>68.17%@+15, 23.98%@+4869, 
<reimport>6.53%@+15, 1.32%@+3181] iv_offset=38"
[   56.269652] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=20126 ksize=0", cfg="random: use_final nosimd 
src_divs=[79.10%@+11679, 5.42%@+9949, <reimport>11.94%@alignmask+21, 
3.54%@+2943] dst_divs=[85.73%@+12616, 14.27%@+15587] iv_offset=56"
[   56.295219] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=111 ksize=0", cfg="random: inplace use_finup 
src_divs=[<reimport,nosimd>48.54%@+16262, <reimport>31.23%@+27, 
20.23%@alignmask+7079]"
[   56.316698] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=205 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[63.98%@+28, <flush>0.91%@+13, 9.73%@alignmask+16317, 
25.38%@+7] dst_divs=[100.0%@+6] iv_offset=17"
[   56.397804] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=26417 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<flush,nosimd>65.90%@+16321, <reimport>4.83%@+4940, 29.27%@+7] 
dst_divs=[100.0%@+12522]"
[   56.547747] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=860 ksize=0", cfg="random: may_sleep 
use_final src_divs=[24.69%@+13903, <reimport>46.46%@+9025, 
<flush>11.77%@+16073, 17.8%@+3609] dst_divs=[100.0%@+16318] iv_offset=58"
[   56.573965] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=645 ksize=0", cfg="random: inplace use_finup 
nosimd src_divs=[35.86%@+12, 0.5%@+9, 11.59%@+16373, <flush>51.84%@+26, 
0.66%@+15799]"
[   56.710296] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=12933 ksize=0", cfg="random: inplace 
use_final src_divs=[66.34%@+6414, <reimport>32.59%@+15, 1.7%@+5352] 
iv_offset=31"
[   56.775253] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=296 ksize=0", cfg="random: may_sleep 
use_final src_divs=[34.93%@+10563, 15.82%@+8, 
<reimport>27.56%@alignmask+16, 20.45%@+13512, <flush>0.9%@+3382, 
<reimport>1.15%@+8713] dst_divs=[100.0%@+4134] iv_offset=40"
[   56.943058] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=17280 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[<flush>2.91%@+313, <flush>28.30%@+16262, 
68.79%@+8] iv_offset=52"
[   57.128981] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=277 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>49.19%@+16370, <flush>42.8%@+16270, 8.73%@+31]"
[   57.234174] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=31541 ksize=0", cfg="random: may_sleep 
use_final src_divs=[59.66%@+7693, <reimport>33.79%@+3210, 4.11%@+16318, 
<reimport>1.59%@+6908, <flush>0.85%@+16338] dst_divs=[69.68%@+16356, 
30.32%@+16322]"

[   42.824278] alg: hash: md5-talitos test failed (wrong result) on test 
vector 6, cfg="random: use_finup src_divs=[59.82%@+5338, 
<reimport>15.92%@alignmask+15, 24.26%@alignmask+4] 
dst_divs=[100.0%@+16284] iv_offset=28"
[   42.844215] alg: hash: md5-talitos test failed (wrong result) on test 
vector 6, cfg="random: may_sleep use_finup src_divs=[32.72%@+3251, 
<flush>61.97%@+8901, 5.31%@+1845]"
[   42.866140] alg: hash: md5-talitos test failed (wrong result) on test 
vector 6, cfg="random: inplace use_finup nosimd 
src_divs=[<reimport>18.6%@+8599, 54.35%@+12736, <flush>10.62%@+16322, 
2.24%@+1783, 14.73%@+16] iv_offset=42"
[   42.892301] alg: hash: md5-talitos test failed (wrong result) on test 
vector 6, cfg="random: use_finup src_divs=[<reimport>3.93%@+11515, 
<reimport,nosimd>39.19%@+9874, <flush,nosimd>11.78%@alignmask+14, 
45.10%@+16261] dst_divs=[100.0%@+0]"
[   42.944880] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=10129 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[24.13%@alignmask+16351, <flush>14.52%@alignmask+1061, 61.35%@+15]"
[   43.107826] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=222 ksize=0", cfg="random: use_finup 
src_divs=[34.43%@+3458, <reimport>31.91%@alignmask+20, 23.70%@+11, 
<flush,nosimd>7.73%@alignmask+29, 1.41%@+12221, <flush,nosimd>0.8%@+11, 
<flush>0.34%@+16362, 0.40%@+16364]"
[   43.364980] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=1003 ksize=0", cfg="random: inplace use_final 
nosimd src_divs=[14.12%@+16318, <flush,nosimd>33.76%@+1724, 8.42%@+22, 
31.83%@+16316, <reimport,nosimd>11.2%@+2626, <flush>0.85%@+24]"
[   43.433803] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=167 ksize=0", cfg="random: inplace use_finup 
src_divs=[21.59%@+14, <flush>73.9%@+7926, 5.32%@+16281]"
[   43.552238] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=142 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[23.20%@+16307, <reimport>43.59%@+12, 12.20%@alignmask+16364, 
21.1%@alignmask+10] dst_divs=[1.88%@+16, 29.48%@+23, 32.6%@+15403, 
34.42%@+1050, 2.16%@+0] i"
[   43.722079] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=287 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[<flush>13.0%@+16297, <flush>66.26%@+5380, 
20.74%@alignmask+9862]"
[   43.753497] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=11516 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[<reimport>0.21%@+0, <flush>66.63%@+16354, 13.24%@+6193, 
<flush>3.94%@+16279, <reimport>15.98%@+2896] iv_offset=15"
[   43.969361] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=652 ksize=0", cfg="random: inplace use_finup 
nosimd src_divs=[<reimport>55.6%@+0, <flush>21.95%@+25, 13.2%@+16356, 
8.29%@+7743, 1.68%@+4956] iv_offset=3"
[   44.615732] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=18370 ksize=0", cfg="random: use_final 
src_divs=[21.15%@+14102, <reimport,nosimd>5.5%@+4320, 40.97%@+9, 
<reimport,nosimd>32.83%@+7269] iv_offset=16"
[   44.909893] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=333 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[71.95%@+16263, <reimport>8.23%@+16352, 
19.82%@+16300] iv_offset=2"
[   44.941347] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=26311 ksize=0", cfg="random: may_sleep use_final 
src_divs=[69.63%@+12556, <flush>15.73%@alignmask+11, 14.64%@+158]"
[   45.214430] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: inplace use_final 
src_divs=[<reimport>87.38%@+29, <flush>4.65%@+1, 6.26%@+3174, 0.53%@+12, 
<reimport>1.14%@+9, <flush,nosimd>0.1%@+11447, 0.2%@+14211, 0.1%@+15277]"
[   45.249703] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: inplace use_final 
src_divs=[<reimport,nosimd>32.64%@+16297, 19.17%@+7, <flush>14.32%@+18, 
33.87%@+20] iv_offset=1"
[   45.281997] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: use_finup nosimd src_divs=[10.64%@+15905, 
<flush,nosimd>42.18%@+16272, 19.1%@+8, 26.50%@+16266, 
<flush,nosimd>0.39%@+8137, 1.20%@+7, <flush,nosimd>0.8%@+5448]"
[   45.318096] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: use_finup nosimd 
src_divs=[<reimport>1.36%@+15412, <reimport>8.76%@+20, 89.88%@+21] 
iv_offset=3"
[   45.449639] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=14122 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[40.60%@+13912, <flush>25.4%@+17, 34.36%@+13952] 
dst_divs=[2.37%@+9, 63.23%@alignmask+23, 28.71%@+16339, 0.27%@+16374, 
0.45%@+30, 4.97%@+26]"
[   45.788347] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=14078 ksize=0", cfg="random: use_finup 
src_divs=[<reimport,nosimd>74.43%@+15, 23.49%@+11831, 1.39%@+14, 
<reimport>0.36%@+16381, 0.33%@alignmask+16286] dst_divs=[89.98%@+16275, 
10.2%@alignmask+379]"
[   46.374990] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=681 ksize=0", cfg="random: use_finup 
src_divs=[43.83%@alignmask+15583, <reimport>48.71%@+14325, 7.46%@+16352] 
dst_divs=[70.72%@alignmask+2657, 5.19%@+845, 1.48%@+16355, 5.53%@+12410, 
1.40%@+8, 2.91%@+6, 12.11%@"
[   46.412643] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=812 ksize=0", cfg="random: inplace use_finup 
nosimd src_divs=[<reimport,nosimd>8.79%@+16, 22.48%@+8, 
<flush,nosimd>43.63%@+11, 25.10%@+9227]"
[   46.595800] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=100 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<flush>35.74%@+0, <reimport>4.19%@+2, 
9.87%@alignmask+31, <flush>32.64%@+13560, 17.56%@+12330]"
[   46.653599] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=283 ksize=0", cfg="random: use_final 
src_divs=[46.11%@alignmask+16006, 
<reimport,nosimd>34.53%@alignmask+2287, 10.54%@+16353, 
<flush>5.87%@+8911, 1.19%@+4, 1.76%@+1823] iv_offset=19"
[   46.789670] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=761 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<reimport>52.22%@+31, <flush>22.39%@+7292, 
25.39%@+25] dst_divs=[100.0%@+14461]"
[   47.536450] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=19896 ksize=0", cfg="random: may_sleep 
use_final src_divs=[<reimport>4.36%@+30, <flush>68.61%@+10319, 
27.3%@+512] iv_offset=39"
[   47.565591] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=245 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>23.3%@+14, <reimport>57.33%@+16334, 
5.73%@+17, 13.91%@+19] dst_divs=[100.0%@+8]"
[   47.652571] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=16628 ksize=0", cfg="random: inplace 
use_final src_divs=[<flush,nosimd>12.42%@+1302, <reimport>38.34%@+7681, 
49.24%@+20]"
[   47.937056] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace may_sleep use_finup 
src_divs=[48.33%@+13929, <flush>41.93%@+16316, 9.74%@+22]"
[   47.972405] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace may_sleep use_finup 
src_divs=[37.14%@+14, <reimport>8.88%@+15793, <reimport>35.34%@+4080, 
18.64%@+4023] iv_offset=61"
[   48.008211] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_finup nosimd 
src_divs=[5.58%@+31, <flush,nosimd>76.87%@+15, 12.93%@+372, 4.62%@+5295]"
[   48.033348] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=11103 ksize=0", cfg="random: inplace 
may_sleep use_finup src_divs=[<flush>44.40%@+7357, <flush>0.62%@+2416, 
<reimport>52.97%@+5, 2.1%@+29] iv_offset=10"
[   48.209986] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=1134 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[85.57%@alignmask+16264, <reimport>13.73%@+12669, 
0.34%@+3, 0.9%@+16368, 0.27%@+24] iv_offset=60"
[   48.269245] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=24130 ksize=0", cfg="random: may_sleep 
use_final src_divs=[<flush>71.94%@+16296, <flush>4.0%@+15923, 
9.49%@alignmask+11271, 12.31%@+7, <flush>1.60%@+31, 
<flush>0.65%@alignmask+11794, <flush>0.1%@+1] dst_divs=[100"
[   48.320500] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=134 ksize=0", cfg="random: inplace use_finup 
src_divs=[<reimport,nosimd>91.95%@+11682, <reimport,nosimd>4.83%@+3008, 
2.49%@+16335, <reimport>0.6%@+5, 0.42%@+0, <flush>0.25%@+7622] iv_offset=19"
[   48.391034] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=217 ksize=0", cfg="random: use_finup 
src_divs=[65.30%@+16206, <reimport,nosimd>31.33%@+16306, 3.37%@+15847]"
[   48.572720] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=157 ksize=0", cfg="random: inplace use_finup 
nosimd src_divs=[<reimport>77.4%@+31, <flush,nosimd>13.67%@+10, 
9.29%@+7167] iv_offset=52"
[   48.978029] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=28148 ksize=0", cfg="random: use_finup 
src_divs=[58.33%@alignmask+3962, <reimport,nosimd>6.77%@alignmask+9395, 
34.90%@alignmask+16305] dst_divs=[64.47%@+3374, 35.53%@+5797]"
[   49.555861] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=31117 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<flush,nosimd>67.40%@+16371, <reimport,nosimd>16.70%@+23, 
15.90%@+22] dst_divs=[10.22%@+16375, 26.31%@+25, 54.65%@+6934, 
5.48%@+16343, 3.34%@alignmask+8]"
[   49.685109] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=750 ksize=0", cfg="random: inplace use_finup 
nosimd src_divs=[87.26%@+29, <flush,nosimd>10.62%@+10257, 2.12%@+8012] 
iv_offset=4"
[   49.783572] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=4384 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>90.33%@+10390, <flush>2.63%@+31, 
<flush>1.47%@+12020, 3.55%@+2155, <flush>2.2%@+4289] dst_divs=[100.0%@+15]"
[   49.948495] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=106 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[36.83%@+22, <reimport>57.36%@+17, 3.28%@+3319, 
2.53%@alignmask+10760]"
[   50.153109] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=17872 ksize=0", cfg="random: inplace 
may_sleep use_finup src_divs=[24.48%@+795, 10.8%@+24, 
<reimport>42.11%@+21, 23.33%@+8] iv_offset=55"
[   50.234905] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=30504 ksize=0", cfg="random: may_sleep 
use_final src_divs=[<reimport>80.57%@+8, <flush>5.57%@+16298, 
13.86%@+15528] iv_offset=10"
[   50.269743] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=158 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<flush>80.17%@+1, <reimport>15.94%@+15014, 3.89%@+9]"
[   50.509073] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=9700 ksize=0", cfg="random: inplace use_final 
src_divs=[<flush,nosimd>10.50%@+2019, 22.66%@+1608, 22.91%@+16345, 
28.60%@+14332, <reimport,nosimd>6.36%@+16, 3.90%@+16353, 
2.49%@alignmask+2890, 2.58%@+10511]"
[   50.620722] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=32487 ksize=0", cfg="random: use_final 
src_divs=[48.30%@+16278, <flush,nosimd>0.18%@+3815, 
<reimport>18.26%@+5709, 22.22%@+2655, 9.18%@+2124, 
1.14%@alignmask+16300, 0.13%@alignmask+4337, <reimport>0.59%@+5] dst_d"
[   50.934263] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=141 ksize=0", cfg="random: use_finup nosimd 
src_divs=[82.65%@+8359, <flush>3.25%@+14153, 14.10%@alignmask+16316]"
[   51.371954] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=635 ksize=0", cfg="random: use_finup nosimd 
src_divs=[59.12%@+8, <reimport,nosimd>40.17%@+15814, 0.71%@+6913] 
dst_divs=[100.0%@+2657] iv_offset=22"
[   51.572217] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=126 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<reimport>19.98%@+7737, <reimport>30.54%@+8, 
49.48%@+14]"
[   51.817825] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace may_sleep use_finup 
src_divs=[61.95%@+12, <reimport>33.6%@+7462, 3.80%@+29, 1.19%@+16343] 
iv_offset=3"
[   51.836745] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_final nosimd 
src_divs=[35.33%@+8, <reimport>1.74%@+21, 62.93%@+16307]"
[   51.856359] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_finup src_divs=[30.10%@+16265, 
55.57%@+26, <flush,nosimd>0.45%@+3, 2.12%@alignmask+8, 11.76%@+16353]"
[   51.884568] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: may_sleep use_finup src_divs=[12.9%@+0, 
<flush>58.49%@+9, 26.69%@+16301, 2.71%@alignmask+23, <flush>0.2%@+14190] 
dst_divs=[100.0%@+4484]"
[   51.915276] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: use_final src_divs=[45.61%@+3400, 
<reimport>4.69%@+4670, 49.70%@alignmask+5] iv_offset=43"
[   51.937017] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_finup 
src_divs=[<flush,nosimd>73.57%@+16162, <flush,nosimd>26.24%@+11598, 
0.15%@+7, 0.4%@+13231]"
[   52.087889] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=5630 ksize=0", cfg="random: inplace use_final 
nosimd src_divs=[<flush,nosimd>57.61%@+3, 2.82%@+11, 
<reimport,nosimd>7.22%@+28, 23.25%@alignmask+16337, 
<flush,nosimd>9.10%@+16269] iv_offset=25"
[   52.228550] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=845 ksize=0", cfg="random: inplace use_finup 
nosimd src_divs=[59.26%@+3764, 5.69%@+10425, 
<reimport,nosimd>30.18%@+7837, 4.87%@+16280] iv_offset=38"
[   52.372848] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=4083 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[75.50%@+12201, <flush>12.46%@+24, 
12.4%@alignmask+26] iv_offset=61"
[   52.594334] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=23542 ksize=0", cfg="random: use_finup 
src_divs=[<flush>24.98%@+23, <reimport,nosimd>3.46%@+9, 
71.56%@alignmask+16325]"
[   52.765938] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=9996 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[72.50%@+14578, <reimport>3.81%@+19, 
<flush>6.68%@+15657, <reimport>15.49%@+16265, 0.6%@+16318, 0.18%@+10946, 
0.3%@+20, 1.25%@alignmask+7] iv_offs"
[   53.188174] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=861 ksize=0", cfg="random: use_final 
src_divs=[<flush>16.60%@+5, <reimport,nosimd>16.62%@+16305, 66.78%@+13734]"
[   53.278733] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=3734 ksize=0", cfg="random: inplace use_final 
nosimd src_divs=[93.92%@+16281, 1.50%@+20, <reimport>1.67%@+15309, 
2.91%@+16309]"
[   53.492933] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=16973 ksize=0", cfg="random: inplace 
use_finup nosimd src_divs=[92.92%@alignmask+16334, <reimport>3.64%@+2, 
3.44%@+7784]"
[   53.688926] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=15156 ksize=0", cfg="random: inplace 
use_final nosimd src_divs=[28.90%@+6, <reimport>65.7%@+16352, 
0.46%@+6100, 0.35%@+18, 5.22%@+24]"
[   53.923942] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=101 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>27.40%@+14, <reimport>31.23%@+12, 
41.37%@alignmask+24] iv_offset=23"
[   54.551914] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=28834 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[<reimport>60.53%@+16359, 
<flush>1.53%@+14508, 37.94%@+16273] iv_offset=28"
[   54.589265] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=69 ksize=0", cfg="random: use_finup nosimd 
src_divs=[75.31%@+12023, <flush>15.21%@+16257, 4.62%@+5616, 4.86%@+16299]"
[   54.742020] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=193 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[43.2%@+16327, 20.63%@alignmask+8, 
<reimport>17.19%@+4337, 19.16%@alignmask+1]"
[   54.797509] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=24837 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[38.74%@+2162, 20.32%@+0, 
<reimport>7.73%@+16370, <flush>21.42%@+27, 2.6%@+6665, 
<reimport>9.73%@+10] iv_offset=50"
[   54.858388] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=17518 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>51.47%@+16351, 10.14%@alignmask+16289, 
<reimport>33.20%@+656, 5.19%@+8737] iv_offset=8"
[   54.962553] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=234 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[44.59%@+16287, <flush>16.96%@+6, 38.45%@+16333] 
dst_divs=[100.0%@+14667]"
[   55.006116] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=68 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[44.85%@+5638, 32.40%@+11326, <flush>18.17%@+2178, 
4.58%@alignmask+1]"

[   42.821956] alg: hash: md5-talitos test failed (wrong result) on test 
vector 6, cfg="random: inplace use_finup nosimd src_divs=[10.1%@+16340, 
<flush,nosimd>46.24%@alignmask+22, 43.75%@+135] iv_offset=37"
[   42.857460] alg: hash: md5-talitos test failed (wrong result) on test 
vector 6, cfg="random: inplace may_sleep use_finup 
src_divs=[<reimport>7.69%@+16343, <reimport>82.26%@+6174, 10.5%@+8697] 
iv_offset=12"
[   42.886721] alg: hash: md5-talitos test failed (wrong result) on test 
vector 6, cfg="random: may_sleep use_finup src_divs=[26.76%@+14767, 
<flush>37.61%@+112, 35.39%@+2019, <flush>0.22%@+6235, 0.2%@+16301] 
iv_offset=41"
[   42.950397] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=27464 ksize=0", cfg="random: use_final nosimd 
src_divs=[<flush>71.74%@+24, <reimport,nosimd>1.46%@+30, 26.80%@+20] 
iv_offset=51"
[   42.992247] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=290 ksize=0", cfg="random: inplace use_final 
src_divs=[<flush,nosimd>26.91%@+21, <flush>39.21%@+3, 30.39%@+5590, 
3.49%@+6087] iv_offset=3"
[   43.082625] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=144 ksize=0", cfg="random: inplace use_finup 
src_divs=[17.20%@+13181, 38.53%@+16270, <flush>7.19%@+16319, 37.8%@+25]"
[   43.160780] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=741 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<reimport>40.33%@+8, <flush>51.38%@+1695, 8.29%@+16258]"
[   43.550021] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=15411 ksize=0", cfg="random: use_final 
src_divs=[68.44%@+16358, <reimport,nosimd>27.24%@alignmask+16314, 
2.35%@+4795, 1.94%@+19, 0.3%@+13] dst_divs=[63.56%@+29, 3.27%@+16261, 
26.78%@+16336, 4.83%@+6902, 1.56%@+16"
[   43.620670] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=9345 ksize=0", cfg="random: use_final nosimd 
src_divs=[8.40%@+16365, <flush,nosimd>25.28%@+15991, 5.16%@+10581, 
61.16%@alignmask+15035]"
[   43.667612] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=657 ksize=0", cfg="random: use_final 
src_divs=[16.67%@+26, <reimport,nosimd>31.19%@+12, 52.14%@+16]"
[   43.698889] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=19787 ksize=0", cfg="random: use_final nosimd 
src_divs=[84.37%@+26, <flush>6.72%@alignmask+10127, 0.51%@+15, 
8.40%@+14975] iv_offset=2"
[   43.765707] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=74 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[73.18%@+16263, <reimport>3.4%@+0, 23.78%@+2]"
[   43.966118] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=220 ksize=0", cfg="random: inplace use_finup 
nosimd src_divs=[30.89%@+884, <reimport>33.45%@+16315, 31.4%@+16276, 
0.34%@+16298, 3.60%@+31, <reimport>0.68%@alignmask+15]"
[   44.108927] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=12814 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[21.67%@+29, <flush>29.89%@+16287, 24.3%@+16285, 22.67%@+16377, 
1.74%@+3] dst_divs=[100.0%@+16368]"
[   44.244604] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=20620 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[35.58%@alignmask+13538, 38.66%@+16285, 
<reimport>24.0%@+19, 1.76%@+1536] iv_offset=51"
[   44.283438] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=885 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[19.24%@+249, <flush>17.94%@+0, 50.48%@+14362, 9.14%@+19, 
1.69%@+3016, <reimport>1.51%@alignmask+19] dst_divs=[100.0%@+2327]"
[   44.309406] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=382 ksize=0", cfg="random: use_final nosimd 
src_divs=[<reimport>48.79%@+16320, <flush>34.11%@+16329, 8.87%@+9, 
<flush,nosimd>8.22%@+15, <reimport,nosimd>0.1%@+524] 
dst_divs=[100.0%@+13] iv_offset=38"
[   44.368142] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=14353 ksize=0", cfg="random: use_final nosimd 
src_divs=[68.62%@+21, <flush,nosimd>26.26%@+16266, 5.12%@+30]"
[   44.412644] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=300 ksize=0", cfg="random: may_sleep use_final 
src_divs=[38.46%@+12, <flush>20.50%@+1468, 41.4%@+10813] 
dst_divs=[100.0%@+16332] iv_offset=27"
[   44.492735] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=11826 ksize=0", cfg="random: use_final 
src_divs=[22.44%@+4774, <flush,nosimd>46.96%@+31, 14.55%@+12, 
<reimport,nosimd>7.10%@+14425, 2.38%@+5249, <reimport>6.57%@+16304] 
dst_divs=[100.0%@+12] iv_offset=7"
[   44.737829] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=29269 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<reimport>10.33%@+4360, <reimport>35.29%@+11030, 
38.57%@alignmask+16306, <reimport,nosimd>5.97%@+16282, 9.84%@+13651] 
dst_divs=[55.7%@+16302, 44.93%@+9699]"
[   44.843832] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=13405 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[<flush>4.56%@+16343, <reimport>83.58%@+14868, 
2.69%@alignmask+9624, 2.88%@+16298, <reimport>2.73%@+10, 
<flush>1.70%@+17, <reimport>1.56%@+16346, "
[   44.980299] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=2427 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[76.35%@+24, <flush>14.82%@+10419, 8.83%@+16355] 
iv_offset=34"
[   45.362567] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=69 ksize=0", cfg="random: inplace use_finup nosimd 
src_divs=[4.0%@+19, <reimport>63.45%@+10054, 32.55%@+4236]"
[   45.516969] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 3, cfg="random: may_sleep use_finup 
src_divs=[<flush>27.53%@+6478, <flush>44.37%@+9217, 28.10%@+14677]"
[   45.586629] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: inplace use_final nosimd 
src_divs=[2.40%@+20, <reimport>57.5%@alignmask+0, 40.55%@+16280] 
iv_offset=46"
[   45.620931] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: use_final nosimd 
src_divs=[<flush,nosimd>68.86%@+16348, <flush,nosimd>19.82%@+6805, 
11.32%@alignmask+10] dst_divs=[24.50%@+30, 75.50%@+16270] iv_offset=5"
[   45.649144] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: use_final nosimd src_divs=[78.49%@+16, 
<flush>8.87%@+4, 12.64%@alignmask+27] dst_divs=[100.0%@alignmask+16360] 
iv_offset=54"
[   45.751581] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=16673 ksize=0", cfg="random: use_final nosimd 
src_divs=[<reimport,nosimd>17.7%@+27, <reimport,nosimd>29.85%@+11515, 
<reimport>45.35%@+8487, <reimport>5.15%@+892, 2.58%@+7] 
dst_divs=[8.57%@+16314, 29.96%@+16323, 6"
[   45.814750] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=25860 ksize=0", cfg="random: inplace 
use_finup nosimd src_divs=[72.99%@+14861, <flush,nosimd>8.95%@+8, 18.6%@+0]"
[   45.923575] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=29803 ksize=0", cfg="random: use_final nosimd 
src_divs=[33.72%@+14, <flush,nosimd>50.10%@+7549, 16.18%@+5] 
dst_divs=[90.88%@alignmask+15836, 0.58%@+14864, 0.89%@+6777, 7.65%@+19]"
[   46.000158] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=18885 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[59.89%@alignmask+13, 4.9%@+5213, 
<reimport>18.37%@alignmask+29, <reimport>14.86%@+16327, 0.53%@+27, 
2.26%@+16372] iv_offset=52"
[   46.030135] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=965 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[<flush>24.88%@+7, <flush>19.47%@+16335, 55.65%@+120]"
[   46.358628] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=12782 ksize=0", cfg="random: use_finup 
src_divs=[34.76%@+16317, 10.66%@+23, <flush,nosimd>4.83%@+16320, 
<flush>48.81%@+10, 0.94%@+16301] dst_divs=[55.36%@+16116, 15.37%@+8, 
29.27%@alignmask+16288] iv_offset=4"
[   46.391977] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=294 ksize=0", cfg="random: inplace use_final 
nosimd src_divs=[63.68%@+16306, <flush>20.86%@+16318, 8.98%@+16357, 
4.84%@+16380, 1.62%@+3587, <reimport>0.1%@+16004, 0.1%@+3999]"
[   46.454932] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=847 ksize=0", cfg="random: may_sleep 
use_final src_divs=[<flush>13.58%@+26, <flush>27.95%@+23, 5.72%@+23, 
<reimport>52.75%@+11648] dst_divs=[72.15%@alignmask+16329, 18.79%@+6055, 
6.52%@+8254, 2.54%@+3506] iv_of"
[   46.650511] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=5240 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[56.89%@+23, 13.98%@+10182, 
<flush>23.59%@alignmask+16312, 1.11%@+2904, 3.52%@+9515, 0.42%@+276, 
<reimport>0.20%@+2864, 0.29%@+12182]"
[   46.692302] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=20305 ksize=0", cfg="random: use_final 
src_divs=[34.15%@+7496, 39.46%@+2, 1.39%@+9337, <flush,nosimd>3.58%@+18, 
<flush>5.6%@+6104, 16.36%@+3573] iv_offset=48"
[   46.716020] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=692 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[9.92%@alignmask+6592, 
<reimport>53.57%@alignmask+16293, 31.73%@+16353, 4.78%@+16277]"
[   46.763098] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=7188 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[41.66%@+16353, <flush>34.44%@alignmask+16300, 
23.90%@+16360]"
[   46.995217] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=143 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<flush>27.29%@+14282, 9.79%@alignmask+11450, 
<flush>42.24%@+12, 20.68%@+16275]"
[   47.157688] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=16765 ksize=0", cfg="random: inplace 
may_sleep use_finup src_divs=[<reimport>19.77%@+16328, 
<flush>41.75%@+8545, 38.48%@alignmask+21] iv_offset=62"
[   47.807197] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=218 ksize=0", cfg="random: inplace use_final 
nosimd src_divs=[<reimport>39.44%@+16369, <flush,nosimd>4.96%@+18, 
55.60%@+15157]"
[   47.880160] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=612 ksize=0", cfg="random: use_final 
src_divs=[80.51%@alignmask+8143, <flush,nosimd>5.2%@+6283, 9.23%@+23, 
1.79%@+19, <reimport,nosimd>2.6%@+3, <reimport>0.64%@+10336, 
0.7%@+16383, 0.68%@+9] dst_divs=[87.83%@+1"
[   47.945663] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=6817 ksize=0", cfg="random: may_sleep 
use_final src_divs=[65.86%@+22, <flush>13.31%@+16365, 
20.83%@alignmask+27] dst_divs=[66.1%@+8664, 33.99%@+10372] iv_offset=9"
[   47.968564] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=72 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[78.6%@+16342, <flush>11.52%@alignmask+4514, 6.43%@+8, 
3.99%@+4] dst_divs=[100.0%@+6266] iv_offset=13"
[   47.993331] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=936 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[19.88%@alignmask+9868, <flush>27.22%@+5631, 
44.99%@+16315, 4.16%@+4010, <reimport>3.75%@alignmask+26] iv_offset=23"
[   48.017771] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=252 ksize=0", cfg="random: inplace use_finup 
src_divs=[10.34%@+16354, <flush,nosimd>22.40%@+9022, 67.26%@+16263]"
[   48.085934] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=171 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<reimport,nosimd>39.9%@+17, <flush>54.58%@+16355, 
6.33%@alignmask+6138] dst_divs=[86.72%@+22, 13.28%@+14251]"
[   48.163573] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=242 ksize=0", cfg="random: inplace use_final 
src_divs=[5.42%@+14497, <reimport,nosimd>32.46%@+17, 45.13%@+12032, 
16.18%@+19, 0.81%@alignmask+13422] iv_offset=20"
[   48.219359] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=8961 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<flush>3.32%@+30, <flush>5.10%@+2580, 
91.58%@alignmask+15349] iv_offset=62"
[   48.258052] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=16399 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>6.17%@+16356, 56.57%@+16368, 
<flush>15.73%@+6808, 7.94%@alignmask+16341, <reimport>7.91%@+11233, 
<reimport>5.68%@+0]"
[   48.500246] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_final nosimd 
src_divs=[26.91%@+11, <flush>42.96%@+16354, 30.13%@+10627]"
[   48.517591] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: may_sleep use_finup 
src_divs=[26.43%@alignmask+3303, <reimport>45.83%@+16310, 5.69%@+416, 
<flush>22.5%@+26] iv_offset=32"
[   48.546110] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: use_finup nosimd 
src_divs=[60.33%@alignmask+18, <flush>17.27%@+16265, 22.40%@+1435] 
iv_offset=7"
[   48.580485] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: use_final src_divs=[43.65%@+18, 
<reimport>41.85%@+15456, 4.46%@+16342, <flush,nosimd>0.22%@+14128, 
0.41%@+16310, <reimport>5.93%@+14326, 3.48%@+12570]"
[   48.606294] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_finup nosimd 
src_divs=[75.80%@+16374, <flush>5.77%@+1336, 18.43%@+5430] iv_offset=40"
[   48.700465] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=153 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[21.83%@+16374, <reimport>54.66%@+14176, 
<reimport>0.96%@+15, 22.55%@+18] iv_offset=5"
[   48.758598] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=20184 ksize=0", cfg="random: use_final nosimd 
src_divs=[<flush>61.84%@+16335, 28.4%@+15, <reimport>9.25%@+15454, 
0.87%@+9715]"
[   48.863950] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=22165 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[91.27%@+6209, <flush>0.58%@+16367, 8.15%@+18] 
iv_offset=46"
[   48.884635] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=217 ksize=0", cfg="random: inplace use_finup 
src_divs=[49.29%@+16304, <reimport>10.27%@+16296, 21.11%@+9798, 
13.53%@+19, 5.80%@+3]"
[   49.109202] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=2273 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[<flush>85.25%@+12489, <flush>10.50%@+21, 1.95%@+16, 
2.30%@+13976]"
[   49.163124] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=15839 ksize=0", cfg="random: inplace 
may_sleep use_finup src_divs=[34.1%@+2, <flush>63.26%@+16346, 
<reimport>0.91%@alignmask+6114, <flush>0.72%@+20, 1.0%@+16271, 0.4%@+27, 
<flush>0.6%@+7722] iv_offset=38"
[   49.232352] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=7101 ksize=0", cfg="random: may_sleep 
use_final src_divs=[<reimport>29.50%@+23, <reimport>53.29%@+16313, 
<flush>10.95%@+6730, 5.34%@+3647, <reimport>0.92%@alignmask+2254] 
dst_divs=[87.42%@+10, 12.58%@+17] iv_off"
[   49.306649] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=465 ksize=0", cfg="random: inplace use_finup 
src_divs=[13.31%@+13, <reimport>34.62%@+16280, 40.46%@alignmask+12787, 
1.4%@+14041, 10.57%@+30] iv_offset=55"
[   49.529958] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=9251 ksize=0", cfg="random: use_final nosimd 
src_divs=[<flush,nosimd>35.6%@+24, <reimport>46.47%@+18, 11.54%@+16343, 
<flush>6.93%@+16364] dst_divs=[100.0%@+16296]"
[   49.621921] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=5320 ksize=0", cfg="random: use_final nosimd 
src_divs=[<reimport,nosimd>45.98%@+14, <flush>5.74%@+0, 43.96%@+4, 
<reimport,nosimd>4.32%@+16349] iv_offset=10"
[   49.851656] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=74 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[74.87%@+5837, <reimport>4.83%@+25, 10.0%@+18, 
4.20%@+3, 6.10%@+15] iv_offset=21"
[   49.932549] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=10067 ksize=0", cfg="random: inplace 
may_sleep use_finup src_divs=[<flush>49.48%@+31, 
<reimport>1.69%@alignmask+1847, <flush>23.15%@alignmask+16366, 
25.68%@alignmask+16257]"
[   50.113062] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=24927 ksize=0", cfg="random: use_finup 
src_divs=[65.72%@+16270, <reimport>17.49%@+16279, 
<flush>14.55%@alignmask+6493, <reimport,nosimd>0.89%@+29, 0.48%@+16301, 
<flush>0.7%@+26, <reimport,nosimd>0.80%@alignmask+1"
[   50.163000] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=958 ksize=0", cfg="random: inplace use_final 
src_divs=[<reimport>42.34%@+9945, <flush,nosimd>24.44%@+22, 0.9%@+31, 
<reimport>1.35%@+2, 31.78%@+7694] iv_offset=24"
[   50.821677] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=279 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<reimport>15.65%@+8739, <reimport>9.21%@+16258, 
75.14%@+16274] iv_offset=42"
[   50.939076] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=195 ksize=0", cfg="random: use_final 
src_divs=[29.64%@+16329, <reimport,nosimd>2.6%@+16325, 56.91%@+8, 
<reimport>11.39%@+27]"
[   51.057542] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=4400 ksize=0", cfg="random: use_finup 
src_divs=[8.11%@+16342, 3.8%@alignmask+16, <flush>25.6%@+16296, 
11.9%@+2095, 52.66%@+10] dst_divs=[100.0%@+11222]"
[   51.340988] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=15517 ksize=0", cfg="random: may_sleep 
use_final src_divs=[70.18%@+16381, <reimport>24.53%@+16333, 3.84%@+26, 
0.23%@+6, 0.80%@+2518, <flush>0.42%@alignmask+16292]"
[   51.653696] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=2200 ksize=0", cfg="random: inplace use_final 
src_divs=[16.32%@+1, <flush>64.98%@+11, 18.70%@+16298]"
[   51.801990] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=488 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>11.63%@+9233, <reimport>5.28%@+6239, 
79.10%@+7752, <flush>3.42%@+16, 0.34%@alignmask+30, 0.23%@alignmask+9709]"
[   51.832415] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=912 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[51.81%@+29, 20.79%@+10184, <flush>6.32%@+5, 
4.50%@alignmask+3, 16.58%@+31]"
[   52.091194] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace may_sleep use_final 
src_divs=[30.13%@+22, <flush>44.90%@+23, <flush>0.49%@+5761, 
20.20%@alignmask+16364, <flush>1.13%@+7, 1.87%@+11811, 
<reimport>1.28%@+13676] iv_offset=16"
[   52.141860] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: use_final 
src_divs=[<flush,nosimd>23.30%@+19, <flush,nosimd>12.52%@+16379, 
6.9%@+3619, <reimport,nosimd>58.9%@+31] dst_divs=[19.58%@+7244, 
80.42%@alignmask+12565] iv_offset=54"
[   52.168477] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_final src_divs=[16.13%@+11872, 
<flush>33.73%@+20, 50.14%@+22] iv_offset=57"
[   52.185456] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace may_sleep use_final 
src_divs=[49.50%@+8, <flush>37.55%@+2148, 11.76%@+5, 
<flush>0.66%@+11179, <reimport>0.53%@+20] iv_offset=36"
[   52.233623] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=8013 ksize=0", cfg="random: use_final nosimd 
src_divs=[<flush,nosimd>51.92%@alignmask+6924, 
<flush,nosimd>39.6%@+16260, 9.2%@+16354] dst_divs=[74.37%@+18, 
14.87%@+21, 10.76%@+18] iv_offset=60"
[   52.275001] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=27584 ksize=0", cfg="random: inplace 
use_finup src_divs=[92.42%@+30, 2.59%@+16376, 3.58%@+16286, 
<reimport>1.16%@+11166, 0.25%@+9]"
[   52.306082] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=216 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>44.99%@+16315, <reimport>27.92%@+3307, 
27.9%@alignmask+14336] dst_divs=[38.99%@+16, 61.1%@alignmask+29] 
iv_offset=60"
[   52.401829] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=197 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<flush,nosimd>61.85%@+4, <reimport>7.53%@+16276, 
<reimport,nosimd>10.13%@+18, <flush,nosimd>4.74%@+15841, 9.12%@+20, 
6.63%@+2] iv_offset=38"
[   53.060297] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=22048 ksize=0", cfg="random: may_sleep 
use_final src_divs=[<flush>72.54%@+12199, <flush>1.54%@alignmask+16269, 
25.92%@+1469] dst_divs=[100.0%@alignmask+16350]"
[   53.439475] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=21529 ksize=0", cfg="random: use_final nosimd 
src_divs=[<flush,nosimd>34.52%@+1415, <reimport,nosimd>61.13%@+15871, 
4.35%@+28] iv_offset=12"
[   53.502868] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=75 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[55.50%@alignmask+9, 9.57%@+16381, 
<flush>22.45%@+815, 12.48%@+15] iv_offset=42"
[   53.922678] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=30616 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[97.91%@+8, 0.44%@+16, <reimport>0.17%@+20, 
0.74%@+944, 0.15%@+25, 0.59%@+12548] dst_divs=[100.0%@+16288]"
[   54.323481] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=5930 ksize=0", cfg="random: inplace use_finup 
src_divs=[<flush>83.37%@+16381, <reimport>11.21%@+16363, 5.26%@+16290, 
<reimport,nosimd>0.4%@+24, <flush>0.2%@+9, <flush>0.10%@+16336]"
[   54.549601] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=26340 ksize=0", cfg="random: may_sleep 
use_final src_divs=[<reimport>28.46%@+14430, <reimport>22.72%@+30, 
47.25%@+3, <flush>0.85%@+16293, <flush>0.56%@+9920, 0.16%@+2] iv_offset=52"
[   54.847793] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=564 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>20.63%@+27, <reimport>40.29%@+16273, 
39.8%@+2784] dst_divs=[39.98%@+26, 60.2%@+1637] iv_offset=23"
[   55.437170] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=23478 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[61.92%@+15255, 
<flush>8.11%@alignmask+16288, 29.97%@+16278] iv_offset=23"
[   55.477270] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=289 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[9.68%@+27, <reimport>90.12%@+14, 0.1%@+9, 
0.19%@alignmask+29] dst_divs=[100.0%@+16341] iv_offset=38"

[   44.460004] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=8991 ksize=0", cfg="random: inplace use_final 
src_divs=[<flush>87.13%@+3034, <reimport,nosimd>8.89%@+12542, 
3.98%@+16383] iv_offset=10"
[   44.507859] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=91 ksize=0", cfg="random: use_finup 
src_divs=[2.88%@+13718, 49.89%@+0, <flush,nosimd>33.59%@+23, 13.64%@+27]"
[   44.632037] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=159 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[54.66%@+16382, <reimport>7.53%@+5879, 37.81%@+7] 
iv_offset=41"
[   44.681926] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=135 ksize=0", cfg="random: use_finup nosimd 
src_divs=[6.59%@+7309, 38.24%@+3, <reimport>31.85%@alignmask+12, 
6.89%@+16024, 16.43%@+3591] dst_divs=[10.98%@+3015, 23.19%@+17, 
25.45%@+7, 7.41%@alignmask+1374, 15.6"
[   44.728654] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=508 ksize=0", cfg="random: may_sleep use_final 
src_divs=[<flush>32.6%@+16312, <reimport>48.31%@+11197, 19.63%@+15] 
iv_offset=6"
[   44.759109] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=8791 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[<flush>54.42%@+19, <flush>15.65%@+18, 29.93%@+2164] 
iv_offset=21"
[   44.884996] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=9740 ksize=0", cfg="random: use_finup nosimd 
src_divs=[33.97%@+6, <reimport>62.43%@+6877, 0.97%@+2, 
<flush,nosimd>2.63%@+16360] iv_offset=61"
[   44.944327] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=938 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<flush>47.25%@+16270, <flush>32.17%@+16360, 
<reimport>6.60%@+1624, 13.98%@alignmask+8]"
[   45.202009] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=23079 ksize=0", cfg="random: inplace use_final 
src_divs=[<flush>32.63%@+4449, <flush>28.98%@+5, 17.59%@+10407, 
20.80%@+7887]"
[   45.576235] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=589 ksize=0", cfg="random: use_final 
src_divs=[<flush>5.91%@+16266, <flush,nosimd>70.72%@+16, 
18.13%@alignmask+8, <reimport,nosimd>4.70%@+14, 0.13%@+9051, 
0.41%@+16296] dst_divs=[45.4%@+16310, 30.9%@+9428, 24.8"
[   45.635261] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=19356 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<reimport>91.71%@+2787, 1.50%@+20, 
<reimport,nosimd>6.6%@+16378, 0.73%@+5541] dst_divs=[12.8%@+3504, 
26.53%@alignmask+4326, 61.39%@+20] iv_offset=37"
[   45.682871] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=644 ksize=0", cfg="random: may_sleep use_final 
src_divs=[50.99%@+7534, 19.40%@+7812, <reimport>25.28%@+11931, 
1.68%@+19, 2.65%@+17] iv_offset=16"
[   45.903819] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=3941 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[<reimport>9.77%@+25, <reimport>70.26%@alignmask+15020, 
<flush>9.50%@+26, 10.47%@+7639] dst_divs=[100.0%@+3005]"
[   46.011944] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=23698 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[87.61%@+6, <flush>7.11%@+26, 5.28%@+23] dst_divs=[85.35%@+21, 
14.65%@+15]"
[   46.050570] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=32384 ksize=0", cfg="random: may_sleep use_final 
src_divs=[<flush>91.7%@+29, 0.84%@alignmask+16322, 
<flush>2.83%@alignmask+15, <reimport>1.26%@+5386, 4.0%@alignmask+16326] 
dst_divs=[100.0%@+9216] iv_offset=4"
[   46.090722] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=183 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[20.16%@+18, <reimport>14.8%@+16371, 
<reimport>5.95%@+14, 59.81%@+28] iv_offset=10"
[   46.371016] alg: hash: md5-talitos test failed (wrong result) on test 
vector "random: psize=367 ksize=0", cfg="random: may_sleep use_final 
src_divs=[<reimport>16.2%@+16324, <reimport>4.91%@+30, 
79.7%@alignmask+526] dst_divs=[100.0%@+16284]"
[   46.679053] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 3, cfg="random: use_finup src_divs=[25.76%@+3838, 
<reimport>1.6%@+5301, 73.18%@+30]"
[   46.698317] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 3, cfg="random: inplace may_sleep use_final 
src_divs=[10.10%@+16, <reimport>40.69%@+910, 49.21%@+27]"
[   46.714679] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 3, cfg="random: use_finup nosimd 
src_divs=[<reimport>55.52%@alignmask+28, <flush>27.8%@+6607, 
17.40%@+5212] dst_divs=[56.44%@+15, 43.56%@+31]"
[   46.739576] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 3, cfg="random: may_sleep use_finup 
src_divs=[<flush>13.58%@+2205, 51.45%@+16307, <flush>17.0%@+16306, 
6.67%@+9613, 5.91%@+16322, 5.39%@+16355] dst_divs=[100.0%@+3]"
[   46.767765] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 3, cfg="random: inplace may_sleep use_finup 
src_divs=[52.26%@+11, <reimport>27.99%@+16337, 5.26%@alignmask+14, 
14.49%@+29]"
[   46.839428] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: inplace use_final nosimd 
src_divs=[<reimport>73.85%@+12887, <flush>3.69%@+21, 
<reimport,nosimd>7.11%@+4, 15.35%@+12970]"
[   46.876896] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: may_sleep use_finup 
src_divs=[<flush>61.44%@alignmask+16341, <reimport>22.63%@+6801, 
<flush>13.91%@+5, 2.2%@+16301]"
[   46.902334] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: may_sleep use_final 
src_divs=[<flush>21.6%@+15, <flush>40.75%@+8225, 38.19%@+3536] 
dst_divs=[100.0%@alignmask+3011]"
[   46.929727] alg: hash: sha1-talitos test failed (wrong result) on 
test vector 5, cfg="random: may_sleep use_finup 
src_divs=[<reimport>47.90%@+16288, <flush>40.2%@+16354, 12.8%@+1213]"
[   47.288237] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=3937 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<reimport>69.89%@+13306, <flush,nosimd>10.56%@+10, 
19.55%@+16278] dst_divs=[5.79%@+23, 94.21%@+0]"
[   47.449404] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=930 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[<flush>82.31%@+31, <reimport>5.86%@+16317, 11.83%@+12]"
[   47.697982] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=1717 ksize=0", cfg="random: use_final 
src_divs=[<reimport>84.93%@+16380, <flush,nosimd>4.47%@+16353, 
6.48%@+12962, <flush,nosimd>4.12%@+3] iv_offset=19"
[   47.825713] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=218 ksize=0", cfg="random: may_sleep 
use_final src_divs=[35.56%@+12030, <flush>20.46%@+27, 43.98%@+17]"
[   47.847219] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=685 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[48.27%@+27, <flush>7.56%@+16288, 
28.58%@alignmask+25, 15.59%@+9496] iv_offset=61"
[   47.947213] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=19276 ksize=0", cfg="random: inplace 
use_final src_divs=[<flush>64.32%@+2784, 3.69%@+13, 
<flush>9.39%@alignmask+4, 22.60%@+14069] iv_offset=42"
[   47.981037] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=472 ksize=0", cfg="random: inplace use_final 
nosimd src_divs=[<reimport,nosimd>9.99%@+16284, <flush,nosimd>36.39%@+0, 
<flush>41.43%@+16378, 12.19%@+16362] iv_offset=2"
[   48.134338] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=22718 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[<reimport>61.81%@+7669, 
<reimport>17.38%@+9701, 20.81%@+7632]"
[   48.202163] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=21735 ksize=0", cfg="random: use_final 
src_divs=[<reimport,nosimd>20.71%@+7, <flush>78.88%@+16329, 
0.40%@+16380, <flush>0.1%@+7546]"
[   48.339559] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=954 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>64.41%@+14356, <flush>5.72%@+6890, 5.83%@+23, 
24.4%@+31] iv_offset=14"
[   48.724780] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=111 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<flush>3.46%@+25, <reimport,nosimd>80.85%@alignmask+19, 
8.10%@+9314, 3.32%@+4219, 3.9%@+15359, 1.18%@+16260] 
dst_divs=[100.0%@alignmask+10702]"
[   48.894203] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=589 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[76.4%@+8648, <reimport>2.48%@+16264, 21.1%@+26, 
<flush>0.14%@+452, <reimport>0.33%@alignmask+15378]"
[   49.172224] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=216 ksize=0", cfg="random: inplace use_finup 
nosimd src_divs=[<reimport>6.74%@+30, <reimport>44.52%@+2388, 
48.74%@alignmask+11511] iv_offset=43"
[   49.222049] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=212 ksize=0", cfg="random: use_final nosimd 
src_divs=[<reimport,nosimd>18.89%@+16287, <reimport,nosimd>3.28%@+14, 
77.83%@+16292]"
[   49.275267] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=13797 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>46.47%@+12192, 31.46%@+7, 
<reimport>17.62%@+16316, 4.45%@+29] dst_divs=[100.0%@+25]"
[   49.482020] alg: hash: sha1-talitos test failed (wrong result) on 
test vector "random: psize=341 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[44.18%@alignmask+14498, <reimport>44.10%@+31, 
6.84%@+19, <flush>4.19%@+11, <flush>0.49%@+6682, 0.11%@+2, 
<flush>0.9%@+16347] iv_offset=7"
[   49.695348] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace may_sleep use_finup 
src_divs=[43.46%@+1918, <reimport>14.19%@+4844, 12.55%@+16364, 
<reimport>29.80%@alignmask+15447] iv_offset=4"
[   49.740292] alg: hash: sha224-talitos test failed (wrong result) on 
test vector 4, cfg="random: may_sleep use_final src_divs=[3.85%@+3293, 
<flush>15.61%@+27, 30.30%@+0, <flush>50.24%@+2] iv_offset=54"
[   49.781924] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=15056 ksize=0", cfg="random: use_final nosimd 
src_divs=[47.35%@+5873, 9.64%@alignmask+13083, <flush,nosimd>37.24%@+16, 
<flush,nosimd>4.40%@+8705, 1.37%@+6577] iv_offset=12"
[   50.044594] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=3862 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[<flush>2.10%@+10, <reimport>62.23%@+1, 5.55%@+11010, 
21.33%@+537, 5.81%@alignmask+6216, 2.98%@+27] iv_offset=37"
[   50.440560] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=11605 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[2.56%@+11, 53.67%@+7882, 
<reimport>24.35%@+16356, 8.4%@+3210, <flush>11.38%@+11413]"
[   50.502413] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=30066 ksize=0", cfg="random: may_sleep 
use_final src_divs=[63.46%@+7, <flush>11.89%@+10804, 
<flush>15.22%@alignmask+16282, 9.43%@+31] iv_offset=47"
[   50.797432] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=426 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<reimport,nosimd>62.0%@+2538, <reimport>18.70%@alignmask+2, 
7.3%@+30, <reimport,nosimd>11.85%@+22, 0.42%@+9683] 
dst_divs=[90.54%@+15, 8.41%@+12, 0.64%@+3, 0"
[   51.148015] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=826 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<flush>61.42%@+7023, <reimport>2.83%@+3, 
<flush>30.83%@+15514, 4.92%@+13855] dst_divs=[51.72%@+6, 8.82%@+27, 
7.44%@alignmask+16264, 9.59%@+16289, 22.43%@"
[   51.343612] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=237 ksize=0", cfg="random: inplace use_finup 
src_divs=[9.21%@+10676, 31.30%@+16342, <flush>23.8%@+3912, 
36.41%@alignmask+10521]"
[   51.440981] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=204 ksize=0", cfg="random: inplace use_final 
nosimd src_divs=[30.30%@+6505, <flush>27.55%@+27, 32.37%@+17, 
5.83%@+16289, <flush,nosimd>3.95%@+1315]"
[   51.489197] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=526 ksize=0", cfg="random: use_final 
src_divs=[6.75%@+8032, <reimport,nosimd>10.2%@+27, 83.23%@+31] 
dst_divs=[100.0%@+14] iv_offset=21"
[   51.674249] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=135 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[<flush>51.26%@alignmask+11168, <flush>16.39%@+16374, 
15.78%@alignmask+16320, <flush>8.2%@+16372, <reimport>5.16%@+28, 
3.39%@+25] iv_offset=21"
[   51.721849] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=31374 ksize=0", cfg="random: use_finup 
src_divs=[46.13%@+27, 16.54%@+9429, <flush>17.59%@+29, 19.74%@+1384]"
[   52.092004] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=8423 ksize=0", cfg="random: inplace use_final 
src_divs=[97.3%@+16, <flush,nosimd>0.78%@+16296, 1.63%@+10, 
0.56%@alignmask+13]"
[   52.460078] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=760 ksize=0", cfg="random: inplace use_finup 
nosimd src_divs=[<reimport,nosimd>81.2%@+2, 
<reimport,nosimd>12.72%@+1467, 3.92%@+21, 2.34%@+10]"
[   52.555509] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=25043 ksize=0", cfg="random: use_final 
src_divs=[67.13%@+23, <flush>26.69%@+14, 3.74%@+1724, 1.41%@+6571, 
1.3%@+1443] dst_divs=[74.38%@+16296, 25.62%@+6809] iv_offset=18"
[   52.791929] alg: hash: sha224-talitos test failed (wrong result) on 
test vector "random: psize=32624 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[84.56%@+11, <reimport>12.92%@+27, 
2.52%@+9196] iv_offset=2"
[   53.332835] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: may_sleep use_final src_divs=[13.67%@+27, 
<reimport>65.2%@+16327, <flush>9.19%@alignmask+16087, 12.12%@+3823] 
dst_divs=[86.68%@+7, 13.32%@+21]"
[   53.356010] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace may_sleep use_finup 
src_divs=[87.56%@+16302, <reimport>2.77%@+6905, 9.67%@+8401] iv_offset=34"
[   53.390643] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: may_sleep use_finup src_divs=[92.22%@+11, 
<flush>1.71%@alignmask+2359, 6.7%@+8469] dst_divs=[100.0%@+11] iv_offset=2"
[   53.417307] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_finup 
src_divs=[<reimport>55.51%@+20, <flush,nosimd>9.13%@+10069, 
<flush>4.70%@+29, 30.66%@+15705]"
[   53.444625] alg: hash: sha256-talitos test failed (wrong result) on 
test vector 4, cfg="random: inplace use_finup src_divs=[11.92%@+17, 
<flush>65.22%@+16256, 12.86%@alignmask+14763, <flush,nosimd>10.0%@+24] 
iv_offset=28"
[   53.578402] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=5887 ksize=0", cfg="random: inplace use_finup 
nosimd src_divs=[<flush,nosimd>23.6%@alignmask+16289, 
<flush>64.51%@+2529, 12.43%@+4] iv_offset=63"
[   53.637198] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=30578 ksize=0", cfg="random: may_sleep 
use_finup src_divs=[<reimport>47.44%@+5, <reimport>34.99%@+10471, 
<flush>12.18%@+16199, <reimport>2.74%@+3, 2.65%@+2503] 
dst_divs=[100.0%@+620] iv_offset=31"
[   53.947955] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=194 ksize=0", cfg="random: inplace use_finup 
src_divs=[<reimport>80.99%@alignmask+0, <flush,nosimd>1.80%@+16343, 
8.48%@+23, 4.34%@+24, <flush>1.72%@alignmask+11, <flush>0.25%@+16275, 
<flush,nosimd>1.87%@+8211, "
[   53.977691] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=85 ksize=0", cfg="random: may_sleep use_finup 
src_divs=[<flush>18.91%@+13003, <reimport>29.58%@+22, 51.51%@+27] 
dst_divs=[9.34%@+30, 90.66%@+11904]"
[   54.119136] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=7685 ksize=0", cfg="random: inplace use_final 
nosimd src_divs=[49.98%@alignmask+2, <reimport,nosimd>19.14%@+16267, 
30.88%@+13] iv_offset=39"
[   54.167691] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=5928 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<reimport>36.49%@+5347, <reimport>0.52%@+1150, 
<reimport,nosimd>38.15%@+17, 17.6%@+0, <flush>7.78%@+16329] iv_offset=15"
[   54.245330] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=10325 ksize=0", cfg="random: use_final nosimd 
src_divs=[<reimport,nosimd>52.53%@+15597, <reimport>43.77%@+1503, 
3.70%@+11147] dst_divs=[32.54%@+7899, 52.48%@+1070, 14.98%@+10237] 
iv_offset=1"
[   54.358122] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=29634 ksize=0", cfg="random: inplace 
use_final src_divs=[85.0%@+28, 12.71%@alignmask+10124, 0.77%@+14502, 
<flush,nosimd>1.27%@+7, 0.25%@+5]"
[   54.664591] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=551 ksize=0", cfg="random: use_finup nosimd 
src_divs=[<flush,nosimd>52.35%@+14, <reimport,nosimd>38.76%@+30, 
8.89%@+16303] iv_offset=30"
[   54.949740] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=21277 ksize=0", cfg="random: inplace 
use_final nosimd src_divs=[67.95%@+16335, <flush,nosimd>30.65%@+16333, 
0.53%@+12877, 0.24%@+10310, 0.23%@alignmask+16359, 
<reimport,nosimd>0.40%@+12244]"
[   55.824272] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=5256 ksize=0", cfg="random: inplace may_sleep 
use_final src_divs=[<flush>30.69%@+13758, <flush>29.84%@alignmask+2115, 
<flush>29.25%@+4823, 10.22%@+16332] iv_offset=37"
[   55.956233] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=18675 ksize=0", cfg="random: use_finup 
src_divs=[18.23%@+16272, <flush,nosimd>66.64%@+4260, 
<reimport>5.35%@+11, <reimport,nosimd>6.17%@+18, 2.90%@+19, 
<flush,nosimd>0.71%@+6] iv_offset=26"
[   56.338585] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=946 ksize=0", cfg="random: inplace use_final 
src_divs=[<reimport,nosimd>16.47%@alignmask+15498, 
<flush,nosimd>46.17%@+11, 37.36%@+16343] iv_offset=23"
[   56.417911] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=13293 ksize=0", cfg="random: inplace 
may_sleep use_final src_divs=[<reimport>14.15%@+16336, 
<reimport>14.94%@+14294, <flush>43.18%@alignmask+27, 
<flush>12.15%@+5556, 15.58%@+3246]"
[   56.482903] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=637 ksize=0", cfg="random: inplace may_sleep 
use_finup src_divs=[16.33%@+16338, 58.36%@+15718, <flush>11.46%@+9478, 
13.36%@alignmask+16324, <flush>0.1%@+16266, 0.24%@+16301, 
<reimport>0.24%@+5355]"
[   56.859188] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=626 ksize=0", cfg="random: use_final 
src_divs=[6.15%@+21, <flush>20.65%@+28, <reimport,nosimd>31.97%@+5, 
41.23%@+2846] dst_divs=[100.0%@+16268] iv_offset=60"
[   56.882971] alg: hash: sha256-talitos test failed (wrong result) on 
test vector "random: psize=1014 ksize=0", cfg="random: inplace use_final 
src_divs=[<reimport>25.5%@+16383, <reimport,nosimd>15.75%@+14250, 
59.20%@+1] iv_offset=17"
