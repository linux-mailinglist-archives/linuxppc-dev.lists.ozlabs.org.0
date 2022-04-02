Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AF24F003D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 11:53:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVsmc05yFz3c38
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 20:53:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVsm63kT1z2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 20:52:51 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KVsm00KlLz9sSQ;
 Sat,  2 Apr 2022 11:52:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g02phkaJeBc3; Sat,  2 Apr 2022 11:52:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KVslz6V7Lz9sSK;
 Sat,  2 Apr 2022 11:52:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C3E398B76D;
 Sat,  2 Apr 2022 11:52:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t_CC7L77K-UG; Sat,  2 Apr 2022 11:52:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.136])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B09C8B768;
 Sat,  2 Apr 2022 11:52:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2329qaFY683766
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 2 Apr 2022 11:52:36 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2329qZDJ683765;
 Sat, 2 Apr 2022 11:52:35 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] cxl/ocxl: Prepare cleanup of powerpc's asm/prom.h
Date: Sat,  2 Apr 2022 11:52:33 +0200
Message-Id: <a2bae89b280e7a7cb87889635d9911d6a245e780.1648833388.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648893152; l=4194; s=20211009;
 h=from:subject:message-id; bh=JxY+648cdfYGL5WtJJa465Q8CbmxwNjfK3pRYSd0Oz4=;
 b=C6PIkmpA1NSRSpcqV35OX6kl8KM54LwdtDbGac1ZsGECLPxcboQ/wjFTP0VkBI0Df0xD1F8x5+Ar
 23DVGOGjD5tphQQvmFz3ljb5P7RE4sa7sqMxHSeOqnl/iIysqcjC
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc's asm/prom.h brings some headers that it doesn't
need itself.

In order to clean it up, first add missing headers in
users of asm/prom.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/misc/cxl/api.c      | 1 +
 drivers/misc/cxl/cxl.h      | 2 ++
 drivers/misc/cxl/cxllib.c   | 1 +
 drivers/misc/cxl/flash.c    | 1 +
 drivers/misc/cxl/guest.c    | 2 ++
 drivers/misc/cxl/irq.c      | 1 +
 drivers/misc/cxl/main.c     | 1 +
 drivers/misc/cxl/native.c   | 1 +
 drivers/misc/ocxl/afu_irq.c | 1 +
 drivers/misc/ocxl/link.c    | 1 +
 10 files changed, 12 insertions(+)

diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
index b493de962153..d85c56530863 100644
--- a/drivers/misc/cxl/api.c
+++ b/drivers/misc/cxl/api.c
@@ -12,6 +12,7 @@
 #include <linux/pseudo_fs.h>
 #include <linux/sched/mm.h>
 #include <linux/mmu_context.h>
+#include <linux/irqdomain.h>
 
 #include "cxl.h"
 
diff --git a/drivers/misc/cxl/cxl.h b/drivers/misc/cxl/cxl.h
index 5dc0f6093f9d..7a6dd91987fd 100644
--- a/drivers/misc/cxl/cxl.h
+++ b/drivers/misc/cxl/cxl.h
@@ -25,6 +25,8 @@
 
 extern uint cxl_verbose;
 
+struct property;
+
 #define CXL_TIMEOUT 5
 
 /*
diff --git a/drivers/misc/cxl/cxllib.c b/drivers/misc/cxl/cxllib.c
index 53b919856426..e5fe0a171472 100644
--- a/drivers/misc/cxl/cxllib.c
+++ b/drivers/misc/cxl/cxllib.c
@@ -5,6 +5,7 @@
 
 #include <linux/hugetlb.h>
 #include <linux/sched/mm.h>
+#include <asm/opal-api.h>
 #include <asm/pnv-pci.h>
 #include <misc/cxllib.h>
 
diff --git a/drivers/misc/cxl/flash.c b/drivers/misc/cxl/flash.c
index 5b93ff51d82a..eee9decc121e 100644
--- a/drivers/misc/cxl/flash.c
+++ b/drivers/misc/cxl/flash.c
@@ -4,6 +4,7 @@
 #include <linux/semaphore.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/of.h>
 #include <asm/rtas.h>
 
 #include "cxl.h"
diff --git a/drivers/misc/cxl/guest.c b/drivers/misc/cxl/guest.c
index 9d485c9e3fff..3321c014913c 100644
--- a/drivers/misc/cxl/guest.c
+++ b/drivers/misc/cxl/guest.c
@@ -6,6 +6,8 @@
 #include <linux/spinlock.h>
 #include <linux/uaccess.h>
 #include <linux/delay.h>
+#include <linux/irqdomain.h>
+#include <linux/platform_device.h>
 
 #include "cxl.h"
 #include "hcalls.h"
diff --git a/drivers/misc/cxl/irq.c b/drivers/misc/cxl/irq.c
index 4cb829d5d873..5f0e2dcebb34 100644
--- a/drivers/misc/cxl/irq.c
+++ b/drivers/misc/cxl/irq.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <linux/workqueue.h>
 #include <linux/sched.h>
 #include <linux/wait.h>
diff --git a/drivers/misc/cxl/main.c b/drivers/misc/cxl/main.c
index 43b312d06e3e..c1fbf6f588f7 100644
--- a/drivers/misc/cxl/main.c
+++ b/drivers/misc/cxl/main.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/idr.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/sched/task.h>
 
 #include <asm/cputable.h>
diff --git a/drivers/misc/cxl/native.c b/drivers/misc/cxl/native.c
index 1a7f22836041..50b0c44bb8d7 100644
--- a/drivers/misc/cxl/native.c
+++ b/drivers/misc/cxl/native.c
@@ -11,6 +11,7 @@
 #include <linux/mm.h>
 #include <linux/uaccess.h>
 #include <linux/delay.h>
+#include <linux/irqdomain.h>
 #include <asm/synch.h>
 #include <asm/switch_to.h>
 #include <misc/cxl-base.h>
diff --git a/drivers/misc/ocxl/afu_irq.c b/drivers/misc/ocxl/afu_irq.c
index ecdcfae025b7..a06920b7e049 100644
--- a/drivers/misc/ocxl/afu_irq.c
+++ b/drivers/misc/ocxl/afu_irq.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Copyright 2017 IBM Corp.
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <asm/pnv-ocxl.h>
 #include <asm/xive.h>
 #include "ocxl_internal.h"
diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 9670d02c927f..4cf4c55a5f00 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -6,6 +6,7 @@
 #include <linux/mm_types.h>
 #include <linux/mmu_context.h>
 #include <linux/mmu_notifier.h>
+#include <linux/irqdomain.h>
 #include <asm/copro.h>
 #include <asm/pnv-ocxl.h>
 #include <asm/xive.h>
-- 
2.35.1

