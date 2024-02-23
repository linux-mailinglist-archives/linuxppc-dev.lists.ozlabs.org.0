Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E191860B43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 08:19:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=A+Pah8dO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th1bw2mBCz3dvs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 18:19:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=A+Pah8dO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.118; helo=out30-118.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th1b859jvz3dTt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 18:18:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1708672733; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=4R2wwRGv9r0ABt36T9MYvpDosxNOFhHAa6Gib5GsXfA=;
	b=A+Pah8dOONowtv+jy55rnPZghER9WvTEo74iQ229R4YEa7EAEXZrHwZfiNPHg0dQjKJP+UBnE8tSUi11zV+rvbMk7Z8FnrtHajbYV23fU1gX89eOsVKEnPaYo7vs2lCR/lJ3T/nY83SElIll9H5my+At98WX5HeWYQ7b61e2kO8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R801e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W13KKaF_1708672729;
Received: from 30.178.67.167(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W13KKaF_1708672729)
          by smtp.aliyun-inc.com;
          Fri, 23 Feb 2024 15:18:51 +0800
Message-ID: <3f4b7dbe-93c1-4cb0-8233-18e8432409f8@linux.alibaba.com>
Date: Fri, 23 Feb 2024 15:18:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv9 2/3] irq: use a struct for the kstat_irqs in the
 interrupt descriptor
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, dianders@chromium.org,
 akpm@linux-foundation.org, liusong@linux.alibaba.com, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
References: <20240222093420.13956-1-yaoma@linux.alibaba.com>
 <20240222093420.13956-3-yaoma@linux.alibaba.com> <87jzmwfxak.ffs@tglx>
From: Bitao Hu <yaoma@linux.alibaba.com>
In-Reply-To: <87jzmwfxak.ffs@tglx>
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2024/2/22 21:22, Thomas Gleixner wrote:
> On Thu, Feb 22 2024 at 17:34, Bitao Hu wrote:
> 
> First of all the subsystem prefix is 'genirq:'. 'git log kernel/irq/'
> gives you a pretty good hint. It's documented....
> 
> Secondly the subject line does not match what this patch is about. It's
> not about using a struct, it's about providing a snapshot mechanism, no?
> 
>> The current implementation uses an int for the kstat_irqs in the
>> interrupt descriptor.
>>
>> However, we need to know the number of interrupts which happened
>> since softlockup detection took a snapshot in order to analyze
>> the problem caused by an interrupt storm.
>>
>> Replacing an int with a struct and providing sensible interfaces
>> for the watchdog code can keep it self contained to the interrupt
>> core code.
> 
> So something like this makes a useful change log for this:
> 
>   Subject: genirq: Provide a snapshot mechanism for interrupt statistics
> 
>   The soft lockup detector lacks a mechanism to identify interrupt storms
>   as root cause of a lockup. To enable this the detector needs a
>   mechanism to snapshot the interrupt count statistics on a CPU when the
>   detector observes a potential lockup scenario and compare that against
>   the interrupt count when it warns about the lockup later on. The number
>   of interrupts in that period give a hint whether the lockup might be
>   caused by an interrupt storm.
> 
>   Instead of having extra storage in the lockup detector and accessing
>   the internals of the interrupt descriptor directly, convert the per CPU
>   irq_desc::kstat_irq member to a data structure which contains the
>   counter plus a snapshot member and provide interfaces to take a
>   snapshot of all interrupts on the current CPU and to retrieve the delta
>   of a specific interrupt later on.
> 
Thanks, the changelog you wrote very clearly articulates the purpose of
this patch.

> Hmm?
> 
>> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> 
> Interesting. You fully authored the patch?
> 
> That's not how it works. You cannot take work from others and claim that
> it is yours. The minimal courtesy is to add a 'Originally-by:' tag.
> 
I'm very sorry, the majority of this patch is your work, I will add an
'Originally-by:' tag.

>> diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
>> index 623b8136e9af..3ad40cf30c66 100644
>> --- a/kernel/irq/proc.c
>> +++ b/kernel/irq/proc.c
>> @@ -488,18 +488,15 @@ int show_interrupts(struct seq_file *p, void *v)
>>   	if (!desc || irq_settings_is_hidden(desc))
>>   		goto outsparse;
>>   
>> -	if (desc->kstat_irqs) {
>> -		for_each_online_cpu(j)
>> -			any_count |= data_race(*per_cpu_ptr(desc->kstat_irqs, j));
>> -	}
>> +	if (desc->kstat_irqs)
>> +		any_count = data_race(desc->tot_count);
> 
> This is an unrelated change and needs to be split out into a separate
> patch with a proper changelog which explains why this is equivalent.
> 

Alright, I will remove this change witch is not related to the purpose
of this patch.

I guess that the purpose of suggesting this change in your V1 response
was to speedup the 'show_interrupts'. However, after reviewing the
usage of 'desc->tot_count' in 'unsigned int kstat_irqs(unsigned int 
irq)', I think the change might be as follows:

diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 623b8136e9af..53b8d6edd7ac 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -489,8 +489,13 @@ int show_interrupts(struct seq_file *p, void *v)
                 goto outsparse;

         if (desc->kstat_irqs) {
-               for_each_online_cpu(j)
-                       any_count |= 
data_race(per_cpu(desc->kstat_irqs->cnt, j));
+               if (!irq_settings_is_per_cpu_devid(desc) &&
+                   !irq_settings_is_per_cpu(desc) &&
+                   !irq_is_nmi(desc))
+                       any_count = data_race(desc->tot_count);
+               else
+                       for_each_online_cpu(j)
+                               any_count |= 
data_race(per_cpu(desc->kstat_irqs->cnt, j));
         }

         if ((!desc->action || irq_desc_is_chained(desc)) && !any_count)

Is my idea correct?

Best Regards,
	Bitao
