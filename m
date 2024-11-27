Return-Path: <linuxppc-dev+bounces-3582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860B9DA24D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 07:28:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyqJZ5SgBz2xpm;
	Wed, 27 Nov 2024 17:28:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732688910;
	cv=none; b=Agbj7IF8Ne2PByHBBvdFl9U8OnX5N0Ne3qE1D2WBmJuCeWOLu1qi9Q+h8fM2LmHHrlo/f3bz3pQQS1pvsjhXuVOKfqUulkXZOLcdfGsN0eRptjRVDgffEFlApiG0rN86fbhsAplh7d8JqSJPf4TKMPOk2ZM+/EOLbjwSf5SDoZOCvjnIZ3ARa6Rp1Tf0jQw6mpe5fW8JMCnr2CHkVPlD0S/5I6WsuHnXwncbG0/H4dQWBYwujYlDYChldjtVljIGmzTh7a5INa+cScOaVfzAev7woi4jDDMMV2C+hpLEgo8ta1ByF5ingMq8/sOxe6gVLB6XRRPFQlRADssLapaxEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732688910; c=relaxed/relaxed;
	bh=3tjkyYjwv1oTpyubP3XdlbZnQ8JPu/R1Fv68D+iZg64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NeuQh6AEyB7Z0A9jgzHaeTTPLAg4DnUGPhuL+kbyY5sSDMvaEfJ8NslglJAxD35gtIx6TbwjTStPrpr1tv1hQSuN8nj8ICh046DJpGu1yGYXXkhAP4auEb/87IdifVnLBmDXbzOz+f+ji3XGppn+YIYxY0GHrudYT+Yc/CwoB7hm/nZR4HKkGj9PSQPNXcpG1i0pbczGdJfCsgrI8y9ertn5MrPOE6fE1llUj2lbryoOhrJ5/f6gs4CNOFy+QRA8kxvGDII4QXAhl452aXN4z9GFPtFnaLjGpT1yCZeuXussZSGJCX+YyYrA6GPAxMXWjX4xV7H8V4uP1yMP4rxo+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyqJY4vgpz2xpf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 17:28:28 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XyqJT50krz9sPd;
	Wed, 27 Nov 2024 07:28:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLqilz5sjvGQ; Wed, 27 Nov 2024 07:28:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XyqJT3tyfz9rvV;
	Wed, 27 Nov 2024 07:28:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7030B8B780;
	Wed, 27 Nov 2024 07:28:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ULA6o10COpzh; Wed, 27 Nov 2024 07:28:25 +0100 (CET)
Received: from [192.168.233.25] (PO18304.IDSI0.si.c-s.fr [192.168.233.25])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D1F5A8B77C;
	Wed, 27 Nov 2024 07:28:24 +0100 (CET)
Message-ID: <cd3f01d0-fd34-4a5c-ac45-5d2dd2349f8a@csgroup.eu>
Date: Wed, 27 Nov 2024 07:28:23 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powerpc: support dynamic preemption
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
 ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, vschneid@redhat.com, peterz@infradead.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
 <20241125042212.1522315-3-sshegde@linux.ibm.com>
 <d169e57d-d0a8-4fe8-a44e-2f7a967b5121@csgroup.eu>
 <f41701ce-2977-4e49-ad25-1dabb26a2668@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <f41701ce-2977-4e49-ad25-1dabb26a2668@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 26/11/2024 à 12:15, Shrikanth Hegde a écrit :
