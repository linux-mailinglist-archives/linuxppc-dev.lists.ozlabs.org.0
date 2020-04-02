Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB45719C023
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 13:26:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tLPQ5JHXzDqFG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 22:26:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tLL24lW4zDq5f
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 22:23:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WBA8Q4J9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48tLKz3MYhz9sQt;
 Thu,  2 Apr 2020 22:23:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585826634;
 bh=pbSAXegT+8Z7l+avNPLwehmYnEsWWDO1v7MhVYfnlXQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WBA8Q4J9sICs9xdSJobj+NAfU8iWBq+SIuyZsPoatm6SJyynjd/gDpSp8Q2IRLDAj
 qZ+iNATA+K/H1WTtmn68sbjnFno/g4Beb5PLSEi6h3QlGXkW4iCmQUeCd06yzlsh9N
 rY3ckrUC4nYLEOlJn0d4JZnmg7grBQmkzFyOPX+Rk0xFHFogaa/vsPtpcTkLYVpMag
 CYvbnUYFJF0159LbLkXs5vfYv1NvrRX3oW9uSbWq0R2Goc3QCmQnGgowk5kgCnPb85
 /WRTeLt/QnmTptocrCOg0qQKSatI6wCxQ5+7e7dI2hu95e/8NQ0I8dCz/tAwQOX063
 +CCfaQAvD9tjg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Qian Cai <cai@lca.pw>, peterz@infradead.org, mingo@redhat.com
Subject: Re: [PATCH v2] sched/core: fix illegal RCU from offline CPUs
In-Reply-To: <20200401214033.8448-1-cai@lca.pw>
References: <20200401214033.8448-1-cai@lca.pw>
Date: Thu, 02 Apr 2020 22:24:00 +1100
Message-ID: <87369mt9kf.fsf@mpe.ellerman.id.au>
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
Cc: juri.lelli@redhat.com, James.Bottomley@HansenPartnership.com,
 vincent.guittot@linaro.org, linux-parisc@vger.kernel.org, paulmck@kernel.org,
 deller@gmx.de, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com,
 linux-mm@kvack.org, Qian Cai <cai@lca.pw>, mgorman@suse.de, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qian Cai <cai@lca.pw> writes:
> From: Peter Zijlstra <peterz@infradead.org>
>
> In the CPU-offline process, it calls mmdrop() after idle entry and the
> subsequent call to cpuhp_report_idle_dead(). Once execution passes the
> call to rcu_report_dead(), RCU is ignoring the CPU, which results in
> lockdep complaining when mmdrop() uses RCU from either memcg or
> debugobjects below.
>
> Fix it by cleaning up the active_mm state from BP instead. Every arch
> which has CONFIG_HOTPLUG_CPU should have already called idle_task_exit()
> from AP. The only exception is parisc because it switches them to
> &init_mm unconditionally (see smp_boot_one_cpu() and smp_cpu_init()),
> but the patch will still work there because it calls mmgrab(&init_mm) in
> smp_cpu_init() and then should call mmdrop(&init_mm) in finish_cpu().

Thanks for debugging this. How did you hit it in the first place?

A link to the original thread would have helped me:

  https://lore.kernel.org/lkml/20200113190331.12788-1-cai@lca.pw/

> WARNING: suspicious RCU usage
> -----------------------------
> kernel/workqueue.c:710 RCU or wq_pool_mutex should be held!
>
> other info that might help us debug this:
>
> RCU used illegally from offline CPU!
> Call Trace:
>  dump_stack+0xf4/0x164 (unreliable)
>  lockdep_rcu_suspicious+0x140/0x164
>  get_work_pool+0x110/0x150
>  __queue_work+0x1bc/0xca0
>  queue_work_on+0x114/0x120
>  css_release+0x9c/0xc0
>  percpu_ref_put_many+0x204/0x230
>  free_pcp_prepare+0x264/0x570
>  free_unref_page+0x38/0xf0
>  __mmdrop+0x21c/0x2c0
>  idle_task_exit+0x170/0x1b0
>  pnv_smp_cpu_kill_self+0x38/0x2e0
>  cpu_die+0x48/0x64
>  arch_cpu_idle_dead+0x30/0x50
>  do_idle+0x2f4/0x470
>  cpu_startup_entry+0x38/0x40
>  start_secondary+0x7a8/0xa80
>  start_secondary_resume+0x10/0x14

