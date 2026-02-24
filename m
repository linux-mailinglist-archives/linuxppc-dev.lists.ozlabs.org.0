Return-Path: <linuxppc-dev+bounces-17114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OG7Lr/GnWkkSAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 16:41:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AD41892FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 16:41:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL25R5JHqz3cQj;
	Wed, 25 Feb 2026 02:41:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771947707;
	cv=none; b=LOzDbGJAjpkJ89IwzcUUIHqgj1Tz9B53/J204y4sABCkkYXxFRWnq/zuSazl43k8Tc3ywAITq+vN6ZJ0ZvA182vAFhCZQLthw6kg8q7DxhS5FvNLQZqx/L2ClpnLacsM/LUNd+9uh7glieYWrndlUUP1G7kknpycLnAiIZmJE2+IdrnRuy5C2a8Xd27bcprSw5tpoQGaG2bFBUxbouHCIdJOCRqwzW9QY/2LtEVx7Q558K1rO3nT5KI4zNENnASsTw+IbE1VxmEi8Qkbyi9Ob+g+muf2cxRXEhwFcemWsfJhwjJ+EEmkqV7o0HgUcmiIes68RHcdvy2DNdWLs6+M2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771947707; c=relaxed/relaxed;
	bh=R1ZMv4njnpISh5Ph/i5b4MUV8Q31alXnt/bBHvqiaOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzdtNOVDJRhAGzwAzOOvZ55uzAK8hP6I3PzQO0m9pfxlReRPPLzOFa/VTQWw/4KXBOQpyaU2fpfSu114h+fQ8Mx/y8xOVOk3zpsEq+qmnttNxf2i5jA2AxPf+f8t9oUZfoh1x3heMdlg4gmxQmtouPaTAxlJ6RM6k93alzVa9euGeU/qxO6OhMckWAPGKEQ5R4DtnADhRzvWqGqT1o9rZ4XShxYw86o1qw7ZSuygzVusYrN/3y6mE5W+YLWqq2R5zzRgNOnDn6cFlisdas7tIyE+PCPl7VlGiG2WY2G7lddKf2q8hBUwrU9DqlOQ9sF3Mto5AHZeidgrcDJfIeFtVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YT1nNitk; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YT1nNitk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL25Q4lrjz3cPw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 02:41:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71AF244578;
	Tue, 24 Feb 2026 15:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7D2C116D0;
	Tue, 24 Feb 2026 15:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771947704;
	bh=H208v0Z5rUJBYXeJ3UAVS2bjkma/8IcplUAsueh/KvI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YT1nNitkIs1wxq/nUgyyR3B4XFXAgL+IyMDXqYQ6Z3rT+glSBDtF97WKCv29iB0y2
	 Xk7zMHtfwitGW9QzX0X5SiRnx43ho7uBE6Y7EfcPijcre74Rn7Q1eJZ/3cksgvOVFt
	 yA8J3IAPQ9uyqSIzalsAQ5Ml9PK76/6xa5jD5pNJF3vt4Ru6sa9Uz0O3ecqrxWDtH6
	 yBktcj8R6JncfgY/Elh5yhRZsZlKlNWsvc+0YItIvNUPWn0IIfJRfYStlO47PkxLlx
	 KwIFYKFOxYec0jBXC6ThrHncVLOvN+7rwjn8C9dYv/y0w6MaxC68NS1uTGT2zTIuJm
	 1lm+AOGPIghbw==
Message-ID: <9ab1e7d7-57ee-49f9-963c-3a1b96dda684@kernel.org>
Date: Tue, 24 Feb 2026 16:41:32 +0100
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
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <9413517d-963b-4e6d-b11b-b440acd7cb5a@linux.ibm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17114-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.972];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C7AD41892FF
X-Rspamd-Action: no action

Hi Hegde,

