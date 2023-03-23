Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC73A6C6F94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 18:43:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjCP64yFNz3fdq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 04:43:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dDxw8Fpz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjCN467Kkz3f6K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 04:42:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uknWkbKCt7r7d+Uri/V39eu4SUqBOmf1+zXqyPceR/Q=; b=dDxw8FpzxhqVLTwZLp+6PLqsZb
	sRJ3X8JsTwZ/JiVyuRpgwQqpktLFA6bvn6+Z5BUFJqFkJRGddW2MQ80jsQJfIgRgfreJe2ASji3Ok
	ubgdvdDoJEumb5zC8iamfg/Bj2JpUUoIIkbWbcU+eS2YQIKqSfzW3woiON0TO/xxXdEJFV3HgvHvO
	sXiZid3LBW1uxBADyBwicyQ2lIEhNgqEfn2o6vq+arvPTl9YSvFX++J11S113A+M+rXKiwhf9f2WT
	HAcSaWWs+/beDL4nUBnINhc313sBkIdpEH77HQ1cT1mXenwbLj9N8jiiOSWeGoraLKmJYcbpzRY9+
	kwRmLaAw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pfOwQ-004vDx-2T;
	Thu, 23 Mar 2023 17:41:35 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7E8ED3002FC;
	Thu, 23 Mar 2023 18:41:29 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 68B95240DB73A; Thu, 23 Mar 2023 18:41:29 +0100 (CET)
Date: Thu, 23 Mar 2023 18:41:29 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
Message-ID: <20230323174129.GA2753619@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
 <xhsmhmt45c703.mognet@vschneid.remote.csb>
 <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
 <xhsmhbkkjcu4q.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmhbkkjcu4q.mognet@vschneid.remote.csb>
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

On Thu, Mar 23, 2023 at 04:25:25PM +0000, Valentin Schneider wrote:
> On 22/03/23 15:04, Peter Zijlstra wrote:
> > @@ -798,14 +794,20 @@ static void smp_call_function_many_cond(
> >  		}
> >  
> >  		/*
> > +		 * Trace each smp_function_call_*() as an IPI, actual IPIs
> > +		 * will be traced with func==generic_smp_call_function_single_ipi().
> > +		 */
> > +		trace_ipi_send_cpumask(cfd->cpumask_ipi, _RET_IP_, func);
> 
> I just got a trace pointing out this can emit an event even though no IPI
> is sent if e.g. the cond_func predicate filters all CPUs in the argument
> mask:
> 
>   ipi_send_cpumask:     cpumask= callsite=on_each_cpu_cond_mask+0x3c callback=flush_tlb_func+0x0
> 
> Maybe something like so on top?
> 
> ---
> diff --git a/kernel/smp.c b/kernel/smp.c
> index ba5478814e677..1dc452017d000 100644
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -791,6 +791,8 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
>  			}
>  		}
>  
> +		if (!nr_cpus)
> +			goto local;

Hmm, this isn't right. You can get nr_cpus==0 even though it did add
some to various lists but never was first.

But urgh, even if we were to say count nr_queued we'd never get the mask
right, because we don't track which CPUs have the predicate matched,
only those we need to actually send an IPI to :/

Ooh, I think we can clear those bits from cfd->cpumask, arguably that's
a correctness fix too, because the 'run_remote && wait' case shouldn't
wait on things we didn't queue.

Hmm?


--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -728,9 +728,9 @@ static void smp_call_function_many_cond(
 	int cpu, last_cpu, this_cpu = smp_processor_id();
 	struct call_function_data *cfd;
 	bool wait = scf_flags & SCF_WAIT;
+	int nr_cpus = 0, nr_queued = 0;
 	bool run_remote = false;
 	bool run_local = false;
-	int nr_cpus = 0;
 
 	lockdep_assert_preemption_disabled();
 
@@ -772,8 +772,10 @@ static void smp_call_function_many_cond(
 		for_each_cpu(cpu, cfd->cpumask) {
 			call_single_data_t *csd = per_cpu_ptr(cfd->csd, cpu);
 
-			if (cond_func && !cond_func(cpu, info))
+			if (cond_func && !cond_func(cpu, info)) {
+				__cpumask_clear_cpu(cpu, cfd->cpumask);
 				continue;
+			}
 
 			csd_lock(csd);
 			if (wait)
@@ -789,13 +791,15 @@ static void smp_call_function_many_cond(
 				nr_cpus++;
 				last_cpu = cpu;
 			}
+			nr_queued++;
 		}
 
 		/*
 		 * Trace each smp_function_call_*() as an IPI, actual IPIs
 		 * will be traced with func==generic_smp_call_function_single_ipi().
 		 */
-		trace_ipi_send_cpumask(cfd->cpumask_ipi, _RET_IP_, func);
+		if (nr_queued)
+			trace_ipi_send_cpumask(cfd->cpumask, _RET_IP_, func);
 
 		/*
 		 * Choose the most efficient way to send an IPI. Note that the