> 
> 
> On 11/26/24 16:18, Christophe Leroy wrote:
>>
>>
> 
> Hi Christophe, Thanks for taking a look at this.
> 
>> Le 25/11/2024 à 05:22, Shrikanth Hegde a écrit :
>>> Once the lazy preemption is supported, it would be desirable to change
>>> the preemption models at runtime. So this change adds support for 
>>> dynamic
>>> preemption using DYNAMIC_KEY.
>>>
>>> In irq-exit to kernel path, use preempt_model_preemptible for decision.
>>> Other way would be using static key based decision. Keeping it
>>> simpler since key based change didn't show performance improvement.
>>>
>>> Tested lightly on Power10 LPAR. Performance numbers indicate that,
>>> preempt=none(no dynamic) and preempt=none(dynamic) are similar.
>>> Only hackbench pipe shows a regression. There is slight overhead of code
>>> check if it is preemptible kernel. hackbench pipe is prone to such
>>> patterns[1]
>>>
>>> cat /sys/kernel/debug/sched/preempt
>>> (none) voluntary full lazy
>>> perf stat -e probe:__cond_resched -a sleep 1
>>>   Performance counter stats for 'system wide':
>>>               1,253      probe:__cond_resched
>>>
>>> echo full > /sys/kernel/debug/sched/preempt
>>> cat /sys/kernel/debug/sched/preempt
>>> none voluntary (full) lazy
>>> perf stat -e probe:__cond_resched -a sleep 1
>>>   Performance counter stats for 'system wide':
>>>                   0      probe:__cond_resched
>>>
>>> echo lazy > /sys/kernel/debug/sched/preempt
>>> cat /sys/kernel/debug/sched/preempt
>>> none voluntary full (lazy)
>>> perf stat -e probe:__cond_resched -a sleep 1
>>>   Performance counter stats for 'system wide':
>>>                   0      probe:__cond_resched
>>>
>>> [1]: 
>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F1a973dda-c79e-4d95-935b-&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cf0474c2567834b69dfd908dd0e0bb554%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638682165690258507%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Gcw6nRSPkp78lGEkG8NX04KWW%2FjCZm0oA%2BTGTjpUZUc%3D&reserved=0 e4b93eb077b8@linux.ibm.com/
>>>
>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>> ---
>>>   arch/powerpc/Kconfig               | 1 +
>>>   arch/powerpc/include/asm/preempt.h | 1 +
>>>   arch/powerpc/kernel/interrupt.c    | 6 +++++-
>>>   arch/powerpc/lib/vmx-helper.c      | 2 +-
>>>   4 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 6d6bbd93abab..01c58f5258c9 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -270,6 +270,7 @@ config PPC
>>>       select HAVE_PERF_EVENTS_NMI        if PPC64
>>>       select HAVE_PERF_REGS
>>>       select HAVE_PERF_USER_STACK_DUMP
>>> +    select HAVE_PREEMPT_DYNAMIC_KEY
>>>       select HAVE_RETHOOK            if KPROBES
>>>       select HAVE_REGS_AND_STACK_ACCESS_API
>>>       select HAVE_RELIABLE_STACKTRACE
>>> diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/ 
>>> include/asm/preempt.h
>>> index 51f8f3881523..c0a19ff3f78c 100644
>>> --- a/arch/powerpc/include/asm/preempt.h
>>> +++ b/arch/powerpc/include/asm/preempt.h
>>> @@ -84,6 +84,7 @@ extern asmlinkage void preempt_schedule_notrace(void);
>>>   #if defined(CONFIG_PREEMPT_DYNAMIC) && 
>>> defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
>>> +DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>>>   void dynamic_preempt_schedule(void);
>>>   void dynamic_preempt_schedule_notrace(void);
>>>   #define __preempt_schedule()        dynamic_preempt_schedule()
>>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/ 
>>> interrupt.c
>>> index 8f4acc55407b..0fb01019d7e0 100644
>>> --- a/arch/powerpc/kernel/interrupt.c
>>> +++ b/arch/powerpc/kernel/interrupt.c
>>> @@ -38,6 +38,10 @@ static inline bool exit_must_hard_disable(void)
>>>   }
>>>   #endif
>>> +#ifdef CONFIG_PREEMPT_DYNAMIC
>>> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>>> +#endif
>>
>> Why is that needed at all ? It isn't used.
> 
> This is needed else compilation fails.
> 
> It has be defined by arch if it doesn't use kernel infra of entry/exit.
> So if an arch does enable, CONFIG_HAVE_PREEMPT_DYNAMIC_KEY it has to be 
> define this key has well. The generic sched/core enables this flag.
> 
> This was one of the point I was requesting answer for. Either to use 
> preempt_model_preemptible or define macros based on this key. Other 
> archs are doing the later and hence the generic code enables this key.
> 
> It can be done in either way. if we do the later way, then this variable 
> will be used as well.
> 

Ah right, I did a grep on sk_dynamic_irqentry_exit_cond_resched but 
indeed it is triggered by static_key_enable(&sk_dynamic_##f.key)

Christophe

