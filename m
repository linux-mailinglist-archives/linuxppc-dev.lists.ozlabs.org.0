Return-Path: <linuxppc-dev+bounces-10589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E10B1A3B7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 15:44:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwd8g3v09z3c00;
	Mon,  4 Aug 2025 23:44:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754315091;
	cv=none; b=JCD8GyPX0IQ0BGDxuAJ1bnH0CORvAcdSy0ZclJOWH0N/SkaCoJLrNCLb0VydK1/Qowm2fFGsKyLl6PZpQSXxQSAgavqPREaUEJ4BtHPGRZ9tC1SkAntgMoPu0LlqxIZ06R1qvrICG3DKnkjReMAJKm4RPH3mKuJIsGnQXuPcCbLt49pH8MRRRQVUXBKvericmVe14MH1Fi+BhfMWU3ogOJ+74aAamMcf/1zdDwBeuYsdSF7oMTtL+Ydk3GforqQE/Ta/d4r7MET3bYIrcpR4I7PSekpDQtW++uF1+5LFT/9o+ER8rtD8f2Y2KzNjf0NGtF5fVF9H3iyhLurxEmaY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754315091; c=relaxed/relaxed;
	bh=ZbjHGtxazHcgW4FC0Q6CPW53runGoMNDTkyj1NYqusc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=gil19D2lJd8bvectKSGEDHLzLUvxgiOW+ZWFAXjcQhoS2pwcSYLuVSMmyFHmdAcGQmp8L61J7WjDSr9/L4gUKLpoL3aBWZG+BhKfJERj1EbnGp+3xnNLztiOrLNDVVnqQC8456eKelnVYt6R8uhyznIu3I8oIFvUAZ0nymrvndGPWG4OsKS793w5vX+SdSuzUcvGWDQp0XRYUo2mZo2h3gyWiNG4BRvBrVC7334FDK8xko8u/5SgF9agcFoo0nS5y67lOdPZhFxXsN5X+hT8vO1uSnjh6F/OiQOpL1wXU2DbU3ij+U5y7B/m/mXB3/ZRr7D1TzMGAB38R4mLdIiMXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kXl4RapY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kXl4RapY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwd8f1y5Gz3byt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 23:44:49 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b3be5c0eb99so3198550a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Aug 2025 06:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754315088; x=1754919888; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbjHGtxazHcgW4FC0Q6CPW53runGoMNDTkyj1NYqusc=;
        b=kXl4RapYlNyXm4SVxl670J5Jr7sKKObDBaL3QvNceR2mvVXeDDTYh15r6gp2SZ0TVA
         EW4TMTyzVhshA+g325yFBVo9a/E1F8yCPhP4u9/cZTyFgyPemWkZJaAmIMbWr+2JE0iU
         W/gJlbD/H8rD6+IdPE6rEHASl2C6cwkCQhqNhyXCyXVwB86ShA1T03ihTHNHo1jJq87u
         eaXEdmMb00nUYFL8V/T1U4VyamxiaFrO2uiqE5kJx5reXf3pjMH/a3dBVwXjgUvivA4e
         gp+t0MINfUBq2B3kNNoibn8gkqHrVR6v1Uuyh4+7wV5j7fvVcpcTcvrs3Or4M7qotVvn
         P6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754315088; x=1754919888;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbjHGtxazHcgW4FC0Q6CPW53runGoMNDTkyj1NYqusc=;
        b=oCEH6GShsfTnvVpFmsjLsyHEaMEbk4Eh4VcBXN6Wcw/+4d6k1WXYeW1oHIzrrKWlAM
         Y3jagYkxzte5TlYCyBRkAonV68zkPKeYavCj1LMT9LEGLIFycyqUjs2OwpSvYmmv8j98
         oh1XDlZObTgY4Ggr6v5kTsbHvMc5x1bFHSoe9WNKX9iRWloW8MQUKzb3T2ogKTBkW4/k
         SbkAeNqwzhQjD3m7HiGxsSyN1q16QKJKax430A0IGM9f8QDnfz0Hf30/YbhKkxDFIOGS
         wqMOsLI6ISAKrY7lxc3lVdmH6UVYLs7+Zh5T5jvUlFtkXgTxyB8ZtrArUOJJO7N6Su83
         /vxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0d2+0UgpdH8CqcnsmkZot9EQr/UaCYu2S6KikTGyIBI7A+GhKql/rXwPrXhBVUbacKKzSwUYYACMvZ1Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxYJEtqK+hOhLTfV85kwUJzuisYieIPuhaqoeHxzzexr3glN4SV
	kayNg+ErmcuWg8VZmUaDubimbuB9ZMC3wV8M7YFznz9/BPaMM2+bmEWt
