Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9446F11
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 10:38:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QrVN3X80zDrgr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 18:38:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="EVs+enJu"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QrSl47tszDrcW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 18:37:27 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45QrSg2ND1z9v0Fx;
 Sat, 15 Jun 2019 10:37:23 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EVs+enJu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id h5MID7vsLt9m; Sat, 15 Jun 2019 10:37:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45QrSg1CYBz9v0Fw;
 Sat, 15 Jun 2019 10:37:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560587843; bh=1zQeOTucIcOz7nqyoTV+C9CLAATxs8YjeVAtiYK4GTE=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=EVs+enJuj66wz1GH4JYPlmhsC4UmOmMDxF16Gzd8G0vPfQB6A8zkuvFv/1SM8LNHH
 CV3s2+JpGylvAisOaKCTmsDwz1svIBkiVcQ3sNLSc91p3ddh0oC/8or4FO6N8tXV5c
 as/gAW7jGMdk6ciS63sVlOLzTnevRh3eQPYR4RYQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F3DB8B7B3;
 Sat, 15 Jun 2019 10:37:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VqXv7xNOE4Pb; Sat, 15 Jun 2019 10:37:24 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D4118B77A;
 Sat, 15 Jun 2019 10:37:23 +0200 (CEST)
Subject: Issue with sg_copy_to_buffer() ? (was Re: [PATCH v3 2/4] crypto:
 talitos - fix hash on SEC1.)
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Horia Geanta <horia.geanta@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
References: <cover.1560429844.git.christophe.leroy@c-s.fr>
 <732ca0ff440bf4cd589d844cfda71d96efd500f5.1560429844.git.christophe.leroy@c-s.fr>
 <VI1PR0402MB34855C37F53DC1012DAF670798EE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <e98f196d-a47c-f2ae-e729-fe2613628da7@c-s.fr>
Message-ID: <0cbec7fa-445c-4644-5ea9-9f0f774b20fd@c-s.fr>
Date: Sat, 15 Jun 2019 10:37:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e98f196d-a47c-f2ae-e729-fe2613628da7@c-s.fr>
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



Le 15/06/2019 à 10:18, Christophe Leroy a écrit :
>>> @@ -2058,7 +2065,18 @@ static int ahash_process_req(struct 
>>> ahash_request *areq, unsigned int nbytes)
>>>           sg_copy_to_buffer(areq->src, nents,
>>>                     ctx_buf + req_ctx->nbuf, offset);
>>>           req_ctx->nbuf += offset;
>>> -        req_ctx->psrc = areq->src;
>>> +        for (sg = areq->src; sg && offset >= sg->length;
>>> +             offset -= sg->length, sg = sg_next(sg))
>>> +            ;
>>> +        if (offset) {
>>> +            sg_init_table(req_ctx->bufsl, 2);
>>> +            sg_set_buf(req_ctx->bufsl, sg_virt(sg) + offset,
>>> +                   sg->length - offset);
>>> +            sg_chain(req_ctx->bufsl, 2, sg_next(sg));
>>> +            req_ctx->psrc = req_ctx->bufsl;
>> Isn't this what scatterwalk_ffwd() does?
> 
> Thanks for pointing this, I wasn't aware of that function. Looking at it 
> it seems to do the same. Unfortunately, some tests fails with 'wrong 
> result' when using it instead.
> 
> Comparing the results of scatterwalk_ffwd() with what I get with my open 
> codying, I see the following difference:
> 
> scatterwalk_ffwd() uses sg_page(sg) + sg->offset + len
> 
> while my open codying results in virt_to_page(sg_virt(sg) + len)
> 
> When sg->offset + len is greater than PAGE_SIZE, the resulting SG entry 
> is different allthough valid in both cases. I think this difference 
> results in sg_copy_to_buffer() failing. I'm still investigating. Any idea ?
> 

After adding some dumps, I confirm the suspicion:

My board uses 16k pages.

SG list when not using scatterwalk_ffwd()
[   64.120540] sg c6386794 page c7fc1c60 offset 22 len 213
[   64.120579] sg c6386a48 page c7fc1b80 offset 4 len 2
[   64.120618] sg c6386a5c page c7fc1b00 offset 3 len 17
[   64.120658] sg c6386a70 page c7fc1b40 offset 2 len 10

SG list when using scatterwalk_ffwd()
[   64.120743] sg c6386794 page c7fc1c40 offset 16406 len 213
[   64.120782] sg c6386a48 page c7fc1b80 offset 4 len 2
[   64.120821] sg c6386a5c page c7fc1b00 offset 3 len 17
[   64.120861] sg c6386a70 page c7fc1b40 offset 2 len 10

Content of the SG list:
[   64.120975] 00000000: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 b8 10
[   64.121021] 00000010: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.121067] 00000020: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 b8 10
[   64.121112] 00000030: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.121157] 00000040: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 b8 10
[   64.121202] 00000050: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.121247] 00000060: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 a8 10
[   64.121292] 00000070: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.121337] 00000080: e8 40 98 f0 48 a0 f8 50 28 00 58 b0 08 60 b8 10
[   64.121382] 00000090: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.121427] 000000a0: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 b8 10
[   64.121472] 000000b0: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.121517] 000000c0: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 b8 10
[   64.121557] 000000d0: 68 c0 18 30 c8
[   64.121598] 00000000: 20 78
[   64.121646] 00000000: d0 28 80 f8 30 88 e0 38 90 e8 40 98 f0 48 a0 f8
[   64.121684] 00000010: 50
[   64.121729] 00000000: a8 00 58 b0 08 60 b8 10 68 c0

Content of the buffer after the copy from the list:
[   64.121790] 00000000: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 b8 10
[   64.121836] 00000010: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.121881] 00000020: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 b8 10
[   64.121927] 00000030: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.121972] 00000040: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 b8 10
[   64.122017] 00000050: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.122062] 00000060: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 a8 10
[   64.122107] 00000070: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.122152] 00000080: e8 40 98 f0 48 a0 f8 50 28 00 58 b0 08 60 b8 10
[   64.122197] 00000090: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.122243] 000000a0: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 b8 10
[   64.122288] 000000b0: 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90
[   64.122333] 000000c0: e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 60 b8 10
[   64.122378] 000000d0: 68 c0 18 30 c8 d8 b0 08 60 b8 10 68 c0 18 70 c8
[   64.122424] 000000e0: 20 78 d0 28 80 d8 30 88 e0 38 90 e8 40 98 f0 48
[   64.122462] 000000f0: a0 f8

As you can see, the data following the first block should be
20 78 d0 28 80 f8 30 88 e0 38 90 e8 40 98 f0 48 a0 f8 50 a8 00 58 b0 08 
60 b8 10 68 c0

Instead it is
d8 b0 08 60 b8 10 68 c0 18 70 c8 20 78 d0 28 80 d8 30 88 e0 38 90 e8 40 
98 f0 48 a0 f8

So I guess there is something wrong with sg_copy_to_buffer()

Christophe
