Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DD518AE8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 09:45:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jgV73TFkzDrHp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 19:45:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=tziaOs8n; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jgQd0LKNzDrCC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 19:42:49 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9125A20724;
 Thu, 19 Mar 2020 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584607367;
 bh=bc6Fify+38nZAY3Cia1aV1OdCk4gn2q4y8vjHO0jHQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tziaOs8nF6qC2ZxtPxDt+NdfWpIrzDmvKzsswJgbGZoj8i6PseYVNTHnVQCWhF3l7
 BlaCfZEzl2+/751CB3Sz2r9W2tBaPF/Ha6955QYPrXbnsfvJrB3QDPo2+ZfG4d0stK
 TebhEBXc4YrP7M09KzptbT9OYlt0nFKptulOurBg=
Date: Thu, 19 Mar 2020 09:42:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 11/15] completion: Use simple wait queues
Message-ID: <20200319084244.GC3492783@kroah.com>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.521507446@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318204408.521507446@linutronix.de>
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
 Davidlohr Bueso <dave@stgolabs.net>, "Paul E . McKenney" <paulmck@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 18, 2020 at 09:43:13PM +0100, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> completion uses a wait_queue_head_t to enqueue waiters.
> 
> wait_queue_head_t contains a spinlock_t to protect the list of waiters
> which excludes it from being used in truly atomic context on a PREEMPT_RT
> enabled kernel.
> 
> The spinlock in the wait queue head cannot be replaced by a raw_spinlock
> because:
> 
>   - wait queues can have custom wakeup callbacks, which acquire other
>     spinlock_t locks and have potentially long execution times
> 
>   - wake_up() walks an unbounded number of list entries during the wake up
>     and may wake an unbounded number of waiters.
> 
> For simplicity and performance reasons complete() should be usable on
> PREEMPT_RT enabled kernels.
> 
> completions do not use custom wakeup callbacks and are usually single
> waiter, except for a few corner cases.
> 
> Replace the wait queue in the completion with a simple wait queue (swait),
> which uses a raw_spinlock_t for protecting the waiter list and therefore is
> safe to use inside truly atomic regions on PREEMPT_RT.
> 
> There is no semantical or functional change:
> 
>   - completions use the exclusive wait mode which is what swait provides
> 
>   - complete() wakes one exclusive waiter
> 
>   - complete_all() wakes all waiters while holding the lock which protects
>     the wait queue against newly incoming waiters. The conversion to swait
>     preserves this behaviour.
> 
> complete_all() might cause unbound latencies with a large number of waiters
> being woken at once, but most complete_all() usage sites are either in
> testing or initialization code or have only a really small number of
> concurrent waiters which for now does not cause a latency problem. Keep it
> simple for now.
> 
> The fixup of the warning check in the USB gadget driver is just a straight
> forward conversion of the lockless waiter check from one waitqueue type to
> the other.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
> V2: Split out the orinoco and usb gadget parts and amended change log
> ---
>  drivers/usb/gadget/function/f_fs.c |    2 +-
>  include/linux/completion.h         |    8 ++++----
>  kernel/sched/completion.c          |   36 +++++++++++++++++++-----------------
>  3 files changed, 24 insertions(+), 22 deletions(-)

For USB portion:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
