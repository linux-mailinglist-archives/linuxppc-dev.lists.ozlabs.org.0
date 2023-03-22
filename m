Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D9C6C525C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 18:24:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Phb1K3r7Rz3cMb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 04:24:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=vKlpYO9J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=vKlpYO9J;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Phb0L6FwBz3cMh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 04:23:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HnYLxxQqsoSk7nx4q+NwD1PkqBw2pnBv/8dY5LfvgsA=; b=vKlpYO9J+SAy1WEvcIK14Yjf/L
	ynXvDY79SlwKJanrwgzYEOXnnioQBgLUy3CrFk50zk6gexGOR1WBu1U+8z0ez8ooEunmN+/ckV8u/
	fy6I/cTWTP+4yMLeJuJFSHIWQ42bpQDS+bJQxNOOStKEvKo3a2qnMtBXerFw3bacxs/V9jZatrsWt
	uJV0KmhWKaEXSUc4+JDi8NPaOVbgXp0+gUnCEyoIpshljJbDcPWNCZ4z8pkm1g7PNfXMezXN9THbL
	CZ6PxxMDhbKXM9wqJQTkrqybw+bklZDk0F+1b+Uh49FUnabKcm7orMqSW89DJ5taY4bb5wRmuPYfj
	wjzBDEmQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pf2Ag-003CAY-SR; Wed, 22 Mar 2023 17:22:47 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 333E830030F;
	Wed, 22 Mar 2023 18:22:42 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1C3D4205D08C3; Wed, 22 Mar 2023 18:22:42 +0100 (CET)
Date: Wed, 22 Mar 2023 18:22:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
Message-ID: <20230322172242.GH2357380@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
 <xhsmhmt45c703.mognet@vschneid.remote.csb>
 <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
 <xhsmhjzz8d8km.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmhjzz8d8km.mognet@vschneid.remote.csb>
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

On Wed, Mar 22, 2023 at 05:01:13PM +0000, Valentin Schneider wrote:

> > So I was thinking something like this:

> Hm, this does get rid of the func being passed down the helpers, but this
> means the trace events are now stateful, i.e. I need the first and last
> events in a CSD stack to figure out which one actually caused the IPI.

Isn't much of tracing stateful? I mean, why am I always writing awk
programs to parse trace output?

The one that is directly followed by
generic_smp_call_function_single_interrupt() (horrible name that), is
the one that tripped the IPI.

> It also requires whoever is looking at the trace to be aware of which IPIs
> are attached to a CSD, and which ones aren't. ATM that's only the resched
> IPI, but per the cover letter there's more to come (e.g. tick_broadcast()
> for arm64/riscv and a few others). For instance:
> 
>        hackbench-157   [001]    10.894320: ipi_send_cpu:         cpu=3 callsite=check_preempt_curr+0x37 callback=0x0

Arguably we should be setting callback to scheduler_ipi(), except
ofcourse, that's not an actual function...

Maybe we can do "extern inline" for the actual users and provide a dummy
function for the symbol when tracing.

>        hackbench-157   [001]    10.895068: ipi_send_cpu:         cpu=3 callsite=try_to_wake_up+0x29e callback=sched_ttwu_pending+0x0
>        hackbench-157   [001]    10.895068: ipi_send_cpu:         cpu=3 callsite=try_to_wake_up+0x29e callback=generic_smp_call_function_single_interrupt+0x0
> 
> That first one sent a RESCHEDULE IPI, the second one a CALL_FUNCTION one,
> but you really have to know what you're looking at...

But you have to know that anyway, you can't do tracing and not know wtf
you're doing. Or rather, if you do, I don't give a crap and you can keep
the pieces :-)

Grepping the callback should be pretty quick resolution at to what trips
it, no?

(also, if you *realllllly* can't manage, we can always add yet another
argument that gives a type thingy)

> Are you worried about the @func being pushed down?

Not really, I was finding it odd that only the first csd was being
logged. Either you should log them all (after all, the target CPU will
run them all and you might still wonder where the heck they came from)
or it should log none and always report that hideous long function name
I can't be arsed to type again :-)

> Staring at x86 asm is not good for the soul,

Scarred for life :-) What's worse, due to being exposed to Intel syntax
at a young age, I'm now permantently confused as to the argument order
of x86 asm.

