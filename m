Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1899C69F708
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 15:48:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMJtL6g5Pz3fnZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 01:48:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMJnY5VKRz3ch3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 01:44:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PMJn41HPMz9sTY;
	Wed, 22 Feb 2023 15:43:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dyDVIQfupDu; Wed, 22 Feb 2023 15:43:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PMJmx0Q26z9sTB;
	Wed, 22 Feb 2023 15:43:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ED99C8B786;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4iTAaJkG6YZU; Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9AA768B78C;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31MEhNA91187141
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 15:43:23 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31MEhNkg1187140;
	Wed, 22 Feb 2023 15:43:23 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 14/17] powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
Date: Wed, 22 Feb 2023 15:43:01 +0100
Message-Id: <2d1831d5e1909bd415073a776f391b3f52016710.1677076552.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677076552.git.christophe.leroy@csgroup.eu>
References: <cover.1677076552.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677076980; l=3876; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=O2l9QHBd+AJ68A/OHfStag+aRq9hgZ+JuScdkzGkTiE=; b=N90xsCpnuNjSQxcHW8vzaOJlqJh9OmnO3vPKrNPPnvc4OTOJbxO3DA2sRj+bqW9zYFWy4p940ceg Wc9BvMtFBxomDvPDqvdIF5ee94ub+3WJPNX6oZ6dQi2y2rPPInet
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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

From: Pali Rohár <pali@kernel.org>

Make just one .setup_arch and one .init_IRQ callback implementation for all
P2020 board code. This deduplicate repeated and same code.

Signed-off-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/85xx/mpc85xx.h     |  5 ---
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c |  4 +--
 arch/powerpc/platforms/85xx/p2020.c       | 38 +++++++++++++++++++----
 3 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx.h b/arch/powerpc/platforms/85xx/mpc85xx.h
index b77bb9e7e79c..0be681526a1a 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx.h
+++ b/arch/powerpc/platforms/85xx/mpc85xx.h
@@ -27,9 +27,4 @@ void __init mpc85xx_ds_uli_init(void);
 static inline void __init mpc85xx_ds_uli_init(void) {}
 #endif
 
-void __init mpc85xx_ds_pic_init(void);
-void __init mpc85xx_ds_setup_arch(void);
-void __init mpc85xx_rdb_setup_arch(void);
-void __init mpc85xx_rdb_pic_init(void);
-
 #endif
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index d1f497e086ed..aee12e68e46d 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -29,7 +29,7 @@
 
 #include "mpc85xx.h"
 
-void __init mpc85xx_rdb_pic_init(void)
+static void __init mpc85xx_rdb_pic_init(void)
 {
 	struct mpic *mpic;
 	int flags = MPIC_BIG_ENDIAN | MPIC_SINGLE_DEST_CPU;
@@ -48,7 +48,7 @@ void __init mpc85xx_rdb_pic_init(void)
 /*
  * Setup the architecture
  */
-void __init mpc85xx_rdb_setup_arch(void)
+static void __init mpc85xx_rdb_setup_arch(void)
 {
 	if (ppc_md.progress)
 		ppc_md.progress("mpc85xx_rdb_setup_arch()", 0);
diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
index 1b0def607749..684ad1ea7362 100644
--- a/arch/powerpc/platforms/85xx/p2020.c
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -34,6 +34,32 @@
 
 #include "mpc85xx.h"
 
+static void __init p2020_pic_init(void)
+{
+	struct mpic *mpic;
+	int flags = MPIC_BIG_ENDIAN | MPIC_SINGLE_DEST_CPU;
+
+	mpic = mpic_alloc(NULL, 0, flags, 0, 256, " OpenPIC  ");
+
+	if (WARN_ON(!mpic))
+		return;
+
+	mpic_init(mpic);
+	mpc85xx_8259_init();
+}
+
+/*
+ * Setup the architecture
+ */
+static void __init p2020_setup_arch(void)
+{
+	swiotlb_detect_4g();
+	fsl_pci_assign_primary();
+	mpc85xx_ds_uli_init();
+	mpc85xx_smp_init();
+	mpc85xx_qe_par_io_init();
+}
+
 #ifdef CONFIG_MPC85xx_DS
 machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
 #endif /* CONFIG_MPC85xx_DS */
@@ -73,8 +99,8 @@ static int __init p2020_rdb_pc_probe(void)
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
@@ -89,8 +115,8 @@ define_machine(p2020_ds) {
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
@@ -103,8 +129,8 @@ define_machine(p2020_rdb) {
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
2.39.1