X-Gm-Gg: ASbGncsrxiampTFuB3s7Hlo46Locs86cbUauanD5wi5gsKYZSjW0XAIz4OAKVVaRQCi
	I/+aKkO/GfqCdDKN8lHTJ6xkleKp5wn2ZXUGHQndNQHdJoBBMV9zke45Gli1HDOQeL2KKnrYS6j
	Jb9XSOIarVvxaA9Pz5lEEw+SjU9oy7hbdopFzo8L9T0eEJiJ01FX1L1YQReHhf5X/FUKePNTfEO
	Glp1CfsHRKRs28J5WBm3Nnf4G1oo5rjTanqmqHTSwabLCvbSSWMBW3MHlVXRz/w5uohYnsQZtbp
	Kgj72ANZLqk2qY6hAUP52+//oqdsK+r3EkEyAIgjdbJ/SWLFo7RF4Lmv8PwgAbFwJ+tqF493gC7
	fZrVUz3elW1GGjiw=
X-Google-Smtp-Source: AGHT+IFq1KmzNhGvtVs66984a9NOv5sMOibe6BOHQkO/gTQ3VhIt+ij4VgBQzxQcMG6vJun+OW1OGQ==
X-Received: by 2002:a17:90b:4397:b0:31f:346:c670 with SMTP id 98e67ed59e1d1-321162cd915mr10139822a91.30.1754315087651;
        Mon, 04 Aug 2025 06:44:47 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3207eba6ac8sm11655474a91.1.2025.08.04.06.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 06:44:46 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, Donet Tom <donettom@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Vishal Chourasia <vishalc@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] powerpc/mm: Fix SLB multihit issue during SLB preload
In-Reply-To: <DBTN94725QGF.9OV4JD5UDTHL@gmail.com>
Date: Mon, 04 Aug 2025 18:50:08 +0530
Message-ID: <87cy9b441j.fsf@gmail.com>
References: <20250801103747.21864-1-donettom@linux.ibm.com> <DBTN94725QGF.9OV4JD5UDTHL@gmail.com>
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
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

"Nicholas Piggin" <npiggin@gmail.com> writes:

> Hmm, interesting bug. Impressive work to track it down.
>

Thanks Nick for taking a look at it.

