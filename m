Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DC6812D0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 11:35:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E25BrxdS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrTJF6ymFz3vtM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 21:35:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E25BrxdS;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrTDl2jQKz3vj0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 21:32:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702549927;
	bh=NlF0fP+4ZhmPGamGwDlLFY8ZIOwzXJyGh1FdhfSJsUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E25BrxdSpDZr+Z9D3h9QALguzNoK1GKyYdWl1YP6Sh99o7o6B08mVXkZsR2c79na2
	 UU45cYaT4MD7nZJuaSIhQHE2iCsI+Fz7lyFdboKvSZFomdVTjEDF3B/p6tAicJhbdV
	 MoBKv+5rWvbtmkadldUSbS9/+JXmHtIabcdsDZT97J1HdlTwU3FlKU77dI0YGBbm0+
	 OtU0cKt3Pin1A+250VzgaI+g6Jri26HBYFOEJPgCnr5BW6PEIhP8E1t5fbBtKnVnCO
	 YPuEmVfH7XXoxn5YC95EZjAk7DlKBRxern4YaadcL6w6RQYgRS+/6Gr9lYxDg5Ov+/
	 b6g5wH/m0ZG7A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SrTDl199yz4xQj;
	Thu, 14 Dec 2023 21:32:07 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 4/5] powerpc/machdep: Define 'compatibles' property in ppc_md and use it
Date: Thu, 14 Dec 2023 21:31:51 +1100
Message-ID: <20231214103152.12269-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214103152.12269-1-mpe@ellerman.id.au>
References: <20231214103152.12269-1-mpe@ellerman.id.au>
MIME-Version: 1.0
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
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Most probe functions that do not use the 'compatible' string do
nothing else than checking whether the machine is compatible with
one of the strings in a NULL terminated table of strings.

Define that table of strings in ppc_md structure and check it directly
from probe_machine() instead of using ppc_md.probe() for that.

Keep checking in ppc_md.probe() only for more complex probing.

All .compatible could be replaced with a single element NULL
terminated list but that's not worth the churn. Can be do incrementaly
in follow-up patches.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/machdep.h            |  1 +
 arch/powerpc/kernel/setup-common.c            |  2 ++
 arch/powerpc/platforms/40x/ppc40x_simple.c    |  9 +++------
 arch/powerpc/platforms/512x/mpc512x_generic.c |  4 +---
 arch/powerpc/platforms/52xx/lite5200.c        | 10 +---------
 arch/powerpc/platforms/52xx/mpc5200_simple.c  | 10 +---------
 arch/powerpc/platforms/83xx/mpc830x_rdb.c     | 10 +---------
 arch/powerpc/platforms/83xx/mpc831x_rdb.c     | 10 +---------
 arch/powerpc/platforms/83xx/mpc837x_rdb.c     | 10 +---------
 arch/powerpc/platforms/85xx/corenet_generic.c |  2 +-
 arch/powerpc/platforms/85xx/tqm85xx.c         | 10 +---------
 11 files changed, 14 insertions(+), 64 deletions(-)

