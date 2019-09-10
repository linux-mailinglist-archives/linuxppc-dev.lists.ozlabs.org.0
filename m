Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB18AE62B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 10:59:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SJrW1sR2zDqrF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:59:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.56.113; helo=14.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 14.mo6.mail-out.ovh.net (14.mo6.mail-out.ovh.net
 [46.105.56.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SJq00bHJzDqrZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 18:58:34 +1000 (AEST)
Received: from player694.ha.ovh.net (unknown [10.109.159.20])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 812211DF4D9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 10:19:15 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player694.ha.ovh.net (Postfix) with ESMTPSA id 6388098EF565;
 Tue, 10 Sep 2019 08:19:11 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/xmon: Improve output of XIVE interrupts
Date: Tue, 10 Sep 2019 10:18:49 +0200
Message-Id: <20190910081850.26038-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910081850.26038-1-clg@kaod.org>
References: <20190910081850.26038-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6666171875507211185
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudekkedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
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
Cc: linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When looping on the list of interrupts, add the current value of the
PQ bits with a load on the ESB page. This has the side effect of
faulting the ESB page of all interrupts.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/xive.h   |  3 +--
 arch/powerpc/sysdev/xive/common.c | 29 ++++++++++++++++++++++++++---
 arch/powerpc/xmon/xmon.c          | 15 ++++-----------
 3 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
index 967d6ab3c977..71f52f22c36b 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -99,8 +99,7 @@ extern void xive_flush_interrupt(void);
 
 /* xmon hook */
 extern void xmon_xive_do_dump(int cpu);
-extern int xmon_xive_get_irq_config(u32 irq, u32 *target, u8 *prio,
-				    u32 *sw_irq);
+extern int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d);
 
 /* APIs used by KVM */
 extern u32 xive_native_default_eq_shift(void);
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index ed4561e71951..85a27ec49d34 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -258,10 +258,33 @@ notrace void xmon_xive_do_dump(int cpu)
 #endif
 }
 
-int xmon_xive_get_irq_config(u32 irq, u32 *target, u8 *prio,
-			     u32 *sw_irq)
+int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d)
 {
-	return xive_ops->get_irq_config(irq, target, prio, sw_irq);
+	int rc;
+	u32 target;
+	u8 prio;
+	u32 lirq;
+
+	rc = xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
+	if (rc) {
+		xmon_printf("IRQ 0x%08x : no config rc=%d\n", hw_irq, rc);
+		return rc;
+	}
+
+	xmon_printf("IRQ 0x%08x : target=0x%x prio=%02x lirq=0x%x ",
+		    hw_irq, target, prio, lirq);
+
+	if (d) {
+		struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
+		u64 val = xive_esb_read(xd, XIVE_ESB_GET);
+
+		xmon_printf("PQ=%c%c",
+			    val & XIVE_ESB_VAL_P ? 'P' : '-',
+			    val & XIVE_ESB_VAL_Q ? 'Q' : '-');
+	}
+
+	xmon_printf("\n");
+	return 0;
 }
 
 #endif /* CONFIG_XMON */
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index dc9832e06256..d83364ebc5c5 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2572,16 +2572,9 @@ static void dump_all_xives(void)
 		dump_one_xive(cpu);
 }
 
-static void dump_one_xive_irq(u32 num)
+static void dump_one_xive_irq(u32 num, struct irq_data *d)
 {
-	int rc;
-	u32 target;
-	u8 prio;
-	u32 lirq;
-
-	rc = xmon_xive_get_irq_config(num, &target, &prio, &lirq);
-	xmon_printf("IRQ 0x%08x : target=0x%x prio=%d lirq=0x%x (rc=%d)\n",
-		    num, target, prio, lirq, rc);
+	xmon_xive_get_irq_config(num, d);
 }
 
 static void dump_all_xive_irq(void)
@@ -2599,7 +2592,7 @@ static void dump_all_xive_irq(void)
 		hwirq = (unsigned int)irqd_to_hwirq(d);
 		/* IPIs are special (HW number 0) */
 		if (hwirq)
-			dump_one_xive_irq(hwirq);
+			dump_one_xive_irq(hwirq, d);
 	}
 }
 
@@ -2619,7 +2612,7 @@ static void dump_xives(void)
 		return;
 	} else if (c == 'i') {
 		if (scanhex(&num))
-			dump_one_xive_irq(num);
+			dump_one_xive_irq(num, NULL);
 		else
 			dump_all_xive_irq();
 		return;
-- 
2.21.0

