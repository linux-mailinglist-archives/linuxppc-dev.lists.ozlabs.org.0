Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B3E75CCF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 18:01:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6vS54nqkz3cXH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 02:01:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=r9hq=dh=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6vRW2mgmz3bsR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 02:00:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B7F1961C5B;
	Fri, 21 Jul 2023 16:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B74C433C7;
	Fri, 21 Jul 2023 16:00:44 +0000 (UTC)
Date: Fri, 21 Jul 2023 12:00:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20230721120040.6ed2c02a@gandalf.local.home>
In-Reply-To: <1b402c0c-1beb-d93f-ff6d-955350995ca3@intel.com>
References: <20211015110035.14813389@gandalf.local.home>
	<20211015161702.GF174703@worktop.programming.kicks-ass.net>
	<20211015133504.6c0a9fcc@gandalf.local.home>
	<20211015135806.72d1af23@gandalf.local.home>
	<20211015180429.GK174703@worktop.programming.kicks-ass.net>
	<20211015142033.72605b47@gandalf.local.home>
	<20211015142541.4badd8a9@gandalf.local.home>
	<1b402c0c-1beb-d93f-ff6d-955350995ca3@intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Paul Mackerras <paulus@samba.org>, Jisheng Zhang <jszhang@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Petr Mladek <pmladek@suse.com>, Albert Ou <aou@eecs.berkeley.edu>, Jiri Kosina <jikos@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Guo Ren <guoren@kernel.org>, Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 Jul 2023 17:34:41 +0200
Alexander Lobakin <aleksander.lobakin@intel.com> wrote:

> From: Steven Rostedt <rostedt@goodmis.org>
> Date: Fri, 15 Oct 2021 14:25:41 -0400
> 
> Sorry for such a necroposting :z
> Just wanted to know if this is a bug, so that I could send a fix, or
> intended behaviour.
> 
> > On Fri, 15 Oct 2021 14:20:33 -0400
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> >   
> >>> I think having one copy of that in a header is better than having 3
> >>> copies. But yes, something along them lines.    
> >>
> >> I was just about to ask you about this patch ;-)  
> > 
> > Except it doesn't build :-p (need to move the inlined function down a bit)
> > 
> > diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> > index 4d244e295e85..b32e3dabe28b 100644
> > --- a/include/linux/preempt.h
> > +++ b/include/linux/preempt.h
> > @@ -77,6 +77,27 @@
> >  /* preempt_count() and related functions, depends on PREEMPT_NEED_RESCHED */
> >  #include <asm/preempt.h>
> >  
> > +/**
> > + * interrupt_context_level - return interrupt context level
> > + *
> > + * Returns the current interrupt context level.
> > + *  0 - normal context
> > + *  1 - softirq context
> > + *  2 - hardirq context
> > + *  3 - NMI context
> > + */
> > +static __always_inline unsigned char interrupt_context_level(void)
> > +{
> > +	unsigned long pc = preempt_count();
> > +	unsigned char level = 0;
> > +
> > +	level += !!(pc & (NMI_MASK));
> > +	level += !!(pc & (NMI_MASK | HARDIRQ_MASK));
> > +	level += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));  
> 
> This doesn't take into account that we can switch the context manually
> via local_bh_disable() / local_irq_save() etc. During the testing of the

You cannot manually switch interrupt context.

> separate issue[0], I've found that the function returns 1 in both just
> softirq and softirq under local_irq_save().
> Is this intended? Shouldn't that be

That is intended behavior.

local_bh_disable() and local_irq_save() is not a context switch. It is just
preventing that context from happening. The interrupt_context_level() is to
tell us what context we are running in, not what context is disabled.

> 
> 	level += !!(pc & (NMI_MASK));
> 	level += !!(pc * (NMI_MASK | HARDIRQ_MASK)) || irqs_disabled();
> 	level += !!(pc * (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET)) ||
> 		 in_atomic();
> 
> ?
> Otherwise, the result it returns is not really "context level".

local_bh_disable() use to (and perhaps still does in some configurations)
confuse things. But read the comment in kernel/softirq.c

/*
 * SOFTIRQ_OFFSET usage:
 *
 * On !RT kernels 'count' is the preempt counter, on RT kernels this applies
 * to a per CPU counter and to task::softirqs_disabled_cnt.
 *
 * - count is changed by SOFTIRQ_OFFSET on entering or leaving softirq
 *   processing.
 *
 * - count is changed by SOFTIRQ_DISABLE_OFFSET (= 2 * SOFTIRQ_OFFSET)
 *   on local_bh_disable or local_bh_enable.
 *
 * This lets us distinguish between whether we are currently processing
 * softirq and whether we just have bh disabled.
 */

Just because you disable interrupts does not mean you are in interrupt
context.

-- Steve


> 
> > +
> > +	return level;
> > +}
> > +  
> [0]
> https://lore.kernel.org/netdev/b3884ff9-d903-948d-797a-1830a39b1e71@intel.com
> 
> Thanks,
> Olek

