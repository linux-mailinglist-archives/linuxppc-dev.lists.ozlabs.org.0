Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5509E6DBE2C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 02:11:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PvCFx1Byrz3fgw
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 10:11:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ucBBxINO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ucBBxINO;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PvCC85HzSz3cdC
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 10:09:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A744A616B5;
	Sun,  9 Apr 2023 00:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C92C433A0;
	Sun,  9 Apr 2023 00:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680998961;
	bh=HhZeWrgAig2HaS6hHyjC+NpmU7/VpU/d+SrMRHkoT6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ucBBxINODGUVQGq30JIZ7MkNr9qlRoBk/lnedWexPzpOEpfLn7pSS1tokOLthU/98
	 wCt52TmsKX9bC9rTcK+kvcgERKZLY12G3VLu2JJoV6JXTcjnwmPKzt27FD5Sv8hbPx
	 HBps4N7scRshb3pBNoDpTG0NCwOv67RulXkyUyRd37i9++xQ6iHRvp8U+SRoCtNWyZ
	 Gh2mG452bEvykO/+85UepZ+FwDVN4SQaq90JLzcSSXI5BLETMsRVNVGunx8ZIjMgy4
	 /8cKueNJ7jHphBEXWwaY6WBvOhAG0bXpdWxFHG7yUtiSvWYfU9Q7JPYCDkrQ3txN5O
	 j/fvjEdwrPReQ==
Received: by pali.im (Postfix)
	id 8DCF3209C; Sun,  9 Apr 2023 02:09:18 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 4/8] powerpc/85xx: mpc85xx_ds: Move uli_init() code into its own driver file
Date: Sun,  9 Apr 2023 02:08:08 +0200
Message-Id: <20230409000812.18904-5-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230409000812.18904-1-pali@kernel.org>
References: <20230409000812.18904-1-pali@kernel.org>
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

Move uli_init() function into existing driver fsl_uli1575.c file in order
to share its code between more platforms and board files.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/include/asm/ppc-pci.h       |  2 ++
 arch/powerpc/platforms/85xx/mpc85xx_ds.c | 23 +----------------------
 arch/powerpc/platforms/fsl_uli1575.c     | 19 +++++++++++++++++++
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
index a8db969dd595..0e393aeed912 100644
--- a/arch/powerpc/include/asm/ppc-pci.h
+++ b/arch/powerpc/include/asm/ppc-pci.h
@@ -59,6 +59,7 @@ void eeh_sysfs_remove_device(struct pci_dev *pdev);
 
 #ifdef CONFIG_FSL_ULI1575
 int uli_exclude_device(struct pci_controller *hose, u_char bus, u_char devfn);
+void __init uli_init(void);
 #endif /* CONFIG_FSL_ULI1575 */
 
 #define PCI_BUSNO(bdfn) ((bdfn >> 8) & 0xff)
@@ -70,6 +71,7 @@ static inline void init_pci_config_tokens(void) { }
 #if !defined(CONFIG_PCI) || !defined(CONFIG_FSL_ULI1575)
 #include <linux/pci.h>
 static inline int uli_exclude_device(struct pci_controller *hose, u_char bus, u_char devfn) { return PCIBIOS_SUCCESSFUL; }
+static inline void __init uli_init(void) {}
 #endif /* !defined(CONFIG_PCI) || !defined(CONFIG_FSL_ULI1575) */
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 581b5f0ef3be..c474da3eeea8 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -107,27 +107,6 @@ void __init mpc85xx_ds_pic_init(void)
 #endif	/* CONFIG_PPC_I8259 */
 }
 
-static void __init mpc85xx_ds_uli_init(void)
-{
-#ifdef CONFIG_PCI
-	struct device_node *node;
-	struct device_node *pci_with_uli;
-
-	/* See if we have a ULI under the primary */
-
-	node = of_find_node_by_name(NULL, "uli1575");
-	while ((pci_with_uli = of_get_parent(node))) {
-		of_node_put(node);
-		node = pci_with_uli;
-
-		if (pci_with_uli == fsl_pci_primary) {
-			ppc_md.pci_exclude_device = uli_exclude_device;
-			break;
-		}
-	}
-#endif
-}
-
 /*
  * Setup the architecture
  */
@@ -138,7 +117,7 @@ static void __init mpc85xx_ds_setup_arch(void)
 
 	swiotlb_detect_4g();
 	fsl_pci_assign_primary();
-	mpc85xx_ds_uli_init();
+	uli_init();
 	mpc85xx_smp_init();
 
 	printk("MPC85xx DS board from Freescale Semiconductor\n");
diff --git a/arch/powerpc/platforms/fsl_uli1575.c b/arch/powerpc/platforms/fsl_uli1575.c
index 1350db0b935d..b073db9d7c79 100644
--- a/arch/powerpc/platforms/fsl_uli1575.c
+++ b/arch/powerpc/platforms/fsl_uli1575.c
@@ -358,3 +358,22 @@ int uli_exclude_device(struct pci_controller *hose, u_char bus, u_char devfn)
 
 	return PCIBIOS_SUCCESSFUL;
 }
+
+void __init uli_init(void)
+{
+	struct device_node *node;
+	struct device_node *pci_with_uli;
+
+	/* See if we have a ULI under the primary */
+
+	node = of_find_node_by_name(NULL, "uli1575");
+	while ((pci_with_uli = of_get_parent(node))) {
+		of_node_put(node);
+		node = pci_with_uli;
+
+		if (pci_with_uli == fsl_pci_primary) {
+			ppc_md.pci_exclude_device = uli_exclude_device;
+			break;
+		}
+	}
+}
-- 
2.20.1

