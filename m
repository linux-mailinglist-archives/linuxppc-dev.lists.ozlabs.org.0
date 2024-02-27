Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD8868EA7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 12:20:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=x1yqMzDr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkZmN4GRPz3dBn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 22:20:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=x1yqMzDr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.113; helo=out30-113.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkZlc0fgyz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 22:20:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1709032804; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Ep8dMZzmk15xqlqQL7RaK3mkeF/5/DFYGYZbEAf2sXs=;
	b=x1yqMzDr2lT01JeB/L60w3/wEY6ufBlomdmj+d59DifYCmNlub89c5m1CCjlrzRp7evZCpYfau5ZulZpsVtifU3V/uHteJSTY6aDNIGnsSqLW01GTIgGoZRV7HuDS8+/5qY3VhND0Fqbm4nsrShoKxdbr9+jS5Qce3rcLHwJXoM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R421e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0W1MauK8_1709032801;
Received: from 30.178.67.122(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W1MauK8_1709032801)
          by smtp.aliyun-inc.com;
          Tue, 27 Feb 2024 19:20:02 +0800
Message-ID: <e78357ae-7b00-446c-b010-3bd770892c9e@linux.alibaba.com>
Date: Tue, 27 Feb 2024 19:20:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv10 3/4] genirq: Avoid summation loops for /proc/interrupts
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, dianders@chromium.org,
 liusong@linux.alibaba.com, akpm@linux-foundation.org, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
References: <20240226020939.45264-1-yaoma@linux.alibaba.com>
 <20240226020939.45264-4-yaoma@linux.alibaba.com> <87le769s0w.ffs@tglx>
From: Bitao Hu <yaoma@linux.alibaba.com>
In-Reply-To: <87le769s0w.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2024/2/27 17:26, Thomas Gleixner wrote:
> On Mon, Feb 26 2024 at 10:09, Bitao Hu wrote:
>> We could use the irq_desc::tot_count member to avoid the summation
>> loop for interrupts which are not marked as 'PER_CPU' interrupts in
>> 'show_interrupts'. This could reduce the time overhead of reading
>> /proc/interrupts.
> 
> "Could" is not really a technical term. Either we do or we do not. Also
> please provide context for your change and avoid the 'We'.
OK.
> 
>> --- a/include/linux/irqdesc.h
>> +++ b/include/linux/irqdesc.h
>> @@ -121,6 +121,8 @@ static inline void irq_unlock_sparse(void) { }
>>   extern struct irq_desc irq_desc[NR_IRQS];
>>   #endif
>>
>> +extern bool irq_is_nmi(struct irq_desc *desc);
>> +
> 
> If at all this wants to be in kernel/irq/internal.h. There is zero
> reason to expose this globally.
> 
>> -static bool irq_is_nmi(struct irq_desc *desc)
>> +bool irq_is_nmi(struct irq_desc *desc)
>>   {
>>   	return desc->istate & IRQS_NMI;
>>   }
> 
> If at all this really wants to be a static inline in internals.h, but
> instead of blindly copying code this can be done smarter:
> 
> unsigned int kstat_irq_desc(struct irq_desc *desc)
> {
> 	unsigned int sum = 0;
> 	int cpu;
> 
> 	if (!irq_settings_is_per_cpu_devid(desc) &&
> 	    !irq_settings_is_per_cpu(desc) &&
> 	    !irq_is_nmi(desc))
> 		return data_race(desc->tot_count);
> 
> 	for_each_possible_cpu(cpu)
> 		sum += data_race(*per_cpu_ptr(desc->kstat_irqs, cpu));
> 	return sum;
> }
> 
> and then let kstat_irqs() and show_interrupts() use it. See?

I have a concern. kstat_irqs() uses for_each_possible_cpu() for
summation. However, show_interrupts() uses for_each_online_cpu(),
which means it only outputs interrupt statistics for online cpus.
If we use for_each_possible_cpu() in show_interrupts() to calculate
'any_count', there could be a problem with the following scenario:
If an interrupt has a count of zero on online cpus but a non-zero
count on possible cpus, then 'any_count' would not be zero, and the
statistics for that interrupt would be output, which is not the
desired behavior for show_interrupts(). Therefore, I think it's not
good to have kstat_irqs() and show_interrupts() both use the same
logic. What do you think?

> 
> With that a proper changelog would be:
> 
>     show_interrupts() unconditionally accumulates the per CPU interrupt
>     statistics to determine whether an interrupt was ever raised.
> 
>     This can be avoided for all interrupts which are not strictly per CPU
>     and not of type NMI because those interrupts provide already an
>     accumulated counter. The required logic is already implemented in
>     kstat_irqs().
> 
>     Split the inner access logic out of kstat_irqs() and use it for
>     kstat_irqs() and show_interrupts() to avoid the accumulation loop
>     when possible.
> 

Best Regards,
	Bitao Hu
