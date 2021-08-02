Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7923DD263
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 10:56:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdX180vtcz3cKq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 18:56:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133;
 helo=out30-133.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdX0q0vCtz306Q
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 18:56:09 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0UhkYtRe_1627894553; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0UhkYtRe_1627894553) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 02 Aug 2021 16:55:54 +0800
Subject: Re: [PATCH 2/2] virtio-console: remove unnecessary kmemdup()
To: Jiri Slaby <jirislaby@kernel.org>, gregkh@linuxfoundation.org,
 amit@kernel.org, arnd@arndb.de
References: <20210801051655.79048-1-xianting.tian@linux.alibaba.com>
 <b5554967-a683-96ae-deb9-2d4980d33b41@kernel.org>
 <5ad81a0e-fbb2-a849-6db7-f5718633d282@linux.alibaba.com>
 <a2598ec9-7bc9-be42-bcab-fa19c9e734f7@kernel.org>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <61a6d459-338b-7e77-c78e-3a069bbfd690@linux.alibaba.com>
Date: Mon, 2 Aug 2021 16:55:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a2598ec9-7bc9-be42-bcab-fa19c9e734f7@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: osandov@fb.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2021/8/2 下午4:40, Jiri Slaby 写道:
> On 02. 08. 21, 10:32, Xianting Tian wrote:
>>
>> 在 2021/8/2 下午3:25, Jiri Slaby 写道:
>>> Hi,
>>>
>>> why is this 2/2? I seem (Lore neither) to find 1/2.
>> You didn't receive 1/2?
>> [PATCH 1/2] tty: hvc: pass DMA capable memory to put_chars()
>> https://lkml.org/lkml/2021/8/1/8 <https://lkml.org/lkml/2021/8/1/8>
>
> Oh, I did, but it's not properly threaded. PLease fix your setup.
Ok, thanks
>
>>> On 01. 08. 21, 7:16, Xianting Tian wrote:
>>>> hvc framework will never pass stack memory to the put_chars() 
>>>> function,
>>>
>>> Am I blind or missing something?
>>>
>>> hvc_console_print(...)
>>> {
>>>   char c[N_OUTBUF]
>>> ...
>>>   cons_ops[index]->put_chars(vtermnos[index], c, i);
>>>
>>> The same here:
>>>
>>> hvc_poll_put_char(..., char ch)
>>> {
>>> ...
>>>    n = hp->ops->put_chars(hp->vtermno, &ch, 1);
>>>
>>> AFAICS both of them *pass* a pointer to stack variable.
>>
>> yes, I discussed the issue with Arnd before in below thread, you can 
>> get the history, thanks
>>
>> https://lkml.org/lkml/2021/7/27/494 
>> <https://lkml.org/lkml/2021/7/27/494>
>
> So is this a v2? You should have noted that. And what changed from v1 
> too.

I think yes, I should mentioned it in this patch, sorry for that:(

>
>>>> So the calling of kmemdup() is unnecessary, remove it.
>>>>
>>>> Fixes: c4baad5029 ("virtio-console: avoid DMA from stack")
>>>
>>> This patch doesn't "Fix" -- it reverts the commit. You should've 
>>> CCed the author too.
>>
>> yes, we discussed ther issue in above thread, which we CCed the author.
>
> I don't see any input from the author?
>
>
> Anyway, 1/2 does not even build, so you will send v3 with all the 
> above fixed, hopefully.

yes, I will send v3 patch after I figured out a better solution based on 
Arnd's comments for the patch '1/2'.

Do you have any other suggestion for the solution?

thanks.

>
> thanks,
