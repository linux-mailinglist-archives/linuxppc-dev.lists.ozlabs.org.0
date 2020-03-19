Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 124EA18BB03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 16:24:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jrKk75bJzDrBq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 02:24:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net
 (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwn.net
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jqv52s08zDqG6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 02:04:32 +1100 (AEDT)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id DB45F384;
 Thu, 19 Mar 2020 15:04:27 +0000 (UTC)
Date: Thu, 19 Mar 2020 09:04:26 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 08/15] Documentation: Add lock ordering and nesting
 documentation
Message-ID: <20200319090426.512510cb@lwn.net>
In-Reply-To: <20200318204408.211530902@linutronix.de>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.211530902@linutronix.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
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
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, linuxppc-dev@lists.ozlabs.org,
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

On Wed, 18 Mar 2020 21:43:10 +0100
Thomas Gleixner <tglx@linutronix.de> wrote:

> From: Thomas Gleixner <tglx@linutronix.de>
> 
> The kernel provides a variety of locking primitives. The nesting of these
> lock types and the implications of them on RT enabled kernels is nowhere
> documented.
> 
> Add initial documentation.

...time to add a a couple of nits...:)

> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V2: Addressed review comments from Randy
> ---
>  Documentation/locking/index.rst     |    1 
>  Documentation/locking/locktypes.rst |  298 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 299 insertions(+)
>  create mode 100644 Documentation/locking/locktypes.rst
> 
> --- a/Documentation/locking/index.rst
> +++ b/Documentation/locking/index.rst
> @@ -7,6 +7,7 @@ locking
>  .. toctree::
>      :maxdepth: 1
>  
> +    locktypes
>      lockdep-design
>      lockstat
>      locktorture
> --- /dev/null
> +++ b/Documentation/locking/locktypes.rst
> @@ -0,0 +1,298 @@
> +.. _kernel_hacking_locktypes:
> +

So ... I vaguely remember that some Thomas guy added a document saying we
should be putting SPDX tags on our files? :)

> +==========================
> +Lock types and their rules
> +==========================

[...]

> +PREEMPT_RT caveats
> +==================
> +
> +spinlock_t and rwlock_t
> +-----------------------
> +
> +The substitution of spinlock_t and rwlock_t on PREEMPT_RT enabled kernels
> +with RT-mutex based implementations has a few implications.
> +
> +On a non PREEMPT_RT enabled kernel the following code construct is
> +perfectly fine::
> +
> +   local_irq_disable();
> +   spin_lock(&lock);
> +
> +and fully equivalent to::
> +
> +   spin_lock_irq(&lock);
> +
> +Same applies to rwlock_t and the _irqsave() suffix variant.
> +
> +On a PREEMPT_RT enabled kernel this breaks because the RT-mutex
> +substitution expects a fully preemptible context.
> +
> +The preferred solution is to use :c:func:`spin_lock_irq()` or
> +:c:func:`spin_lock_irqsave()` and their unlock counterparts.

We don't need (and shouldn't use) :c:func: anymore; just saying
spin_lock_irq() will cause the Right Things to happen.

Thanks,
jon
