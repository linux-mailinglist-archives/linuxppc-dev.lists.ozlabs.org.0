Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515E18CAF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 10:58:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kK3q4N97zDrH8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 20:58:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kJrw0ljzzDrcC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 20:49:19 +1100 (AEDT)
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1jFEH0-0000vL-Ur; Fri, 20 Mar 2020 10:49:03 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: tglx@linutronix.de
Subject: [PATCH 1/5] nds32: Remove mm.h from asm/uaccess.h
Date: Fri, 20 Mar 2020 10:48:52 +0100
Message-Id: <20200320094856.3453859-2-bigeasy@linutronix.de>
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
Cc: rdunlap@infradead.org, peterz@infradead.org, linux-pci@vger.kernel.org,
 bigeasy@linutronix.de, linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 Vincent Chen <deanbo422@gmail.com>, will@kernel.org, mingo@kernel.org,
 dave@stgolabs.net, arnd@arndb.de, torvalds@linux-foundation.org,
 paulmck@kernel.org, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org,
 Greentime Hu <green.hu@gmail.com>, bhelgaas@google.com,
 kurt.schwemmer@microsemi.com, kvalo@codeaurora.org,
 kbuild test robot <lkp@intel.com>, balbi@kernel.org,
 Nick Hu <nickhu@andestech.com>, gregkh@linuxfoundation.org,
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
|                  from arch/nds32/include/asm/uaccess.h:,
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

Cc: Nick Hu <nickhu@andestech.com>
Cc: Greentime Hu <green.hu@gmail.com>
Cc: Vincent Chen <deanbo422@gmail.com>
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/nds32/include/asm/uaccess.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/nds32/include/asm/uaccess.h b/arch/nds32/include/asm/uacc=
ess.h
index 8916ad9f9f139..3a9219f53ee0d 100644
--- a/arch/nds32/include/asm/uaccess.h
+++ b/arch/nds32/include/asm/uaccess.h
@@ -11,7 +11,6 @@
 #include <asm/errno.h>
 #include <asm/memory.h>
 #include <asm/types.h>
-#include <linux/mm.h>
=20
 #define __asmeq(x, y)  ".ifnc " x "," y " ; .err ; .endif\n\t"
=20
--=20
2.26.0.rc2

