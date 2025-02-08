Return-Path: <linuxppc-dev+bounces-5993-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8342A2D7FF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 19:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yqzdz1ySBz2yVD;
	Sun,  9 Feb 2025 05:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739038807;
	cv=none; b=S1rFLfxRY9apCMG6OsxRU1IiknpNjarKjFXT/kP2bqpemSUEyWIS2Q7548eo1eYAYRSpjIKkyGLaLR5u19G2xy5Hb8KVktyO5PCTkrzANB/HtLmjH1QHC7LYckMWV82VGP1Q+4Y6156kidWV8Y4dQ5svD84c9CYeSb87ou01C3Et3mHb8wjhbQ2EybsLTAqlO9GZOc/BCRnN9eGNLEiTDLPJAADe2pX4t8MCMz3a+OFer9An8e+eN+aXlhrLu9urkkTyK5lFcTpg6PQDoOAhFDCQK8GTupPLylwUlIhr7WpaWL6u2xRNfBvgsUHNJ/+f012aT1KliinwM/fjdk2MHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739038807; c=relaxed/relaxed;
	bh=DH84ICV7i7R/e4m6i/CWqFVJlPwBx+t+ajY8fMAW850=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqCgEmOxs/Y04L/9TedQDynGAZ028hKqp6Pf7SabsVFjYHRp7b4sdrNwxln9nW5Z9f60PsJCL2uAERxNYFM4yNB/uVZ8MaNmBsyxXbTjEE2hfq+CSl65OytcjMkgnLQe5xPGapjujybomOYEmNdIUFholLdwmc768+C7vaY2q1U+T9qVz+JWo2DxtTmNGfcDTq3KIeBzfEoYwY3SclIXJPnhpSQSSyoVP0ZEEM+CeK2xSQBXHowzMCd8C9hbClPZbCFxA1TZQ0Je+PECT/s/49T9IFvj5M9U0IE0TFy1vnBmL5UUSQIJvAv8Okh1UlzRTYkqSvaro8yjbubOXseBAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yqzdy3KH6z2yT0
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 05:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yqz654D1kz9sPd;
	Sat,  8 Feb 2025 18:55:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2kbV93WVjU2T; Sat,  8 Feb 2025 18:55:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yqz6539yJz9rvV;
	Sat,  8 Feb 2025 18:55:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 624F28B79C;
	Sat,  8 Feb 2025 18:55:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ViW2ux6gv5_3; Sat,  8 Feb 2025 18:55:57 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6213F8B763;
	Sat,  8 Feb 2025 18:55:56 +0100 (CET)
Message-ID: <0f05c020-47e4-444d-90ab-9eb8414f4ef8@csgroup.eu>
Date: Sat, 8 Feb 2025 18:55:54 +0100
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
Subject: Re: [PATCH v3 5/9] powerpc: Use preempt_model_str().
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 Ben Segall <bsegall@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-6-bigeasy@linutronix.de>
 <65c6f60d-bb52-48bd-a02c-87ffd2a915d4@csgroup.eu>
 <20250203160103.9DikC9FJ@linutronix.de>
 <51999b8e-61c0-48b7-b744-c83d39e7f311@csgroup.eu>
 <20250204082223.6iNyq_KR@linutronix.de>
 <7b51f7de-8e4b-4766-85ca-dee24832c693@linux.ibm.com>
 <93833119-9406-4d30-aa7b-4521adb3a573@csgroup.eu>
 <936f0451-a4ee-4e14-9ce9-9cd9613fc55c@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <936f0451-a4ee-4e14-9ce9-9cd9613fc55c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 08/02/2025 à 14:42, Shrikanth Hegde a écrit :
