Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0F869B9CB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 12:29:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJmg000hfz3cNG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 22:29:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ML3ph7iD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ML3ph7iD;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJmc00LGgz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 22:26:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA51960B7C;
	Sat, 18 Feb 2023 11:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D634AC433A0;
	Sat, 18 Feb 2023 11:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676719612;
	bh=jGRbes1qfF5eX/m0mTgtaEiMEXtloCCuJQ0jRPGZpLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ML3ph7iDs4nYKIXl+E5PZQMgZU+yxf63QJGEnEbhnR8tiRiHUgLtKLhRBNhPdXkV8
	 V386llNNuVGyCoJ5IE63heNMMwtCyrKSS/LOlAVnNpOBOgIaV6roVRXrk26dbkr67q
	 iCi8bH57aMpjPSsGIT7dz/XF2Wwn15M5hL2pyaAweam2BICEwXpCw25R3ym1CYE4RU
	 PCUPA0Il5m///NH0v01ZlxfmXf6/HWMUVgeYS3jE6OqzrY8QRBABvl02bBFlNWT4/I
	 F3TzGQp6mWslMx+J/F+SjnahTIyWs1nRTNrTnfXcbb6K8qMEndiGWnTojJJjzWWbQ7
	 08cGwRAxkSkYA==
Received: by pali.im (Postfix)
	id 58EC82558; Sat, 18 Feb 2023 12:26:49 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Scott Wood <oss@buserror.net>,
	Sinan Akman <sinan@writeme.com>,
	Martin Kennedy <hurricos@gmail.com>
Subject: [PATCH v3 5/8] powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
Date: Sat, 18 Feb 2023 12:14:02 +0100
Message-Id: <20230218111405.27688-6-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230218111405.27688-1-pali@kernel.org>
References: <20230218111405.27688-1-pali@kernel.org>
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

Make just one .setup_arch and one .init_IRQ callback implementation for all
P2020 board code. This deduplicate repeated and same code.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/p2020.c | 58 +++++------------------------
 1 file changed, 9 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
index 1cc468dc4caf..1033b7bb05cc 100644
--- a/arch/powerpc/platforms/85xx/p2020.c
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -42,8 +42,6 @@
 #define DBG(fmt, args...)
 #endif
 
-#ifdef CONFIG_MPC85xx_DS
-
 static void mpc85xx_8259_cascade(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
@@ -86,7 +84,7 @@ static void __init mpc85xx_8259_init(void)
 	irq_set_chained_handler(cascade_irq, mpc85xx_8259_cascade);
 }
 
-static void __init mpc85xx_ds_pic_init(void)
+static void __init p2020_pic_init(void)
 {
 	struct mpic *mpic;
 
@@ -138,58 +136,20 @@ static void __init mpc85xx_ds_uli_init(void)
 #endif
 }
 
-#endif /* CONFIG_MPC85xx_DS */
-
-#ifdef CONFIG_MPC85xx_RDB
-static void __init mpc85xx_rdb_pic_init(void)
-{
-	struct mpic *mpic;
-
-	mpic = mpic_alloc(NULL, 0,
-	  MPIC_BIG_ENDIAN |
-	  MPIC_SINGLE_DEST_CPU,
-	  0, 256, " OpenPIC  ");
-
-	BUG_ON(mpic == NULL);
-	mpic_init(mpic);
-}
-#endif /* CONFIG_MPC85xx_RDB */
-
 /*
  * Setup the architecture
  */
-#ifdef CONFIG_MPC85xx_DS
-static void __init mpc85xx_ds_setup_arch(void)
+static void __init p2020_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_ds_setup_arch()", 0);
-
 	swiotlb_detect_4g();
 	fsl_pci_assign_primary();
 	mpc85xx_ds_uli_init();
 	mpc85xx_smp_init();
 
-	printk("MPC85xx DS board from Freescale Semiconductor\n");
-}
-#endif /* CONFIG_MPC85xx_DS */
-
-#ifdef CONFIG_MPC85xx_RDB
-static void __init mpc85xx_rdb_setup_arch(void)
-{
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_rdb_setup_arch()", 0);
-
-	mpc85xx_smp_init();
-
-	fsl_pci_assign_primary();
-
 #ifdef CONFIG_QUICC_ENGINE
 	mpc85xx_qe_par_io_init();
-#endif	/* CONFIG_QUICC_ENGINE */
-
-	printk(KERN_INFO "MPC85xx RDB board from Freescale Semiconductor\n");
+#endif
 }
-#endif /* CONFIG_MPC85xx_RDB */
 
 #ifdef CONFIG_MPC85xx_DS
 machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
@@ -230,8 +190,8 @@ static int __init p2020_rdb_pc_probe(void)
 define_machine(p2020_ds) {
 	.name			= "P2020 DS",
 	.probe			= p2020_ds_probe,
-	.setup_arch		= mpc85xx_ds_setup_arch,
-	.init_IRQ		= mpc85xx_ds_pic_init,
+	.setup_arch		= p2020_setup_arch,
+	.init_IRQ		= p2020_pic_init,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
@@ -246,8 +206,8 @@ define_machine(p2020_ds) {
 define_machine(p2020_rdb) {
 	.name			= "P2020 RDB",
 	.probe			= p2020_rdb_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
+	.setup_arch		= p2020_setup_arch,
+	.init_IRQ		= p2020_pic_init,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
@@ -260,8 +220,8 @@ define_machine(p2020_rdb) {
 define_machine(p2020_rdb_pc) {
 	.name			= "P2020RDB-PC",
 	.probe			= p2020_rdb_pc_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
+	.setup_arch		= p2020_setup_arch,
+	.init_IRQ		= p2020_pic_init,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-- 
2.20.1

