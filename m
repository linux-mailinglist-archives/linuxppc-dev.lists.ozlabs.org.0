Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE06DBB84
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 16:13:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ptxz754Bkz3fdm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 00:13:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fBBkYvEp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fBBkYvEp;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptxl41HFtz3fXj
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 00:02:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E86261592;
	Sat,  8 Apr 2023 14:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878B9C433EF;
	Sat,  8 Apr 2023 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680962550;
	bh=a38Nb5+8BNBu5WNBdOxVHDnSVobRmoKRlk/8DEiKyc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fBBkYvEpUI8SwbbzlPd2D0k2OvEpwpC+5BqBS8Z0u8CDD+F9eZEnh0euO/f+HwRx/
	 s3qd2JdMkWkkSs9zm9vAZDXJhfRra6u+5K/0iltAoeQ69TINxpP3a/TIp7/wUvL2XH
	 DvtP+wWyJ3siCNd72JqNhIPpptnDIgIhojgRWu338t/F+4tyHUEpxUoSxURjh2WuHz
	 5KwGNW8ZCTWlhEdKExquwDBqR50QSCzqiN3ExmObLpRY9M7RJqrUZCmCRbYN/rqyUF
	 0n1IwbBM/gnnczWxqw6TEGFDERNPVEMgctBqZMlqmFEcCV9ADx2iSllhgccbUOBo7g
	 PMgylgktVCeWA==
Received: by pali.im (Postfix)
	id 3B0E924CB; Sat,  8 Apr 2023 16:02:27 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 10/13] powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
Date: Sat,  8 Apr 2023 16:01:19 +0200
Message-Id: <20230408140122.25293-11-pali@kernel.org>
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

Make just one .setup_arch and one .init_IRQ callback implementation for all
P2020 board code. This deduplicate repeated and same code.

Signed-off-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

---
Changes in v5:
* Make mpc85xx_ds_pic_init() and mpc85xx_ds_setup_arch() static too.
---
 arch/powerpc/platforms/85xx/mpc85xx.h     |  5 ---
 arch/powerpc/platforms/85xx/mpc85xx_ds.c  |  4 +--
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c |  4 +--
 arch/powerpc/platforms/85xx/p2020.c       | 38 +++++++++++++++++++----
 4 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx.h b/arch/powerpc/platforms/85xx/mpc85xx.h
index e792907ee3d5..c764d7551ef1 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx.h
+++ b/arch/powerpc/platforms/85xx/mpc85xx.h
@@ -21,9 +21,4 @@ void __init mpc85xx_8259_init(void);
 static inline void __init mpc85xx_8259_init(void) {}
 #endif
 
-void __init mpc85xx_ds_pic_init(void);
-void __init mpc85xx_ds_setup_arch(void);
-void __init mpc85xx_rdb_setup_arch(void);
-void __init mpc85xx_rdb_pic_init(void);
-
 #endif
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index db4cf76c0fd1..4347d629b567 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -34,7 +34,7 @@
 
 #include "mpc85xx.h"
 
-void __init mpc85xx_ds_pic_init(void)
+static void __init mpc85xx_ds_pic_init(void)
 {
 	struct mpic *mpic;
 	int flags = MPIC_BIG_ENDIAN | MPIC_SINGLE_DEST_CPU;
@@ -55,7 +55,7 @@ void __init mpc85xx_ds_pic_init(void)
 /*
  * Setup the architecture
  */
-void __init mpc85xx_ds_setup_arch(void)
+static void __init mpc85xx_ds_setup_arch(void)
 {
 	if (ppc_md.progress)
 		ppc_md.progress("mpc85xx_ds_setup_arch()", 0);
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index dbedffc57ce8..c42a68da6dfd 100644
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
index 41bba8c0e335..0e7be454b2de 100644
--- a/arch/powerpc/platforms/85xx/p2020.c
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -21,6 +21,32 @@
 #include "smp.h"
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
+	uli_init();
+	mpc85xx_smp_init();
+	mpc85xx_qe_par_io_init();
+}
+
 #ifdef CONFIG_MPC85xx_DS
 machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
 #endif /* CONFIG_MPC85xx_DS */
@@ -34,8 +60,8 @@ machine_arch_initcall(p2020_rdb_pc, mpc85xx_common_publish_devices);
 define_machine(p2020_ds) {
 	.name			= "P2020 DS",
 	.compatible		= "fsl,P2020DS",
-	.setup_arch		= mpc85xx_ds_setup_arch,
-	.init_IRQ		= mpc85xx_ds_pic_init,
+	.setup_arch		= p2020_setup_arch,
+	.init_IRQ		= p2020_pic_init,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
 	.pcibios_fixup_phb	= fsl_pcibios_fixup_phb,
@@ -49,8 +75,8 @@ define_machine(p2020_ds) {
 define_machine(p2020_rdb) {
 	.name			= "P2020 RDB",
 	.compatible		= "fsl,P2020RDB",
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
+	.setup_arch		= p2020_setup_arch,
+	.init_IRQ		= p2020_pic_init,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
 	.pcibios_fixup_phb	= fsl_pcibios_fixup_phb,
@@ -62,8 +88,8 @@ define_machine(p2020_rdb) {
 define_machine(p2020_rdb_pc) {
 	.name			= "P2020RDB-PC",
 	.compatible		= "fsl,P2020RDB-PC",
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
+	.setup_arch		= p2020_setup_arch,
+	.init_IRQ		= p2020_pic_init,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
 	.pcibios_fixup_phb	= fsl_pcibios_fixup_phb,
-- 
2.20.1

