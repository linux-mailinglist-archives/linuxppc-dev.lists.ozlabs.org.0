Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F496D7C2F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 14:06:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps3Hq3gb9z3f6k
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 22:05:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EVjCBfCz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EVjCBfCz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps3Gx2lGbz3bW0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 22:05:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8297A6275F;
	Wed,  5 Apr 2023 12:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBE6C433EF;
	Wed,  5 Apr 2023 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680696309;
	bh=2dntsBKAfiYObhgH+T4tWxDkf4zhQWtEdrWOlrJ7gD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVjCBfCze0Wzbi5fN1afi7tMw81NrI7c4eojmXzztXxkChaRIF6l4TPNEK+S09JF+
	 bydvoLBPZ7Bvo5arjod13PZKu0NFqc0j+xU2q+3CCrsg+IO2Q5N4wieayneWjBZj5x
	 /9LNlr3lt3fCWKO9hYSsMsWu06zQ+oYin3+qL1YKcG9AzNX5vb8QX+UgrD9j6IWOMn
	 GKaBzCep8dVZQZJXW8lJtrPBBOMLz1RFN8cCe8l5dibbQH668C0em7A2199J/3HU/R
	 ZMVhSzCurduLvj6p/Th286mqzeapi/dnZoxWW/v8zevgxApdJHZg/QQsho1tC8ecC+
	 13Nof4D+AOIcA==
Date: Wed, 5 Apr 2023 14:05:06 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <ZC1j8ivE/kK7+Gd5@lothringen>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC1XD/sEJY+zRujE@lothringen>
 <20230405114148.GA351571@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405114148.GA351571@hirez.programming.kicks-ass.net>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 01:41:48PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 05, 2023 at 01:10:07PM +0200, Frederic Weisbecker wrote:
> > On Wed, Apr 05, 2023 at 12:44:04PM +0200, Frederic Weisbecker wrote:
> > > On Tue, Apr 04, 2023 at 04:42:24PM +0300, Yair Podemsky wrote:
> > > > +	int state = atomic_read(&ct->state);
> > > > +	/* will return true only for cpus in kernel space */
> > > > +	return state & CT_STATE_MASK == CONTEXT_KERNEL;
> > > > +}
> > > 
> > > Also note that this doesn't stricly prevent userspace from being interrupted.
> > > You may well observe the CPU in kernel but it may receive the IPI later after
> > > switching to userspace.
> > > 
> > > We could arrange for avoiding that with marking ct->state with a pending work bit
> > > to flush upon user entry/exit but that's a bit more overhead so I first need to
> > > know about your expectations here, ie: can you tolerate such an occasional
> > > interruption or not?
> > 
> > Bah, actually what can we do to prevent from that racy IPI? Not much I fear...
> 
> Yeah, so I don't think that's actually a problem. The premise is that
> *IFF* NOHZ_FULL stays in userspace, then it will never observe the IPI.
> 
> If it violates this by doing syscalls or other kernel entries; it gets
> to keep the pieces.

Ok so how about the following (only build tested)?

Two things:

1) It has the advantage to check context tracking _after_ the llist_add(), so
   it really can't be misused ordering-wise.

2) The IPI callback is always enqueued and then executed upon return
   from userland. The ordering makes sure it will either IPI or execute
   upon return to userspace.

diff --git a/include/linux/context_tracking_state.h b/include/linux/context_tracking_state.h
index 4a4d56f77180..dc4b56da1747 100644
--- a/include/linux/context_tracking_state.h
+++ b/include/linux/context_tracking_state.h
@@ -137,10 +137,23 @@ static __always_inline int ct_state(void)
 	return ret;
 }
 
+static __always_inline int ct_state_cpu(int cpu)
+{
+	struct context_tracking *ct;
+
+	if (!context_tracking_enabled())
+		return CONTEXT_DISABLED;
+
+	ct = per_cpu_ptr(&context_tracking, cpu);
+
+	return atomic_read(&ct->state) & CT_STATE_MASK;
+}
+
 #else
 static __always_inline bool context_tracking_enabled(void) { return false; }
 static __always_inline bool context_tracking_enabled_cpu(int cpu) { return false; }
 static __always_inline bool context_tracking_enabled_this_cpu(void) { return false; }
