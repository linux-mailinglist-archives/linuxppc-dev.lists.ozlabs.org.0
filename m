Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE09418C998
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 10:09:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kHzM0HDwzDrPh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 20:09:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=stgolabs.net (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stgolabs.net
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kHpf0CM6zDrNB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 20:02:18 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 60CA0AECE;
 Fri, 20 Mar 2020 09:02:12 +0000 (UTC)
Date: Fri, 20 Mar 2020 02:01:06 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 11/15] completion: Use simple wait queues
Message-ID: <20200320090106.6p2lwqvs4jedhvds@linux-p48b>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.521507446@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200318204408.521507446@linutronix.de>
User-Agent: NeoMutt/20180716
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

On Wed, 18 Mar 2020, Thomas Gleixner wrote:

>From: Thomas Gleixner <tglx@linutronix.de>
>
>completion uses a wait_queue_head_t to enqueue waiters.
>
>wait_queue_head_t contains a spinlock_t to protect the list of waiters
>which excludes it from being used in truly atomic context on a PREEMPT_RT
>enabled kernel.
>
>The spinlock in the wait queue head cannot be replaced by a raw_spinlock
>because:
>
>  - wait queues can have custom wakeup callbacks, which acquire other
>    spinlock_t locks and have potentially long execution times
>
>  - wake_up() walks an unbounded number of list entries during the wake up
>    and may wake an unbounded number of waiters.
>
>For simplicity and performance reasons complete() should be usable on
>PREEMPT_RT enabled kernels.
>
>completions do not use custom wakeup callbacks and are usually single
>waiter, except for a few corner cases.
>
>Replace the wait queue in the completion with a simple wait queue (swait),
>which uses a raw_spinlock_t for protecting the waiter list and therefore is
>safe to use inside truly atomic regions on PREEMPT_RT.
>
>There is no semantical or functional change:
>
>  - completions use the exclusive wait mode which is what swait provides
>
>  - complete() wakes one exclusive waiter
>
>  - complete_all() wakes all waiters while holding the lock which protects
>    the wait queue against newly incoming waiters. The conversion to swait
>    preserves this behaviour.
>
>complete_all() might cause unbound latencies with a large number of waiters
>being woken at once, but most complete_all() usage sites are either in
>testing or initialization code or have only a really small number of
>concurrent waiters which for now does not cause a latency problem. Keep it
>simple for now.
>
>The fixup of the warning check in the USB gadget driver is just a straight
>forward conversion of the lockless waiter check from one waitqueue type to
>the other.
>
>Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>Cc: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Davidlohr Bueso <dbueso@suse.de>