> On Fri Aug 1, 2025 at 8:37 PM AEST, Donet Tom wrote:
>> On systems using the hash MMU, there is a software SLB preload cache that
>> mirrors the entries loaded into the hardware SLB buffer. This preload
>> cache is subject to periodic eviction — typically after every 256 context
>> switches — to remove old entry.
>>
>> To optimize performance, the kernel skips switch_mmu_context() in
>> switch_mm_irqs_off() when the prev and next mm_struct are the same.
>> However, on hash MMU systems, this can lead to inconsistencies between
>> the hardware SLB and the software preload cache.
>>
>> If an SLB entry for a process is evicted from the software cache on one
>> CPU, and the same process later runs on another CPU without executing
>> switch_mmu_context(), the hardware SLB may retain stale entries. If the
>> kernel then attempts to reload that entry, it can trigger an SLB
>> multi-hit error.
>>
>> The following timeline shows how stale SLB entries are created and can
>> cause a multi-hit error when a process moves between CPUs without a
>> MMU context switch.
>>
>> CPU 0                                   CPU 1
>> -----                                    -----
>> Process P
>> exec                                    swapper/1
>>  load_elf_binary
>>   begin_new_exc
>>     activate_mm
>>      switch_mm_irqs_off
>>       switch_mmu_context
>>        switch_slb
>>        /*
>>         * This invalidates all
>>         * the entries in the HW
>>         * and setup the new HW
>>         * SLB entries as per the
>>         * preload cache.
>>         */
>> context_switch
>> sched_migrate_task migrates process P to cpu-1
>>
>> Process swapper/0                       context switch (to process P)
>> (uses mm_struct of Process P)           switch_mm_irqs_off()
>>                                          switch_slb
>>                                            load_slb++
>>                                             /*
>>                                             * load_slb becomes 0 here
>>                                             * and we evict an entry from
>>                                             * the preload cache with
>>                                             * preload_age(). We still
>>                                             * keep HW SLB and preload
>>                                             * cache in sync, that is
>>                                             * because all HW SLB entries
>>                                             * anyways gets evicted in
>>                                             * switch_slb during SLBIA.
>>                                             * We then only add those
>>                                             * entries back in HW SLB,
>>                                             * which are currently
>>                                             * present in preload_cache
>>                                             * (after eviction).
>>                                             */
>>                                         load_elf_binary continues...
>>                                          setup_new_exec()
>>                                           slb_setup_new_exec()
>>
>>                                         sched_switch event
>>                                         sched_migrate_task migrates
>>                                         process P to cpu-0
>>
>> context_switch from swapper/0 to Process P
>>  switch_mm_irqs_off()
>>   /*
>>    * Since both prev and next mm struct are same we don't call
>>    * switch_mmu_context(). This will cause the HW SLB and SW preload
>>    * cache to go out of sync in preload_new_slb_context. Because there
>>    * was an SLB entry which was evicted from both HW and preload cache
>>    * on cpu-1. Now later in preload_new_slb_context(), when we will try
>>    * to add the same preload entry again, we will add this to the SW
>>    * preload cache and then will add it to the HW SLB. Since on cpu-0
>>    * this entry was never invalidated, hence adding this entry to the HW
>>    * SLB will cause a SLB multi-hit error.
>>    */
>> load_elf_binary continues...
>>  START_THREAD
>>   start_thread
>>    preload_new_slb_context
>>    /*
>>     * This tries to add a new EA to preload cache which was earlier
>>     * evicted from both cpu-1 HW SLB and preload cache. This caused the
>>     * HW SLB of cpu-0 to go out of sync with the SW preload cache. The
>>     * reason for this was, that when we context switched back on CPU-0,
>>     * we should have ideally called switch_mmu_context() which will
>>     * bring the HW SLB entries on CPU-0 in sync with SW preload cache
>>     * entries by setting up the mmu context properly. But we didn't do
>>     * that since the prev mm_struct running on cpu-0 was same as the
>>     * next mm_struct (which is true for swapper / kernel threads). So
>>     * now when we try to add this new entry into the HW SLB of cpu-0,
>>     * we hit a SLB multi-hit error.
>>     */
>
> Okay, so what happens is CPU0 has SLB entries remaining from when
> P last ran on there, and the preload aging happens on CPU1 at a
> time when that CPU does clear its SLB. That slb aging step doesn't
> account for the fact CPU0 SLB entries still exist.

Yes, that is right.

