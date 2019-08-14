Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 816B98D93E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 19:06:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467wwp6KzPzDqGv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 03:06:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.58.91; helo=7.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 7.mo178.mail-out.ovh.net (7.mo178.mail-out.ovh.net
 [46.105.58.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467wrw4hpWzDqpd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 03:03:24 +1000 (AEST)
Received: from player770.ha.ovh.net (unknown [10.108.57.49])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id DB19A70EE9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:48:17 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 6B71C8DDB6A5;
 Wed, 14 Aug 2019 15:48:11 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/3] powerpc/xive: Fix dump of XIVE interrupt under pseries
Date: Wed, 14 Aug 2019 17:47:53 +0200
Message-Id: <20190814154754.23682-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814154754.23682-1-clg@kaod.org>
References: <20190814154754.23682-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3260887608819157937
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvledgfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The xmon 'dxi' command calls OPAL to query the XIVE configuration of a
interrupt. This can only be done on baremetal (PowerNV) and it will
crash a pseries machine.

Introduce a new XIVE get_irq_config() operation which implements a
different query depending on the platform, PowerNV or pseries, and
modify xmon to use a top level wrapper.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/xive.h          |  2 +
 arch/powerpc/sysdev/xive/xive-internal.h |  2 +
 arch/powerpc/sysdev/xive/common.c        |  7 ++++
 arch/powerpc/sysdev/xive/native.c        | 15 +++++++
 arch/powerpc/sysdev/xive/spapr.c         | 51 ++++++++++++++++++++++++
 arch/powerpc/xmon/xmon.c                 | 12 +++---
 6 files changed, 83 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
index efb0e597b272..967d6ab3c977 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -99,6 +99,8 @@ extern void xive_flush_interrupt(void);
 
 /* xmon hook */
 extern void xmon_xive_do_dump(int cpu);
+extern int xmon_xive_get_irq_config(u32 irq, u32 *target, u8 *prio,
+				    u32 *sw_irq);
 
 /* APIs used by KVM */
 extern u32 xive_native_default_eq_shift(void);
diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysdev/xive/xive-internal.h
index 211725dbf364..59cd366e7933 100644
--- a/arch/powerpc/sysdev/xive/xive-internal.h
+++ b/arch/powerpc/sysdev/xive/xive-internal.h
@@ -33,6 +33,8 @@ struct xive_cpu {
 struct xive_ops {
 	int	(*populate_irq_data)(u32 hw_irq, struct xive_irq_data *data);
 	int 	(*configure_irq)(u32 hw_irq, u32 target, u8 prio, u32 sw_irq);
+	int	(*get_irq_config)(u32 hw_irq, u32 *target, u8 *prio,
+				  u32 *sw_irq);
 	int	(*setup_queue)(unsigned int cpu, struct xive_cpu *xc, u8 prio);
 	void	(*cleanup_queue)(unsigned int cpu, struct xive_cpu *xc, u8 prio);
 	void	(*setup_cpu)(unsigned int cpu, struct xive_cpu *xc);
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index be86fce1a84e..ed4561e71951 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -257,6 +257,13 @@ notrace void xmon_xive_do_dump(int cpu)
 	}
 #endif
 }
+
+int xmon_xive_get_irq_config(u32 irq, u32 *target, u8 *prio,
+			     u32 *sw_irq)
+{
+	return xive_ops->get_irq_config(irq, target, prio, sw_irq);
+}
+
 #endif /* CONFIG_XMON */
 
 static unsigned int xive_get_irq(void)
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 2f26b74f6cfa..4b61e44f0171 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -111,6 +111,20 @@ int xive_native_configure_irq(u32 hw_irq, u32 target, u8 prio, u32 sw_irq)
 }
 EXPORT_SYMBOL_GPL(xive_native_configure_irq);
 
