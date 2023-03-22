Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC186C47AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 11:31:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhPrv5m1qz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 21:31:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=nWUnvkKp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=nWUnvkKp;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhPr04rm6z3cBq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 21:30:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HoRvkd+LKj4dGdGLlCXof2DCgR7hulEC2e5UJ4bAaXY=; b=nWUnvkKpFDRoWjs9u2AzwYMtJ7
	aenibCcG9GWoRWHfBMx1W3UNq1sJn93PyZxuygGUkDBzBh6zn9TRHrL+I7ZYcL3lgqjY8VAa+udBm
	kIShoJMH6uEX2pe1htwgzEWCW0pxMY/WPULPz/LxY6CZFOp/eLwj+k6ki5q6N/i9vq3nJ5a9LKzhW
	d21VTjejO9uEV7WREfd/52Y2FOCBZdKennKdjG8Gt17Dc4Z05ACBMFZQln9tGX2Z0Mu/Lm6PdQ+Oo
	sXexlVoadXfFPb02yVG1fVEWDquekMFyR6ShCOCO7j+Y6R9vIbc1v6vAfeqAIVqFl8FQCC/8FvGmi
	xMJbNNrA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pevjK-002vC8-My; Wed, 22 Mar 2023 10:30:06 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C12CA3002FC;
	Wed, 22 Mar 2023 11:30:04 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id A6E332394C189; Wed, 22 Mar 2023 11:30:04 +0100 (CET)
Date: Wed, 22 Mar 2023 11:30:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v5 1/7] trace: Add trace_ipi_send_cpumask()
Message-ID: <20230322103004.GA571242@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-2-vschneid@redhat.com>
 <20230322093955.GR2017917@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322093955.GR2017917@hirez.programming.kicks-ass.net>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-hexagon@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.
 org, Daniel Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 22, 2023 at 10:39:55AM +0100, Peter Zijlstra wrote:
> On Tue, Mar 07, 2023 at 02:35:52PM +0000, Valentin Schneider wrote:
> > trace_ipi_raise() is unsuitable for generically tracing IPI sources due to
> > its "reason" argument being an uninformative string (on arm64 all you get
> > is "Function call interrupts" for SMP calls).
> > 
> > Add a variant of it that exports a target cpumask, a callsite and a callback.
> > 
> > Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > ---
> >  include/trace/events/ipi.h | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/include/trace/events/ipi.h b/include/trace/events/ipi.h
> > index 0be71dad6ec03..b1125dc27682c 100644
> > --- a/include/trace/events/ipi.h
> > +++ b/include/trace/events/ipi.h
> > @@ -35,6 +35,28 @@ TRACE_EVENT(ipi_raise,
> >  	TP_printk("target_mask=%s (%s)", __get_bitmask(target_cpus), __entry->reason)
> >  );
> >  
> > +TRACE_EVENT(ipi_send_cpumask,
> > +
> > +	TP_PROTO(const struct cpumask *cpumask, unsigned long callsite, void *callback),
> > +
> > +	TP_ARGS(cpumask, callsite, callback),
> > +
> > +	TP_STRUCT__entry(
> > +		__cpumask(cpumask)
> > +		__field(void *, callsite)
> > +		__field(void *, callback)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__assign_cpumask(cpumask, cpumask_bits(cpumask));
> > +		__entry->callsite = (void *)callsite;
> > +		__entry->callback = callback;
> > +	),
> > +
> > +	TP_printk("cpumask=%s callsite=%pS callback=%pS",
> > +		  __get_cpumask(cpumask), __entry->callsite, __entry->callback)
> > +);
> 
> Would it make sense to add a variant like: ipi_send_cpu() that records a
> single cpu instead of a cpumask. A lot of sites seems to do:
> cpumask_of(cpu) for that first argument, and it seems to me it is quite
> daft to have to memcpy a full multi-word cpumask in those cases.
> 
> Remember, nr_possible_cpus > 64 is quite common these days.

Something we litte bit like so...

---
Subject: trace: Add trace_ipi_send_cpu()
From: Peter Zijlstra <peterz@infradead.org>
Date: Wed Mar 22 11:28:36 CET 2023

Because copying cpumasks around when targeting a single CPU is a bit
daft...

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/smp.h        |    6 +++---
 include/trace/events/ipi.h |   22 ++++++++++++++++++++++
 kernel/irq_work.c          |    6 ++----
 kernel/smp.c               |    4 ++--
 4 files changed, 29 insertions(+), 9 deletions(-)

--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -130,9 +130,9 @@ extern void arch_smp_send_reschedule(int
  * scheduler_ipi() is inline so can't be passed as callback reason, but the
  * callsite IP should be sufficient for root-causing IPIs sent from here.
  */
-#define smp_send_reschedule(cpu) ({				  \
-	trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, NULL);  \
-	arch_smp_send_reschedule(cpu);				  \
+#define smp_send_reschedule(cpu) ({		  \
+	trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
+	arch_smp_send_reschedule(cpu);		  \
 })
 
 /*
--- a/include/trace/events/ipi.h
+++ b/include/trace/events/ipi.h
@@ -35,6 +35,28 @@ TRACE_EVENT(ipi_raise,
 	TP_printk("target_mask=%s (%s)", __get_bitmask(target_cpus), __entry->reason)
 );
 
+TRACE_EVENT(ipi_send_cpu,
+
+	TP_PROTO(const unsigned int cpu, unsigned long callsite, void *callback),
+
+	TP_ARGS(cpu, callsite, callback),
+
+	TP_STRUCT__entry(
+		__field(unsigned int, cpu)
+		__field(void *, callsite)
+		__field(void *, callback)
+	),
+
+	TP_fast_assign(
+		__entry->cpu = cpu;
+		__entry->callsite = (void *)callsite;
+		__entry->callback = callback;
+	),
+
+	TP_printk("cpu=%s callsite=%pS callback=%pS",
+		  __entry->cpu, __entry->callsite, __entry->callback)
+);
+
 TRACE_EVENT(ipi_send_cpumask,
 
 	TP_PROTO(const struct cpumask *cpumask, unsigned long callsite, void *callback),
--- a/kernel/irq_work.c
+++ b/kernel/irq_work.c
@@ -78,10 +78,8 @@ void __weak arch_irq_work_raise(void)
 
 static __always_inline void irq_work_raise(struct irq_work *work)
 {
-	if (trace_ipi_send_cpumask_enabled() && arch_irq_work_has_interrupt())
-		trace_ipi_send_cpumask(cpumask_of(smp_processor_id()),
-				       _RET_IP_,
-				       work->func);
+	if (trace_ipi_send_cpu_enabled() && arch_irq_work_has_interrupt())
+		trace_ipi_send_cpu(smp_processor_id(), _RET_IP_, work->func);
 
 	arch_irq_work_raise();
 }
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -109,7 +109,7 @@ static __always_inline void
 send_call_function_single_ipi(int cpu, smp_call_func_t func)
 {
 	if (call_function_single_prep_ipi(cpu)) {
-		trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, func);
+		trace_ipi_send_cpu(cpu, _RET_IP_, func);
 		arch_send_call_function_single_ipi(cpu);
 	}
 }
@@ -348,7 +348,7 @@ void __smp_call_single_queue(int cpu, st
 	 * even if we haven't sent the smp_call IPI yet (e.g. the stopper
 	 * executes migration_cpu_stop() on the remote CPU).
 	 */
-	if (trace_ipi_send_cpumask_enabled()) {
+	if (trace_ipi_send_cpu_enabled()) {
 		call_single_data_t *csd;
 		smp_call_func_t func;
 
