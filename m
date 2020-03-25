Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0142192ED4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 18:00:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nZ9W0lPQzDqTG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 03:59:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=Ny0TO9lE; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nZ7l29YpzDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 03:58:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=nzNtddxyHToIfzwzcRpU+rkJvFePaVcVMvDxhJ0zIm8=; b=Ny0TO9lEhbmvUL2PtdSbl/e3Gm
 dLHrOkD5v8ewIwjLPXGarl7V5+K4iXFzHb2IblMXtRLy0e1xYPfEYd/TNMgeQMms4qdMS3GnsSBzh
 MG4FkMj0CmZIJdF594Ere7tUatW2cpHFY1FN56RNDDvW3fQmt0gVnStPqemN2Xr9H/2N8GLHIr5Wg
 jCmOaOYFpQoZFzr/LNFj0CHFygyAwaMnjmIJLMM/2ZdRTd590pAvjPj/dIFmu4oG/94o0FTc9L0qs
 q8JUj6IqIVy73yedpWdJ2Myuil5rim24S7yVdJXA5SxDwBhAKySclpEAQs+h4mmF+uJG1N1o3ZfNM
 CTBQSfOQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH9M9-0002V3-KT; Wed, 25 Mar 2020 16:58:17 +0000
Subject: [PATCH v2] Documentation/locking/locktypes: minor copy editor fixes
To: Thomas Gleixner <tglx@linutronix.de>, paulmck@kernel.org
References: <20200323025501.GE3199@paulmck-ThinkPad-P72>
 <87r1xhz6qp.fsf@nanos.tec.linutronix.de>
 <20200325002811.GO19865@paulmck-ThinkPad-P72>
 <87wo78y5yy.fsf@nanos.tec.linutronix.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ac615f36-0b44-408d-aeab-d76e4241add4@infradead.org>
Date: Wed, 25 Mar 2020 09:58:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87wo78y5yy.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, Sebastian Siewior <bigeasy@linutronix.de>,
 Oleg Nesterov <oleg@redhat.com>, Guo Ren <guoren@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 linux-acpi@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hexagon@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
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
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Davidlohr Bueso <dbueso@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Randy Dunlap <rdunlap@infradead.org>

Minor editorial fixes:
- add some hyphens in multi-word adjectives
- add some periods for consistency
- add "'" for possessive CPU's
- capitalize IRQ when it's an acronym and not part of a function name

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Paul McKenney <paulmck@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Sebastian Siewior <bigeasy@linutronix.de>
Cc: Joel Fernandes <joel@joelfernandes.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 Documentation/locking/locktypes.rst |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--- linux-next-20200325.orig/Documentation/locking/locktypes.rst
+++ linux-next-20200325/Documentation/locking/locktypes.rst
@@ -84,7 +84,7 @@ rtmutex
 
 RT-mutexes are mutexes with support for priority inheritance (PI).
 
-PI has limitations on non PREEMPT_RT enabled kernels due to preemption and
+PI has limitations on non-PREEMPT_RT-enabled kernels due to preemption and
 interrupt disabled sections.
 
 PI clearly cannot preempt preemption-disabled or interrupt-disabled
@@ -150,7 +150,7 @@ kernel configuration including PREEMPT_R
 
 raw_spinlock_t is a strict spinning lock implementation in all kernels,
 including PREEMPT_RT kernels.  Use raw_spinlock_t only in real critical
-core code, low level interrupt handling and places where disabling
+core code, low-level interrupt handling and places where disabling
 preemption or interrupts is required, for example, to safely access
 hardware state.  raw_spinlock_t can sometimes also be used when the
 critical section is tiny, thus avoiding RT-mutex overhead.
@@ -160,20 +160,20 @@ spinlock_t
 
 The semantics of spinlock_t change with the state of PREEMPT_RT.
 
-On a non PREEMPT_RT enabled kernel spinlock_t is mapped to raw_spinlock_t
+On a non-PREEMPT_RT-enabled kernel spinlock_t is mapped to raw_spinlock_t
 and has exactly the same semantics.
 
 spinlock_t and PREEMPT_RT
 -------------------------
 
-On a PREEMPT_RT enabled kernel spinlock_t is mapped to a separate
+On a PREEMPT_RT-enabled kernel spinlock_t is mapped to a separate
 implementation based on rt_mutex which changes the semantics:
 
- - Preemption is not disabled
+ - Preemption is not disabled.
 
  - The hard interrupt related suffixes for spin_lock / spin_unlock
-   operations (_irq, _irqsave / _irqrestore) do not affect the CPUs
-   interrupt disabled state
+   operations (_irq, _irqsave / _irqrestore) do not affect the CPU's
+   interrupt disabled state.
 
  - The soft interrupt related suffix (_bh()) still disables softirq
    handlers.
@@ -279,7 +279,7 @@ fully preemptible context.  Instead, use
 spin_lock_irqsave() and their unlock counterparts.  In cases where the
 interrupt disabling and locking must remain separate, PREEMPT_RT offers a
 local_lock mechanism.  Acquiring the local_lock pins the task to a CPU,
-allowing things like per-CPU irq-disabled locks to be acquired.  However,
+allowing things like per-CPU IRQ-disabled locks to be acquired.  However,
 this approach should be used only where absolutely necessary.
 
 

