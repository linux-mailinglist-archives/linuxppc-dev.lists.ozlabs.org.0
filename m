Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADBF18CB07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 11:01:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kK6x18X8zDrML
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 21:01:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kJs06vMwzDrdV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 20:49:24 +1100 (AEDT)
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1jFEH2-0000vL-Rg; Fri, 20 Mar 2020 10:49:04 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: tglx@linutronix.de
Subject: [PATCH 4/5] ia64: Remove mm.h from asm/uaccess.h
Date: Fri, 20 Mar 2020 10:48:55 +0100
Message-Id: <20200320094856.3453859-5-bigeasy@linutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200320094856.3453859-1-bigeasy@linutronix.de>
References: <20200318204408.010461877@linutronix.de>
 <20200320094856.3453859-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: rdunlap@infradead.org, linux-ia64@vger.kernel.org, peterz@infradead.org,
 linux-pci@vger.kernel.org, bigeasy@linutronix.de, linux-kernel@vger.kernel.org,
 joel@joelfernandes.org, will@kernel.org, mingo@kernel.org, dave@stgolabs.net,
 arnd@arndb.de, torvalds@linux-foundation.org,
 Fenghua Yu <fenghua.yu@intel.com>, paulmck@kernel.org,
 linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, bhelgaas@google.com,
 kurt.schwemmer@microsemi.com, kvalo@codeaurora.org,
 kbuild test robot <lkp@intel.com>, balbi@kernel.org,
 Tony Luck <tony.luck@intel.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, oleg@redhat.com,
 netdev@vger.kernel.org, logang@deltatee.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The defconfig compiles without linux/mm.h. With mm.h included the
include chain leands to:
|   CC      kernel/locking/percpu-rwsem.o
| In file included from include/linux/huge_mm.h:8,
|                  from include/linux/mm.h:567,
|                  from arch/ia64/include/asm/uaccess.h:,
|                  from include/linux/uaccess.h:11,
|                  from include/linux/sched/task.h:11,
|                  from include/linux/sched/signal.h:9,
|                  from include/linux/rcuwait.h:6,
|                  from include/linux/percpu-rwsem.h:8,
|                  from kernel/locking/percpu-rwsem.c:6:
| include/linux/fs.h:1422:29: error: array type has incomplete element type=
 'struct percpu_rw_semaphore'
|  1422 |  struct percpu_rw_semaphore rw_sem[SB_FREEZE_LEVELS];

once rcuwait.h includes linux/sched/signal.h.

Remove the linux/mm.h include.

Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: linux-ia64@vger.kernel.org
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/ia64/include/asm/uaccess.h | 1 -
 arch/ia64/kernel/process.c      | 1 +
 arch/ia64/mm/ioremap.c          | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/ia64/include/asm/uaccess.h b/arch/ia64/include/asm/uacces=
s.h
index 89782ad3fb887..5c7e79eccaeed 100644
--- a/arch/ia64/include/asm/uaccess.h
+++ b/arch/ia64/include/asm/uaccess.h
@@ -35,7 +35,6 @@
=20
 #include <linux/compiler.h>
 #include <linux/page-flags.h>
-#include <linux/mm.h>
=20
 #include <asm/intrinsics.h>
 #include <asm/pgtable.h>
diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index 968b5f33e725e..743aaf5283278 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -681,3 +681,4 @@ machine_power_off (void)
 	machine_halt();
 }
=20
+EXPORT_SYMBOL(ia64_delay_loop);
diff --git a/arch/ia64/mm/ioremap.c b/arch/ia64/mm/ioremap.c
index a09cfa0645369..55fd3eb753ff9 100644
--- a/arch/ia64/mm/ioremap.c
+++ b/arch/ia64/mm/ioremap.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/efi.h>
 #include <linux/io.h>
+#include <linux/mm.h>
 #include <linux/vmalloc.h>
 #include <asm/io.h>
 #include <asm/meminit.h>
--=20
2.26.0.rc2

