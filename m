Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A6568241
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 04:31:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45n6wr12jWzDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 12:31:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="ZnxXJWi0"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45n6rD5CDVzDqTQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 12:27:38 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id g15so6956725pgi.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2019 19:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ydjsBuMhwJdR/DM0stZdSCFpSWR8eAgEHhFCrGIxjqA=;
 b=ZnxXJWi0wxxSpMGUupy5wR6C8ZXxElbSdxbfpbqs0OzC2bTSggvZmBxBZsNYI/UB0/
 Hj2sc3BmeMWjFeAD9o8OSZhFAWfk/ZrZ96wOYb2GS6Bz3BOBVCWtL7oDf+oR3C+7N1WC
 vzZ0zf2rWv7wTb++AGpazzpt+OQkofqEtLi7DN7UEvhrkFon6VB019YRFuXfEFf997h8
 LbO2hW3oVl61NO0AIHnyTAhCSAb5x0PXz3UXWkFIPBv+1Kpi9nPmIfdI1jcit9kE86QF
 Vdeds9G5wR5cwOXxDs+b3ijorNKZPwsuiuRl8iizVBOrfM04N3Ys4bun2VE4S//ndLO4
 yx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ydjsBuMhwJdR/DM0stZdSCFpSWR8eAgEHhFCrGIxjqA=;
 b=fYPHnhgEnUsQFXzFflD7CYHneEd8FCgfOmuBbdm3Bbav99RHCGIz6whYR4qosJvL+w
 hNhYL4DTGEbEB58/8H06N5D//HU4iC2gMj6+acyNjWd25XIAP13vWkl5c9ecxsu6dc3X
 llvTvpzZLajF7jJZyhJHR9JpO3Xpg85XWEirwnUqOeVuennIwZClx9zfs06LkloPkUdE
 pCjWPuHGv4D+LyopYMqd8NC4PiEN2BWWPG09DLkxBiyIsAysTufzzah1xTcVdc1BrUKT
 hxH904bPgkffZbsNfnzELW+kBF3yPI1sOyAJOCxqUUVREXl8sL9Ms4/3HcUzfSnSCkRM
 aejg==
X-Gm-Message-State: APjAAAUI/GYZEPYHgR87OJgSUbSbjBOqvYHAL7bbR42nuQjL7bMBN0VM
 vG5rOGs1Adntgcqpw9iv5no=
X-Google-Smtp-Source: APXvYqxf/7/yVetfuC68vmHC/lcF32ErVA2uwk3GL98k2/0GlPco4N2pVYl/89C0U+6JMCg66CbdDg==
X-Received: by 2002:a63:1b66:: with SMTP id b38mr24272199pgm.54.1563157656130; 
 Sun, 14 Jul 2019 19:27:36 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id r61sm22747210pjb.7.2019.07.14.19.27.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 19:27:35 -0700 (PDT)
Subject: Re: [RFC PATCH kernel] powerpc/xive: Drop deregistered irqs
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20190712082036.40440-1-aik@ozlabs.ru>
 <e500148e-93f3-5a63-cdc2-b48428c51ee8@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <816f26ea-d868-781f-9189-6c0d4e7257cf@ozlabs.ru>
Date: Mon, 15 Jul 2019 12:27:30 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e500148e-93f3-5a63-cdc2-b48428c51ee8@gmail.com>
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
Cc: Alistair Popple <alistair@popple.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 15/07/2019 05:14, Daniel Henrique Barboza wrote:
> This patch fixed an issue I was experiencing with virsh start/destroy
> of guests with mlx5 and GPU passthrough in a Power 9 server. I
> believe it's a similar situation which Alexey described in the post
> commit msg.
> 
> 
> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Thanks for testing! Unfortunately, this is not the right fix as it only 
reduces the race window but does not eliminate it, we need something 
better than this, i.e. do not backport this anywhere please :) Thanks,


> 
> 
> On 7/12/19 5:20 AM, Alexey Kardashevskiy wrote:
>> There is a race between releasing an irq on one cpu and fetching it
>> from XIVE on another cpu as there does not seem to be any locking between
>> these, probably because xive_irq_chip::irq_shutdown() is supposed to
>> remove the irq from all queues in the system which it does not do.
>>
>> As a result, when such released irq appears in a queue, we take it
>> from the queue but we do not change the current priority on that cpu and
>> since there is no handler for the irq, EOI is never called and the cpu
>> current priority remains elevated (7 vs. 0xff==unmasked). If another irq
>> is assigned to the same cpu, then that device stops working until irq
>> is moved to another cpu or the device is reset.
>>
>> This checks if irq is still registered, if not, it assumes no valid irq
>> was fetched from the loop and if there is none left, it continues to
>> the irq==0 case (not visible in this patch) and sets priority to 0xff
>> which is basically unmasking. This calls irq_to_desc() on a hot path now
>> which is a radix tree lookup; hopefully this won't be noticeable as
>> that tree is quite small.
>>
>> Signed-off-by: Alexey Kardashevskiy<aik@ozlabs.ru>
>> ---
>>
>> Found it on P9 system with:
>> - a host with 8 cpus online
>> - a boot disk on ahci with its msix on cpu#0
>> - a guest with 2xGPUs + 6xNVLink + 4 cpus
>> - GPU#0 from the guest is bound to the same cpu#0.
>>
>> Killing a guest killed ahci and therefore the host because of the race.
>> Note that VFIO masks interrupts first and only then resets the device.
>>
>> Alternatives:
>>
>> 1. Fix xive_irq_chip::irq_shutdown() to walk through all cpu queues and
>> drop deregistered irqs.
>>
>> 2. Exploit chip->irq_get_irqchip_state function from
>> 62e0468650c30f0298 "genirq: Add optional hardware synchronization for shutdown".
>>
>> Both require deep XIVE knowledge which I do not have.
>> ---
>>   arch/powerpc/sysdev/xive/common.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>> index 082c7e1c20f0..65742e280337 100644
>> --- a/arch/powerpc/sysdev/xive/common.c
>> +++ b/arch/powerpc/sysdev/xive/common.c
>> @@ -148,8 +148,12 @@ static u32 xive_scan_interrupts(struct xive_cpu *xc, bool just_peek)
>>   		irq = xive_read_eq(&xc->queue[prio], just_peek);
>>   
>>   		/* Found something ? That's it */
>> -		if (irq)
>> -			break;
>> +		if (irq) {
>> +			/* Another CPU may have shut this irq down, check it */
>> +			if (irq_to_desc(irq))
>> +				break;
>> +			irq = 0;
>> +		}
>>   
>>   		/* Clear pending bits */
>>   		xc->pending_prio &= ~(1 << prio);
> 

-- 
Alexey
