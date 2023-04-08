Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956E6DBB82
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 16:11:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtxxG5yqNz3fsM
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 00:11:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jchH2BAp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jchH2BAp;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptxky6SCfz3cj2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 00:02:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5BC1761586;
	Sat,  8 Apr 2023 14:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79470C433D2;
	Sat,  8 Apr 2023 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680962550;
	bh=c2v6S7SrkyA9rVz69Nj+MQ69+ndU/wcEsy0ubY3+aNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jchH2BAp2vyIZoRO6phcZztt+dP4wGidcQtV4IkDPOZpN3WLcnYKfIyJo0EbAGfNz
	 uxPeqq0VDCrrIWgqM7f/Yc+ZUY/Q8RxLNJThmpwEi4/ZDiTZp5oEdWg9uQa8deEG+o
	 vQGnp0N5M5T0OAKO4X5qnfgi2qMM2W0pS9VGX6ZzJXunOaWCbvpKf7CGt0PJzRLR6G
	 hbGil+jTKGWzVZCmBoryjTU8tsDfS7LWCid237SUqf+XI6CliP/VtVtkJu/k3+6vaq
	 BM6+V7ns4VVbxXKS9mJggDOc3ZK9QSqvxJjBdUOTZswhFlWHBbq7tsjEBS8hxkpBj1
	 XGYGoTACRs9QQ==
Received: by pali.im (Postfix)
	id CF3DB213C; Sat,  8 Apr 2023 16:02:26 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 07/13] powerpc/85xx: p2020: Move all P2020 DS machine descriptions to p2020.c
Date: Sat,  8 Apr 2023 16:01:16 +0200
Message-Id: <20230408140122.25293-8-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230408140122.25293-1-pali@kernel.org>
References: <20230408140122.25293-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves P2020 DS machine descriptions into new p2020.c source file.
This is preparation for code de-duplication and providing one unified
machine description for all P2020 boards.

Signed-off-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

---
Changes in v5:
* Fix commit message
* Reduce includes
---
 arch/powerpc/platforms/85xx/Makefile     |  2 +-
 arch/powerpc/platforms/85xx/mpc85xx.h    |  3 ++
 arch/powerpc/platforms/85xx/mpc85xx_ds.c | 16 +--------
 arch/powerpc/platforms/85xx/p2020.c      | 41 ++++++++++++++++++++++++
 4 files changed, 46 insertions(+), 16 deletions(-)
 create mode 100644 arch/powerpc/platforms/85xx/p2020.c

diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
index 260fbad7967b..1f54623db9b7 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -16,7 +16,7 @@ obj-$(CONFIG_MPC8540_ADS) += mpc85xx_ads.o
 obj-$(CONFIG_MPC8560_ADS) += mpc85xx_ads.o
 obj-$(CONFIG_MPC85xx_CDS) += mpc85xx_cds.o
 obj-$(CONFIG_MPC8536_DS)  += mpc8536_ds.o
-obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o
+obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o p2020.o
 obj-$(CONFIG_MPC85xx_MDS) += mpc85xx_mds.o
 obj-$(CONFIG_MPC85xx_RDB) += mpc85xx_rdb.o
 obj-$(CONFIG_P1010_RDB)   += p1010rdb.o
diff --git a/arch/powerpc/platforms/85xx/mpc85xx.h b/arch/powerpc/platforms/85xx/mpc85xx.h
index cb84c5c56c36..ca8b39e6b05a 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx.h
+++ b/arch/powerpc/platforms/85xx/mpc85xx.h
@@ -15,4 +15,7 @@ extern void mpc85xx_qe_par_io_init(void);
 static inline void __init mpc85xx_qe_par_io_init(void) {}
 #endif
 
+void __init mpc85xx_ds_pic_init(void);
+void __init mpc85xx_ds_setup_arch(void);
+
 #endif
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 4ae300e76c2d..af2cafec4f0a 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -101,7 +101,7 @@ void __init mpc85xx_ds_pic_init(void)
 /*
  * Setup the architecture
  */
-static void __init mpc85xx_ds_setup_arch(void)
+void __init mpc85xx_ds_setup_arch(void)
 {
 	if (ppc_md.progress)
 		ppc_md.progress("mpc85xx_ds_setup_arch()", 0);
@@ -116,7 +116,6 @@ static void __init mpc85xx_ds_setup_arch(void)
 
 machine_arch_initcall(mpc8544_ds, mpc85xx_common_publish_devices);
 machine_arch_initcall(mpc8572_ds, mpc85xx_common_publish_devices);
-machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
 
 define_machine(mpc8544_ds) {
 	.name			= "MPC8544 DS",
@@ -143,16 +142,3 @@ define_machine(mpc8572_ds) {
 	.get_irq		= mpic_get_irq,
 	.progress		= udbg_progress,
 };
-
-define_machine(p2020_ds) {
-	.name			= "P2020 DS",
-	.compatible		= "fsl,P2020DS",
-	.setup_arch		= mpc85xx_ds_setup_arch,
-	.init_IRQ		= mpc85xx_ds_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.progress		= udbg_progress,
-};
diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
new file mode 100644
index 000000000000..356335122153
--- /dev/null
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Freescale P2020 board Setup
+ *
+ * Copyright 2007,2009,2012-2013 Freescale Semiconductor Inc.
+ * Copyright 2022-2023 Pali Rohár <pali@kernel.org>
+ */
+
+#include <linux/stddef.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include <asm/machdep.h>
+#include <asm/udbg.h>
+#include <asm/mpic.h>
+#include <asm/swiotlb.h>
+#include <asm/ppc-pci.h>
+
+#include <sysdev/fsl_pci.h>
+
+#include "smp.h"
+#include "mpc85xx.h"
+
+#ifdef CONFIG_MPC85xx_DS
+machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
+#endif /* CONFIG_MPC85xx_DS */
+
+#ifdef CONFIG_MPC85xx_DS
+define_machine(p2020_ds) {
+	.name			= "P2020 DS",
+	.compatible		= "fsl,P2020DS",
+	.setup_arch		= mpc85xx_ds_setup_arch,
+	.init_IRQ		= mpc85xx_ds_pic_init,
+#ifdef CONFIG_PCI
+	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
+	.pcibios_fixup_phb	= fsl_pcibios_fixup_phb,
+#endif
+	.get_irq		= mpic_get_irq,
+	.progress		= udbg_progress,
+};
+#endif /* CONFIG_MPC85xx_DS */
-- 
2.20.1

