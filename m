Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239356C5A2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 00:16:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Phkqx6qnYz3cdG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 10:16:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=k4/hIANB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=k4/hIANB;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Phkq01GZ2z3c6v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 10:15:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hKMA4pE4ZC1WEjwlMS0oahB5WbuLzi761bi+OVXv/X8=; b=k4/hIANBdxC2Z8c++HmkBPk16F
	hq1n4vi1aFY7d/izKMGpm0/zkTd++0c77IZs+Q5bV257Gjkiy34yMSDd8L7TKq46+CV0zDSHb27H+
	4KSIRSylcgYZ2OMei78Bb1gC7STjWled8MJkcwhhG29tpOAa6HtPIFWPyA9seeGrRiJr3vWUYPsTp
	3Vu3FPyPpiLcCMVxhaxuIGSboSf1mmZy7nxDek09nDmg/P6bBJA5M4EMw//9ErW/pvBC1TxeGCDAY
	4DGmD2DpR96GbtKoxaTV3TYyxFMIuFbNKoIU/LaGvb2xuytoT+Rk3V4s2DX53haN44indyDWk1fXo
	N1G/mBcw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pf7f5-004hB6-38;
	Wed, 22 Mar 2023 23:14:32 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9046D30035F;
	Thu, 23 Mar 2023 00:14:28 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 73D47202F7F60; Thu, 23 Mar 2023 00:14:28 +0100 (CET)
Date: Thu, 23 Mar 2023 00:14:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
Message-ID: <20230322231428.GV2017917@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
 <xhsmhmt45c703.mognet@vschneid.remote.csb>
 <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
 <xhsmhjzz8d8km.mognet@vschneid.remote.csb>
 <20230322172242.GH2357380@hirez.programming.kicks-ass.net>
 <xhsmhh6ucd4t7.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmhh6ucd4t7.mognet@vschneid.remote.csb>
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

On Wed, Mar 22, 2023 at 06:22:28PM +0000, Valentin Schneider wrote:
> On 22/03/23 18:22, Peter Zijlstra wrote:

> >>        hackbench-157   [001]    10.894320: ipi_send_cpu:         cpu=3 callsite=check_preempt_curr+0x37 callback=0x0
> >
> > Arguably we should be setting callback to scheduler_ipi(), except
> > ofcourse, that's not an actual function...
> >
> > Maybe we can do "extern inline" for the actual users and provide a dummy
> > function for the symbol when tracing.
> >
> 
> Huh, I wasn't aware that was an option, I'll look into that. I did scribble
> down a comment next to smp_send_reschedule(), but having a decodable
> function name would be better!

So clang-15 builds the below (and generates the expected code), but
gcc-12 vomits nonsense about a non-static inline calling a static inline
or somesuch bollocks :-/

--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1991,7 +1991,7 @@ extern char *__get_task_comm(char *to, s
 })
 
 #ifdef CONFIG_SMP
-static __always_inline void scheduler_ipi(void)
+extern __always_inline void scheduler_ipi(void)
 {
 	/*
 	 * Fold TIF_NEED_RESCHED into the preempt_count; anybody setting
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -130,9 +130,9 @@ extern void arch_smp_send_reschedule(int
  * scheduler_ipi() is inline so can't be passed as callback reason, but the
  * callsite IP should be sufficient for root-causing IPIs sent from here.
  */
-#define smp_send_reschedule(cpu) ({		  \
-	trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
-	arch_smp_send_reschedule(cpu);		  \
+#define smp_send_reschedule(cpu) ({				\
+	trace_ipi_send_cpu(cpu, _RET_IP_, &scheduler_ipi);	\
+	arch_smp_send_reschedule(cpu);				\
 })
 
 /*
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3790,6 +3790,15 @@ static int ttwu_runnable(struct task_str
 }
 
 #ifdef CONFIG_SMP
+void scheduler_ipi(void)
+{
+	/*
+	 * Actual users should end up using the extern inline, this is only
+	 * here for the symbol.
+	 */
+	BUG();
+}
+
 void sched_ttwu_pending(void *arg)
 {
 	struct llist_node *llist = arg;
