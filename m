Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A3446253
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:42:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlxsq61C8z3c4X
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:42:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.187.244;
 helo=10.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from 10.mo552.mail-out.ovh.net (10.mo552.mail-out.ovh.net
 [87.98.187.244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlxsN6hBLz2xX8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:42:14 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4FE8022C6D;
 Fri,  5 Nov 2021 10:26:43 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00346f708bf-d9a1-4797-b728-acac7d58eb05,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 11/11] powerpc/smp: Add a doorbell=off kernel parameter
Date: Fri, 5 Nov 2021 11:26:36 +0100
Message-ID: <20211105102636.1016378-12-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6f8b580a-678f-45ae-b9f9-6c0c74bdc4a9
X-Ovh-Tracer-Id: 495958910588980189
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On processors with a XIVE interrupt controller (POWER9 and above), the
kernel can use either doorbells or XIVE to generate CPU IPIs. Sending
doorbell is generally preferred to using the XIVE IC because it is
faster. There are cases where we want to avoid doorbells and use XIVE
only, for debug or performance. Only useful on POWER9 and above.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/dbell.h                |  1 +
 arch/powerpc/kernel/dbell.c                     | 17 +++++++++++++++++
 arch/powerpc/platforms/powernv/smp.c            |  7 +++++--
 arch/powerpc/platforms/pseries/smp.c            |  3 +++
 Documentation/admin-guide/kernel-parameters.txt | 10 ++++++++++
 5 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/dbell.h b/arch/powerpc/include/asm/dbell.h
index 3e9da22a2779..07775aa3e81b 100644
--- a/arch/powerpc/include/asm/dbell.h
+++ b/arch/powerpc/include/asm/dbell.h
@@ -90,6 +90,7 @@ static inline void ppc_msgsync(void)
 #endif /* CONFIG_PPC_BOOK3S */
 
 extern void doorbell_exception(struct pt_regs *regs);
+extern bool doorbell_disabled;
 
 static inline void ppc_msgsnd(enum ppc_dbell type, u32 flags, u32 tag)
 {
diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index 5545c9cd17c1..681ee4775629 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -38,6 +38,23 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 
 	set_irq_regs(old_regs);
 }
+
+bool doorbell_disabled;
+
+static int __init doorbell_cmdline(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (strncmp(arg, "off", 3) == 0) {
+		pr_info("Doorbell disabled on kernel command line\n");
+		doorbell_disabled = true;
+	}
+
+	return 0;
+}
+__setup("doorbell=", doorbell_cmdline);
+
 #else /* CONFIG_SMP */
 DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 {
diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index cbb67813cd5d..1311bda9446a 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -338,10 +338,13 @@ static void __init pnv_smp_probe(void)
 		ic_cause_ipi = smp_ops->cause_ipi;
 		WARN_ON(!ic_cause_ipi);
 
-		if (cpu_has_feature(CPU_FTR_ARCH_300))
+		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+			if (doorbell_disabled)
+				return;
 			smp_ops->cause_ipi = doorbell_global_ipi;
-		else
+		} else {
 			smp_ops->cause_ipi = pnv_cause_ipi;
+		}
 	}
 }
 
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index f47429323eee..3bc9e6aaf645 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -229,6 +229,9 @@ static __init void pSeries_smp_probe(void)
 			return;
 	}
 
+	if (doorbell_disabled)
+		return;
+
 	/*
 	 * Under PowerVM, FSCR[MSGP] is enabled as guest vCPU siblings are
 	 * gang scheduled on the same physical core, so doorbells are always
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 10fa093251e8..2e1284febe39 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1041,6 +1041,16 @@
 			The filter can be disabled or changed to another
 			driver later using sysfs.
 
+	doorbell=off	[PPC]
+			On processors with a XIVE interrupt controller
+			(POWER9 and above), the kernel can use either
+			doorbells or XIVE to generate CPU IPIs.	Sending
+			doorbell is generally preferred to using the XIVE
+			IC because it is faster. There are cases where
+			we want to avoid doorbells and use XIVE only,
+			for debug or performance. Only useful on
+			POWER9 and above.
+
 	driver_async_probe=  [KNL]
 			List of driver names to be probed asynchronously.
 			Format: <driver_name1>,<driver_name2>...
-- 
2.31.1

