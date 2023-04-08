Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 825406DBB80
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 16:09:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtxvK2RD6z3fSj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 00:09:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=apch3ZsR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=apch3ZsR;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptxkx6ZpQz3fVt
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 00:02:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 87FDD6159F;
	Sat,  8 Apr 2023 14:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4459C433A4;
	Sat,  8 Apr 2023 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680962549;
	bh=jbQirVnPPVloFTYjJFk7nyK5o6hQwE8ZafKlV8Ygph8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=apch3ZsRdK68wnRVwCB9cxtfA8GAzqAr4nVPQ8kE9cEItnHE6Rtno8tgkJLwKfaYp
	 8Et3BeR3vltGc/KD7ta4Y3I0/9us0PASidQf8Tbq27N8ab5BJtTSMwFZwTIl1K/Kyr
	 dCuyLX2J0qycSQCUEymYrtl7n9hltcUKxC4226iLgHw7EFO7xPFwgMXZ37+2hZ02LJ
	 OBEa0wFXd/h9o6g4yTEAMFIy6/0FwPqdBee7OJjuq8skfuc23zjcY/J0oHOKQwbgOv
	 6mpk0DnCF04/5FUNczWN+Y8egf9iHFzDZpfTxYQ/TKaAoa1oe4xoOHSXq25PdWBuJf
	 0Dq/W0+4ZhOYw==
Received: by pali.im (Postfix)
	id EFD622317; Sat,  8 Apr 2023 16:02:26 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 08/13] powerpc/85xx: p2020: Move all P2020 RDB machine descriptions to p2020.c
Date: Sat,  8 Apr 2023 16:01:17 +0200
Message-Id: <20230408140122.25293-9-pali@kernel.org>
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

This moves P2020 RDB machine descriptions into new p2020.c source file.
This is preparation for code de-duplication and providing one unified
machine description for all P2020 boards.

Signed-off-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

---
Changes in v5:
* Fix commit message
* Reduce includes
---
 arch/powerpc/platforms/85xx/Makefile      |  2 +-
 arch/powerpc/platforms/85xx/mpc85xx.h     |  2 ++
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c | 30 +--------------------
 arch/powerpc/platforms/85xx/p2020.c       | 33 +++++++++++++++++++++++
 4 files changed, 37 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
index 1f54623db9b7..93451850ed83 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -18,7 +18,7 @@ obj-$(CONFIG_MPC85xx_CDS) += mpc85xx_cds.o
 obj-$(CONFIG_MPC8536_DS)  += mpc8536_ds.o
 obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o p2020.o
 obj-$(CONFIG_MPC85xx_MDS) += mpc85xx_mds.o
-obj-$(CONFIG_MPC85xx_RDB) += mpc85xx_rdb.o
+obj-$(CONFIG_MPC85xx_RDB) += mpc85xx_rdb.o p2020.o
 obj-$(CONFIG_P1010_RDB)   += p1010rdb.o
 obj-$(CONFIG_P1022_DS)    += p1022_ds.o
 obj-$(CONFIG_P1022_RDK)   += p1022_rdk.o
diff --git a/arch/powerpc/platforms/85xx/mpc85xx.h b/arch/powerpc/platforms/85xx/mpc85xx.h
index ca8b39e6b05a..8f7b37c1de87 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx.h
+++ b/arch/powerpc/platforms/85xx/mpc85xx.h
@@ -17,5 +17,7 @@ static inline void __init mpc85xx_qe_par_io_init(void) {}
 
 void __init mpc85xx_ds_pic_init(void);
 void __init mpc85xx_ds_setup_arch(void);
+void __init mpc85xx_rdb_setup_arch(void);
+void __init mpc85xx_rdb_pic_init(void);
 
 #endif
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index cdafecaecf56..dbedffc57ce8 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -48,7 +48,7 @@ void __init mpc85xx_rdb_pic_init(void)
 /*
  * Setup the architecture
  */
-static void __init mpc85xx_rdb_setup_arch(void)
+void __init mpc85xx_rdb_setup_arch(void)
 {
 	if (ppc_md.progress)
 		ppc_md.progress("mpc85xx_rdb_setup_arch()", 0);
@@ -93,8 +93,6 @@ static void __init mpc85xx_rdb_setup_arch(void)
 	pr_info("MPC85xx RDB board from Freescale Semiconductor\n");
 }
 
-machine_arch_initcall(p2020_rdb, mpc85xx_common_publish_devices);
-machine_arch_initcall(p2020_rdb_pc, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1020_mbg_pc, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1020_rdb, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1020_rdb_pc, mpc85xx_common_publish_devices);
@@ -104,19 +102,6 @@ machine_arch_initcall(p1021_rdb_pc, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1025_rdb, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1024_rdb, mpc85xx_common_publish_devices);
 
-define_machine(p2020_rdb) {
-	.name			= "P2020 RDB",
-	.compatible		= "fsl,P2020RDB",
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.progress		= udbg_progress,
-};
-
 define_machine(p1020_rdb) {
 	.name			= "P1020 RDB",
 	.compatible		= "fsl,P1020RDB",
@@ -143,19 +128,6 @@ define_machine(p1021_rdb_pc) {
 	.progress		= udbg_progress,
 };
 
-define_machine(p2020_rdb_pc) {
-	.name			= "P2020RDB-PC",
-	.compatible		= "fsl,P2020RDB-PC",
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.progress		= udbg_progress,
-};
-
 define_machine(p1025_rdb) {
 	.name			= "P1025 RDB",
 	.compatible		= "fsl,P1025RDB",
diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
index 356335122153..41bba8c0e335 100644
--- a/arch/powerpc/platforms/85xx/p2020.c
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -25,6 +25,11 @@
 machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
 #endif /* CONFIG_MPC85xx_DS */
 
+#ifdef CONFIG_MPC85xx_RDB
+machine_arch_initcall(p2020_rdb, mpc85xx_common_publish_devices);
+machine_arch_initcall(p2020_rdb_pc, mpc85xx_common_publish_devices);
+#endif /* CONFIG_MPC85xx_RDB */
+
 #ifdef CONFIG_MPC85xx_DS
 define_machine(p2020_ds) {
 	.name			= "P2020 DS",
@@ -39,3 +44,31 @@ define_machine(p2020_ds) {
 	.progress		= udbg_progress,
 };
 #endif /* CONFIG_MPC85xx_DS */
+
+#ifdef CONFIG_MPC85xx_RDB
+define_machine(p2020_rdb) {
+	.name			= "P2020 RDB",
+	.compatible		= "fsl,P2020RDB",
+	.setup_arch		= mpc85xx_rdb_setup_arch,
+	.init_IRQ		= mpc85xx_rdb_pic_init,
+#ifdef CONFIG_PCI
+	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
+	.pcibios_fixup_phb	= fsl_pcibios_fixup_phb,
+#endif
+	.get_irq		= mpic_get_irq,
+	.progress		= udbg_progress,
+};
+
+define_machine(p2020_rdb_pc) {
+	.name			= "P2020RDB-PC",
+	.compatible		= "fsl,P2020RDB-PC",
+	.setup_arch		= mpc85xx_rdb_setup_arch,
+	.init_IRQ		= mpc85xx_rdb_pic_init,
+#ifdef CONFIG_PCI
+	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
+	.pcibios_fixup_phb	= fsl_pcibios_fixup_phb,
+#endif
+	.get_irq		= mpic_get_irq,
+	.progress		= udbg_progress,
+};
+#endif /* CONFIG_MPC85xx_RDB */
-- 
2.20.1

