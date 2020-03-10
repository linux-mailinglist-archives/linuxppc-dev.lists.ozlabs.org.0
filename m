Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5CE17F690
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 12:43:58 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cCsj6RmYzDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 22:43:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cCpb0YjFzDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 22:41:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ff0eRtkc; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48cCpT4q0rz9sPF;
 Tue, 10 Mar 2020 22:41:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583840470;
 bh=cOitpLFHAIjMWgBu77JQjQ0j2l9R2qgmEiiTn4Mmnog=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ff0eRtkc5gtUTz6PhR+Xi03lzmkjMkBCIz9KIVB/siWWs0a6ITaErairLGKXDWEd/
 aqQKouR0/aAFos8+hOcBCf1gDkbg4PtLQqAdW+Mkc8uVx1jcyzUHZxm5XzRNMgCGC4
 qSxXHI3rpdYhmH1KO/FMovfJaNpUrgFPIxzJ/Q2ZfxzB9VMXqzcy+Vtm4UYs+9ijTK
 QLWkJK04LUdHH92lACH6N37ncQMfxaciMMjxHpBriKOavUTLfESRiQBEaT5ASENiMZ
 ZO3vdlmslL9nXK5Mnct6LGhRV355Aebtm8VqQ+7uUoz/xGIVvErjn88rPcg/LrM4c2
 YD5BI/9j3lclA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3] powerpc: setup_64: set up PACA earlier to avoid kcov
 problems
In-Reply-To: <1583543617.bp71axgtlo.astroid@bobo.none>
References: <20200306073000.9491-1-dja@axtens.net>
 <1583543617.bp71axgtlo.astroid@bobo.none>
Date: Tue, 10 Mar 2020 22:41:00 +1100
Message-ID: <87tv2wigj7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Daniel Axtens's on March 6, 2020 5:30 pm:
>> kcov instrumentation is collected the __sanitizer_cov_trace_pc hook in
>> kernel/kcov.c. The compiler inserts these hooks into every basic block
>> unless kcov is disabled for that file.
>> 
>> We then have a deep call-chain:
>>  - __sanitizer_cov_trace_pc calls to check_kcov_mode()
>>  - check_kcov_mode() (kernel/kcov.c) calls in_task()
>>  - in_task() (include/linux/preempt.h) calls preempt_count().
>>  - preempt_count() (include/asm-generic/preempt.h) calls
>>      current_thread_info()
>>  - because powerpc has THREAD_INFO_IN_TASK, current_thread_info()
>>      (include/linux/thread_info.h) is defined to 'current'
>>  - current (arch/powerpc/include/asm/current.h) is defined to
>>      get_current().
>>  - get_current (same file) loads an offset of r13.
>>  - arch/powerpc/include/asm/paca.h makes r13 a register variable
>>      called local_paca - it is the PACA for the current CPU, so
>>      this has the effect of loading the current task from PACA.
>>  - get_current returns the current task from PACA,
>>  - current_thread_info returns the task cast to a thread_info
>>  - preempt_count dereferences the thread_info to load preempt_count
>>  - that value is used by in_task and so on up the chain
>> 
>> The problem is:
>> 
>>  - kcov instrumentation is enabled for arch/powerpc/kernel/dt_cpu_ftrs.c
>> 
>>  - even if it were not, dt_cpu_ftrs_init calls generic dt parsing code
>>    which should definitely have instrumentation enabled.
>> 
>>  - setup_64.c calls dt_cpu_ftrs_init before it sets up a PACA.
>> 
>>  - If we don't set up a paca, r13 will contain unpredictable data.
>> 
>>  - In a zImage compiled with kcov and KASAN, we see r13 containing a value
>>    that leads to dereferencing invalid memory (something like
>>    912a72603d420015).
>> 
>>  - Weirdly, the same kernel as a vmlinux loaded directly by qemu does not
>>    crash. Investigating with gdb, it seems that in the vmlinux boot case,
>>    r13 is near enough to zero that we just happen to be able to read that
>>    part of memory (we're operating with translation off at this point) and
>>    the current pointer also happens to land in readable memory and
>>    everything just works.
>> 
>>  - PACA setup refers to CPU features - setup_paca() looks at
>>    early_cpu_has_feature(CPU_FTR_HVMODE)
>> 
>> There's no generic kill switch for kcov (as far as I can tell), and we
>> don't want to have to turn off instrumentation in the generic dt parsing
>> code (which lives outside arch/powerpc/) just because we don't have a real
>> paca or task yet.
>> 
>> So:
>>  - change the test when setting up a PACA to consider the actual value of
>>    the MSR rather than the CPU feature.
>> 
>>  - move the PACA setup to before the cpu feature parsing.
>
> Hmm. Problem is that equally we want PACA to be sane before we call too
> far into the rest of the kernel ("generic dt parsing code").

But currently we call into that code with no paca at all. Or rather,
with r13 pointing somewhere random that will be interpreted as being a
paca.

This took a while for Daniel to debug because depending on how you boot
r13 contains a different junk value. That junk value may not point to
memory at all, or if it does the memory it points to may or may not send
you down the wrong path, depending on which exact bit you're looking at
in some random location.

So this is really not about kcov from my POV, that's just how we
discovered it.

cheers