+static inline int ct_state_cpu(int cpu) { return CONTEXT_DISABLED; }
 #endif /* CONFIG_CONTEXT_TRACKING_USER */
 
 #endif
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 846add8394c4..cdc7e8a59acc 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -10,6 +10,7 @@
 #include <linux/audit.h>
 #include <linux/tick.h>
 
+#include "../kernel/sched/smp.h"
 #include "common.h"
 
 #define CREATE_TRACE_POINTS
@@ -27,6 +28,10 @@ static __always_inline void __enter_from_user_mode(struct pt_regs *regs)
 	instrumentation_begin();
 	kmsan_unpoison_entry_regs(regs);
 	trace_hardirqs_off_finish();
+
+	/* Flush delayed IPI queue on nohz_full */
+	if (context_tracking_enabled_this_cpu())
+		flush_smp_call_function_queue();
 	instrumentation_end();
 }
 
diff --git a/kernel/smp.c b/kernel/smp.c
index 06a413987a14..14b25d25ef3a 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -878,6 +878,8 @@ EXPORT_SYMBOL_GPL(smp_call_function_any);
  */
 #define SCF_WAIT	(1U << 0)
 #define SCF_RUN_LOCAL	(1U << 1)
+#define SCF_NO_USER	(1U << 2)
+
 
 static void smp_call_function_many_cond(const struct cpumask *mask,
 					smp_call_func_t func, void *info,
@@ -946,10 +948,13 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 #endif
 			cfd_seq_store(pcpu->seq_queue, this_cpu, cpu, CFD_SEQ_QUEUE);
 			if (llist_add(&csd->node.llist, &per_cpu(call_single_queue, cpu))) {
-				__cpumask_set_cpu(cpu, cfd->cpumask_ipi);
-				nr_cpus++;
-				last_cpu = cpu;
-
+				if (!(scf_flags & SCF_NO_USER) ||
+				    !IS_ENABLED(CONFIG_GENERIC_ENTRY) ||
+				     ct_state_cpu(cpu) != CONTEXT_USER) {
+					__cpumask_set_cpu(cpu, cfd->cpumask_ipi);
+					nr_cpus++;
+					last_cpu = cpu;
+				}
 				cfd_seq_store(pcpu->seq_ipi, this_cpu, cpu, CFD_SEQ_IPI);
 			} else {
 				cfd_seq_store(pcpu->seq_noipi, this_cpu, cpu, CFD_SEQ_NOIPI);
@@ -1121,6 +1126,24 @@ void __init smp_init(void)
 	smp_cpus_done(setup_max_cpus);
 }
 
+static void __on_each_cpu_cond_mask(smp_cond_func_t cond_func,
+				    smp_call_func_t func,
+				    void *info, bool wait, bool nouser,
+				    const struct cpumask *mask)
+{
+	unsigned int scf_flags = SCF_RUN_LOCAL;
+
+	if (wait)
+		scf_flags |= SCF_WAIT;
+
+	if (nouser)
+		scf_flags |= SCF_NO_USER;
+
+	preempt_disable();
+	smp_call_function_many_cond(mask, func, info, scf_flags, cond_func);
+	preempt_enable();
+}
+
 /*
  * on_each_cpu_cond(): Call a function on each processor for which
  * the supplied function cond_func returns true, optionally waiting
@@ -1146,17 +1169,18 @@ void __init smp_init(void)
 void on_each_cpu_cond_mask(smp_cond_func_t cond_func, smp_call_func_t func,
 			   void *info, bool wait, const struct cpumask *mask)
 {
-	unsigned int scf_flags = SCF_RUN_LOCAL;
-
-	if (wait)
-		scf_flags |= SCF_WAIT;
-
-	preempt_disable();
-	smp_call_function_many_cond(mask, func, info, scf_flags, cond_func);
-	preempt_enable();
+	__on_each_cpu_cond_mask(cond_func, func, info, wait, false, mask);
 }
 EXPORT_SYMBOL(on_each_cpu_cond_mask);
 
+void on_each_cpu_cond_nouser_mask(smp_cond_func_t cond_func,
+				  smp_call_func_t func,
+				  void *info, bool wait,
+				  const struct cpumask *mask)
+{
+	__on_each_cpu_cond_mask(cond_func, func, info, wait, true, mask);
+}
+
 static void do_nothing(void *unused)
 {
 }

