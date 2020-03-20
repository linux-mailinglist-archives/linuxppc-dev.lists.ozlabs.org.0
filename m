Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA0F18D8C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 20:54:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kZGl1txyzDrdm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 06:54:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kZDg1WLPzF0Tj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 06:52:19 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jFNgI-0002w2-14; Fri, 20 Mar 2020 20:51:46 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 626F61039FC; Fri, 20 Mar 2020 20:51:44 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: paulmck@kernel.org
Subject: Re: [patch V2 08/15] Documentation: Add lock ordering and nesting
 documentation
In-Reply-To: <20200320160145.GN3199@paulmck-ThinkPad-P72>
Date: Fri, 20 Mar 2020 20:51:44 +0100
Message-ID: <87mu8apzxr.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
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

"Paul E. McKenney" <paulmck@kernel.org> writes:
>
>  - The soft interrupt related suffix (_bh()) still disables softirq
>    handlers.  However, unlike non-PREEMPT_RT kernels (which disable
>    preemption to get this effect), PREEMPT_RT kernels use a per-CPU
>    lock to exclude softirq handlers.

I've made that:

  - The soft interrupt related suffix (_bh()) still disables softirq
    handlers.

    Non-PREEMPT_RT kernels disable preemption to get this effect.

    PREEMPT_RT kernels use a per-CPU lock for serialization. The lock
    disables softirq handlers and prevents reentrancy by a preempting
    task.
    
On non-RT this is implicit through preemption disable, but it's non
obvious for RT as preemption stays enabled.

> PREEMPT_RT kernels preserve all other spinlock_t semantics:
>
>  - Tasks holding a spinlock_t do not migrate.  Non-PREEMPT_RT kernels
>    avoid migration by disabling preemption.  PREEMPT_RT kernels instead
>    disable migration, which ensures that pointers to per-CPU variables
>    remain valid even if the task is preempted.
>
>  - Task state is preserved across spinlock acquisition, ensuring that the
>    task-state rules apply to all kernel configurations.  In non-PREEMPT_RT
>    kernels leave task state untouched.  However, PREEMPT_RT must change
>    task state if the task blocks during acquisition.  Therefore, the
>    corresponding lock wakeup restores the task state.  Note that regular
>    (not lock related) wakeups do not restore task state.

   - Task state is preserved across spinlock acquisition, ensuring that the
     task-state rules apply to all kernel configurations.  Non-PREEMPT_RT
     kernels leave task state untouched.  However, PREEMPT_RT must change
     task state if the task blocks during acquisition.  Therefore, it
     saves the current task state before blocking and the corresponding
     lock wakeup restores it. A regular not lock related wakeup sets the
     task state to RUNNING. If this happens while the task is blocked on
     a spinlock then the saved task state is changed so that correct
     state is restored on lock wakeup.

Hmm?

> But this code failes on PREEMPT_RT kernels because the memory allocator
> is fully preemptible and therefore cannot be invoked from truly atomic
> contexts.  However, it is perfectly fine to invoke the memory allocator
> while holding a normal non-raw spinlocks because they do not disable
> preemption::
>
>> +  spin_lock(&lock);
>> +  p = kmalloc(sizeof(*p), GFP_ATOMIC);
>> +
>> +Most places which use GFP_ATOMIC allocations are safe on PREEMPT_RT as the
>> +execution is forced into thread context and the lock substitution is
>> +ensuring preemptibility.
>
> Interestingly enough, most uses of GFP_ATOMIC allocations are
> actually safe on PREEMPT_RT because the the lock substitution ensures
> preemptibility.  Only those GFP_ATOMIC allocations that are invoke
> while holding a raw spinlock or with preemption otherwise disabled need
> adjustment to work correctly on PREEMPT_RT.
>
> [ I am not as confident of the above as I would like to be... ]

I'd leave that whole paragraph out. This documents the rules and from
the above code examples it's pretty clear what works and what not :)

> And meeting time, will continue later!

Enjoy!

Thanks,

        tglx
