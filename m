Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA4E777B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2019 10:38:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45wfW06Kc0zDqSZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2019 18:38:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.172.75; helo=4.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 968 seconds by postgrey-1.36 at bilbo;
 Sat, 27 Jul 2019 18:37:25 AEST
Received: from 4.mo2.mail-out.ovh.net (4.mo2.mail-out.ovh.net [87.98.172.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45wfTK4gJ2zDqD0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2019 18:37:21 +1000 (AEST)
Received: from player691.ha.ovh.net (unknown [10.108.54.97])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id E723F1A6021
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2019 10:21:06 +0200 (CEST)
Received: from kaod.org (bad36-1-78-202-132-1.fbx.proxad.net [78.202.132.1])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 4EC5C8742BE4;
 Sat, 27 Jul 2019 08:20:54 +0000 (UTC)
Subject: Re: [PATCH kernel v3] powerpc/xive: Drop deregistered irqs
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20190717050028.85926-1-aik@ozlabs.ru>
 <299e14d3-0820-7a11-7111-423093cc3e50@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <04a0667d-9916-ec84-de18-5209c0cc97f5@kaod.org>
Date: Sat, 27 Jul 2019 10:20:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <299e14d3-0820-7a11-7111-423093cc3e50@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 680606494261152665
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrkeeigddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Alexey,

>> --- a/arch/powerpc/kernel/irq.c
>> +++ b/arch/powerpc/kernel/irq.c
>> @@ -632,10 +632,13 @@ void __do_irq(struct pt_regs *regs)
>>       may_hard_irq_enable();
>>         /* And finally process it */
>> -    if (unlikely(!irq))
>> +    if (unlikely(!irq)) {
>>           __this_cpu_inc(irq_stat.spurious_irqs);
>> -    else
>> -        generic_handle_irq(irq);
>> +    } else if (generic_handle_irq(irq)) {
>> +        if (ppc_md.orphan_irq)
>> +            ppc_md.orphan_irq(irq);
>> +        __this_cpu_inc(irq_stat.spurious_irqs);
>> +    }

I think we still have an issue here. 

The fix is relying on the fact that generic_handle_irq() will return 
EINVAL if irq desc is NULL, and if this is the case the top interrupt 
handler will consider we have an orphan interrupt.

But, we could also be in the middle of irq_domain->map() and have a 
partially initialized descriptor if the same interrupt is being remapped 
on a CPU while another is trying to handle orphans. 

Calling can_request_irq() (which checks the IRQ_NOREQUEST flag) should 
close that window and it would be clearer than relying on the return value 
of generic_handle_irq().  

C.
