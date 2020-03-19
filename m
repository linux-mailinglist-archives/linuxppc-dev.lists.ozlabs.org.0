Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00118A9F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 01:46:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jSs65RzPzDr43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 11:46:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jSqJ2mg9zDqmJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 11:45:00 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jEjIR-0005E3-Fd; Thu, 19 Mar 2020 01:44:27 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id CFC0A103088; Thu, 19 Mar 2020 01:44:26 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [patch V2 11/15] completion: Use simple wait queues
In-Reply-To: <20200319003351.GA211584@google.com>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.521507446@linutronix.de> <20200319003351.GA211584@google.com>
Date: Thu, 19 Mar 2020 01:44:26 +0100
Message-ID: <87a74ddvh1.fsf@nanos.tec.linutronix.de>
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
 "Paul E . McKenney" <paulmck@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel,

Joel Fernandes <joel@joelfernandes.org> writes:
> On Wed, Mar 18, 2020 at 09:43:13PM +0100, Thomas Gleixner wrote:
>> The spinlock in the wait queue head cannot be replaced by a raw_spinlock
>> because:
>> 
>>   - wait queues can have custom wakeup callbacks, which acquire other
>>     spinlock_t locks and have potentially long execution times
>
> Cool, makes sense.
>
>>   - wake_up() walks an unbounded number of list entries during the wake up
>>     and may wake an unbounded number of waiters.
>
> Just to clarify here, wake_up() will really wake up just 1 waiter if all the
> waiters on the queue are exclusive right? So in such scenario at least, the
> "unbounded number of waiters" would not be an issue if everything waiting was
> exclusive and waitqueue with wake_up() was used. Please correct me if I'm
> wrong about that though.

Correct.

> So the main reasons to avoid waitqueue in favor of swait (as you mentioned)
> would be the sleep-while-atomic issue in truly atomic context on RT, and the
> fact that callbacks can take a long time.

Yes.

Thanks,

        tglx

