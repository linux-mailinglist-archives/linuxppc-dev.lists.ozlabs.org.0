Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB6C432B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 06:59:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PWkG5NzXzDr5y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 14:59:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="MhSOA8iy"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PWhL0M7YzDr8R
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 14:57:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45PWh96FsDz9v1BD;
 Thu, 13 Jun 2019 06:57:45 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=MhSOA8iy; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id MYOM_FHLP4JJ; Thu, 13 Jun 2019 06:57:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45PWh95BrDz9v0vD;
 Thu, 13 Jun 2019 06:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560401865; bh=+P6drS8qQAAx9wMET+Ioeysvq3tKZ0fEutPbE6hyLGo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MhSOA8iyqqu0tlKYwRx4p33Knq6T+T6fIH8L6Stkytdtulq46nvnFQaIfhecaykTm
 uM0JRtD7fBixCqu6Jykt50vDZRIwXkPT7aTwwMS4omyM5BrJp1B1JfrcW2wR9gbChJ
 fBsNFov3f/FQtlSiWKEuqJpxKCXRRzFUUzGA/9gA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DBC48B798;
 Thu, 13 Jun 2019 06:57:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id V2EWmVBVwxSd; Thu, 13 Jun 2019 06:57:46 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 026358B797;
 Thu, 13 Jun 2019 06:57:45 +0200 (CEST)
Subject: Re: [PATCH v2 0/4] Additional fixes on Talitos driver
To: Horia Geanta <horia.geanta@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
References: <cover.1560263641.git.christophe.leroy@c-s.fr>
 <VI1PR0402MB34853CAF031426F4183FE29B98ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <0cb7c534-6e48-5284-899c-c0ef85c3c126@c-s.fr>
 <VI1PR0402MB3485AD965F36709F27EFB72698ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <58787543-76d3-e0db-9517-ccd0f6494d85@c-s.fr>
 <VI1PR0402MB348583D36921F9DEC4E0DA2698EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <bbfc8706-129b-b441-796a-af4ef54aba53@c-s.fr>
Date: Thu, 13 Jun 2019 06:57:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <VI1PR0402MB348583D36921F9DEC4E0DA2698EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/06/2019 à 15:59, Horia Geanta a écrit :
> On 6/12/2019 8:52 AM, Christophe Leroy wrote:
>>
>>
>> Le 11/06/2019 à 18:30, Horia Geanta a écrit :
>>> On 6/11/2019 6:40 PM, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 11/06/2019 à 17:37, Horia Geanta a écrit :
>>>>> On 6/11/2019 5:39 PM, Christophe Leroy wrote:
>>>>>> This series is the last set of fixes for the Talitos driver.
>>>>>>
>>>>>> We now get a fully clean boot on both SEC1 (SEC1.2 on mpc885) and
>>>>>> SEC2 (SEC2.2 on mpc8321E) with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS:
>>>>>>
>>>>> I am getting below failures on a sec 3.3.2 (p1020rdb) for hmac(sha384) and
>>>>> hmac(sha512):
>>>>
>>>> Is that new with this series or did you already have it before ?
>>>>
>>> Looks like this happens with or without this series.
>>
>> Found the issue, that's in
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b8fbdc2bc4e71b62646031d5df5f08aafe15d5ad
>>
>> CONFIG_CRYPTO_DEV_TALITOS_SEC2 should be CONFIG_CRYPTO_DEV_TALITOS2 instead.
>>
>> Just sent a patch to fix it.
>>
> Thanks, I've tested it and the hmac failures go away.
> 
> However, testing gets stuck.
> Seems there is another issue lurking in the driver.
> 
> Used cryptodev-2.6/master with the following on top:
> crypto: testmgr - add some more preemption points
> 	https://patchwork.kernel.org/patch/10972337/
> crypto: talitos - fix max key size for sha384 and sha512
> 	https://patchwork.kernel.org/patch/10988473/
> 
> [...]
> alg: skcipher: skipping comparison tests for ecb-3des-talitos because ecb(des3_ede-generic) is unavailable
> INFO: task cryptomgr_test:314 blocked for more than 120 seconds.
>        Not tainted 5.2.0-rc1-g905bfd415e8a #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> cryptomgr_test  D    0   314      2 0x00000800
> Call Trace:
> [e78337e0] [00000004] 0x4 (unreliable)
> [e78338a8] [c08a6e5c] __schedule+0x20c/0x4d4
> [e78338f8] [c08a7158] schedule+0x34/0xc8
> [e7833908] [c08aa5ec] schedule_timeout+0x1d4/0x350
> [e7833958] [c08a7be4] wait_for_common+0xa0/0x164
> [e7833998] [c03a7b14] do_ahash_op+0xa4/0xc4
> [e78339b8] [c03aba00] test_ahash_vec_cfg+0x188/0x5e4
> [e7833aa8] [c03ac1c8] test_hash_vs_generic_impl+0x1b0/0x2b4
> [e7833de8] [c03ac498] __alg_test_hash+0x1cc/0x2d0
> [e7833e28] [c03a9fb4] alg_test.part.37+0x8c/0x3ac
> [e7833ef8] [c03a54d0] cryptomgr_test+0x4c/0x54
> [e7833f08] [c006c410] kthread+0xf8/0x124
> [e7833f38] [c001227c] ret_from_kernel_thread+0x14/0x1c
> 
> addr2line on c03aba00 points to crypto/testmgr.c:1335
> 
>     1327)  if (cfg->finalization_type == FINALIZATION_TYPE_DIGEST ||
>     1328)      vec->digest_error) {
>     1329)          /* Just using digest() */
>     1330)          ahash_request_set_callback(req, req_flags, crypto_req_done,
>     1331)                                     &wait);
>     1332)          ahash_request_set_crypt(req, tsgl->sgl, result, vec->psize);
>     1333)          err = do_ahash_op(crypto_ahash_digest, req, &wait, cfg->nosimd);
>     1334)          if (err) {
> -> 1335)                  if (err == vec->digest_error)
>     1336)                          return 0;
>     1337)                  pr_err("alg: ahash: %s digest() failed on test vector %s; expected_error=%d, actual_error=%d, cfg=\"%s\"\n",
>     1338)                         driver, vec_name, vec->digest_error, err,
>     1339)                         cfg->name);
>     1340)                  return err;
>     1341)          }
>     1342)          if (vec->digest_error) {
>     1343)                  pr_err("alg: ahash: %s digest() unexpectedly succeeded on test vector %s; expected_error=%d, cfg=\"%s\"\n",
>     1344)                         driver, vec_name, vec->digest_error, cfg->name);
>     1345)                  return -EINVAL;
>     1346)          }
>     1347)          goto result_ready;
>     1348)  }
> 
> Seems that for some reason driver does not receive the interrupt from HW,
> thus completion callback does not run.
> 
> Tried with or without current patch series, no change in behaviour.
> 
> If you cannot reproduce and don't have any idea, I'll try the hard way
> (git bisect).

I cannot reproduce, both mpc885 and mpc8321e boot fine, and don't have 
any idea at first.

I know the SEC1 behaves that way when you submit zero-length data.

Christophe

> 
> Thanks,
> Horia
> 
