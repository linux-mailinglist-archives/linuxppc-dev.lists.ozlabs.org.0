Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C49B4F0060
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 12:12:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVtBv1PRbz2yn2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 21:12:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVtBT2DnGz2xMQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 21:12:16 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KVtBP5PWTz9sSZ;
 Sat,  2 Apr 2022 12:12:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBVEswwalOhr; Sat,  2 Apr 2022 12:12:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KVtBP4Yxhz9sSY;
 Sat,  2 Apr 2022 12:12:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8AA768B76D;
 Sat,  2 Apr 2022 12:12:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Y39pw8naxh-1; Sat,  2 Apr 2022 12:12:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.136])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4008E8B768;
 Sat,  2 Apr 2022 12:12:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 232AC21k684504
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 2 Apr 2022 12:12:02 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 232AC1vb684503;
 Sat, 2 Apr 2022 12:12:01 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Bjorn Helgaas <bhelgaas@google.com>, Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH] pci: hotplug: Prepare cleanup of powerpc's asm/prom.h
Date: Sat,  2 Apr 2022 12:11:56 +0200
Message-Id: <79201f5fae8d003164ac36ed3be7789db1bc5ab4.1648833421.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648894316; l=2747; s=20211009;
 h=from:subject:message-id; bh=riyiPWE4HTVvKGtVKlLpPUMpYnTwPNAnyQF6g59mDYM=;
 b=rQ2g85F150Av16A7yWWJ//JEv+Wvgu4E5UOvoFCjbONcbjOGHDdnXryAiFyQiyfcVJDjWnhRGzvL
 s5el7hyjBJWTa3+/9RLXTojkDcHbdTvkk6BPDdoXD5kh8F8EAIJm
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc's asm/prom.h brings some headers that it doesn't
need itself.

In order to clean it up, first add missing headers in
users of asm/prom.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/pci/hotplug/pnv_php.c       | 1 +
 drivers/pci/hotplug/rpadlpar_core.c | 1 +
 drivers/pci/hotplug/rpaphp_core.c   | 2 ++
 drivers/pci/hotplug/rpaphp_pci.c    | 1 +
 drivers/pci/hotplug/rpaphp_slot.c   | 1 +
 5 files changed, 6 insertions(+)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index f4c2e6e01be0..881d420637bf 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pci_hotplug.h>
+#include <linux/of_fdt.h>
 
 #include <asm/opal.h>
 #include <asm/pnv-pci.h>
diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
index e6991ff67526..980bb3afd092 100644
--- a/drivers/pci/hotplug/rpadlpar_core.c
+++ b/drivers/pci/hotplug/rpadlpar_core.c
@@ -15,6 +15,7 @@
 
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/string.h>
 #include <linux/vmalloc.h>
diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index 9887c9de08c3..491986197c47 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/pci_hotplug.h>
 #include <linux/smp.h>
@@ -20,6 +21,7 @@
 #include <asm/eeh.h>       /* for eeh_add_device() */
 #include <asm/rtas.h>		/* rtas_call */
 #include <asm/pci-bridge.h>	/* for pci_controller */
+#include <asm/prom.h>
 #include "../pci.h"		/* for pci_add_new_bus */
 				/* and pci_do_scan_bus */
 #include "rpaphp.h"
diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaphp_pci.c
index c380bdacd146..630f77057c23 100644
--- a/drivers/pci/hotplug/rpaphp_pci.c
+++ b/drivers/pci/hotplug/rpaphp_pci.c
@@ -8,6 +8,7 @@
  * Send feedback to <lxie@us.ibm.com>
  *
  */
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/string.h>
 
diff --git a/drivers/pci/hotplug/rpaphp_slot.c b/drivers/pci/hotplug/rpaphp_slot.c
index 93b4a945c55d..779eab12e981 100644
--- a/drivers/pci/hotplug/rpaphp_slot.c
+++ b/drivers/pci/hotplug/rpaphp_slot.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/sysfs.h>
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/string.h>
 #include <linux/slab.h>
-- 
2.35.1

