Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB74229ED5C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 14:45:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMRXW1JTNzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 00:45:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=tmae=ee=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMRQL2cF2zDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 00:40:10 +1100 (AEDT)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5577420796;
 Thu, 29 Oct 2020 13:40:04 +0000 (UTC)
Date: Thu, 29 Oct 2020 09:40:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH 5/9] kprobes/ftrace: Add recursion protection to the
 ftrace callback
Message-ID: <20201029094001.0cfab7aa@gandalf.local.home>
In-Reply-To: <20201029165803.5f6b401e5bccca4e57c70181@kernel.org>
References: <20201028115244.995788961@goodmis.org>
 <20201028115613.140212174@goodmis.org>
 <20201029165803.5f6b401e5bccca4e57c70181@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-s390@vger.kernel.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Oct 2020 16:58:03 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Hi Steve,
> 
> On Wed, 28 Oct 2020 07:52:49 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> > 
> > If a ftrace callback does not supply its own recursion protection and
> > does not set the RECURSION_SAFE flag in its ftrace_ops, then ftrace will
> > make a helper trampoline to do so before calling the callback instead of
> > just calling the callback directly.  
> 
> So in that case the handlers will be called without preempt disabled?
> 
> 
> > The default for ftrace_ops is going to assume recursion protection unless
> > otherwise specified.  
> 
> This seems to skip entier handler if ftrace finds recursion.
> I would like to increment the missed counter even in that case.

Note, this code does not change the functionality at this point, because
without having the FL_RECURSION flag set (which kprobes does not even in
this patch), it always gets called from the helper function that does this:

	bit = trace_test_and_set_recursion(TRACE_LIST_START, TRACE_LIST_MAX);
	if (bit < 0)
		return;

	preempt_disable_notrace();

	op->func(ip, parent_ip, op, regs);

	preempt_enable_notrace();
	trace_clear_recursion(bit);

Where this function gets called by op->func().

In other words, you don't get that count anyway, and I don't think you want
it. Because it means you traced something that your callback calls.

That bit check is basically a nop, because the last patch in this series
will make the default that everything has recursion protection, but at this
patch the test does this:

	/* A previous recursion check was made */
	if ((val & TRACE_CONTEXT_MASK) > max)
		return 0;

Which would always return true, because this function is called via the
helper that already did the trace_test_and_set_recursion() which, if it
made it this far, the val would always be greater than max.

> 
> [...]
> e.g.
> 
> > diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
> > index 5264763d05be..5eb2604fdf71 100644
> > --- a/arch/csky/kernel/probes/ftrace.c
> > +++ b/arch/csky/kernel/probes/ftrace.c
> > @@ -13,16 +13,21 @@ int arch_check_ftrace_location(struct kprobe *p)
> >  void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
> >  			   struct ftrace_ops *ops, struct pt_regs *regs)
> >  {
> > +	int bit;
> >  	bool lr_saver = false;
> >  	struct kprobe *p;
> >  	struct kprobe_ctlblk *kcb;
> >  
> > -	/* Preempt is disabled by ftrace */
> > +	bit = ftrace_test_recursion_trylock();  
> 
> > +
> > +	preempt_disable_notrace();
> >  	p = get_kprobe((kprobe_opcode_t *)ip);
> >  	if (!p) {
> >  		p = get_kprobe((kprobe_opcode_t *)(ip - MCOUNT_INSN_SIZE));
> >  		if (unlikely(!p) || kprobe_disabled(p))
> > -			return;
> > +			goto out;
> >  		lr_saver = true;
> >  	}  
> 
> 	if (bit < 0) {
> 		kprobes_inc_nmissed_count(p);
> 		goto out;
> 	}

If anything called in get_kprobe() or kprobes_inc_nmissed_count() gets
traced here, you have zero recursion protection, and this will crash the
machine with a likely reboot (triple fault).

Note, the recursion handles interrupts and wont stop them. bit < 0 only
happens if you recurse because this function called something that ends up
calling itself. Really, why would you care about missing a kprobe on the
same kprobe?

-- Steve
