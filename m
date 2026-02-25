Return-Path: <linuxppc-dev+bounces-17170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFeIDeHEnmkuXQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 10:46:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73F1953C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 10:46:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLV8Y5PFMz3dh2;
	Wed, 25 Feb 2026 20:46:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772012765;
	cv=none; b=mWaKoQ1d1Kkm2GWAyOyBD7i8W8Bp7wIrkDXiq0H7vX/7gW3e/2mBC2tyTm/twTK5x5iRIZXIjz/VrER65yMam/cKd/3lp9i2oITtNigP3HgEn900sCgQaiPQOP/6+xNyAZHB1yJtv91Z4yzNnw6+bDVm0mR7387Z/wNlV2rYzPmQ1yAzHfkZXOgkm9YyFiGrkGqC5ddIe+8q3hioFOD7jgitewDUBLhC18ML/M1mWRHAIXz792Q4Dah2+KIYrFeyFqb3dESs/vltNlnDMDEdXVr87DPpdeOpiF4X2BgTSxzFxyytqirwHLs0DnnleRTxlSswz6m5FVmyrLEIW93LEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772012765; c=relaxed/relaxed;
	bh=fkP9slHVlbCXh5LwyXBVW6AXI9xb4WSqTOXIZuJpW1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mz8mKzRFrxYAEYe45EoNJc1r6ZgMs+GNojul9kgJqQjhYlo1dKRwehkKkNfROWq2t3wOwYtVbQIpBTSD23b4fBU/Lh458Z6R3AVNJIYGaKMh85iDDHVRxPhCbaOdt42Da06pHXKvxR5dXEaLKsUnPOaj9eXvxa85+qctn7ORKxo+RVcU2iGxjXzjY0GhlzkevYB9EC6S7fGje50gCK9U9rEGyTbNUAxWPV7PBL8QpJ4mams478Xoumu2RJq1fKfk0hYb1q5cxp4ZX/hUcwflMpzAcUNaCKWREgRy9UUz+LBiFaWULF2aOWb5VgC8D962sljDTFA9U1iNDWeGfo48nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pZamFFOV; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pZamFFOV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLV8X62b0z3dXj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 20:46:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B045460053;
	Wed, 25 Feb 2026 09:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0C7C116D0;
	Wed, 25 Feb 2026 09:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772012762;
	bh=e1tQggcgK40+SWAwt4lGz/ga/c6lFzPkuamY/wn1pao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pZamFFOVtclVCnwxSmXZYX1KReIgG+KclKS2BhZcJLh6yJflCG6+ZblLIShf9DeXr
	 jJ1ajAkdlDa980REQ117y+bYIjXNVjZmXuDyolDsRb0805WtnX3L/On20paXjcAcYz
	 741K6MH2SqCjbQMMTs7VdXOzHtLEQFiju2CNiYJODgGzWyhGF3yvHpteL5lpkx26ks
	 02jwVU+9VlPzbgEgKIFcZBlVZNgPhF7CT2C/7c5pZdNke9CkU7RtqEhBORqB0+3RCy
	 6IR/YL1IdGjkXSWylFpx350dgrqHvqc6RO0NvWy1cSK911YYkVKJotelztdnihCryq
	 ViYH5BMFaP0oQ==
Message-ID: <55720b5b-f643-4e67-8841-d81a9e712faf@kernel.org>
Date: Wed, 25 Feb 2026 10:45:53 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] powerpc/time: Prepare to stop elapsing in
 dynticks-idle
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Ben Segall <bsegall@google.com>, Boqun Feng <boqun.feng@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Juri Lelli <juri.lelli@redhat.com>, Kieran Bingham <kbingham@kernel.org>,
 Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, "Paul E . McKenney"
 <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>,
 Valentin Schneider <vschneid@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Xin Zhao <jackzxcui1989@163.com>,
 linux-pm@vger.kernel.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260206142245.58987-1-frederic@kernel.org>
 <20260206142245.58987-5-frederic@kernel.org>
 <9413517d-963b-4e6d-b11b-b440acd7cb5a@linux.ibm.com>
 <9ab1e7d7-57ee-49f9-963c-3a1b96dda684@kernel.org>
 <120884b0-0b09-43a9-b0f6-7dc2affe1ac0@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <120884b0-0b09-43a9-b0f6-7dc2affe1ac0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17170-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:frederic@kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.980];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4E73F1953C9
