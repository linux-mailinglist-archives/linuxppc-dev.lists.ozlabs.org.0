Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D75C92CBF77
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 15:23:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmLm630vlzDr6v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 01:23:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Rsz1p5mk; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmLhr54DTzDr6S
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 01:20:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zrRkDip9syURLU9E0Xb2jeKaoBtCaWsSoFLaKvOtats=; b=Rsz1p5mkhJCX7CZVz3x+qAHtrt
 +IcT5x25jXpFmuWiw1PKnwQg2YBu/MuxQY8FpoPQ0RNIDZw1b2ewQQYueRC/wdqveh5rwAKK3WVJO
 s5vwq/RGYckBzfx7tiWTLX6l7qnh/l0w5qOlhW0WVz5q/EYUCIVDjzkE36UJ1A5wjT/PmIEvyitLR
 sP44sspX+zHD22KRxoHLpq4r8N74MZ8ZKqMVqmkSL4Fskoi2s3eyftVzrJjxmDUGAvKcCzJ1io6cG
 nlb/Mie3gyBSOCv7tR9HG/ubvCe5pQ7CAayYYCTZC8Kc5g8uMQqn3y0CoWn5u+Ash/btKS01xcNHz
 esFETNAg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkSz9-0003nY-UA; Wed, 02 Dec 2020 14:20:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CC1E7305C10;
 Wed,  2 Dec 2020 15:19:57 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AFCB52143477A; Wed,  2 Dec 2020 15:19:57 +0100 (CET)
Date: Wed, 2 Dec 2020 15:19:57 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies, a non-refcounting lazy tlb
 option
Message-ID: <20201202141957.GJ3021@hirez.programming.kicks-ass.net>
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-7-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201128160141.1003903-7-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 29, 2020 at 02:01:39AM +1000, Nicholas Piggin wrote:
> +		 * - A delayed freeing and RCU-like quiescing sequence based on
> +		 *   mm switching to avoid IPIs completely.

That one's interesting too. so basically you want to count switch_mm()
invocations on each CPU. Then, periodically snapshot the counter on each
CPU, and when they've all changed, increment a global counter.

Then, you snapshot the global counter and wait for it to increment
(twice I think, the first increment might already be in progress).

The only question here is what should drive this machinery.. the tick
probably.

This shouldn't be too hard to do I think.

Something a little like so perhaps?


diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 41404afb7f4c..27b64a60a468 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4525,6 +4525,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
 		 * finish_task_switch()'s mmdrop().
 		 */
 		switch_mm_irqs_off(prev->active_mm, next->mm, next);
+		rq->nr_mm_switches++;
 
 		if (!prev->mm) {                        // from kernel
 			/* will mmdrop() in finish_task_switch(). */
@@ -4739,6 +4740,80 @@ unsigned long long task_sched_runtime(struct task_struct *p)
 	return ns;
 }
 
+static DEFINE_PER_CPU(unsigned long[2], mm_switches);
+
+static struct {
+	unsigned long __percpu *switches[2];
+	unsigned long generation;
+	atomic_t complete;
+	struct wait_queue_dead wait;
+} mm_foo = {
+	.switches = &mm_switches,
+	.generation = 0,
+	.complete = -1, // XXX bootstrap, hotplug
+	.wait = __WAIT_QUEUE_HEAD_INITIALIZER(mm_foo.wait),
+};
+
+static void mm_gen_tick(int cpu, struct rq *rq)
+{
+	unsigned long prev, curr, switches = rq->nr_mm_switches;
+	int idx = READ_ONCE(mm_foo.generation) & 1;
+
+	/* DATA-DEP on mm_foo.generation */
+
+	prev = __this_cpu_read(mm_foo.switches[idx^1]);
+	curr = __this_cpu_read(mm_foo.switches[idx]);
+
+	/* we haven't switched since the last generation */
+	if (prev == switches)
+		return false;
+
+	__this_cpu_write(mm_foo.switches[idx], switches);
+
+	/*
+	 * If @curr is less than @prev, this is the first update of
+	 * this generation, per the above, switches has also increased since,
+	 * so mark out CPU complete.
+	 */
+	if ((long)(curr - prev) < 0 && atomic_dec_and_test(&mm_foo.complete)) {
+		/*
+		 * All CPUs are complete, IOW they all switched at least once
+		 * since the last generation. Reset the completion counter and
+		 * increment the generation.
+		 */
+		atomic_set(&mm_foo.complete, nr_online_cpus());
+		/*
+		 * Matches the address dependency above:
+		 *
+		 *   idx = gen & 1	complete = nr_cpus
+		 *   <DATA-DEP>		<WMB>
+		 *   curr = sw[idx]	generation++;
+		 *   prev = sw[idx^1]
+		 *   if (curr < prev)
+		 *     complete--
+		 *
+		 * If we don't observe the new generation; we'll not decrement. If we
+		 * do see the new generation, we must also see the new completion count.
+		 */
+		smp_wmb();
+		mm_foo.generation++;
+		return true;
+	}
+
+	return false;
+}
+
+static void mm_gen_wake(void)
+{
+	wake_up_all(&mm_foo.wait);
+}
+
+static void mm_gen_wait(void)
+{
+	unsigned int gen = READ_ONCE(mm_foo.generation);
+	wait_event(&mm_foo.wait, READ_ONCE(mm_foo.generation) - gen > 1);
+}
+
 /*
  * This function gets called by the timer code, with HZ frequency.
  * We call it with interrupts disabled.
@@ -4750,6 +4825,7 @@ void scheduler_tick(void)
 	struct task_struct *curr = rq->curr;
 	struct rq_flags rf;
 	unsigned long thermal_pressure;
+	bool wake_mm_gen;
 
 	arch_scale_freq_tick();
 	sched_clock_tick();
@@ -4763,8 +4839,13 @@ void scheduler_tick(void)
 	calc_global_load_tick(rq);
 	psi_task_tick(rq);
 
+	wake_mm_gen = mm_gen_tick(cpu, rq);
+
 	rq_unlock(rq, &rf);
 
+	if (wake_mm_gen)
+		mm_gen_wake();
+
 	perf_event_task_tick();
 
 #ifdef CONFIG_SMP
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index bf9d8da7d35e..62fb685db8d0 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -927,6 +927,7 @@ struct rq {
 	unsigned int		ttwu_pending;
 #endif
 	u64			nr_switches;
+	u64			nr_mm_switches;
 
 #ifdef CONFIG_UCLAMP_TASK
 	/* Utilization clamp values based on CPU's RUNNABLE tasks */
