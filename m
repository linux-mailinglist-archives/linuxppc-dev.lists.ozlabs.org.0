Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB7019361E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 03:43:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nq713hqgzDqR2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:43:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=gxm3=5l=paulmck-thinkpad-p72.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=hlvpwsdF; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nq3Y2VgHzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 13:40:40 +1100 (AEDT)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F23B020714;
 Thu, 26 Mar 2020 02:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585190438;
 bh=B/0A+EakHUoxJZZH8Zsz0E0Jrwx9AZ5KMhmmm4tWgAU=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=hlvpwsdFfUlivcRX+rgOky3Qzz9W6+h3DS6rDIiFCMTcOVT/UZK7XAVPOw5xlfZmc
 U4gWvMk+HY610Ebp67p0IXeEOlLqhqArE8W38Bn1Pstxz2UMd+wQaxLwVqwPtOGuCa
 LHixNahpVcBZT1S+4QWNrSt9INUA9VsBP8hxz+k8=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id C134335226B0; Wed, 25 Mar 2020 19:40:37 -0700 (PDT)
Date: Wed, 25 Mar 2020 19:40:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Documentation/locking/locktypes: minor copy editor
 fixes
Message-ID: <20200326024037.GJ19865@paulmck-ThinkPad-P72>
References: <20200323025501.GE3199@paulmck-ThinkPad-P72>
 <87r1xhz6qp.fsf@nanos.tec.linutronix.de>
 <20200325002811.GO19865@paulmck-ThinkPad-P72>
 <87wo78y5yy.fsf@nanos.tec.linutronix.de>
 <ac615f36-0b44-408d-aeab-d76e4241add4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac615f36-0b44-408d-aeab-d76e4241add4@infradead.org>
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
Cc: linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, Sebastian Siewior <bigeasy@linutronix.de>,
 Oleg Nesterov <oleg@redhat.com>, Guo Ren <guoren@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, Vincent Chen <deanbo422@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Davidlohr Bueso <dave@stgolabs.net>,
 linux-acpi@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hexagon@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Greentime Hu <green.hu@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 platform-driver-x86@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 kbuild test robot <lkp@intel.com>, Felipe Balbi <balbi@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Nick Hu <nickhu@andestech.com>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Davidlohr Bueso <dbueso@suse.de>, netdev@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 25, 2020 at 09:58:14AM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Minor editorial fixes:
> - add some hyphens in multi-word adjectives
> - add some periods for consistency
> - add "'" for possessive CPU's
> - capitalize IRQ when it's an acronym and not part of a function name
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Paul McKenney <paulmck@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Sebastian Siewior <bigeasy@linutronix.de>
> Cc: Joel Fernandes <joel@joelfernandes.org>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>

Some nits below, but with or without those suggested changes:

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  Documentation/locking/locktypes.rst |   16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> --- linux-next-20200325.orig/Documentation/locking/locktypes.rst
> +++ linux-next-20200325/Documentation/locking/locktypes.rst
> @@ -84,7 +84,7 @@ rtmutex
>  
>  RT-mutexes are mutexes with support for priority inheritance (PI).
>  
> -PI has limitations on non PREEMPT_RT enabled kernels due to preemption and
> +PI has limitations on non-PREEMPT_RT-enabled kernels due to preemption and

Or just drop the " enabled".

>  interrupt disabled sections.
>  
>  PI clearly cannot preempt preemption-disabled or interrupt-disabled
> @@ -150,7 +150,7 @@ kernel configuration including PREEMPT_R
>  
>  raw_spinlock_t is a strict spinning lock implementation in all kernels,
>  including PREEMPT_RT kernels.  Use raw_spinlock_t only in real critical
> -core code, low level interrupt handling and places where disabling
> +core code, low-level interrupt handling and places where disabling
>  preemption or interrupts is required, for example, to safely access
>  hardware state.  raw_spinlock_t can sometimes also be used when the
>  critical section is tiny, thus avoiding RT-mutex overhead.
> @@ -160,20 +160,20 @@ spinlock_t
>  
>  The semantics of spinlock_t change with the state of PREEMPT_RT.
>  
> -On a non PREEMPT_RT enabled kernel spinlock_t is mapped to raw_spinlock_t
> +On a non-PREEMPT_RT-enabled kernel spinlock_t is mapped to raw_spinlock_t

Ditto.

>  and has exactly the same semantics.
>  
>  spinlock_t and PREEMPT_RT
>  -------------------------
>  
> -On a PREEMPT_RT enabled kernel spinlock_t is mapped to a separate
> +On a PREEMPT_RT-enabled kernel spinlock_t is mapped to a separate

And here as well.

>  implementation based on rt_mutex which changes the semantics:
>  
> - - Preemption is not disabled
> + - Preemption is not disabled.
>  
>   - The hard interrupt related suffixes for spin_lock / spin_unlock
> -   operations (_irq, _irqsave / _irqrestore) do not affect the CPUs
> -   interrupt disabled state
> +   operations (_irq, _irqsave / _irqrestore) do not affect the CPU's
> +   interrupt disabled state.
>  
>   - The soft interrupt related suffix (_bh()) still disables softirq
>     handlers.
> @@ -279,7 +279,7 @@ fully preemptible context.  Instead, use
>  spin_lock_irqsave() and their unlock counterparts.  In cases where the
>  interrupt disabling and locking must remain separate, PREEMPT_RT offers a
>  local_lock mechanism.  Acquiring the local_lock pins the task to a CPU,
> -allowing things like per-CPU irq-disabled locks to be acquired.  However,
> +allowing things like per-CPU IRQ-disabled locks to be acquired.  However,

Quite a bit of text in the kernel uses "irq", lower case.  Another
option is to spell out "interrupt".

>  this approach should be used only where absolutely necessary.
>  
>  
> 