+static int xive_native_get_irq_config(u32 hw_irq, u32 *target, u8 *prio,
+				      u32 *sw_irq)
+{
+	s64 rc;
+	__be64 vp;
+	__be32 lirq;
+
+	rc = opal_xive_get_irq_config(hw_irq, &vp, prio, &lirq);
+
+	*target = be64_to_cpu(vp);
+	*sw_irq = be32_to_cpu(lirq);
+
+	return rc == 0 ? 0 : -ENXIO;
+}
 
 /* This can be called multiple time to change a queue configuration */
 int xive_native_configure_queue(u32 vp_id, struct xive_q *q, u8 prio,
@@ -442,6 +456,7 @@ EXPORT_SYMBOL_GPL(xive_native_sync_queue);
 static const struct xive_ops xive_native_ops = {
 	.populate_irq_data	= xive_native_populate_irq_data,
 	.configure_irq		= xive_native_configure_irq,
+	.get_irq_config		= xive_native_get_irq_config,
 	.setup_queue		= xive_native_setup_queue,
 	.cleanup_queue		= xive_native_cleanup_queue,
 	.match			= xive_native_match,
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 8ef9cf4ebb1c..2a2d209336f7 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -211,6 +211,38 @@ static long plpar_int_set_source_config(unsigned long flags,
 	return 0;
 }
 
+static long plpar_int_get_source_config(unsigned long flags,
+					unsigned long lisn,
+					unsigned long *target,
+					unsigned long *prio,
+					unsigned long *sw_irq)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+	long rc;
+
+	pr_devel("H_INT_GET_SOURCE_CONFIG flags=%lx lisn=%lx\n", flags, lisn);
+
+	do {
+		rc = plpar_hcall(H_INT_GET_SOURCE_CONFIG, retbuf, flags, lisn,
+				 target, prio, sw_irq);
+	} while (plpar_busy_delay(rc));
+
+	if (rc) {
+		pr_err("H_INT_GET_SOURCE_CONFIG lisn=%ld failed %ld\n",
+		       lisn, rc);
+		return rc;
+	}
+
+	*target = retbuf[0];
+	*prio   = retbuf[1];
+	*sw_irq = retbuf[2];
+
+	pr_devel("H_INT_GET_SOURCE_CONFIG target=%lx prio=%lx sw_irq=%lx\n",
+		retbuf[0], retbuf[1], retbuf[2]);
+
+	return 0;
+}
+
 static long plpar_int_get_queue_info(unsigned long flags,
 				     unsigned long target,
 				     unsigned long priority,
@@ -394,6 +426,24 @@ static int xive_spapr_configure_irq(u32 hw_irq, u32 target, u8 prio, u32 sw_irq)
 	return rc == 0 ? 0 : -ENXIO;
 }
 
+static int xive_spapr_get_irq_config(u32 hw_irq, u32 *target, u8 *prio,
+				     u32 *sw_irq)
+{
+	long rc;
+	unsigned long h_target;
+	unsigned long h_prio;
+	unsigned long h_sw_irq;
+
+	rc = plpar_int_get_source_config(0, hw_irq, &h_target, &h_prio,
+					 &h_sw_irq);
+
+	*target = h_target;
+	*prio = h_prio;
+	*sw_irq = h_sw_irq;
+
+	return rc == 0 ? 0 : -ENXIO;
+}
+
 /* This can be called multiple time to change a queue configuration */
 static int xive_spapr_configure_queue(u32 target, struct xive_q *q, u8 prio,
 				   __be32 *qpage, u32 order)
@@ -586,6 +636,7 @@ static void xive_spapr_sync_source(u32 hw_irq)
 static const struct xive_ops xive_spapr_ops = {
 	.populate_irq_data	= xive_spapr_populate_irq_data,
 	.configure_irq		= xive_spapr_configure_irq,
+	.get_irq_config		= xive_spapr_get_irq_config,
 	.setup_queue		= xive_spapr_setup_queue,
 	.cleanup_queue		= xive_spapr_cleanup_queue,
 	.match			= xive_spapr_match,
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 25d4adccf750..4ea53e05053f 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2574,14 +2574,14 @@ static void dump_all_xives(void)
 
 static void dump_one_xive_irq(u32 num)
 {
-	s64 rc;
-	__be64 vp;
+	int rc;
+	u32 target;
 	u8 prio;
-	__be32 lirq;
+	u32 lirq;
 
-	rc = opal_xive_get_irq_config(num, &vp, &prio, &lirq);
-	xmon_printf("IRQ 0x%x config: vp=0x%llx prio=%d lirq=0x%x (rc=%lld)\n",
-		    num, be64_to_cpu(vp), prio, be32_to_cpu(lirq), rc);
+	rc = xmon_xive_get_irq_config(num, &target, &prio, &lirq);
+	xmon_printf("IRQ 0x%08x : target=0x%x prio=%d lirq=0x%x (rc=%d)\n",
+		    num, target, prio, lirq, rc);
 }
 
 static void dump_xives(void)
-- 
2.21.0

