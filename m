Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4EE6C46B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 10:41:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhNlj21KCz3ch8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 20:41:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rgS/CEWA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhNkg4hd2z3cBj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 20:40:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NIAHg4If27BetC+4UZobAV0PxBnmTt3z+fWts2bKQWA=; b=rgS/CEWAlsTurPe5ucKBiXaDhr
	ew26BoXauCH9lin/sWfYKxjLJe0WysSt1P4iOSDXV1qfu4JSoUQNAlogwxNIDbcZw5jKIurC6wBP0
	+/+Z8kdUTp/ZyyNP9QPql3dhW8rHV0QqkfTXWuMoE0vryMGgt+T+aOFFPTKbmbiRK5T84YLaG6C4t
	iRHD6M2ZFvI2kES3RCcIFI7D2yWW07o0ZjcKw1qqr5MTJddfTUE9AHHetindb2rqkUVxpV/GEVyQu
	B4Z/fkelloNxIIEvBXXKz9pvL88Uc5JVf1N0nCKJVM3jEC4cK78BNevAeHHN3c0k/dy9sGC9ChrU5
	42+coITw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1peuwq-002t99-FB; Wed, 22 Mar 2023 09:40:00 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7E63F3001F7;
	Wed, 22 Mar 2023 10:39:56 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 16170205D08C3; Wed, 22 Mar 2023 10:39:56 +0100 (CET)
Date: Wed, 22 Mar 2023 10:39:55 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v5 1/7] trace: Add trace_ipi_send_cpumask()
Message-ID: <20230322093955.GR2017917@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-2-vschneid@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307143558.294354-2-vschneid@redhat.com>
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

On Tue, Mar 07, 2023 at 02:35:52PM +0000, Valentin Schneider wrote:
> trace_ipi_raise() is unsuitable for generically tracing IPI sources due to
> its "reason" argument being an uninformative string (on arm64 all you get
> is "Function call interrupts" for SMP calls).
> 
> Add a variant of it that exports a target cpumask, a callsite and a callback.
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  include/trace/events/ipi.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/include/trace/events/ipi.h b/include/trace/events/ipi.h
> index 0be71dad6ec03..b1125dc27682c 100644
> --- a/include/trace/events/ipi.h
> +++ b/include/trace/events/ipi.h
> @@ -35,6 +35,28 @@ TRACE_EVENT(ipi_raise,
>  	TP_printk("target_mask=%s (%s)", __get_bitmask(target_cpus), __entry->reason)
>  );
>  
> +TRACE_EVENT(ipi_send_cpumask,
> +
> +	TP_PROTO(const struct cpumask *cpumask, unsigned long callsite, void *callback),
> +
> +	TP_ARGS(cpumask, callsite, callback),
> +
> +	TP_STRUCT__entry(
> +		__cpumask(cpumask)
> +		__field(void *, callsite)
> +		__field(void *, callback)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_cpumask(cpumask, cpumask_bits(cpumask));
> +		__entry->callsite = (void *)callsite;
> +		__entry->callback = callback;
> +	),
> +
> +	TP_printk("cpumask=%s callsite=%pS callback=%pS",
> +		  __get_cpumask(cpumask), __entry->callsite, __entry->callback)
> +);

Would it make sense to add a variant like: ipi_send_cpu() that records a
single cpu instead of a cpumask. A lot of sites seems to do:
cpumask_of(cpu) for that first argument, and it seems to me it is quite
daft to have to memcpy a full multi-word cpumask in those cases.

Remember, nr_possible_cpus > 64 is quite common these days.
