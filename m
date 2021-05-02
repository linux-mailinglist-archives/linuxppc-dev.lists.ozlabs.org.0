Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2786370BBA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 15:49:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FY6sk4zTBz302l
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 23:49:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ga5+1IFs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ga5+1IFs; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FY6sF0DpVz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 May 2021 23:49:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FY6s542HYz9sRR;
 Sun,  2 May 2021 23:48:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1619963338;
 bh=eSFDQN893VS1d4R/dc90A/omXmW2fciFt+qa1w2wZC0=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=ga5+1IFsk/5y09VHlAq7ww7+mlWAD9bEHH/HPpjkxWpUvd1GErEdrpYiv25zBOsqi
 S5lMOW5PZ179BOP2/FCXkHCkJeISZKzS6TUVcJhsowzI1hium+uPrydyXZft38bR2y
 YsdkfebQP55Ekrme6mdQCWA784G4m0ZTGZIoebk1h1S2Hos/VbYqQdhBCRQFa6zMIW
 980ZSysrPPa0lHMJy4IRcpPhKPDFnAgI5lGNyElA3lzi9EzTq7aHJcpK3jS1svTc8q
 ACTIWWPHTBTXUKD2/rTKSkZR5cnIWuuA2iLPwS9Kmh0teHiYc7EEzUOEBi81Txbhfc
 Gj/RsR5kq/V2Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/4] powerpc/pseries: Fix hcall tracing recursion in pv
 queued spinlocks
In-Reply-To: <1619832010.xbqdcxufia.astroid@bobo.none>
References: <20210423031108.1046067-1-npiggin@gmail.com>
 <20210423031108.1046067-2-npiggin@gmail.com>
 <1619529780.yjjzv9cw5m.naveen@linux.ibm.com>
 <1619832010.xbqdcxufia.astroid@bobo.none>
Date: Sun, 02 May 2021 23:48:55 +1000
Message-ID: <878s4x9rg8.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Naveen N. Rao's message of April 27, 2021 11:43 pm:
>> Nicholas Piggin wrote:
>>> The paravit queued spinlock slow path adds itself to the queue then
>>> calls pv_wait to wait for the lock to become free. This is implemented
>>> by calling H_CONFER to donate cycles.
>>> 
>>> When hcall tracing is enabled, this H_CONFER call can lead to a spin
>>> lock being taken in the tracing code, which will result in the lock to
>>> be taken again, which will also go to the slow path because it queues
>>> behind itself and so won't ever make progress.
>>> 
>>> An example trace of a deadlock:
>>> 
>>>   __pv_queued_spin_lock_slowpath
>>>   trace_clock_global
>>>   ring_buffer_lock_reserve
>>>   trace_event_buffer_lock_reserve
>>>   trace_event_buffer_reserve
>>>   trace_event_raw_event_hcall_exit
>>>   __trace_hcall_exit
>>>   plpar_hcall_norets_trace
>>>   __pv_queued_spin_lock_slowpath
>>>   trace_clock_global
>>>   ring_buffer_lock_reserve
>>>   trace_event_buffer_lock_reserve
>>>   trace_event_buffer_reserve
>>>   trace_event_raw_event_rcu_dyntick
>>>   rcu_irq_exit
>>>   irq_exit
>>>   __do_irq
>>>   call_do_irq
>>>   do_IRQ
>>>   hardware_interrupt_common_virt
>>> 
>>> Fix this by introducing plpar_hcall_norets_notrace(), and using that to
>>> make SPLPAR virtual processor dispatching hcalls by the paravirt
>>> spinlock code.
>>> 
>>> Fixes: 20c0e8269e9d ("powerpc/pseries: Implement paravirt qspinlocks for SPLPAR")
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>  arch/powerpc/include/asm/hvcall.h       |  3 +++
>>>  arch/powerpc/include/asm/paravirt.h     | 22 +++++++++++++++++++---
>>>  arch/powerpc/platforms/pseries/hvCall.S | 10 ++++++++++
>>>  arch/powerpc/platforms/pseries/lpar.c   |  4 ++--
>>>  4 files changed, 34 insertions(+), 5 deletions(-)
>> 
>> Thanks for the fix! Some very minor nits below, but none the less:
>> Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> 
>>> 
>>> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
>>> index ed6086d57b22..0c92b01a3c3c 100644
>>> --- a/arch/powerpc/include/asm/hvcall.h
>>> +++ b/arch/powerpc/include/asm/hvcall.h
>>> @@ -446,6 +446,9 @@
>>>   */
>>>  long plpar_hcall_norets(unsigned long opcode, ...);
>>> 
>>> +/* Variant which does not do hcall tracing */
>>> +long plpar_hcall_norets_notrace(unsigned long opcode, ...);
>>> +
>>>  /**
>>>   * plpar_hcall: - Make a pseries hypervisor call
>>>   * @opcode: The hypervisor call to make.
>>> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
>>> index 5d1726bb28e7..3c13c2ec70a9 100644
>>> --- a/arch/powerpc/include/asm/paravirt.h
>>> +++ b/arch/powerpc/include/asm/paravirt.h
>>> @@ -30,17 +30,33 @@ static inline u32 yield_count_of(int cpu)
>>> 
>>>  static inline void yield_to_preempted(int cpu, u32 yield_count)
>>>  {
>> 
>> It looks like yield_to_preempted() is only used by simple spin locks 
>> today. I wonder if it makes more sense to put the below comment in 
>> yield_to_any() which is used by the qspinlock code.
>
> Yeah, I just put it above the functions entirely because it refers to 
> all of them.
>
>> 
>>> -	plpar_hcall_norets(H_CONFER, get_hard_smp_processor_id(cpu), yield_count);
>>> +	/*
>>> +	 * Spinlock code yields and prods, so don't trace the hcalls because
>>> +	 * tracing code takes spinlocks which could recurse.
>>> +	 *
>>> +	 * These calls are made while the lock is not held, the lock slowpath
>>> +	 * yields if it can not acquire the lock, and unlock slow path might
>>> +	 * prod if a waiter has yielded). So this did not seem to be a problem
>>> +	 * for simple spin locks because technically it didn't recuse on the
>> 							       ^^^^^^
>> 							       recurse
>> 
>>> +	 * lock. However the queued spin lock contended path is more strictly
>>> +	 * ordered: the H_CONFER hcall is made after the task has queued itself
>>> +	 * on the lock, so then recursing on the lock will queue up behind that
>>> +	 * (or worse: queued spinlocks uses tricks that assume a context never
>>> +	 * waits on more than one spinlock, so that may cause random
>>> +	 * corruption).
>>> +	 */
>>> +	plpar_hcall_norets_notrace(H_CONFER,
>>> +				   get_hard_smp_processor_id(cpu), yield_count);
>> 
>> This can all be on a single line.
>
> Should it though? Linux in general allegedly changed to 100 column 
> lines for checkpatch, but it seems to still be frowned upon to go
> beyond 80 deliberately. What about arch/powerpc?

Splitting it provides zero benefit to code readability IMO. And it would
be only 89 by my count, which is not grossly long.

cheers
