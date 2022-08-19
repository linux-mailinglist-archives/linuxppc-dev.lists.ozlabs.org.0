Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F44D59A635
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 21:18:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8Wks11hXz3dyk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 05:18:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XFiU8hLO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XFiU8hLO;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8Whx6mZhz2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 05:17:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05E4B614C0;
	Fri, 19 Aug 2022 19:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16399C433D7;
	Fri, 19 Aug 2022 19:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660936621;
	bh=evTFJOZkg0tavzSABFrNQzTpKadK2avGSqbk5clFvMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XFiU8hLOFxouRha9xeLdMQ7zYGJvI+gF0WnuJNyMxaytSkue2twOU1SXiL3EmDdoe
	 8OdoJDVhhAZYjn2U6o86fw4W0JxGaci1SimmT7tbsmdeMgVOjszK9HIMGpqqwkMW65
	 8+uirZAFFN05ROHssQjGF09udyth4mqafBUrR/ZK5iav4jTgKwNiKPReSCoyia9tlY
	 /15EX2RhXPYxMSI7ZRFPc2eUY0l/n+YUFFzKlOzZl6uyxbX07Bg+Mu/JaE75zXRQkb
	 kpvGyeYpJOp//Wyq5vsla/qFzCAIJMkbw3s/7VCF9n6CgbphmAewC0Ln+We3neQPJE
	 X1jJ1U4stYgLg==
Received: by pali.im (Postfix)
	id C2489761; Fri, 19 Aug 2022 21:17:00 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Scott Wood <oss@buserror.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sinan Akman <sinan@writeme.com>
Subject: [PATCH 4/7] powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
Date: Fri, 19 Aug 2022 21:15:54 +0200
Message-Id: <20220819191557.28116-5-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220819191557.28116-1-pali@kernel.org>
References: <20220819191557.28116-1-pali@kernel.org>
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
 arch/powerpc/platforms/85xx/p2020.c | 97 +++++++++--------------------
 1 file changed, 30 insertions(+), 67 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
index d65d4c88ac47..d327e6c9b838 100644
--- a/arch/powerpc/platforms/85xx/p2020.c
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -42,9 +42,8 @@
 #define DBG(fmt, args...)
 #endif
 
-#ifdef CONFIG_MPC85xx_DS
-
 #ifdef CONFIG_PPC_I8259
+
 static void mpc85xx_8259_cascade(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
@@ -55,37 +54,21 @@ static void mpc85xx_8259_cascade(struct irq_desc *desc)
 	}
 	chip->irq_eoi(&desc->irq_data);
 }
-#endif	/* CONFIG_PPC_I8259 */
 
-static void __init mpc85xx_ds_pic_init(void)
+static void mpc85xx_8259_init(void)
 {
-	struct mpic *mpic;
-#ifdef CONFIG_PPC_I8259
 	struct device_node *np;
 	struct device_node *cascade_node = NULL;
 	int cascade_irq;
-#endif
-
-	mpic = mpic_alloc(NULL, 0,
-		  MPIC_BIG_ENDIAN |
-		  MPIC_SINGLE_DEST_CPU,
-		0, 256, " OpenPIC  ");
 
-	BUG_ON(mpic == NULL);
-	mpic_init(mpic);
-
-#ifdef CONFIG_PPC_I8259
-	/* Initialize the i8259 controller */
 	for_each_node_by_type(np, "interrupt-controller")
 	    if (of_device_is_compatible(np, "chrp,iic")) {
 		cascade_node = np;
 		break;
 	}
 
-	if (cascade_node == NULL) {
-		printk(KERN_DEBUG "Could not find i8259 PIC\n");
+	if (cascade_node == NULL)
 		return;
-	}
 
 	cascade_irq = irq_of_parse_and_map(cascade_node, 0);
 	if (!cascade_irq) {
@@ -93,12 +76,30 @@ static void __init mpc85xx_ds_pic_init(void)
 		return;
 	}
 
-	DBG("mpc85xxds: cascade mapped to irq %d\n", cascade_irq);
+	DBG("i8259: cascade mapped to irq %d\n", cascade_irq);
 
 	i8259_init(cascade_node, 0);
 	of_node_put(cascade_node);
 
 	irq_set_chained_handler(cascade_irq, mpc85xx_8259_cascade);
+}
+
+#endif	/* CONFIG_PPC_I8259 */
+
+static void __init p2020_pic_init(void)
+{
+	struct mpic *mpic;
+
+	mpic = mpic_alloc(NULL, 0,
+		  MPIC_BIG_ENDIAN |
+		  MPIC_SINGLE_DEST_CPU,
+		0, 256, " OpenPIC  ");
+
+	BUG_ON(mpic == NULL);
+	mpic_init(mpic);
+
+#ifdef CONFIG_PPC_I8259
+	mpc85xx_8259_init();
 #endif	/* CONFIG_PPC_I8259 */
 }
 
@@ -138,58 +139,20 @@ static void __init mpc85xx_ds_uli_init(void)
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
@@ -230,8 +193,8 @@ static int __init p2020_rdb_pc_probe(void)
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
@@ -246,8 +209,8 @@ define_machine(p2020_ds) {
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
@@ -260,8 +223,8 @@ define_machine(p2020_rdb) {
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

