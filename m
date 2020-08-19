Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2FA24A36A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 17:44:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWsXX3TLYzDqcR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 01:44:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=iM2jo4Vk; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWsRH2QznzDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 01:39:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=A/NLDEqSKQO5M1WQObNymH18o4NlNdxjll2by5D8bbE=; b=iM2jo4Vkp8b1Brl9BuejvbdL4q
 uyEe0Iygv7v92s+Gs5XNITaVQMbU+ie4eWP1lPmZsJroegcnyl5wqfRGY1bweEH1cH+NLqkOhjCs7
 ihL+pVwi1DffiQyKENwc0G2/7+6VUVt5ihMWefbrvGSks18PYeyBXSM6XXdsiToUhza/SifSRn9/K
 65swPPEhRGGab8qDuBogNkb76IGW313uWwSetAhxG+WPw0EdnM1WMQ8ghH6zi1Pc/Xyj7HlEUY+8I
 hFV7ER+hErZgX+VFmlgEENeHALwZlA7S1SKEH3ew1MtMkOMme5SS7h745f//FCWrV6v2qnY89unTQ
 YCHyzPRQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8QBr-0007p3-8U; Wed, 19 Aug 2020 15:39:51 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7BACF3059C6;
 Wed, 19 Aug 2020 17:39:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5FEE82BEB7F3D; Wed, 19 Aug 2020 17:39:49 +0200 (CEST)
Date: Wed, 19 Aug 2020 17:39:49 +0200
From: peterz@infradead.org
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
Message-ID: <20200819153949.GO35926@hirez.programming.kicks-ass.net>
References: <20200723105615.1268126-1-npiggin@gmail.com>
 <20200807111126.GI2674@hirez.programming.kicks-ass.net>
 <1597220073.mbvcty6ghk.astroid@bobo.none>
 <20200812103530.GL2674@hirez.programming.kicks-ass.net>
 <1597735273.s0usqkrlsk.astroid@bobo.none>
 <20200818154143.GT2674@hirez.programming.kicks-ass.net>
 <1597793862.l8c4pmmzpq.astroid@bobo.none>
 <7fadb5ab-9869-396d-ff5d-c0adb6fc0b35@ozlabs.ru>
 <20200819153250.GF2674@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819153250.GF2674@hirez.programming.kicks-ass.net>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 19, 2020 at 05:32:50PM +0200, peterz@infradead.org wrote:
> On Wed, Aug 19, 2020 at 08:39:13PM +1000, Alexey Kardashevskiy wrote:
> 
> > > or current upstream?
> > 
> > The upstream 18445bf405cb (13 hours old) also shows the problem. Yours
> > 1/2 still fixes it.
> 
> Afaict that just reduces the window.
> 
> Isn't the problem that:
> 
> arch/powerpc/kernel/exceptions-64e.S
> 
> 	START_EXCEPTION(perfmon);
> 	NORMAL_EXCEPTION_PROLOG(0x260, BOOKE_INTERRUPT_PERFORMANCE_MONITOR,
> 				PROLOG_ADDITION_NONE)
> 	EXCEPTION_COMMON(0x260)
> 	INTS_DISABLE
> #	  RECONCILE_IRQ_STATE
> #	    TRACE_DISABLE_INTS
> #	      TRACE_WITH_FRAME_BUFFER(trace_hardirqs_off)
> #
> # but we haven't done nmi_enter() yet... whoopsy
> 
> 	CHECK_NAPPING()
> 	addi	r3,r1,STACK_FRAME_OVERHEAD
> 	bl	performance_monitor_exception
> #	 perf_irq()
> #          perf_event_interrupt
> #	     __perf_event_interrupt
> #	      nmi_enter()
> 
> 
> 
> That is, afaict your entry code is buggered.

That is, patch 1/2 doesn't change the case:

	local_irq_enable()
	  trace_hardirqs_on()
	  <NMI>
	    trace_hardirqs_off()
	    ...
	    if (regs_irqs_disabled(regs)) // false
	      trace_hardirqs_on();
	  </NMI>
	  raw_local_irq_enable()

Where local_irq_enable() has done trace_hardirqs_on() and the NMI hits
and undoes it, but doesn't re-do it because the hardware state is still
disabled.

What's supposed to happen is:

	<NMI>
	  nmi_enter()
	  trace_hardirqs_off() // no-op, because in_nmi() (or previously because lockdep_off())
	  ...
	</NMI>

