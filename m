Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B420122DEE7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 14:13:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BF20H6lCJzF0PV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 22:13:35 +1000 (AEST)
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
 header.s=merlin.20170209 header.b=sP1/Yjfm; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BF1yF2q65zDqCZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 22:11:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xA3Hnz+mwiXbGsGPSLX5kHfDe9+CoKBCym0WXsIlDDo=; b=sP1/Yjfm/lG5EQn9AxmxZdauaJ
 MxUY80ZJ40JT45IWrg88x3weHFXoDis8wKOuWPpaMIKIHT08gNY7ds8XI+dxwzg/7jpjPM5iU3K2a
 fp+AniTB/M1sw3UKSnx+aNRJC078VCBq9AdVx7ousLRNjP3pvlfP78klqSV0BgalGdz6OA1Z+sNsB
 Pdlh4P7ZYXdDJN5EdIY3uw5oUbRhUZ2nn575NPj46hthp++5huQ5fcxEiK1rkElZeDTP+ReSLIUI/
 0KbZrzjPc0Kv5ZJ+TYr8ZZQvtgIhBbBqfpHnOyaokMhJJixAzDdIdFV42GrzYf3XwrXS/bGClBsAG
 nzv6UgBA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzfVD-0001ia-Rc; Sun, 26 Jul 2020 12:11:40 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 37A07301AC6;
 Sun, 26 Jul 2020 14:11:38 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1BD78285770B1; Sun, 26 Jul 2020 14:11:38 +0200 (CEST)
Date: Sun, 26 Jul 2020 14:11:38 +0200
From: peterz@infradead.org
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
Message-ID: <20200726121138.GC119549@hirez.programming.kicks-ass.net>
References: <20200723105615.1268126-1-npiggin@gmail.com>
 <20200725202617.GI10769@hirez.programming.kicks-ass.net>
 <1595735694.b784cvipam.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595735694.b784cvipam.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 26, 2020 at 02:14:34PM +1000, Nicholas Piggin wrote:
> Excerpts from Peter Zijlstra's message of July 26, 2020 6:26 am:

> > Which is 'funny' when it interleaves like:
> > 
> > 	local_irq_disable();
> > 	...
> > 	local_irq_enable()
> > 	  trace_hardirqs_on();
> > 	  <NMI/>
> > 	  raw_local_irq_enable();
> > 
> > Because then it will undo the trace_hardirqs_on() we just did. With the
> > result that both tracing and lockdep will see a hardirqs-disable without
> > a matching enable, while the hardware state is enabled.
> 
> Seems like an arch problem -- why not disable if it was enabled only?
> I guess the local_irq tracing calls are a mess so maybe they copied 
> those.

Because, as I wrote earlier, then we can miss updating software state.
So your proposal has:

	raw_local_irq_disable()
	<NMI>
	  if (!arch_irqs_disabled(regs->flags) // false
	    trace_hardirqs_off();

	  // tracing/lockdep still think IRQs are enabled
	  // hardware IRQ state is disabled.

With the current code we have:

	local_irq_enable()
	  trace_hardirqs_on();
	  <NMI>
	    trace_hardirqs_off();
	    ...
	    if (!arch_irqs_disabled(regs->flags)) // false
	      trace_hardirqs_on();
	  </NMI>
	  // and now the NMI disabled software state again
	  // while we're about to enable the hardware state
	  raw_local_irq_enable();

> > Which is exactly the state Alexey seems to have ran into.
> 
> No his was what I said, the interruptee's trace_hardirqs_on() in
> local_irq_enable getting lost because the NMI's local_irq_disable
> always disables, but the enable doesn't re-enable.

That's _exactly_ the case above. It doesn't re-enable because hardirqs
are actually still disabled. You _cannot_ rely on hardirq state for
NMIs, that'll get you wrong state.

> It's all just weird asymmetrical special case hacks AFAIKS, the
> code should just be symmetric and lockdep handle it's own weirdness.

It's for non-maskable exceptions/interrupts, because there the hardware
and software state changes non-atomically. For maskable interrupts doing
the software state transitions inside the disabled region makes perfect
sense, because that keeps it atomic.
