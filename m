Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1BC18B3E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 16:09:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450FZj2sXMzDqGb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 00:09:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.com
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=pmladek@suse.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.com
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450FWF5XQXzDqRP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 00:06:15 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9158BAC31;
 Thu,  9 May 2019 14:06:12 +0000 (UTC)
Date: Thu, 9 May 2019 16:06:09 +0200
From: Petr Mladek <pmladek@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
Message-ID: <20190509140609.n44v6kj27wb77jck@pathway.suse.cz>
References: <20190509121923.8339-1-pmladek@suse.com>
 <20190509091357.0af3fcd7@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509091357.0af3fcd7@gandalf.local.home>
User-Agent: NeoMutt/20170912 (1.9.0)
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
Cc: linux-arch@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2019-05-09 09:13:57, Steven Rostedt wrote:
> On Thu,  9 May 2019 14:19:23 +0200
> Petr Mladek <pmladek@suse.com> wrote:
> 
> > The commit 3e5903eb9cff70730 ("vsprintf: Prevent crash when dereferencing
> > invalid pointers") broke boot on several architectures. The common
> > pattern is that probe_kernel_read() is not working during early
> > boot because userspace access framework is not ready.
> > 
> > The check is only the best effort. Let's not rush with it during
> > the early boot.
> > 
> > Details:
> > 
> > 1. Report on Power:
> > 
> > Kernel crashes very early during boot with with CONFIG_PPC_KUAP and
> > CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG
> > 
> > The problem is the combination of some new code called via printk(),
> > check_pointer() which calls probe_kernel_read(). That then calls
> > allow_user_access() (PPC_KUAP) and that uses mmu_has_feature() too early
> > (before we've patched features). With the JUMP_LABEL debug enabled that
> > causes us to call printk() & dump_stack() and we end up recursing and
> > overflowing the stack.
> > 
> > Because it happens so early you don't get any output, just an apparently
> > dead system.
> > 
> > The stack trace (which you don't see) is something like:
> > 
> >   ...
> >   dump_stack+0xdc
> >   probe_kernel_read+0x1a4
> >   check_pointer+0x58
> >   string+0x3c
> >   vsnprintf+0x1bc
> >   vscnprintf+0x20
> >   printk_safe_log_store+0x7c
> >   printk+0x40
> >   dump_stack_print_info+0xbc
> >   dump_stack+0x8
> >   probe_kernel_read+0x1a4
> >   probe_kernel_read+0x19c
> >   check_pointer+0x58
> >   string+0x3c
> >   vsnprintf+0x1bc
> >   vscnprintf+0x20
> >   vprintk_store+0x6c
> >   vprintk_emit+0xec
> >   vprintk_func+0xd4
> >   printk+0x40
> >   cpufeatures_process_feature+0xc8
> >   scan_cpufeatures_subnodes+0x380
> >   of_scan_flat_dt_subnodes+0xb4
> >   dt_cpu_ftrs_scan_callback+0x158
> >   of_scan_flat_dt+0xf0
> >   dt_cpu_ftrs_scan+0x3c
> >   early_init_devtree+0x360
> >   early_setup+0x9c
> > 
> > 2. Report on s390:
> > 
> > vsnprintf invocations, are broken on s390. For example, the early boot
> > output now looks like this where the first (efault) should be
> > the linux_banner:
> > 
> > [    0.099985] (efault)
> > [    0.099985] setup: Linux is running as a z/VM guest operating system in 64-bit mode
> > [    0.100066] setup: The maximum memory size is 8192MB
> > [    0.100070] cma: Reserved 4 MiB at (efault)
> > [    0.100100] numa: NUMA mode: (efault)
> > 
> > The reason for this, is that the code assumes that
> > probe_kernel_address() works very early. This however is not true on
> > at least s390. Uaccess on KERNEL_DS works only after page tables have
> > been setup on s390, which happens with setup_arch()->paging_init().
> > 
> > Any probe_kernel_address() invocation before that will return -EFAULT.
> 
> Hmm, this sounds to me that probe_kernel_address() is broken for these
> architectures. Perhaps the system_state check should be in
> probe_kernel_address() for those architectures?

Yeah. Well, these problems are hard to debug. It left a dead power
system with a blank screen. I am not sure if the added check is
worth the pain.

I hope that the check would help to debug problems. But it is yet
another complexity in printk() path. I think that it is fine
to keep it enabled only on the booted system for a while
and get some more feedback.

Best Regards,
Petr
