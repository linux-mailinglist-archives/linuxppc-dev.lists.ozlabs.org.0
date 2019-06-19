Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC5C4B9F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 15:30:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TQmd2h0SzDqp7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 23:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="kVb3ZJa2"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQWX38lHzDqlS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 23:18:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45TQWN27Q3zB09ZL;
 Wed, 19 Jun 2019 15:18:40 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kVb3ZJa2; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QY0ATIWU49ie; Wed, 19 Jun 2019 15:18:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45TQWN0SYTzB09ZJ;
 Wed, 19 Jun 2019 15:18:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560950320; bh=WgTiX3OsG89AXheoy/URgukofuIwabLU7WF9fLzkpdA=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=kVb3ZJa2s5NBS4EWAJuYRVPvafPASJlQQKp/poSsOSZxZoxN/mRCOzUJz7HQfM+IZ
 QtObspnGzzggzjg+MZBmNWXahovzQ0zvDnwCdq3AJAHbxw9u2fPfQmrfB1JqRNmOGs
 ZnMN+9CBqg0O1yPv1+lrbk+bPCvh+E9JjZh+60O8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 62B468B93E;
 Wed, 19 Jun 2019 15:18:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ciQUHf7tCdKL; Wed, 19 Jun 2019 15:18:42 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 177058B92B;
 Wed, 19 Jun 2019 15:18:42 +0200 (CEST)
Subject: Re: [PATCH 1/3] powerpc/64: __ioremap_at clean up in the error case
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190610030818.17965-1-npiggin@gmail.com>
 <5d358284-c31c-5e01-240a-54b3491a8915@c-s.fr>
 <1560916886.zyg87enrjs.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f32d9238-12fd-cceb-9980-4eb60d09ce6b@c-s.fr>
Date: Wed, 19 Jun 2019 15:04:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1560916886.zyg87enrjs.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/06/2019 à 06:04, Nicholas Piggin a écrit :
> Christophe Leroy's on June 11, 2019 4:28 pm:
>>
>>
>> Le 10/06/2019 à 05:08, Nicholas Piggin a écrit :
>>> __ioremap_at error handling is wonky, it requires caller to clean up
>>> after it. Implement a helper that does the map and error cleanup and
>>> remove the requirement from the caller.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>
>>> This series is a different approach to the problem, using the generic
>>> ioremap_page_range directly which reduces added code, and moves
>>> the radix specific code into radix files. Thanks to Christophe for
>>> pointing out various problems with the previous patch.
>>>
>>>    arch/powerpc/mm/pgtable_64.c | 27 ++++++++++++++++++++-------
>>>    1 file changed, 20 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
>>> index d2d976ff8a0e..6bd3660388aa 100644
>>> --- a/arch/powerpc/mm/pgtable_64.c
>>> +++ b/arch/powerpc/mm/pgtable_64.c
>>> @@ -108,14 +108,30 @@ unsigned long ioremap_bot;
>>>    unsigned long ioremap_bot = IOREMAP_BASE;
>>>    #endif
>>>    
>>> +static int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
>>> +{
>>> +	unsigned long i;
>>> +
>>> +	for (i = 0; i < size; i += PAGE_SIZE) {
>>> +		int err = map_kernel_page(ea + i, pa + i, prot);
>>
>> Missing a blank line
>>
>>> +		if (err) {
>>
>> I'd have done the following to reduce indentation depth
>>
>> 		if (!err)
>> 			continue
> 
> I'll consider it, line lengths were not too bad.
> 
>>> +			if (slab_is_available())
>>> +				unmap_kernel_range(ea, size);
>>
>> Shouldn't it be unmap_kernel_range(ea, i) ?
> 
> I guess (i - PAGE_SIZE really), although the old code effectively did
> the full range. As a "clean up" it may be better to avoid subtle
> change in behaviour and do that in another patch?

Not sure we have to do it in another patch.
Previous code was doing full range because it was done at upper level so 
it didn't know the boundaries. You are creating a nice brand new 
function that have all necessary information, so why not make it right 
from the start ?

Christophe

> 
> Thanks,
> Nick
> 