Le 19/02/2026 à 19:30, Shrikanth Hegde a écrit :
> 
> 
> On 2/6/26 7:52 PM, Frederic Weisbecker wrote:
>> Currently the tick subsystem stores the idle cputime accounting in
>> private fields, allowing cohabitation with architecture idle vtime
>> accounting. The former is fetched on online CPUs, the latter on offline
>> CPUs.
>>
>> For consolidation purpose, architecture vtime accounting will continue
>> to account the cputime but will make a break when the idle tick is
>> stopped. The dyntick cputime accounting will then be relayed by the tick
>> subsystem so that the idle cputime is still seen advancing coherently
>> even when the tick isn't there to flush the idle vtime.
>>
>> Prepare for that and introduce three new APIs which will be used in
>> subsequent patches:
>>
>> _ vtime_dynticks_start() is deemed to be called when idle enters in
>>    dyntick mode. The idle cputime that elapsed so far is accumulated.
>>
>> - vtime_dynticks_stop() is deemed to be called when idle exits from
>>    dyntick mode. The vtime entry clocks are fast-forward to current time
>>    so that idle accounting restarts elapsing from now.
>>
>> - vtime_reset() is deemed to be called from dynticks idle IRQ entry to
>>    fast-forward the clock to current time so that the IRQ time is still
>>    accounted by vtime while nohz cputime is paused.
>>
>> Also accumulated vtime won't be flushed from dyntick-idle ticks to avoid
>> accounting twice the idle cputime, along with nohz accounting.
>>
>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> 
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> 
>> ---
>>   arch/powerpc/kernel/time.c | 41 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/vtime.h      |  6 ++++++
>>   2 files changed, 47 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>> index 4bbeb8644d3d..18506740f4a4 100644
>> --- a/arch/powerpc/kernel/time.c
>> +++ b/arch/powerpc/kernel/time.c
>> @@ -376,6 +376,47 @@ void vtime_task_switch(struct task_struct *prev)
>>           acct->starttime = acct0->starttime;
>>       }
>>   }
>> +
>> +#ifdef CONFIG_NO_HZ_COMMON
>> +/**
>> + * vtime_reset - Fast forward vtime entry clocks
>> + *
>> + * Called from dynticks idle IRQ entry to fast-forward the clocks to 
>> current time
>> + * so that the IRQ time is still accounted by vtime while nohz 
>> cputime is paused.
>> + */
>> +void vtime_reset(void)
>> +{
>> +    struct cpu_accounting_data *acct = get_accounting(current);
>> +
>> +    acct->starttime = mftb();
> 
> I figured out why those huge values happen.
> 
> This happens because mftb is from when the system is booted.
> I was doing kexec to start the new kernel and mftb wasn't getting
> reset.
> 
> I thought about this. This is concern for pseries too, where LPAR's
> restart but system won't restart and mftb will continue to run instead of
> reset.
> 
> I think we should be using sched_clock instead of mftb here.
> Though we need it a few more places and some cosmetic changes around it.
> 
> Note: Some values being huge exists without series for few CPUs, with 
> series it
> shows up in most of the CPUs.
> 
> So I am planning send out fix below fix separately keeping your
> series as dependency.
> 
> ---
>   arch/powerpc/include/asm/accounting.h |  4 ++--
>   arch/powerpc/include/asm/cputime.h    | 14 +++++++-------
>   arch/powerpc/kernel/time.c            | 22 +++++++++++-----------
>   3 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/accounting.h b/arch/powerpc/ 
> include/asm/accounting.h
> index 6d79c31700e2..50f120646e6d 100644
> --- a/arch/powerpc/include/asm/accounting.h
> +++ b/arch/powerpc/include/asm/accounting.h
> @@ -21,8 +21,8 @@ struct cpu_accounting_data {
>       unsigned long steal_time;
>       unsigned long idle_time;
>       /* Internal counters */
> -    unsigned long starttime;    /* TB value snapshot */
> -    unsigned long starttime_user;    /* TB value on exit to usermode */
> +    unsigned long starttime;    /* Time value snapshot */
> +    unsigned long starttime_user;    /* Time value on exit to usermode */
>   #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
>       unsigned long startspurr;    /* SPURR value snapshot */
>       unsigned long utime_sspurr;    /* ->user_time when ->startspurr 
> set */
> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/ 
> asm/cputime.h
> index aff858ca99c0..eb6b629b113f 100644
> --- a/arch/powerpc/include/asm/cputime.h
> +++ b/arch/powerpc/include/asm/cputime.h
> @@ -20,9 +20,9 @@
>   #include <asm/time.h>
>   #include <asm/param.h>
>   #include <asm/firmware.h>
> +#include <linux/sched/clock.h>
> 
>   #ifdef __KERNEL__
> -#define cputime_to_nsecs(cputime) tb_to_ns(cputime)
> 
>   /*
>    * PPC64 uses PACA which is task independent for storing accounting 
> data while
> @@ -44,20 +44,20 @@
>    */
>   static notrace inline void account_cpu_user_entry(void)
>   {
> -    unsigned long tb = mftb();
> +    unsigned long now = sched_clock();

Now way !

By doing that you'll kill performance for no reason. All we need when 
accounting time spent in kernel or in user is the difference between 
time at entry and time at exit, no mater what the time was at boot time.

Also sched_clock() returns nanoseconds which implies calculation from 
timebase. This is pointless CPU consumption. The current implementation 
calculates nanoseconds at task switch when calling vtime_flush().Your 
change will now do it at every kernel entry and kernel exit by calling 
sched_clock().

Another point is that sched_clock() returns a long long not a long.

And also sched_clock() uses get_tb() which does mftb and mftbu. Which is 
pointless for calculating time deltas unless your application spends 
hours without being re-scheduled.


>       struct cpu_accounting_data *acct = raw_get_accounting(current);
> 
> -    acct->utime += (tb - acct->starttime_user);
> -    acct->starttime = tb;
> +    acct->utime += (now - acct->starttime_user);
> +    acct->starttime = now;
>   }
> 
>   static notrace inline void account_cpu_user_exit(void)
>   {
> -    unsigned long tb = mftb();
> +    unsigned long now = sched_clock();
>       struct cpu_accounting_data *acct = raw_get_accounting(current);
> 
> -    acct->stime += (tb - acct->starttime);
> -    acct->starttime_user = tb;
> +    acct->stime += (now - acct->starttime);
> +    acct->starttime_user = now;
>   }
> 
>   static notrace inline void account_stolen_time(void)
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 18506740f4a4..fb67cdae3bcb 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -215,7 +215,7 @@ static unsigned long vtime_delta(struct 
> cpu_accounting_data *acct,
> 
>       WARN_ON_ONCE(!irqs_disabled());
> 
> -    now = mftb();
> +    now = sched_clock();
>       stime = now - acct->starttime;
>       acct->starttime = now;
> 
> @@ -299,9 +299,9 @@ static void vtime_flush_scaled(struct task_struct *tsk,
>   {
>   #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
>       if (acct->utime_scaled)
> -        tsk->utimescaled += cputime_to_nsecs(acct->utime_scaled);
> +        tsk->utimescaled += acct->utime_scaled;
>       if (acct->stime_scaled)
> -        tsk->stimescaled += cputime_to_nsecs(acct->stime_scaled);
> +        tsk->stimescaled += acct->stime_scaled;
> 
>       acct->utime_scaled = 0;
>       acct->utime_sspurr = 0;
> @@ -321,28 +321,28 @@ void vtime_flush(struct task_struct *tsk)
>       struct cpu_accounting_data *acct = get_accounting(tsk);
> 
>       if (acct->utime)
> -        account_user_time(tsk, cputime_to_nsecs(acct->utime));
> +        account_user_time(tsk, acct->utime);
> 
>       if (acct->gtime)
> -        account_guest_time(tsk, cputime_to_nsecs(acct->gtime));
> +        account_guest_time(tsk, acct->gtime);
> 
>       if (IS_ENABLED(CONFIG_PPC_SPLPAR) && acct->steal_time) {
> -        account_steal_time(cputime_to_nsecs(acct->steal_time));
> +        account_steal_time(acct->steal_time);
>           acct->steal_time = 0;
>       }
> 
>       if (acct->idle_time)
> -        account_idle_time(cputime_to_nsecs(acct->idle_time));
> +        account_idle_time(acct->idle_time);
> 
>       if (acct->stime)
> -        account_system_index_time(tsk, cputime_to_nsecs(acct->stime),
> +        account_system_index_time(tsk, acct->stime,
>                         CPUTIME_SYSTEM);
> 
>       if (acct->hardirq_time)
> -        account_system_index_time(tsk, cputime_to_nsecs(acct- 
>  >hardirq_time),
> +        account_system_index_time(tsk, acct->hardirq_time,
>                         CPUTIME_IRQ);
>       if (acct->softirq_time)
> -        account_system_index_time(tsk, cputime_to_nsecs(acct- 
>  >softirq_time),
> +        account_system_index_time(tsk, acct->softirq_time,
>                         CPUTIME_SOFTIRQ);
> 
>       vtime_flush_scaled(tsk, acct);
> @@ -388,7 +388,7 @@ void vtime_reset(void)
>   {
>       struct cpu_accounting_data *acct = get_accounting(current);
> 
> -    acct->starttime = mftb();
> +    acct->starttime = sched_clock();
>   #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
>       acct->startspurr = read_spurr(acct->starttime);
>   #endif


