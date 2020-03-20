Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F69818DA00
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 22:04:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kbqw4RGvzF0Ws
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 08:04:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=vttx=5f=paulmck-thinkpad-p72.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=BCeAXqXF; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kbny5NFWzF0PM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 08:02:46 +1100 (AEDT)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FA3C20658;
 Fri, 20 Mar 2020 21:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584738164;
 bh=fLFR8YUhXJwNZZYH7ngeOnxwmZhi+69xDiLb5E3X218=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=BCeAXqXFUuj1hHiVzGhhcgSUUir3NHhdbxKZUoNYcV8LStVDQjfG/eRwyCQXKq8Be
 IuQ1313Lnf1b5icOH+wFddq7Mb39GH99NqIqxPbuPU2PIooSvheiWkrBcjjmp3yjFc
 b7TA5EIztlrs4AAazjq0Dl03OXMXgVcpSpgAAgtk=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id C94F935226B5; Fri, 20 Mar 2020 14:02:43 -0700 (PDT)
Date: Fri, 20 Mar 2020 14:02:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 08/15] Documentation: Add lock ordering and nesting
 documentation
Message-ID: <20200320210243.GT3199@paulmck-ThinkPad-P72>
References: <20200320160145.GN3199@paulmck-ThinkPad-P72>
 <87mu8apzxr.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mu8apzxr.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oleg Nesterov <oleg@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Logan Gunthorpe <logang@deltatee.com>,
 Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 20, 2020 at 08:51:44PM +0100, Thomas Gleixner wrote:
> "Paul E. McKenney" <paulmck@kernel.org> writes:
> >
> >  - The soft interrupt related suffix (_bh()) still disables softirq
> >    handlers.  However, unlike non-PREEMPT_RT kernels (which disable
> >    preemption to get this effect), PREEMPT_RT kernels use a per-CPU
> >    lock to exclude softirq handlers.
> 
> I've made that:
> 
>   - The soft interrupt related suffix (_bh()) still disables softirq
>     handlers.
> 
>     Non-PREEMPT_RT kernels disable preemption to get this effect.
> 
>     PREEMPT_RT kernels use a per-CPU lock for serialization. The lock
>     disables softirq handlers and prevents reentrancy by a preempting
>     task.

That works!  At the end, I would instead say "prevents reentrancy
due to task preemption", but what you have works.

> On non-RT this is implicit through preemption disable, but it's non
> obvious for RT as preemption stays enabled.
> 
> > PREEMPT_RT kernels preserve all other spinlock_t semantics:
> >
> >  - Tasks holding a spinlock_t do not migrate.  Non-PREEMPT_RT kernels
> >    avoid migration by disabling preemption.  PREEMPT_RT kernels instead
> >    disable migration, which ensures that pointers to per-CPU variables
> >    remain valid even if the task is preempted.
> >
> >  - Task state is preserved across spinlock acquisition, ensuring that the
> >    task-state rules apply to all kernel configurations.  In non-PREEMPT_RT
> >    kernels leave task state untouched.  However, PREEMPT_RT must change
> >    task state if the task blocks during acquisition.  Therefore, the
> >    corresponding lock wakeup restores the task state.  Note that regular
> >    (not lock related) wakeups do not restore task state.
> 
>    - Task state is preserved across spinlock acquisition, ensuring that the
>      task-state rules apply to all kernel configurations.  Non-PREEMPT_RT
>      kernels leave task state untouched.  However, PREEMPT_RT must change
>      task state if the task blocks during acquisition.  Therefore, it
>      saves the current task state before blocking and the corresponding
>      lock wakeup restores it. A regular not lock related wakeup sets the
>      task state to RUNNING. If this happens while the task is blocked on
>      a spinlock then the saved task state is changed so that correct
>      state is restored on lock wakeup.
> 
> Hmm?

I of course cannot resist editing the last two sentences:

   ... Other types of wakeups unconditionally set task state to RUNNING.
   If this happens while a task is blocked while acquiring a spinlock,
   then the task state is restored to its pre-acquisition value at
   lock-wakeup time.

> > But this code failes on PREEMPT_RT kernels because the memory allocator
> > is fully preemptible and therefore cannot be invoked from truly atomic
> > contexts.  However, it is perfectly fine to invoke the memory allocator
> > while holding a normal non-raw spinlocks because they do not disable
> > preemption::
> >
> >> +  spin_lock(&lock);
> >> +  p = kmalloc(sizeof(*p), GFP_ATOMIC);
> >> +
> >> +Most places which use GFP_ATOMIC allocations are safe on PREEMPT_RT as the
> >> +execution is forced into thread context and the lock substitution is
> >> +ensuring preemptibility.
> >
> > Interestingly enough, most uses of GFP_ATOMIC allocations are
> > actually safe on PREEMPT_RT because the the lock substitution ensures
> > preemptibility.  Only those GFP_ATOMIC allocations that are invoke
> > while holding a raw spinlock or with preemption otherwise disabled need
> > adjustment to work correctly on PREEMPT_RT.
> >
> > [ I am not as confident of the above as I would like to be... ]
> 
> I'd leave that whole paragraph out. This documents the rules and from
> the above code examples it's pretty clear what works and what not :)

Works for me!  ;-)

> > And meeting time, will continue later!
> 
> Enjoy!

Not bad, actually, as meetings go.

							Thanx, Paul
