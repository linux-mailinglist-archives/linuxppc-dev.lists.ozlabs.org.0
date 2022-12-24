Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88C655B4D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Dec 2022 22:21:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NfcRb0S8hz3fBH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Dec 2022 08:21:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DsDHwiA1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DsDHwiA1;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NfcLH3VFTz3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Dec 2022 08:16:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DF6060B4E;
	Sat, 24 Dec 2022 21:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833C9C433EF;
	Sat, 24 Dec 2022 21:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671916596;
	bh=xNSdUI6pz4D6dE9/Og/zOzJThSiw3fw4+p8TGNZp1R0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DsDHwiA1Ml1/V9aFtJjyvnguPlFykX7SqWAxLPn1/2OmrJiOtMFJu4fiHxeS/51MK
	 Py+b9wD4O1fIaKofMSAk5BsCmejZSGQvCpumBQW8uCG+/+lfjy+Grcirb4Ylj28tg+
	 rAvSS0SGB0nYtqB+OWSEVZZIx+kVYF/j2qUfhNI7wZcPCQDrhalzqL3i9rKrMLs4dK
	 7EctiQ30THPYXQhdWffKwWrkKqvfSjA+DKBdqguvkJNhmriQNHcGmUjccIU5c+Xfn/
	 st4O39arY0XTQSTA4BbwaAtrRsavYjyMyZHmES05IGpln7mgG2bIClTgqfszYSLO81
	 yFaOQARpg4mBQ==
Received: by pali.im (Postfix)
	id 3E87D720; Sat, 24 Dec 2022 22:16:36 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Scott Wood <oss@buserror.net>,
	Sinan Akman <sinan@writeme.com>,
	Martin Kennedy <hurricos@gmail.com>
Subject: [PATCH v2 5/8] powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
Date: Sat, 24 Dec 2022 22:14:22 +0100
Message-Id: <20221224211425.14983-6-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221224211425.14983-1-pali@kernel.org>
References: <20221224211425.14983-1-pali@kernel.org>
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
index b8584bf307b0..adf3750abef9 100644
--- a/arch/powerpc/platforms/85xx/p2020.c
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -42,8 +42,6 @@
 #define DBG(fmt, args...)
 #endif
 
-#ifdef CONFIG_MPC85xx_DS
-
 #ifdef CONFIG_PPC_I8259
 
 static void mpc85xx_8259_cascade(struct irq_desc *desc)
@@ -90,7 +88,7 @@ static void __init mpc85xx_8259_init(void)
 
 #endif	/* CONFIG_PPC_I8259 */
 
-static void __init mpc85xx_ds_pic_init(void)
+static void __init p2020_pic_init(void)
 {
 	struct mpic *mpic;
 
@@ -143,58 +141,20 @@ static void __init mpc85xx_ds_uli_init(void)
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
@@ -235,8 +195,8 @@ static int __init p2020_rdb_pc_probe(void)
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
@@ -251,8 +211,8 @@ define_machine(p2020_ds) {
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
@@ -265,8 +225,8 @@ define_machine(p2020_rdb) {
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

