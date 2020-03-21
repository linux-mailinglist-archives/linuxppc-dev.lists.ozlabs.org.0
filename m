Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A80F18E4D8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 22:51:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lDqM1Y4rzDrhQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 08:51:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lDnX3FRpzDrfW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 08:49:36 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jFlzN-0001VX-Ok; Sat, 21 Mar 2020 22:49:06 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id C8A961040D5; Sat, 21 Mar 2020 22:49:04 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [patch V2 08/15] Documentation: Add lock ordering and nesting
 documentation
In-Reply-To: <20200321212144.GA6475@google.com>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.211530902@linutronix.de> <20200321212144.GA6475@google.com>
Date: Sat, 21 Mar 2020 22:49:04 +0100
Message-ID: <874kuhqsz3.fsf@nanos.tec.linutronix.de>
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
 Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Arnd Bergmann <arnd@arndb.de>, Logan Gunthorpe <logang@deltatee.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linuxppc-dev@lists.ozlabs.org,
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

Joel Fernandes <joel@joelfernandes.org> writes:
>> +rwlock_t
>> +========
>> +
>> +rwlock_t is a multiple readers and single writer lock mechanism.
>> +
>> +On a non PREEMPT_RT enabled kernel rwlock_t is implemented as a spinning
>> +lock and the suffix rules of spinlock_t apply accordingly. The
>> +implementation is fair and prevents writer starvation.
>>
>
> You mentioned writer starvation, but I think it would be good to also mention
> that rwlock_t on a non-PREEMPT_RT kernel also does not have _reader_
> starvation problem, since it uses queued implementation.  This fact is worth
> mentioning here, since further below you explain that an rwlock in PREEMPT_RT
> does have reader starvation problem.

It's worth mentioning. But RT really has only write starvation not
reader starvation.

>> +rwlock_t and PREEMPT_RT
>> +-----------------------
>> +
>> +On a PREEMPT_RT enabled kernel rwlock_t is mapped to a separate
>> +implementation based on rt_mutex which changes the semantics:
>> +
>> + - Same changes as for spinlock_t
>> +
>> + - The implementation is not fair and can cause writer starvation under
>> +   certain circumstances. The reason for this is that a writer cannot grant
>> +   its priority to multiple readers. Readers which are blocked on a writer
>> +   fully support the priority inheritance protocol.
>
> Is it hard to give priority to multiple readers because the number of readers
> to give priority to could be unbounded?

Yes, and it's horribly complex and racy. We had an implemetation years
ago which taught us not to try it again :)

>> +PREEMPT_RT also offers a local_lock mechanism to substitute the
>> +local_irq_disable/save() constructs in cases where a separation of the
>> +interrupt disabling and the locking is really unavoidable. This should be
>> +restricted to very rare cases.
>
> It would also be nice to mention where else local_lock() can be used, such as
> protecting per-cpu variables without disabling preemption. Could we add a
> section on protecting per-cpu data? (Happy to do that and send a patch if you
> prefer).

The local lock section will come soon when we post the local lock
patches again.

>> +rwsems have grown interfaces which allow non owner release for special
>> +purposes. This usage is problematic on PREEMPT_RT because PREEMPT_RT
>> +substitutes all locking primitives except semaphores with RT-mutex based
>> +implementations to provide priority inheritance for all lock types except
>> +the truly spinning ones. Priority inheritance on ownerless locks is
>> +obviously impossible.
>> +
>> +For now the rwsem non-owner release excludes code which utilizes it from
>> +being used on PREEMPT_RT enabled kernels.
>
> I could not parse the last sentence here, but I think you meant "For now,
> PREEMPT_RT enabled kernels disable code that perform a non-owner release of
> an rwsem". Correct me if I'm wrong.

Right, that's what I wanted to say :)

Care to send a delta patch?

Thanks!

        tglx
