Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3A220F1DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 11:42:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wztQ6FF4zDqmj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 19:42:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wzrf07lkzDqfW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 19:41:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ObiET+eN9wPISA69yMBAjLsRR+NFaZ4l0xk8JBk7804=; b=YxYVnapPrNLDtKA1tIbiaacSX5
 ZAYioY8ULLtGnawpbkokHrxzK+nUrSkEF0L09yUL8NLcQdrEpxv7PMoMmS6qf8unE1c5M2AhC0TU/
 1cY7d/vUPxWxB+SRzRxgdSjYXnTbXUlhczgIMZvS/cInvnmDeoIcS1G7ikHH+rj+PlXkDbwFuoUHz
 tb8903egHL1o5Nbw6dvVBCBkcCfRA/qz/W3unSbaTs7QP3ecC/6V1h9WMCbcQl+hJUBbYW39j0KHw
 JD+4egP8OPWq0pUvcxFGGKFFx2ano6jdwqVG+BFTkOahPzwI+V6dH/FmiFRYeplwMXqNG4jjxVX8p
 UC+CT2mg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqCka-0004MK-9L; Tue, 30 Jun 2020 09:40:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 835593013E5;
 Tue, 30 Jun 2020 11:40:19 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 703772147FFB9; Tue, 30 Jun 2020 11:40:19 +0200 (CEST)
Date: Tue, 30 Jun 2020 11:40:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Ahmed S. Darwish" <a.darwish@linutronix.de>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200630094019.GL4800@hirez.programming.kicks-ass.net>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200630055939.GA3676007@debian-buster-darwi.lab.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630055939.GA3676007@debian-buster-darwi.lab.linutronix.de>
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bigeasy@linutronix.de, x86@kernel.org, heiko.carstens@de.ibm.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, davem@davemloft.net,
 sparclinux@vger.kernel.org, linux@armlinux.org.uk, tglx@linutronix.de,
 will@kernel.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 30, 2020 at 07:59:39AM +0200, Ahmed S. Darwish wrote:
> Peter Zijlstra wrote:
> 
> ...
> 
> > -#define lockdep_assert_irqs_disabled()	do {			\
> > -		WARN_ONCE(debug_locks && !current->lockdep_recursion &&	\
> > -			  current->hardirqs_enabled,			\
> > -			  "IRQs not disabled as expected\n");		\
> > -	} while (0)
> 
> ...
> 
> > +#define lockdep_assert_irqs_disabled()				\
> > +do {									\
> > +	WARN_ON_ONCE(debug_locks && this_cpu_read(hardirqs_enabled));	\
> > +} while (0)
> 
> I think it would be nice to keep the "IRQs not disabled as expected"
> message. It makes the lockdep splat much more readable.
> 
> This is similarly the case for the v3 lockdep preemption macros:
> 
>   https://lkml.kernel.org/r/20200630054452.3675847-5-a.darwish@linutronix.de
> 
> I did not add a message though to get in-sync with the IRQ macros above.

Hurmph.. the file:line output of a splat is usually all I look at, also
__WARN_printf() generates such atrocious crap code that try and not use
it.

I suppose I should do a __WARN_str() or something, but then people are
unlikely to want to use that, too much variation etc. :/

Cursed if you do, cursed if you don't.
