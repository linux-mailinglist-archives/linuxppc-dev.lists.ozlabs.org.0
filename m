Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2A818BEF9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 19:05:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jvvN2vdczDrP2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 05:05:04 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jvrh4phszDrN4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 05:02:44 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jEzUo-0006uF-9W; Thu, 19 Mar 2020 19:02:18 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 8F6F8103088; Thu, 19 Mar 2020 19:02:17 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: paulmck@kernel.org
Subject: Re: [patch V2 08/15] Documentation: Add lock ordering and nesting
 documentation
In-Reply-To: <20200318223137.GW3199@paulmck-ThinkPad-P72>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.211530902@linutronix.de>
 <20200318223137.GW3199@paulmck-ThinkPad-P72>
Date: Thu, 19 Mar 2020 19:02:17 +0100
Message-ID: <874kuk5il2.fsf@nanos.tec.linutronix.de>
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

Paul,

"Paul E. McKenney" <paulmck@kernel.org> writes:

> On Wed, Mar 18, 2020 at 09:43:10PM +0100, Thomas Gleixner wrote:
>
> Mostly native-English-speaker services below, so please feel free to
> ignore.  The one place I made a substantive change, I marked it "@@@".
> I only did about half of this document, but should this prove useful,
> I will do the other half later.

Native speaker services are always useful and appreciated.

>> +The kernel provides a variety of locking primitives which can be divided
>> +into two categories:
>> +
>> + - Sleeping locks
>> + - Spinning locks
>> +
>> +This document describes the lock types at least at the conceptual level and
>> +provides rules for nesting of lock types also under the aspect of PREEMPT_RT.
>
> I suggest something like this:
>
> This document conceptually describes these lock types and provides rules
> for their nesting, including the rules for use under PREEMPT_RT.

Way better :)

>> +Sleeping locks can only be acquired in preemptible task context.
>> +
>> +Some of the implementations allow try_lock() attempts from other contexts,
>> +but that has to be really evaluated carefully including the question
>> +whether the unlock can be done from that context safely as well.
>> +
>> +Note that some lock types change their implementation details when
>> +debugging is enabled, so this should be really only considered if there is
>> +no other option.
>
> How about something like this?
>
> Although implementations allow try_lock() from other contexts, it is
> necessary to carefully evaluate the safety of unlock() as well as of
> try_lock().  Furthermore, it is also necessary to evaluate the debugging
> versions of these primitives.  In short, don't acquire sleeping locks
> from other contexts unless there is no other option.

Yup.

>> +Sleeping lock types:
>> +
>> + - mutex
>> + - rt_mutex
>> + - semaphore
>> + - rw_semaphore
>> + - ww_mutex
>> + - percpu_rw_semaphore
>> +
>> +On a PREEMPT_RT enabled kernel the following lock types are converted to
>> +sleeping locks:
>
> On PREEMPT_RT kernels, these lock types are converted to sleeping
> locks:

Ok.

>> + - spinlock_t
>> + - rwlock_t
>> +
>> +Spinning locks
>> +--------------
>> +
>> + - raw_spinlock_t
>> + - bit spinlocks
>> +
>> +On a non PREEMPT_RT enabled kernel the following lock types are spinning
>> +locks as well:
>
> On non-PREEMPT_RT kernels, these lock types are also spinning locks:

Ok.

>> + - spinlock_t
>> + - rwlock_t
>> +
>> +Spinning locks implicitly disable preemption and the lock / unlock functions
>> +can have suffixes which apply further protections:
>> +
>> + ===================  ====================================================
>> + _bh()                Disable / enable bottom halves (soft interrupts)
>> + _irq()               Disable / enable interrupts
>> + _irqsave/restore()   Save and disable / restore interrupt disabled state
>> + ===================  ====================================================
>> +
>> +
>> +rtmutex
>> +=======
>> +
>> +RT-mutexes are mutexes with support for priority inheritance (PI).
>> +
>> +PI has limitations on non PREEMPT_RT enabled kernels due to preemption and
>> +interrupt disabled sections.
>> +
>> +On a PREEMPT_RT enabled kernel most of these sections are fully
>> +preemptible. This is possible because PREEMPT_RT forces most executions
>> +into task context, especially interrupt handlers and soft interrupts, which
>> +allows to substitute spinlock_t and rwlock_t with RT-mutex based
>> +implementations.
>
> PI clearly cannot preempt preemption-disabled or interrupt-disabled
> regions of code, even on PREEMPT_RT kernels.  Instead, PREEMPT_RT kernels
> execute most such regions of code in preemptible task context, especially
> interrupt handlers and soft interrupts.  This conversion allows spinlock_t
> and rwlock_t to be implemented via RT-mutexes.

Nice.

>> +
>> +raw_spinlock_t and spinlock_t
>> +=============================
>> +
>> +raw_spinlock_t
>> +--------------
>> +
>> +raw_spinlock_t is a strict spinning lock implementation regardless of the
>> +kernel configuration including PREEMPT_RT enabled kernels.
>> +
>> +raw_spinlock_t is to be used only in real critical core code, low level
>> +interrupt handling and places where protecting (hardware) state is required
>> +to be safe against preemption and eventually interrupts.
>> +
>> +Another reason to use raw_spinlock_t is when the critical section is tiny
>> +to avoid the overhead of spinlock_t on a PREEMPT_RT enabled kernel in the
>> +contended case.
>
> raw_spinlock_t is a strict spinning lock implementation in all kernels,
> including PREEMPT_RT kernels.  Use raw_spinlock_t only in real critical
> core code, low level interrupt handling and places where disabling
> preemption or interrupts is required, for example, to safely access
> hardware state.  raw_spinlock_t can sometimes also be used when the
> critical section is tiny and the lock is lightly contended, thus avoiding
> RT-mutex overhead.
>
> @@@  I added the point about the lock being lightly contended.

Hmm, not sure. The point is that if the critical section is small the
overhead of cross CPU boosting along with the resulting IPIs is going to
be at least an order of magnitude larger. And on contention this is just
pushing the raw_spinlock contention off to the raw_spinlock in the rt
mutex plus the owning tasks pi_lock which makes things even worse.

>> + - The hard interrupt related suffixes for spin_lock / spin_unlock
>> +   operations (_irq, _irqsave / _irqrestore) do not affect the CPUs
>                                                                   CPU's

Si senor!

>> +   interrupt disabled state
>> +
>> + - The soft interrupt related suffix (_bh()) is still disabling the
>> +   execution of soft interrupts, but contrary to a non PREEMPT_RT enabled
>> +   kernel, which utilizes the preemption count, this is achieved by a per
>> +   CPU bottom half locking mechanism.
>
>  - The soft interrupt related suffix (_bh()) still disables softirq
>    handlers.  However, unlike non-PREEMPT_RT kernels (which disable
>    preemption to get this effect), PREEMPT_RT kernels use a per-CPU
>    per-bottom-half locking mechanism.

it's not per-bottom-half anymore. That turned out to be dangerous due to
dependencies between BH types, e.g. network and timers.

I hope I was able to encourage you to comment on the other half as well :)

Thanks,

        tglx
