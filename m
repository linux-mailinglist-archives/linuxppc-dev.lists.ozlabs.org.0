Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA035026D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 10:39:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfqWw5S94z3bd4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 18:39:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfqWV5hfPz2xrf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 18:39:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KfqWM2DXFz9sTX;
 Fri, 15 Apr 2022 10:39:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D824Z9MR6TXb; Fri, 15 Apr 2022 10:39:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KfqWL3Gxqz9sTZ;
 Fri, 15 Apr 2022 10:39:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A6C28B764;
 Fri, 15 Apr 2022 10:39:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oswjtVjw35K3; Fri, 15 Apr 2022 10:39:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 320748B778;
 Fri, 15 Apr 2022 10:39:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 23F8dGhE1534866
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 15 Apr 2022 10:39:16 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 23F8dEDd1534865;
 Fri, 15 Apr 2022 10:39:14 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Douglas Miller <dougmill@linux.ibm.com>,
 Dany Madden <drt@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Thomas Falcon <tlfalcon@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Ishizaki Kou <kou.ishizaki@toshiba.co.jp>,
 Geoff Levand <geoff@infradead.org>
Subject: [PATCH net-next v2] net: ethernet: Prepare cleanup of powerpc's
 asm/prom.h
Date: Fri, 15 Apr 2022 10:39:13 +0200
Message-Id: <f995b36fc3f2a3793038300388f06d1c3dd7e69a.1650011798.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1650011951; l=5275; s=20211009;
 h=from:subject:message-id; bh=6Mn6luywNXD4wXAkTlWB9klxzMHdcnBQNps4ZuH77io=;
 b=OKkYGXGm5p/s0I8QuaeeSSqzUTTZEX5+qhqOZPY+sbeR/xnZFFVzhj9RMwLODHddvj9BLMHUrlot
 sJrhgXl2C5UIVOb33Oq6AgTfLFbWAupgINk/NQMAN7E9EYQ72m6/
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc's asm/prom.h brings some headers that it doesn't
need itself.

In order to clean it up in a further step, first clean all
files that include asm/prom.h

Some files don't need asm/prom.h at all. For those ones,
just remove inclusion of asm/prom.h

Some files don't need any of the items provided by asm/prom.h,
but need some of the headers included by asm/prom.h. For those
ones, add the needed headers that are brought by asm/prom.h at
the moment, then remove asm/prom.h

Some files really need asm/prom.h but also need some of the
headers included by asm/prom.h. For those one, leave asm/prom.h
but also add the needed headers so that they can be removed
from asm/prom.h in a later step.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: More detailed commit description
---
 drivers/net/ethernet/apple/bmac.c                | 1 -
 drivers/net/ethernet/apple/mace.c                | 1 -
 drivers/net/ethernet/freescale/fec_mpc52xx.c     | 2 ++
 drivers/net/ethernet/freescale/fec_mpc52xx_phy.c | 1 +
 drivers/net/ethernet/ibm/ehea/ehea.h             | 1 +
 drivers/net/ethernet/ibm/ehea/ehea_main.c        | 2 ++
 drivers/net/ethernet/ibm/ibmvnic.c               | 1 +
 drivers/net/ethernet/sun/sungem.c                | 1 -
 drivers/net/ethernet/toshiba/spider_net.c        | 1 +
 9 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/apple/bmac.c b/drivers/net/ethernet/apple/bmac.c
index 4d2ba30c2fbd..334de0d93c89 100644
--- a/drivers/net/ethernet/apple/bmac.c
+++ b/drivers/net/ethernet/apple/bmac.c
@@ -25,7 +25,6 @@
 #include <linux/ethtool.h>
 #include <linux/slab.h>
 #include <linux/pgtable.h>
-#include <asm/prom.h>
 #include <asm/dbdma.h>
 #include <asm/io.h>
 #include <asm/page.h>
diff --git a/drivers/net/ethernet/apple/mace.c b/drivers/net/ethernet/apple/mace.c
index 6f8c91eb1263..d0a771b65e88 100644
--- a/drivers/net/ethernet/apple/mace.c
+++ b/drivers/net/ethernet/apple/mace.c
@@ -20,7 +20,6 @@
 #include <linux/bitrev.h>
 #include <linux/slab.h>
 #include <linux/pgtable.h>
-#include <asm/prom.h>
 #include <asm/dbdma.h>
 #include <asm/io.h>
 #include <asm/macio.h>
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net/ethernet/freescale/fec_mpc52xx.c
index be0bd4b44926..5ddb769bdfb4 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
@@ -29,7 +29,9 @@
 #include <linux/crc32.h>
 #include <linux/hardirq.h>
 #include <linux/delay.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/of_platform.h>
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
index b5497e308302..f85b5e81dfc1 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
@@ -15,6 +15,7 @@
 #include <linux/phy.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
+#include <linux/of_address.h>
 #include <linux/of_mdio.h>
 #include <asm/io.h>
 #include <asm/mpc52xx.h>
diff --git a/drivers/net/ethernet/ibm/ehea/ehea.h b/drivers/net/ethernet/ibm/ehea/ehea.h
index b140835d4c23..208c440a602b 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea.h
+++ b/drivers/net/ethernet/ibm/ehea/ehea.h
@@ -19,6 +19,7 @@
 #include <linux/ethtool.h>
 #include <linux/vmalloc.h>
 #include <linux/if_vlan.h>
+#include <linux/platform_device.h>
 
 #include <asm/ibmebus.h>
 #include <asm/io.h>
diff --git a/drivers/net/ethernet/ibm/ehea/ehea_main.c b/drivers/net/ethernet/ibm/ehea/ehea_main.c
index bad94e4d50f4..8ce3348edf08 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea_main.c
+++ b/drivers/net/ethernet/ibm/ehea/ehea_main.c
@@ -29,6 +29,8 @@
 #include <asm/kexec.h>
 #include <linux/mutex.h>
 #include <linux/prefetch.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
 #include <net/ip.h>
 
diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 77683909ca3d..309d97d28fb1 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -53,6 +53,7 @@
 #include <linux/ip.h>
 #include <linux/ipv6.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/kthread.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
diff --git a/drivers/net/ethernet/sun/sungem.c b/drivers/net/ethernet/sun/sungem.c
index 036856102c50..45bd89153de2 100644
--- a/drivers/net/ethernet/sun/sungem.c
+++ b/drivers/net/ethernet/sun/sungem.c
@@ -52,7 +52,6 @@
 #endif
 
 #ifdef CONFIG_PPC_PMAC
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
 #endif
diff --git a/drivers/net/ethernet/toshiba/spider_net.c b/drivers/net/ethernet/toshiba/spider_net.c
index f47b8358669d..eeee4f7ae444 100644
--- a/drivers/net/ethernet/toshiba/spider_net.c
+++ b/drivers/net/ethernet/toshiba/spider_net.c
@@ -35,6 +35,7 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/bitops.h>
+#include <linux/of.h>
 #include <net/checksum.h>
 
 #include "spider_net.h"
-- 
2.35.1

