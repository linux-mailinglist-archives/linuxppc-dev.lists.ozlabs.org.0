Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBF4199D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 10:43:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450kJG5xVTzDqVC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 18:43:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 450kH30PD3zDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 18:42:20 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D6C62AF24;
 Fri, 10 May 2019 08:42:17 +0000 (UTC)
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] vsprintf: Do not break early boot with probing addresses
Date: Fri, 10 May 2019 10:42:13 +0200
Message-Id: <20190510084213.22149-1-pmladek@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190510081635.GA4533@jagdpanzerIV>
References: <20190510081635.GA4533@jagdpanzerIV>
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stephen Rothwell <sfr@ozlabs.org>, Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit 3e5903eb9cff70730 ("vsprintf: Prevent crash when dereferencing
invalid pointers") broke boot on several architectures. The common
pattern is that probe_kernel_read() is not working during early
boot because userspace access framework is not ready.

It is a generic problem. We have to avoid any complex external
functions in vsprintf() code, especially in the common path.
They might break printk() easily and are hard to debug.

Replace probe_kernel_read() with some simple checks for obvious
problems.

Details:

1. Report on Power:

Kernel crashes very early during boot with with CONFIG_PPC_KUAP and
CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG

The problem is the combination of some new code called via printk(),
check_pointer() which calls probe_kernel_read(). That then calls
allow_user_access() (PPC_KUAP) and that uses mmu_has_feature() too early
(before we've patched features). With the JUMP_LABEL debug enabled that
causes us to call printk() & dump_stack() and we end up recursing and
overflowing the stack.

Because it happens so early you don't get any output, just an apparently
dead system.

The stack trace (which you don't see) is something like:

  ...
  dump_stack+0xdc
  probe_kernel_read+0x1a4
  check_pointer+0x58
  string+0x3c
  vsnprintf+0x1bc
  vscnprintf+0x20
  printk_safe_log_store+0x7c
  printk+0x40
  dump_stack_print_info+0xbc
  dump_stack+0x8
  probe_kernel_read+0x1a4
  probe_kernel_read+0x19c
  check_pointer+0x58
  string+0x3c
  vsnprintf+0x1bc
  vscnprintf+0x20
  vprintk_store+0x6c
  vprintk_emit+0xec
  vprintk_func+0xd4
  printk+0x40
  cpufeatures_process_feature+0xc8
  scan_cpufeatures_subnodes+0x380
  of_scan_flat_dt_subnodes+0xb4
  dt_cpu_ftrs_scan_callback+0x158
  of_scan_flat_dt+0xf0
  dt_cpu_ftrs_scan+0x3c
  early_init_devtree+0x360
  early_setup+0x9c

2. Report on s390:

vsnprintf invocations, are broken on s390. For example, the early boot
output now looks like this where the first (efault) should be
the linux_banner:

[    0.099985] (efault)
[    0.099985] setup: Linux is running as a z/VM guest operating system in 64-bit mode
[    0.100066] setup: The maximum memory size is 8192MB
[    0.100070] cma: Reserved 4 MiB at (efault)
[    0.100100] numa: NUMA mode: (efault)

The reason for this, is that the code assumes that
probe_kernel_address() works very early. This however is not true on
at least s390. Uaccess on KERNEL_DS works only after page tables have
been setup on s390, which happens with setup_arch()->paging_init().

Any probe_kernel_address() invocation before that will return -EFAULT.

Fixes: 3e5903eb9cff70730 ("vsprintf: Prevent crash when dereferencing invalid pointers")
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 lib/vsprintf.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 7b0a6140bfad..2f003cfe340e 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -628,19 +628,16 @@ static char *error_string(char *buf, char *end, const char *s,
 }
 
 /*
- * This is not a fool-proof test. 99% of the time that this will fault is
- * due to a bad pointer, not one that crosses into bad memory. Just test
- * the address to make sure it doesn't fault due to a poorly added printk
- * during debugging.
+ * Do not call any complex external code here. Nested printk()/vsprintf()
+ * might cause infinite loops. Failures might break printk() and would
+ * be hard to debug.
  */
 static const char *check_pointer_msg(const void *ptr)
 {
-	char byte;
-
 	if (!ptr)
 		return "(null)";
 
-	if (probe_kernel_address(ptr, byte))
+	if ((unsigned long)ptr < PAGE_SIZE || IS_ERR_VALUE(ptr))
 		return "(efault)";
 
 	return NULL;
-- 
2.16.4