>>
>> WARNING: CPU: 0 PID: 1810970 at arch/powerpc/mm/book3s64/slb.c:62
>> assert_slb_presence+0x2c/0x50(48 results) 02:47:29 [20157/42149]
>> Modules linked in:
>> CPU: 0 UID: 0 PID: 1810970 Comm: dd Not tainted 6.16.0-rc3-dirty #12
>> VOLUNTARY
>> Hardware name: IBM pSeries (emulated by qemu) POWER8 (architected)
>> 0x4d0200 0xf000004 of:SLOF,HEAD hv:linux,kvm pSeries
>> NIP:  c00000000015426c LR: c0000000001543b4 CTR: 0000000000000000
>> REGS: c0000000497c77e0 TRAP: 0700   Not tainted  (6.16.0-rc3-dirty)
>> MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR: 28888482  XER: 00000000
>> CFAR: c0000000001543b0 IRQMASK: 3
>> <...>
>> NIP [c00000000015426c] assert_slb_presence+0x2c/0x50
>> LR [c0000000001543b4] slb_insert_entry+0x124/0x390
>> Call Trace:
>>   0x7fffceb5ffff (unreliable)
>>   preload_new_slb_context+0x100/0x1a0
>>   start_thread+0x26c/0x420
>>   load_elf_binary+0x1b04/0x1c40
>>   bprm_execve+0x358/0x680
>>   do_execveat_common+0x1f8/0x240
>>   sys_execve+0x58/0x70
>>   system_call_exception+0x114/0x300
>>   system_call_common+0x160/0x2c4
>>
>> To fix this issue, we add a code change to always switch the MMU context on
>> hash MMU if the SLB preload cache has aged. With this change, the
>> SLB multi-hit error no longer occurs.
>>
>> cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> cc: Michael Ellerman <mpe@ellerman.id.au>
>> cc: Nicholas Piggin <npiggin@gmail.com>
>> Fixes: 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")
>> cc: stable@vger.kernel.org
>> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>>
>> v1 -> v2 : Changed commit message and added a comment in
>> switch_mm_irqs_off()
>>
>> v1 - https://lore.kernel.org/all/20250731161027.966196-1-donettom@linux.ibm.com/
>> ---
>>  arch/powerpc/mm/book3s64/slb.c | 2 +-
>>  arch/powerpc/mm/mmu_context.c  | 7 +++++--
>>  2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
>> index 6b783552403c..08daac3f978c 100644
>> --- a/arch/powerpc/mm/book3s64/slb.c
>> +++ b/arch/powerpc/mm/book3s64/slb.c
>> @@ -509,7 +509,7 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
>>  	 * SLB preload cache.
>>  	 */
>>  	tsk->thread.load_slb++;
>> -	if (!tsk->thread.load_slb) {
>> +	if (tsk->thread.load_slb == U8_MAX) {
>>  		unsigned long pc = KSTK_EIP(tsk);
>>  
>>  		preload_age(ti);
>> diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
>> index 3e3af29b4523..95455d787288 100644
>> --- a/arch/powerpc/mm/mmu_context.c
>> +++ b/arch/powerpc/mm/mmu_context.c
>> @@ -83,8 +83,11 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
>>  	/* Some subarchs need to track the PGD elsewhere */
>>  	switch_mm_pgdir(tsk, next);
>>  
>> -	/* Nothing else to do if we aren't actually switching */
>> -	if (prev == next)
>> +	/*
>> +	 * Nothing else to do if we aren't actually switching and
>> +	 * the preload slb cache has not aged
>> +	 */
>> +	if ((prev == next) && (tsk->thread.load_slb != U8_MAX))
>>  		return;
>>  
>>  	/*
>
> I see couple of issues with this fix. First of all, it's a bit wrong to
> call switch subsequent switch_mm functions if prev == next, they are not
> all powerpc specific. We could work around that somehow with some hash
> specific knowledge. But worse I think is that load_slb could be
> incremented again if we context switched P again before migrating back
> here, then we would miss it.

Aah right. Got too involved in the issue, missed to see that coming.
You are right, if the process is context switched twice before coming
back on the original cpu (while still in load_elf_binary() path), we can
still hit the same issue. Though it's probablity of hitting must be very
low, but it is still possible.

>
> How about removing preload_new_slb_context() and slb_setup_new_exec()
> entirely? Then slb preload is a much simpler thing that is only loaded
> after the SLB has been cleared. Those functions were always a bit
> janky and for performance, context switch is the most improtant I think,
> new thread/proc creation less so.

Thanks for the suggestion. Right the above changes should not affect
context switch which is more performance critical. 

I agree, removing these two functions should solve the reported problem,
since these two are the only callers where we don't invalidate the HW
SLB before preloading. switch_slb() on the other hand takes care of
that (which gets called during context switch).

I see in the original commit - you had measured context_switch benchmark
which showed 27% performance improvement. Was this context_switch in
will-it-scale?
Is there any workload which you think we could run to confirm that no
regression should be observed with these changes (including for
proc/thread creation?)

>
> Thanks,
> Nick

Thanks again for taking a look. Appreciate your help!

-ritesh