> 
> 
> On 2/8/25 18:25, Christophe Leroy wrote:
>>
>>
>> Le 08/02/2025 à 08:35, Shrikanth Hegde a écrit :
>>>
>>>
>>> On 2/4/25 13:52, Sebastian Andrzej Siewior wrote:
>>>> Use preempt_model_str() instead of manually conducting the preemption
>>>> model. Use pr_emerg() instead of printk() to pass a loglevel.
>>>
>>> even on powerpc, i see __die ends up calling show_regs_print_info().
>>> Why print it twice?
>>
>> I don't understand what you mean, what is printed twice ?
>>
>> I can't see show_regs_print_info() printing the preemption model, am I 
>> missing something ?
>>
> 
> Patch 2/9 add preemption string in dump_stack_print_info.
> 
> __die -> show_regs() _> show_regs_print_info() -> 
> dump_stack_print_info() -> init_utsname()->version, preempt_model_str(), 
> BUILD_ID_VAL);
> 
> Wont we end up in this path?

Indeed I missed that. You are right, we now get the information twice:

[  440.068216] BUG: Unable to handle kernel data access on write at 
0xc09036fc
[  440.075051] Faulting instruction address: 0xc045ddf8
[  440.080032] Oops: Kernel access of bad area, sig: 11 [#1]
[  440.085438] BE PAGE_SIZE=16K PREEMPT  CMPC885
[  440.089872] SAF3000 DIE NOTIFICATION
[  440.093391] CPU: 0 UID: 0 PID: 472 Comm: sh Not tainted 
6.13.0-s3k-dev-01384-g54680e2fbfb0 #1379 PREEMPT
[  440.102977] Hardware name: MIAE 8xx 0x500000 CMPC885
[  440.107951] NIP:  c045ddf8 LR: c045dde8 CTR: 00000000
[  440.113015] REGS: c9bf3d60 TRAP: 0300   Not tainted 
(6.13.0-s3k-dev-01384-g54680e2fbfb0)
[  440.121215] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 35009393  XER: 80003100
[  440.128198] DAR: c09036fc DSISR: 82000000
[  440.128198] GPR00: c045c59c c9bf3e20 c27e7700 0000002e c108575c 
00000001 c1085850 00009032
[  440.128198] GPR08: 00000027 0198b861 00000001 3ffff000 55009393 
100d815e 7fcf5e20 100d0000
[  440.128198] GPR16: 100d0000 00000000 113e447c 113e4480 00000000 
00000001 00000000 00000000
[  440.128198] GPR24: 113e4464 00000000 c1828000 c9bf3ef8 c1136eac 
c9bf3ef8 c2888000 c0900000
[  440.168081] NIP [c045ddf8] lkdtm_WRITE_RO+0x34/0x50
[  440.172969] LR [c045dde8] lkdtm_WRITE_RO+0x24/0x50
[  440.177771] Call Trace:

Christophe

> 
>> Christophe
>>
>>>
>>>>
>>>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>> Cc: Nicholas Piggin <npiggin@gmail.com>
>>>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> Cc: Naveen N Rao <naveen@kernel.org>
>>>> Cc: linuxppc-dev@lists.ozlabs.org
>>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>>> ---
>>>> v2…v3:
>>>>    - Use printk() instead of pr_emerg() to remain consistent with the
>>>>      other invocations in terms of printing context.
>>>>
>>>>   arch/powerpc/kernel/traps.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>>>> index edf5cabe5dfdb..d6d77d92b3358 100644
>>>> --- a/arch/powerpc/kernel/traps.c
>>>> +++ b/arch/powerpc/kernel/traps.c
>>>> @@ -263,10 +263,10 @@ static int __die(const char *str, struct 
>>>> pt_regs *regs, long err)
>>>>   {
>>>>       printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
>>>> -    printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
>>>> +    printk("%s PAGE_SIZE=%luK%s %s %s%s%s%s %s\n",
>>>>              IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>>>>              PAGE_SIZE / 1024, get_mmu_str(),
>>>> -           IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
>>>> +           preempt_model_str(),
>>>>              IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>>>>              IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" 
>>>> __stringify(NR_CPUS)) : "",
>>>>              debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
>>>
>>
> 


