Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D199A46EF3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 10:19:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Qr4B2LmlzDrfw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 18:19:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="S/HGbpHT"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qr2W5rvNzDrcV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 18:18:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Qr2Q4R0Yz9v0Dw;
 Sat, 15 Jun 2019 10:18:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=S/HGbpHT; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sapXI2Lu1-d5; Sat, 15 Jun 2019 10:18:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Qr2Q2t64z9v0Dk;
 Sat, 15 Jun 2019 10:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560586686; bh=+Zco0FR9mmqB3Bll/AYl3OOsNrGQR4TrxurFLcfKqYQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=S/HGbpHTpbiPjpxKnfGawh1W0KnxaGu2okWAzbwWln7hJjfGK8J0BaGEsZJ9KK+oe
 cpxxNcwCu10adPTu3ZeKimZC24Qg14UlA20Iai4/FBlyMbUpCwWgdbsC8cmITBMZUX
 yqCKNNY3JpKWsyfcNcoVVS2GkvW59SX/ypVnzbZ0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6BFB38B7B3;
 Sat, 15 Jun 2019 10:18:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id D6B_beVqunfZ; Sat, 15 Jun 2019 10:18:07 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFCD58B77A;
 Sat, 15 Jun 2019 10:18:06 +0200 (CEST)
Subject: Re: [PATCH v3 2/4] crypto: talitos - fix hash on SEC1.
To: Horia Geanta <horia.geanta@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
References: <cover.1560429844.git.christophe.leroy@c-s.fr>
 <732ca0ff440bf4cd589d844cfda71d96efd500f5.1560429844.git.christophe.leroy@c-s.fr>
 <VI1PR0402MB34855C37F53DC1012DAF670798EE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e98f196d-a47c-f2ae-e729-fe2613628da7@c-s.fr>
Date: Sat, 15 Jun 2019 10:18:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <VI1PR0402MB34855C37F53DC1012DAF670798EE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
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



Le 14/06/2019 à 13:32, Horia Geanta a écrit :
> On 6/13/2019 3:48 PM, Christophe Leroy wrote:
>> @@ -336,15 +336,18 @@ static void flush_channel(struct device *dev, int ch, int error, int reset_ch)
>>   	tail = priv->chan[ch].tail;
>>   	while (priv->chan[ch].fifo[tail].desc) {
>>   		__be32 hdr;
>> +		struct talitos_edesc *edesc;
>>   
>>   		request = &priv->chan[ch].fifo[tail];
>> +		edesc = container_of(request->desc, struct talitos_edesc, desc);
> Not needed for all cases, should be moved to the block that uses it.

Ok.

> 
>>   
>>   		/* descriptors with their done bits set don't get the error */
>>   		rmb();
>>   		if (!is_sec1)
>>   			hdr = request->desc->hdr;
>>   		else if (request->desc->next_desc)
>> -			hdr = (request->desc + 1)->hdr1;
>> +			hdr = ((struct talitos_desc *)
>> +			       (edesc->buf + edesc->dma_len))->hdr1;
>>   		else
>>   			hdr = request->desc->hdr1;
>>   
> [snip]
>> @@ -2058,7 +2065,18 @@ static int ahash_process_req(struct ahash_request *areq, unsigned int nbytes)
>>   		sg_copy_to_buffer(areq->src, nents,
>>   				  ctx_buf + req_ctx->nbuf, offset);
>>   		req_ctx->nbuf += offset;
>> -		req_ctx->psrc = areq->src;
>> +		for (sg = areq->src; sg && offset >= sg->length;
>> +		     offset -= sg->length, sg = sg_next(sg))
>> +			;
>> +		if (offset) {
>> +			sg_init_table(req_ctx->bufsl, 2);
>> +			sg_set_buf(req_ctx->bufsl, sg_virt(sg) + offset,
>> +				   sg->length - offset);
>> +			sg_chain(req_ctx->bufsl, 2, sg_next(sg));
>> +			req_ctx->psrc = req_ctx->bufsl;
> Isn't this what scatterwalk_ffwd() does?

Thanks for pointing this, I wasn't aware of that function. Looking at it 
it seems to do the same. Unfortunately, some tests fails with 'wrong 
result' when using it instead.

Comparing the results of scatterwalk_ffwd() with what I get with my open 
codying, I see the following difference:

scatterwalk_ffwd() uses sg_page(sg) + sg->offset + len

while my open codying results in virt_to_page(sg_virt(sg) + len)

When sg->offset + len is greater than PAGE_SIZE, the resulting SG entry 
is different allthough valid in both cases. I think this difference 
results in sg_copy_to_buffer() failing. I'm still investigating. Any idea ?

Christophe

> 
> Horia
> 