X-Rspamd-Action: no action

Hi Hegde,

Le 25/02/2026 à 08:46, Shrikanth Hegde a écrit :
> Hi Christophe,
> 
> On 2/24/26 9:11 PM, Christophe Leroy (CS GROUP) wrote:
>> Hi Hegde,
>>
>> Le 19/02/2026 à 19:30, Shrikanth Hegde a écrit :
>>>
>>>
>>> On 2/6/26 7:52 PM, Frederic Weisbecker wrote:
>>>> Currently the tick subsystem stores the idle cputime accounting in
>>>> private fields, allowing cohabitation with architecture idle vtime
>>>> accounting. The former is fetched on online CPUs, the latter on offline
>>>> CPUs.
>>>>
>>>> For consolidation purpose, architecture vtime accounting will continue
>>>> to account the cputime but will make a break when the idle tick is
>>>> stopped. The dyntick cputime accounting will then be relayed by the 
>>>> tick
>>>> subsystem so that the idle cputime is still seen advancing coherently
>>>> even when the tick isn't there to flush the idle vtime.
>>>>
>>>> Prepare for that and introduce three new APIs which will be used in
>>>> subsequent patches:
>>>>
>>>> _ vtime_dynticks_start() is deemed to be called when idle enters in
>>>>    dyntick mode. The idle cputime that elapsed so far is accumulated.
>>>>
>>>> - vtime_dynticks_stop() is deemed to be called when idle exits from
>>>>    dyntick mode. The vtime entry clocks are fast-forward to current 
>>>> time
>>>>    so that idle accounting restarts elapsing from now.
>>>>
>>>> - vtime_reset() is deemed to be called from dynticks idle IRQ entry to
>>>>    fast-forward the clock to current time so that the IRQ time is still
>>>>    accounted by vtime while nohz cputime is paused.
>>>>
>>>> Also accumulated vtime won't be flushed from dyntick-idle ticks to 
>>>> avoid
>>>> accounting twice the idle cputime, along with nohz accounting.
>>>>
>>>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>>>
>>> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>>
>>>> ---
>>>>   arch/powerpc/kernel/time.c | 41 ++++++++++++++++++++++++++++++++++ 
>>>> ++++
>>>>   include/linux/vtime.h      |  6 ++++++
>>>>   2 files changed, 47 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>>>> index 4bbeb8644d3d..18506740f4a4 100644
>>>> --- a/arch/powerpc/kernel/time.c
>>>> +++ b/arch/powerpc/kernel/time.c
>>>> @@ -376,6 +376,47 @@ void vtime_task_switch(struct task_struct *prev)
>>>>           acct->starttime = acct0->starttime;
>>>>       }
>>>>   }
>>>> +
>>>> +#ifdef CONFIG_NO_HZ_COMMON
>>>> +/**
>>>> + * vtime_reset - Fast forward vtime entry clocks
>>>> + *
>>>> + * Called from dynticks idle IRQ entry to fast-forward the clocks 
>>>> to current time
>>>> + * so that the IRQ time is still accounted by vtime while nohz 
>>>> cputime is paused.
>>>> + */
>>>> +void vtime_reset(void)
>>>> +{
>>>> +    struct cpu_accounting_data *acct = get_accounting(current);
>>>> +
>>>> +    acct->starttime = mftb();
>>>
>>> I figured out why those huge values happen.
>>>
>>> This happens because mftb is from when the system is booted.
>>> I was doing kexec to start the new kernel and mftb wasn't getting
>>> reset.
>>>
>>> I thought about this. This is concern for pseries too, where LPAR's
>>> restart but system won't restart and mftb will continue to run 
>>> instead of
>>> reset.
>>>
>>> I think we should be using sched_clock instead of mftb here.
>>> Though we need it a few more places and some cosmetic changes around it.
>>>
>>> Note: Some values being huge exists without series for few CPUs, with 
>>> series it
>>> shows up in most of the CPUs.
>>>
>>> So I am planning send out fix below fix separately keeping your
>>> series as dependency.
>>>
>>> ---
>>>   arch/powerpc/include/asm/accounting.h |  4 ++--
>>>   arch/powerpc/include/asm/cputime.h    | 14 +++++++-------
>>>   arch/powerpc/kernel/time.c            | 22 +++++++++++-----------
>>>   3 files changed, 20 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/accounting.h b/arch/powerpc/ 
>>> include/asm/accounting.h
>>> index 6d79c31700e2..50f120646e6d 100644
>>> --- a/arch/powerpc/include/asm/accounting.h
>>> +++ b/arch/powerpc/include/asm/accounting.h
>>> @@ -21,8 +21,8 @@ struct cpu_accounting_data {
>>>       unsigned long steal_time;
>>>       unsigned long idle_time;
>>>       /* Internal counters */
>>> -    unsigned long starttime;    /* TB value snapshot */
>>> -    unsigned long starttime_user;    /* TB value on exit to usermode */
>>> +    unsigned long starttime;    /* Time value snapshot */
>>> +    unsigned long starttime_user;    /* Time value on exit to 
>>> usermode */
>>>   #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
>>>       unsigned long startspurr;    /* SPURR value snapshot */
>>>       unsigned long utime_sspurr;    /* ->user_time when ->startspurr 
>>> set */
>>> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/ 
>>> include/ asm/cputime.h
>>> index aff858ca99c0..eb6b629b113f 100644
>>> --- a/arch/powerpc/include/asm/cputime.h
>>> +++ b/arch/powerpc/include/asm/cputime.h
>>> @@ -20,9 +20,9 @@
>>>   #include <asm/time.h>
>>>   #include <asm/param.h>
>>>   #include <asm/firmware.h>
>>> +#include <linux/sched/clock.h>
>>>
>>>   #ifdef __KERNEL__
>>> -#define cputime_to_nsecs(cputime) tb_to_ns(cputime)
>>>
>>>   /*
>>>    * PPC64 uses PACA which is task independent for storing accounting 
>>> data while
>>> @@ -44,20 +44,20 @@
>>>    */
>>>   static notrace inline void account_cpu_user_entry(void)
>>>   {
>>> -    unsigned long tb = mftb();
>>> +    unsigned long now = sched_clock();
>>
>> Now way !
>>
>> By doing that you'll kill performance for no reason. All we need when 
>> accounting time spent in kernel or in user is the difference between 
>> time at entry and time at exit, no mater what the time was at boot time.
>>
> 
> No. With this patch there will not be any performance difference.
> All it does is, instead of using mftb uses sched_clock at those places.
> 
> 
> In arch/powerpc/kernel/time.c we have sched_clock().
> notrace unsigned long long sched_clock(void)
> {
>          return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << 
> tb_to_ns_shift;
> }
> 
> It does the same mftb call, and accounts only the time after boot, which is
> what /proc/stat should do as well.
> 
> "
> the amount of time, measured in units of USER_HZ
> (1/100ths of a second on most architectures
> 
> user   (1) Time spent in user mode.
> 
> idle   (4) Time spent in the idle task.  This value
>         should be USER_HZ times the second entry in
>         the /proc/uptime pseudo-file.
> "
> /proc/uptime is based on sched_clock, so i infer /proc/stat also should 
> show
> values w.r.t to boot of the OS.
> 
> 
>> Also sched_clock() returns nanoseconds which implies calculation from 
>> timebase. This is pointless CPU consumption. The current 
>> implementation calculates nanoseconds at task switch when calling 
>> vtime_flush().Your change will now do it at every kernel entry and 
>> kernel exit by calling sched_clock().
> 
> This change doesn't add any additional paths. Even without patches, mftb 
> would have
> been called in every kernel entry/exit.  See mftb usage 
> account_cpu_user_exit/enter
> 
> Now instead of mftb sched_clock is used, that's all. No additional 
> entry/exit points.
> And previously when accounting we would have done cputime_to_nsecs, now 
> that conversion
> is done automatically in sched_clock. So overall computation-wise it 
> should be same.
> 
> What i am missing to see it here?

Ok, lets try to explain in more details:

While a process is running, it will enter and leave the kernel multiple 
times, without task switch. For instance for system calls or for interrupts.

At every kernel entry and exit, account_cpu_user_entry() and 
account_cpu_user_exit() are called. That's a very hot path.

I have added the following functions to see what the code looks like:

+
+void my_account_cpu_user_entry(void);
+void my_account_cpu_user_entry(void)
+{
+       account_cpu_user_entry();
+}
+
+void my_account_cpu_user_exit(void);
+void my_account_cpu_user_exit(void)
+{
+       account_cpu_user_exit();
+}

What we have today is very optimised:

00000148 <my_account_cpu_user_entry>:
  148:	7d 0c 42 e6 	mftb    r8
  14c:	80 e2 00 08 	lwz     r7,8(r2)
  150:	81 22 00 28 	lwz     r9,40(r2)
  154:	91 02 00 24 	stw     r8,36(r2)
  158:	7d 29 38 50 	subf    r9,r9,r7
  15c:	7d 29 42 14 	add     r9,r9,r8
  160:	91 22 00 08 	stw     r9,8(r2)
  164:	4e 80 00 20 	blr

00000168 <my_account_cpu_user_exit>:
  168:	7d 0c 42 e6 	mftb    r8
  16c:	80 e2 00 0c 	lwz     r7,12(r2)
  170:	81 22 00 24 	lwz     r9,36(r2)
  174:	91 02 00 28 	stw     r8,40(r2)
  178:	7d 29 38 50 	subf    r9,r9,r7
  17c:	7d 29 42 14 	add     r9,r9,r8
  180:	91 22 00 0c 	stw     r9,12(r2)
  184:	4e 80 00 20 	blr



With your change we now get a call to sched_clock() instead of a simple 
mftb,

00000154 <my_account_cpu_user_entry>:
  154:	94 21 ff f0 	stwu    r1,-16(r1)
  158:	7c 08 02 a6 	mflr    r0
  15c:	90 01 00 14 	stw     r0,20(r1)
  160:	48 00 00 01 	bl      160 <my_account_cpu_user_entry+0xc>
			160: R_PPC_REL24	sched_clock
  164:	81 02 00 08 	lwz     r8,8(r2)
  168:	81 22 00 28 	lwz     r9,40(r2)
  16c:	90 82 00 24 	stw     r4,36(r2)
  170:	7d 29 40 50 	subf    r9,r9,r8
  174:	7d 29 22 14 	add     r9,r9,r4
  178:	91 22 00 08 	stw     r9,8(r2)
  17c:	80 01 00 14 	lwz     r0,20(r1)
  180:	38 21 00 10 	addi    r1,r1,16
  184:	7c 08 03 a6 	mtlr    r0
  188:	4e 80 00 20 	blr

0000018c <my_account_cpu_user_exit>:
  18c:	94 21 ff f0 	stwu    r1,-16(r1)
  190:	7c 08 02 a6 	mflr    r0
  194:	90 01 00 14 	stw     r0,20(r1)
  198:	48 00 00 01 	bl      198 <my_account_cpu_user_exit+0xc>
			198: R_PPC_REL24	sched_clock
  19c:	81 02 00 0c 	lwz     r8,12(r2)
  1a0:	81 22 00 24 	lwz     r9,36(r2)
  1a4:	90 82 00 28 	stw     r4,40(r2)
  1a8:	7d 29 40 50 	subf    r9,r9,r8
  1ac:	7d 29 22 14 	add     r9,r9,r4
  1b0:	91 22 00 0c 	stw     r9,12(r2)
  1b4:	80 01 00 14 	lwz     r0,20(r1)
  1b8:	38 21 00 10 	addi    r1,r1,16
  1bc:	7c 08 03 a6 	mtlr    r0
  1c0:	4e 80 00 20 	blr

And sched_clock() is heavy, first it has the sequence mftbu/mftb/mftbu, 
and then it does awful lot of calculations including many multiply:

000004d8 <sched_clock>:
  4d8:	7d 2d 42 e6 	mftbu   r9
  4dc:	7d 0c 42 e6 	mftb    r8
  4e0:	7d 4d 42 e6 	mftbu   r10
  4e4:	7c 09 50 40 	cmplw   r9,r10
  4e8:	40 82 ff f0 	bne     4d8 <sched_clock>
  4ec:	3d 40 00 00 	lis     r10,0
			4ee: R_PPC_ADDR16_HA	.data..ro_after_init
  4f0:	38 ca 00 00 	addi    r6,r10,0
			4f2: R_PPC_ADDR16_LO	.data..ro_after_init
  4f4:	3c e0 00 00 	lis     r7,0
			4f6: R_PPC_ADDR16_HA	.data..read_mostly
  4f8:	38 87 00 00 	addi    r4,r7,0
			4fa: R_PPC_ADDR16_LO	.data..read_mostly
  4fc:	80 66 00 04 	lwz     r3,4(r6)
  500:	80 e7 00 00 	lwz     r7,0(r7)
			502: R_PPC_ADDR16_LO	.data..read_mostly
  504:	80 c4 00 04 	lwz     r6,4(r4)
  508:	81 4a 00 00 	lwz     r10,0(r10)
			50a: R_PPC_ADDR16_LO	.data..ro_after_init
  50c:	7c 63 40 10 	subfc   r3,r3,r8
  510:	7d 0a 49 10 	subfe   r8,r10,r9
  514:	7d 27 19 d6 	mullw   r9,r7,r3
  518:	7d 43 30 16 	mulhwu  r10,r3,r6
  51c:	7c 08 31 d6 	mullw   r0,r8,r6
  520:	7d 4a 48 14 	addc    r10,r10,r9
  524:	7c 67 18 16 	mulhwu  r3,r7,r3
  528:	39 20 00 00 	li      r9,0
  52c:	7c c8 30 16 	mulhwu  r6,r8,r6
  530:	7c a9 49 14 	adde    r5,r9,r9
  534:	7d 67 41 d6 	mullw   r11,r7,r8
  538:	7d 4a 00 14 	addc    r10,r10,r0
  53c:	7c a5 01 94 	addze   r5,r5
  540:	7c 63 30 14 	addc    r3,r3,r6
  544:	7d 29 49 14 	adde    r9,r9,r9
  548:	80 84 00 08 	lwz     r4,8(r4)
  54c:	7c 63 58 14 	addc    r3,r3,r11
  550:	7c e7 40 16 	mulhwu  r7,r7,r8
  554:	7d 29 01 94 	addze   r9,r9
  558:	7c 63 28 14 	addc    r3,r3,r5
  55c:	7d 29 39 14 	adde    r9,r9,r7
  560:	35 44 ff e0 	addic.  r10,r4,-32
  564:	41 80 00 10 	blt     574 <sched_clock+0x9c>
  568:	7c 63 50 30 	slw     r3,r3,r10
  56c:	38 80 00 00 	li      r4,0
  570:	4e 80 00 20 	blr
  574:	21 04 00 1f 	subfic  r8,r4,31
  578:	54 6a f8 7e 	srwi    r10,r3,1
  57c:	7d 29 20 30 	slw     r9,r9,r4
  580:	7d 4a 44 30 	srw     r10,r10,r8
  584:	7c 64 20 30 	slw     r4,r3,r4
  588:	7d 43 4b 78 	or      r3,r10,r9
  58c:	4e 80 00 20 	blr

I think the difference is obvious, no need of benchmarking. We shall 
refrain from calling sched_clock() at every kernel entry/exit. 
Converting from timebase to nanoseconds only need to be done in 
vtime_flush() called by vtime_task_switch() during task switch.

Hope it is more explicit now.

Christophe

