Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E417C1FF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 16:39:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YsHZ3g7BzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 02:39:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.61.94; helo=7.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 7.mo179.mail-out.ovh.net (7.mo179.mail-out.ovh.net
 [46.105.61.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YsFj613vzDqt3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 02:38:00 +1100 (AEDT)
Received: from player758.ha.ovh.net (unknown [10.110.171.238])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id BC01715E510
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 16:01:56 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 0DE06102B4F2F;
 Fri,  6 Mar 2020 15:01:49 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/4] powerpc/xive: Use XIVE_BAD_IRQ instead of zero to catch
 non configured IPIs
Date: Fri,  6 Mar 2020 16:01:40 +0100
Message-Id: <20200306150143.5551-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200306150143.5551-1-clg@kaod.org>
References: <20200306150143.5551-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7341993296681339825
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudduvddgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejheekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: David Gibson <david@gibson.dropbear.id.au>, linuxppc-dev@lists.ozlabs.org,
 Greg Kurz <groug@kaod.org>, stable@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a CPU is brought up, an IPI number is allocated and recorded
under the XIVE CPU structure. Invalid IPI numbers are tracked with
interrupt number 0x0.

On the PowerNV platform, the interrupt number space starts at 0x10 and
this works fine. However, on the sPAPR platform, it is possible to
allocate the interrupt number 0x0 and this raises an issue when CPU 0
is unplugged. The XIVE spapr driver tracks allocated interrupt numbers
in a bitmask and it is not correctly updated when interrupt number 0x0
is freed. It stays allocated and it is then impossible to reallocate.

Fix by using the XIVE_BAD_IRQ value instead of zero on both platforms.

Reported-by: David Gibson <david@gibson.dropbear.id.au>
Fixes: eac1e731b59e ("powerpc/xive: guest exploitation of the XIVE interrupt controller")
Cc: stable@vger.kernel.org # v4.14+
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/xive-internal.h |  7 +++++++
 arch/powerpc/sysdev/xive/common.c        | 12 +++---------
 arch/powerpc/sysdev/xive/native.c        |  4 ++--
 arch/powerpc/sysdev/xive/spapr.c         |  4 ++--
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysdev/xive/xive-internal.h
index 59cd366e7933..382980f4de2d 100644
--- a/arch/powerpc/sysdev/xive/xive-internal.h
+++ b/arch/powerpc/sysdev/xive/xive-internal.h
@@ -5,6 +5,13 @@
 #ifndef __XIVE_INTERNAL_H
 #define __XIVE_INTERNAL_H
 
+/*
+ * A "disabled" interrupt should never fire, to catch problems
+ * we set its logical number to this
+ */
+#define XIVE_BAD_IRQ		0x7fffffff
+#define XIVE_MAX_IRQ		(XIVE_BAD_IRQ - 1)
+
 /* Each CPU carry one of these with various per-CPU state */
 struct xive_cpu {
 #ifdef CONFIG_SMP
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index fa49193206b6..550baba98ec9 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -68,13 +68,6 @@ static u32 xive_ipi_irq;
 /* Xive state for each CPU */
 static DEFINE_PER_CPU(struct xive_cpu *, xive_cpu);
 
-/*
- * A "disabled" interrupt should never fire, to catch problems
- * we set its logical number to this
- */
-#define XIVE_BAD_IRQ		0x7fffffff
-#define XIVE_MAX_IRQ		(XIVE_BAD_IRQ - 1)
-
 /* An invalid CPU target */
 #define XIVE_INVALID_TARGET	(-1)
 
@@ -1153,7 +1146,7 @@ static int xive_setup_cpu_ipi(unsigned int cpu)
 	xc = per_cpu(xive_cpu, cpu);
 
 	/* Check if we are already setup */
-	if (xc->hw_ipi != 0)
+	if (xc->hw_ipi != XIVE_BAD_IRQ)
 		return 0;
 
 	/* Grab an IPI from the backend, this will populate xc->hw_ipi */
@@ -1190,7 +1183,7 @@ static void xive_cleanup_cpu_ipi(unsigned int cpu, struct xive_cpu *xc)
 	/* Disable the IPI and free the IRQ data */
 
 	/* Already cleaned up ? */
-	if (xc->hw_ipi == 0)
+	if (xc->hw_ipi == XIVE_BAD_IRQ)
 		return;
 
 	/* Mask the IPI */
@@ -1346,6 +1339,7 @@ static int xive_prepare_cpu(unsigned int cpu)
 		if (np)
 			xc->chip_id = of_get_ibm_chip_id(np);
 		of_node_put(np);
+		xc->hw_ipi = XIVE_BAD_IRQ;
 
 		per_cpu(xive_cpu, cpu) = xc;
 	}
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 0ff6b739052c..50e1a8e02497 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -312,7 +312,7 @@ static void xive_native_put_ipi(unsigned int cpu, struct xive_cpu *xc)
 	s64 rc;
 
 	/* Free the IPI */
-	if (!xc->hw_ipi)
+	if (xc->hw_ipi == XIVE_BAD_IRQ)
 		return;
 	for (;;) {
 		rc = opal_xive_free_irq(xc->hw_ipi);
@@ -320,7 +320,7 @@ static void xive_native_put_ipi(unsigned int cpu, struct xive_cpu *xc)
 			msleep(OPAL_BUSY_DELAY_MS);
 			continue;
 		}
-		xc->hw_ipi = 0;
+		xc->hw_ipi = XIVE_BAD_IRQ;
 		break;
 	}
 }
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 55dc61cb4867..3f15615712b5 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -560,11 +560,11 @@ static int xive_spapr_get_ipi(unsigned int cpu, struct xive_cpu *xc)
 
 static void xive_spapr_put_ipi(unsigned int cpu, struct xive_cpu *xc)
 {
-	if (!xc->hw_ipi)
+	if (xc->hw_ipi == XIVE_BAD_IRQ)
 		return;
 
 	xive_irq_bitmap_free(xc->hw_ipi);
-	xc->hw_ipi = 0;
+	xc->hw_ipi = XIVE_BAD_IRQ;
 }
 #endif /* CONFIG_SMP */
 
-- 
2.21.1