Do we know when this started happening? ie. can we determine a Fixes
tag?

> <Peter to sign off here>
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>  arch/powerpc/platforms/powernv/smp.c |  1 -
>  include/linux/sched/mm.h             |  2 ++
>  kernel/cpu.c                         | 18 +++++++++++++++++-
>  kernel/sched/core.c                  |  5 +++--
>  4 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
> index 13e251699346..b2ba3e95bda7 100644
> --- a/arch/powerpc/platforms/powernv/smp.c
> +++ b/arch/powerpc/platforms/powernv/smp.c
> @@ -167,7 +167,6 @@ static void pnv_smp_cpu_kill_self(void)
>  	/* Standard hot unplug procedure */
>  
>  	idle_task_exit();
> -	current->active_mm = NULL; /* for sanity */

If I'm reading it right, we'll now be running with active_mm == init_mm
in the offline loop.

I guess that's fine, I can't think of any reason it would matter, and it
seems like we were NULL'ing it out just for paranoia's sake not because
of any actual problem.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)


cheers

> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index c49257a3b510..a132d875d351 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -49,6 +49,8 @@ static inline void mmdrop(struct mm_struct *mm)
>  		__mmdrop(mm);
>  }
>  
> +void mmdrop(struct mm_struct *mm);
> +
>  /*
>   * This has to be called after a get_task_mm()/mmget_not_zero()
>   * followed by taking the mmap_sem for writing before modifying the
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 2371292f30b0..244d30544377 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -3,6 +3,7 @@
>   *
>   * This code is licenced under the GPL.
>   */
> +#include <linux/sched/mm.h>
>  #include <linux/proc_fs.h>
>  #include <linux/smp.h>
>  #include <linux/init.h>
> @@ -564,6 +565,21 @@ static int bringup_cpu(unsigned int cpu)
>  	return bringup_wait_for_ap(cpu);
>  }
>  
> +static int finish_cpu(unsigned int cpu)
> +{
> +	struct task_struct *idle = idle_thread_get(cpu);
> +	struct mm_struct *mm = idle->active_mm;
> +
> +	/*
> +	 * idle_task_exit() will have switched to &init_mm, now
> +	 * clean up any remaining active_mm state.
> +	 */
> +	if (mm != &init_mm)
> +		idle->active_mm = &init_mm;
> +	mmdrop(mm);
> +	return 0;
> +}
> +
>  /*
>   * Hotplug state machine related functions
>   */
> @@ -1549,7 +1565,7 @@ static struct cpuhp_step cpuhp_hp_states[] = {
>  	[CPUHP_BRINGUP_CPU] = {
>  		.name			= "cpu:bringup",
>  		.startup.single		= bringup_cpu,
> -		.teardown.single	= NULL,
> +		.teardown.single	= finish_cpu,
>  		.cant_stop		= true,
>  	},
>  	/* Final state before CPU kills itself */
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index a2694ba82874..8787958339d5 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6200,13 +6200,14 @@ void idle_task_exit(void)
>  	struct mm_struct *mm = current->active_mm;
>  
>  	BUG_ON(cpu_online(smp_processor_id()));
> +	BUG_ON(current != this_rq()->idle);
>  
>  	if (mm != &init_mm) {
>  		switch_mm(mm, &init_mm, current);
> -		current->active_mm = &init_mm;
>  		finish_arch_post_lock_switch();
>  	}
> -	mmdrop(mm);
> +
> +	/* finish_cpu(), as ran on the BP, will clean up the active_mm state */
>  }
>  
>  /*
> -- 
> 2.21.0 (Apple Git-122.2)