v2: Unchanged.

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index d31a5ec1550d..1862f94335ee 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -22,6 +22,7 @@ struct pci_host_bridge;
 struct machdep_calls {
 	const char	*name;
 	const char	*compatible;
+	const char * const *compatibles;
 #ifdef CONFIG_PPC64
 #ifdef CONFIG_PM
 	void		(*iommu_restore)(void);
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 9b142b9d5187..ec02f9d8f55d 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -616,6 +616,8 @@ static __init void probe_machine(void)
 		DBG("  %s ...\n", machine_id->name);
 		if (machine_id->compatible && !of_machine_is_compatible(machine_id->compatible))
 			continue;
+		if (machine_id->compatibles && !of_machine_compatible_match(machine_id->compatibles))
+			continue;
 		memcpy(&ppc_md, machine_id, sizeof(struct machdep_calls));
 		if (ppc_md.probe && !ppc_md.probe())
 			continue;
diff --git a/arch/powerpc/platforms/40x/ppc40x_simple.c b/arch/powerpc/platforms/40x/ppc40x_simple.c
index e454e9d2eff1..294ab2728588 100644
--- a/arch/powerpc/platforms/40x/ppc40x_simple.c
+++ b/arch/powerpc/platforms/40x/ppc40x_simple.c
@@ -59,16 +59,13 @@ static const char * const board[] __initconst = {
 
 static int __init ppc40x_probe(void)
 {
-	if (of_device_compatible_match(of_root, board)) {
-		pci_set_flags(PCI_REASSIGN_ALL_RSRC);
-		return 1;
-	}
-
-	return 0;
+	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
+	return 1;
 }
 
 define_machine(ppc40x_simple) {
 	.name = "PowerPC 40x Platform",
+	.compatibles = board,
 	.probe = ppc40x_probe,
 	.progress = udbg_progress,
 	.init_IRQ = uic_init_tree,
diff --git a/arch/powerpc/platforms/512x/mpc512x_generic.c b/arch/powerpc/platforms/512x/mpc512x_generic.c
index 0d58ab257cd9..d4fa6c302ccf 100644
--- a/arch/powerpc/platforms/512x/mpc512x_generic.c
+++ b/arch/powerpc/platforms/512x/mpc512x_generic.c
@@ -32,9 +32,6 @@ static const char * const board[] __initconst = {
  */
 static int __init mpc512x_generic_probe(void)
 {
-	if (!of_device_compatible_match(of_root, board))
-		return 0;
-
 	mpc512x_init_early();
 
 	return 1;
@@ -42,6 +39,7 @@ static int __init mpc512x_generic_probe(void)
 
 define_machine(mpc512x_generic) {
 	.name			= "MPC512x generic",
+	.compatibles		= board,
 	.probe			= mpc512x_generic_probe,
 	.init			= mpc512x_init,
 	.setup_arch		= mpc512x_setup_arch,
diff --git a/arch/powerpc/platforms/52xx/lite5200.c b/arch/powerpc/platforms/52xx/lite5200.c
index 0fd67b3ffc3e..0a161d82a3a8 100644
--- a/arch/powerpc/platforms/52xx/lite5200.c
+++ b/arch/powerpc/platforms/52xx/lite5200.c
@@ -172,17 +172,9 @@ static const char * const board[] __initconst = {
 	NULL,
 };
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init lite5200_probe(void)
-{
-	return of_device_compatible_match(of_root, board);
-}
-
 define_machine(lite5200) {
 	.name 		= "lite5200",
-	.probe 		= lite5200_probe,
+	.compatibles	= board,
 	.setup_arch 	= lite5200_setup_arch,
 	.discover_phbs	= mpc52xx_setup_pci,
 	.init		= mpc52xx_declare_of_platform_devices,
diff --git a/arch/powerpc/platforms/52xx/mpc5200_simple.c b/arch/powerpc/platforms/52xx/mpc5200_simple.c
index f1e85e86f5e5..7e0e4c34a40b 100644
--- a/arch/powerpc/platforms/52xx/mpc5200_simple.c
+++ b/arch/powerpc/platforms/52xx/mpc5200_simple.c
@@ -59,17 +59,9 @@ static const char *board[] __initdata = {
 	NULL
 };
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc5200_simple_probe(void)
-{
-	return of_device_compatible_match(of_root, board);
-}
-
 define_machine(mpc5200_simple_platform) {
 	.name		= "mpc5200-simple-platform",
-	.probe		= mpc5200_simple_probe,
+	.compatibles	= board,
 	.setup_arch	= mpc5200_simple_setup_arch,
 	.discover_phbs	= mpc52xx_setup_pci,
 	.init		= mpc52xx_declare_of_platform_devices,
diff --git a/arch/powerpc/platforms/83xx/mpc830x_rdb.c b/arch/powerpc/platforms/83xx/mpc830x_rdb.c
index 534bb227480d..63b6d213726a 100644
--- a/arch/powerpc/platforms/83xx/mpc830x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc830x_rdb.c
@@ -34,19 +34,11 @@ static const char *board[] __initdata = {
 	NULL
 };
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc830x_rdb_probe(void)
-{
-	return of_device_compatible_match(of_root, board);
-}
-
 machine_device_initcall(mpc830x_rdb, mpc83xx_declare_of_platform_devices);
 
 define_machine(mpc830x_rdb) {
 	.name			= "MPC830x RDB",
-	.probe			= mpc830x_rdb_probe,
+	.compatibles		= board,
 	.setup_arch		= mpc830x_rdb_setup_arch,
 	.discover_phbs		= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
diff --git a/arch/powerpc/platforms/83xx/mpc831x_rdb.c b/arch/powerpc/platforms/83xx/mpc831x_rdb.c
index 7b901ab3b864..5c39966762e4 100644
--- a/arch/powerpc/platforms/83xx/mpc831x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc831x_rdb.c
@@ -34,19 +34,11 @@ static const char *board[] __initdata = {
 	NULL
 };
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc831x_rdb_probe(void)
-{
-	return of_device_compatible_match(of_root, board);
-}
-
 machine_device_initcall(mpc831x_rdb, mpc83xx_declare_of_platform_devices);
 
 define_machine(mpc831x_rdb) {
 	.name			= "MPC831x RDB",
-	.probe			= mpc831x_rdb_probe,
+	.compatibles		= board,
 	.setup_arch		= mpc831x_rdb_setup_arch,
 	.discover_phbs		= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
diff --git a/arch/powerpc/platforms/83xx/mpc837x_rdb.c b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
index 39e78018dd0b..45823e147933 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
@@ -61,17 +61,9 @@ static const char * const board[] __initconst = {
 	NULL
 };
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc837x_rdb_probe(void)
-{
-	return of_device_compatible_match(of_root, board);
-}
-
 define_machine(mpc837x_rdb) {
 	.name			= "MPC837x RDB/WLAN",
-	.probe			= mpc837x_rdb_probe,
+	.compatibles		= board,
 	.setup_arch		= mpc837x_rdb_setup_arch,
 	.discover_phbs  	= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index 645fcca77cde..c44400e95f55 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -149,7 +149,7 @@ static int __init corenet_generic_probe(void)
 	extern struct smp_ops_t smp_85xx_ops;
 #endif
 
-	if (of_device_compatible_match(of_root, boards))
+	if (of_machine_compatible_match(boards))
 		return 1;
 
 	/* Check if we're running under the Freescale hypervisor */
diff --git a/arch/powerpc/platforms/85xx/tqm85xx.c b/arch/powerpc/platforms/85xx/tqm85xx.c
index 6be1b9809db6..f74d446c53f0 100644
--- a/arch/powerpc/platforms/85xx/tqm85xx.c
+++ b/arch/powerpc/platforms/85xx/tqm85xx.c
@@ -112,17 +112,9 @@ static const char * const board[] __initconst = {
 	NULL
 };
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init tqm85xx_probe(void)
-{
-	return of_device_compatible_match(of_root, board);
-}
-
 define_machine(tqm85xx) {
 	.name			= "TQM85xx",
-	.probe			= tqm85xx_probe,
+	.compatibles		= board,
 	.setup_arch		= tqm85xx_setup_arch,
 	.init_IRQ		= tqm85xx_pic_init,
 	.show_cpuinfo		= tqm85xx_show_cpuinfo,
-- 
2.43.0

