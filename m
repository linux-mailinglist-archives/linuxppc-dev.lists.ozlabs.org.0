Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0F33FFF15
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 13:23:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1FmK17wQz3cDG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 21:23:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1FgK1S4Xz3bjP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 21:19:25 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H1Ffc2bcsz9sV8;
 Fri,  3 Sep 2021 13:18:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wew_VNpGKzbI; Fri,  3 Sep 2021 13:18:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H1Ffc08p1z9sT4;
 Fri,  3 Sep 2021 13:18:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E4BBA8B764;
 Fri,  3 Sep 2021 13:18:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id y7g5z1zsqt52; Fri,  3 Sep 2021 13:18:47 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E39BE8B8E3;
 Fri,  3 Sep 2021 13:18:45 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6C05463D75; Fri,  3 Sep 2021 11:18:45 +0000 (UTC)
Message-Id: <89f6b6743a970e8f6fafc51499f673c6a3dbcf1f.1630667612.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1630667612.git.christophe.leroy@csgroup.eu>
References: <cover.1630667612.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 10/11] powerpc/platforms: Use ppc_md_update() instead
 of define_machine()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  3 Sep 2021 11:18:45 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As a preparation of converting ppc_md into static calls, use our
new ppc_md helpers to setup platform functions instead of
define_machine() macro.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/40x/ppc40x_simple.c    |  20 +-
 arch/powerpc/platforms/44x/canyonlands.c      |  21 +-
 arch/powerpc/platforms/44x/ebony.c            |  11 +-
 arch/powerpc/platforms/44x/fsp2.c             |  11 +-
 arch/powerpc/platforms/44x/iss4xx.c           |  11 +-
 arch/powerpc/platforms/44x/ppc44x_simple.c    |  11 +-
 arch/powerpc/platforms/44x/ppc476.c           |  22 +--
 arch/powerpc/platforms/44x/sam440ep.c         |  11 +-
 arch/powerpc/platforms/44x/warp.c             |  11 +-
 arch/powerpc/platforms/512x/mpc5121_ads.c     |  15 +-
 arch/powerpc/platforms/512x/mpc512x_generic.c |  13 +-
 arch/powerpc/platforms/512x/pdm360ng.c        |  13 +-
 arch/powerpc/platforms/52xx/efika.c           |  33 ++--
 arch/powerpc/platforms/52xx/lite5200.c        |  20 +-
 arch/powerpc/platforms/52xx/media5200.c       |  20 +-
 arch/powerpc/platforms/52xx/mpc5200_simple.c  |  20 +-
 arch/powerpc/platforms/82xx/ep8248e.c         |  18 +-
 arch/powerpc/platforms/82xx/km82xx.c          |  18 +-
 arch/powerpc/platforms/82xx/mpc8272_ads.c     |  20 +-
 arch/powerpc/platforms/82xx/pq2fads.c         |  20 +-
 arch/powerpc/platforms/83xx/asp834x.c         |  22 ++-
 arch/powerpc/platforms/83xx/km83xx.c          |  22 ++-
 arch/powerpc/platforms/83xx/mpc830x_rdb.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc831x_rdb.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc832x_mds.c     |  14 +-
 arch/powerpc/platforms/83xx/mpc832x_rdb.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc834x_itx.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc834x_mds.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc836x_mds.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc836x_rdk.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc837x_mds.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc837x_rdb.c     |  22 ++-
 arch/powerpc/platforms/85xx/bsc913x_qds.c     |  22 ++-
 arch/powerpc/platforms/85xx/bsc913x_rdb.c     |  16 +-
 arch/powerpc/platforms/85xx/c293pcie.c        |  18 +-
 arch/powerpc/platforms/85xx/corenet_generic.c |  58 +++---
 arch/powerpc/platforms/85xx/ge_imp3a.c        |  26 +--
 arch/powerpc/platforms/85xx/ksi8560.c         |  18 +-
 arch/powerpc/platforms/85xx/mpc8536_ds.c      |  24 ++-
 arch/powerpc/platforms/85xx/mpc85xx_ads.c     |  18 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     |  26 +--
 arch/powerpc/platforms/85xx/mpc85xx_ds.c      |  72 ++++---
 arch/powerpc/platforms/85xx/mpc85xx_mds.c     |  71 ++++---
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c     | 181 +++++++-----------
 arch/powerpc/platforms/85xx/mvme2500.c        |  24 ++-
 arch/powerpc/platforms/85xx/p1010rdb.c        |  29 +--
 arch/powerpc/platforms/85xx/p1022_ds.c        |  24 ++-
 arch/powerpc/platforms/85xx/p1022_rdk.c       |  24 ++-
 arch/powerpc/platforms/85xx/p1023_rdb.c       |  23 ++-
 arch/powerpc/platforms/85xx/ppa8548.c         |  18 +-
 arch/powerpc/platforms/85xx/qemu_e500.c       |  24 ++-
 arch/powerpc/platforms/85xx/socrates.c        |  17 +-
 arch/powerpc/platforms/85xx/stx_gp3.c         |  18 +-
 arch/powerpc/platforms/85xx/tqm85xx.c         |  18 +-
 arch/powerpc/platforms/85xx/twr_p102x.c       |  22 ++-
 arch/powerpc/platforms/85xx/xes_mpc85xx.c     |  61 +++---
 arch/powerpc/platforms/86xx/gef_ppc9a.c       |  27 +--
 arch/powerpc/platforms/86xx/gef_sbc310.c      |  27 +--
 arch/powerpc/platforms/86xx/gef_sbc610.c      |  27 +--
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c    |  25 +--
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c    |  27 +--
 arch/powerpc/platforms/86xx/mvme7100.c        |  24 ++-
 arch/powerpc/platforms/8xx/adder875.c         |  18 +-
 arch/powerpc/platforms/8xx/ep88xc.c           |  18 +-
 arch/powerpc/platforms/8xx/mpc86xads_setup.c  |  22 ++-
 arch/powerpc/platforms/8xx/mpc885ads_setup.c  |  18 +-
 arch/powerpc/platforms/8xx/tqm8xx_setup.c     |  22 ++-
 arch/powerpc/platforms/amigaone/setup.c       |  42 ++--
 arch/powerpc/platforms/cell/setup.c           |  23 +--
 arch/powerpc/platforms/chrp/setup.c           |  25 +--
 arch/powerpc/platforms/embedded6xx/gamecube.c |  15 +-
 arch/powerpc/platforms/embedded6xx/holly.c    |  20 +-
 .../platforms/embedded6xx/linkstation.c       |  17 +-
 .../platforms/embedded6xx/mpc7448_hpc2.c      |  20 +-
 arch/powerpc/platforms/embedded6xx/mvme5100.c |  22 ++-
 .../platforms/embedded6xx/storcenter.c        |  18 +-
 arch/powerpc/platforms/embedded6xx/wii.c      |  17 +-
 arch/powerpc/platforms/maple/setup.c          |  27 +--
 arch/powerpc/platforms/microwatt/setup.c      |  12 +-
 arch/powerpc/platforms/pasemi/setup.c         |  19 +-
 arch/powerpc/platforms/powermac/setup.c       |  47 ++---
 arch/powerpc/platforms/powernv/setup.c        |  91 ++++-----
 arch/powerpc/platforms/ps3/setup.c            |  53 ++---
 arch/powerpc/platforms/pseries/setup.c        |  49 ++---
 84 files changed, 1217 insertions(+), 1002 deletions(-)

diff --git a/arch/powerpc/platforms/40x/ppc40x_simple.c b/arch/powerpc/platforms/40x/ppc40x_simple.c
index e70b42729322..9a059891e711 100644
--- a/arch/powerpc/platforms/40x/ppc40x_simple.c
+++ b/arch/powerpc/platforms/40x/ppc40x_simple.c
@@ -60,20 +60,20 @@ static const char * const board[] __initconst = {
 
 static int __init ppc40x_probe(void)
 {
-	if (of_device_compatible_match(of_root, board)) {
-		pci_set_flags(PCI_REASSIGN_ALL_RSRC);
-		return 1;
-	}
+	if (!of_device_compatible_match(of_root, board))
+		return 0;
 
-	return 0;
+	ppc_md_update(progress, udbg_progress);
+	ppc_md_update(init_IRQ, uic_init_tree);
+	ppc_md_update(get_irq, uic_get_irq);
+	ppc_md_update(restart, ppc4xx_reset_system);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
+	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
+	return 1;
 }
 
 define_machine(ppc40x_simple) {
 	.name = "PowerPC 40x Platform",
 	.probe = ppc40x_probe,
-	.progress = udbg_progress,
-	.init_IRQ = uic_init_tree,
-	.get_irq = uic_get_irq,
-	.restart = ppc4xx_reset_system,
-	.calibrate_decr = generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/canyonlands.c b/arch/powerpc/platforms/44x/canyonlands.c
index 807968a755ef..e8ff83d67f46 100644
--- a/arch/powerpc/platforms/44x/canyonlands.c
+++ b/arch/powerpc/platforms/44x/canyonlands.c
@@ -38,11 +38,17 @@ machine_device_initcall(canyonlands, ppc460ex_device_probe);
 
 static int __init ppc460ex_probe(void)
 {
-	if (of_machine_is_compatible("amcc,canyonlands")) {
-		pci_set_flags(PCI_REASSIGN_ALL_RSRC);
-		return 1;
-	}
-	return 0;
+	if (of_machine_is_compatible("amcc,canyonlands"))
+		return 0;
+
+	ppc_md_update(progress, udbg_progress);
+	ppc_md_update(init_IRQ, uic_init_tree);
+	ppc_md_update(get_irq, uic_get_irq);
+	ppc_md_update(restart, ppc4xx_reset_system);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
+	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
+	return 1;
 }
 
 /* USB PHY fixup code on Canyonlands kit. */
@@ -110,9 +116,4 @@ machine_device_initcall(canyonlands, ppc460ex_canyonlands_fixup);
 define_machine(canyonlands) {
 	.name = "Canyonlands",
 	.probe = ppc460ex_probe,
-	.progress = udbg_progress,
-	.init_IRQ = uic_init_tree,
-	.get_irq = uic_get_irq,
-	.restart = ppc4xx_reset_system,
-	.calibrate_decr = generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/ebony.c b/arch/powerpc/platforms/44x/ebony.c
index 0d8f202bc45f..000184b9401e 100644
--- a/arch/powerpc/platforms/44x/ebony.c
+++ b/arch/powerpc/platforms/44x/ebony.c
@@ -48,6 +48,12 @@ static int __init ebony_probe(void)
 	if (!of_machine_is_compatible("ibm,ebony"))
 		return 0;
 
+	ppc_md_update(progress, udbg_progress);
+	ppc_md_update(init_IRQ, uic_init_tree);
+	ppc_md_update(get_irq, uic_get_irq);
+	ppc_md_update(restart, ppc4xx_reset_system);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
 	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
 
 	return 1;
@@ -56,9 +62,4 @@ static int __init ebony_probe(void)
 define_machine(ebony) {
 	.name			= "Ebony",
 	.probe			= ebony_probe,
-	.progress		= udbg_progress,
-	.init_IRQ		= uic_init_tree,
-	.get_irq		= uic_get_irq,
-	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index b299e43f5ef9..a2a99e94f9a8 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -245,6 +245,12 @@ static int __init fsp2_probe(void)
 	if (!of_flat_dt_is_compatible(root, "ibm,fsp2"))
 		return 0;
 
+	ppc_md_update(progress, udbg_progress);
+	ppc_md_update(init_IRQ, fsp2_irq_init);
+	ppc_md_update(get_irq, uic_get_irq);
+	ppc_md_update(restart, ppc4xx_reset_system);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
 	/* Clear BC_ERR and mask snoopable request plb errors. */
 	val = mfdcr(DCRN_PLB6_CR0);
 	val |= 0x20000000;
@@ -307,9 +313,4 @@ static void __init fsp2_irq_init(void)
 define_machine(fsp2) {
 	.name			= "FSP-2",
 	.probe			= fsp2_probe,
-	.progress		= udbg_progress,
-	.init_IRQ		= fsp2_irq_init,
-	.get_irq		= uic_get_irq,
-	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/iss4xx.c b/arch/powerpc/platforms/44x/iss4xx.c
index 37cc6551f0d4..0262815634ac 100644
--- a/arch/powerpc/platforms/44x/iss4xx.c
+++ b/arch/powerpc/platforms/44x/iss4xx.c
@@ -148,15 +148,16 @@ static int __init iss4xx_probe(void)
 	if (!of_machine_is_compatible("ibm,iss-4xx"))
 		return 0;
 
+	ppc_md_update(progress, udbg_progress);
+	ppc_md_update(init_IRQ, iss4xx_init_irq);
+	ppc_md_update(setup_arch, iss4xx_setup_arch);
+	ppc_md_update(restart, ppc4xx_reset_system);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
 	return 1;
 }
 
 define_machine(iss4xx) {
 	.name			= "ISS-4xx",
 	.probe			= iss4xx_probe,
-	.progress		= udbg_progress,
-	.init_IRQ		= iss4xx_init_irq,
-	.setup_arch		= iss4xx_setup_arch,
-	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/ppc44x_simple.c b/arch/powerpc/platforms/44x/ppc44x_simple.c
index 3dbd8ddd734a..1aee9812a1a6 100644
--- a/arch/powerpc/platforms/44x/ppc44x_simple.c
+++ b/arch/powerpc/platforms/44x/ppc44x_simple.c
@@ -68,6 +68,12 @@ static int __init ppc44x_probe(void)
 
 	for (i = 0; i < ARRAY_SIZE(board); i++) {
 		if (of_machine_is_compatible(board[i])) {
+			ppc_md_update(progress, udbg_progress);
+			ppc_md_update(init_IRQ, uic_init_tree);
+			ppc_md_update(get_irq, uic_get_irq);
+			ppc_md_update(restart, ppc4xx_reset_system);
+			ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
 			pci_set_flags(PCI_REASSIGN_ALL_RSRC);
 			return 1;
 		}
@@ -79,9 +85,4 @@ static int __init ppc44x_probe(void)
 define_machine(ppc44x_simple) {
 	.name = "PowerPC 44x Platform",
 	.probe = ppc44x_probe,
-	.progress = udbg_progress,
-	.init_IRQ = uic_init_tree,
-	.get_irq = uic_get_irq,
-	.restart = ppc4xx_reset_system,
-	.calibrate_decr = generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index f905bed1dadf..22d1659f664e 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -271,23 +271,23 @@ static void ppc47x_pci_irq_fixup(struct pci_dev *dev)
  */
 static int __init ppc47x_probe(void)
 {
-	if (of_machine_is_compatible("ibm,akebono"))
-		return 1;
+	if (!of_machine_is_compatible("ibm,akebono") &&
+	    !of_machine_is_compatible("ibm,currituck"))
+		return 0;
 
-	if (of_machine_is_compatible("ibm,currituck")) {
+	ppc_md_update(progress, udbg_progress);
+	ppc_md_update(init_IRQ, ppc47x_init_irq);
+	ppc_md_update(setup_arch, ppc47x_setup_arch);
+	ppc_md_update(restart, ppc4xx_reset_system);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
+	if (of_machine_is_compatible("ibm,currituck"))
 		ppc_md_update(pci_irq_fixup, ppc47x_pci_irq_fixup);
-		return 1;
-	}
 
-	return 0;
+	return 1;
 }
 
 define_machine(ppc47x) {
 	.name			= "PowerPC 47x",
 	.probe			= ppc47x_probe,
-	.progress		= udbg_progress,
-	.init_IRQ		= ppc47x_init_irq,
-	.setup_arch		= ppc47x_setup_arch,
-	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/sam440ep.c b/arch/powerpc/platforms/44x/sam440ep.c
index 68ba4b009da0..04a387164081 100644
--- a/arch/powerpc/platforms/44x/sam440ep.c
+++ b/arch/powerpc/platforms/44x/sam440ep.c
@@ -45,6 +45,12 @@ static int __init sam440ep_probe(void)
 	if (!of_machine_is_compatible("acube,sam440ep"))
 		return 0;
 
+	ppc_md_update(progress, udbg_progress);
+	ppc_md_update(init_IRQ, uic_init_tree);
+	ppc_md_update(get_irq, uic_get_irq);
+	ppc_md_update(restart, ppc4xx_reset_system);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
 	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
 
 	return 1;
@@ -53,11 +59,6 @@ static int __init sam440ep_probe(void)
 define_machine(sam440ep) {
 	.name 			= "Sam440ep",
 	.probe 			= sam440ep_probe,
-	.progress 		= udbg_progress,
-	.init_IRQ 		= uic_init_tree,
-	.get_irq 		= uic_get_irq,
-	.restart		= ppc4xx_reset_system,
-	.calibrate_decr 	= generic_calibrate_decr,
 };
 
 static struct i2c_board_info sam440ep_rtc_info = {
diff --git a/arch/powerpc/platforms/44x/warp.c b/arch/powerpc/platforms/44x/warp.c
index 665f18e37efb..1d1320919950 100644
--- a/arch/powerpc/platforms/44x/warp.c
+++ b/arch/powerpc/platforms/44x/warp.c
@@ -43,17 +43,18 @@ static int __init warp_probe(void)
 	if (!of_machine_is_compatible("pika,warp"))
 		return 0;
 
+	ppc_md_update(progress, udbg_progress);
+	ppc_md_update(init_IRQ, uic_init_tree);
+	ppc_md_update(get_irq, uic_get_irq);
+	ppc_md_update(restart, ppc4xx_reset_system);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
 	return 1;
 }
 
 define_machine(warp) {
 	.name		= "Warp",
 	.probe 		= warp_probe,
-	.progress 	= udbg_progress,
-	.init_IRQ 	= uic_init_tree,
-	.get_irq 	= uic_get_irq,
-	.restart	= ppc4xx_reset_system,
-	.calibrate_decr = generic_calibrate_decr,
 };
 
 
diff --git a/arch/powerpc/platforms/512x/mpc5121_ads.c b/arch/powerpc/platforms/512x/mpc5121_ads.c
index 9d030c2e0004..5c3839d7fbf5 100644
--- a/arch/powerpc/platforms/512x/mpc5121_ads.c
+++ b/arch/powerpc/platforms/512x/mpc5121_ads.c
@@ -57,6 +57,14 @@ static int __init mpc5121_ads_probe(void)
 	if (!of_machine_is_compatible("fsl,mpc5121ads"))
 		return 0;
 
+	ppc_md_update(setup_arch, mpc5121_ads_setup_arch);
+	ppc_md_update(discover_phbs, mpc5121_ads_setup_pci);
+	ppc_md_update(init, mpc512x_init);
+	ppc_md_update(init_IRQ, mpc5121_ads_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(restart, mpc512x_restart);
+
 	mpc512x_init_early();
 
 	return 1;
@@ -65,11 +73,4 @@ static int __init mpc5121_ads_probe(void)
 define_machine(mpc5121_ads) {
 	.name			= "MPC5121 ADS",
 	.probe			= mpc5121_ads_probe,
-	.setup_arch		= mpc5121_ads_setup_arch,
-	.discover_phbs		= mpc5121_ads_setup_pci,
-	.init			= mpc512x_init,
-	.init_IRQ		= mpc5121_ads_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.restart		= mpc512x_restart,
 };
diff --git a/arch/powerpc/platforms/512x/mpc512x_generic.c b/arch/powerpc/platforms/512x/mpc512x_generic.c
index 303bc308b2e6..1a90ca674ff1 100644
--- a/arch/powerpc/platforms/512x/mpc512x_generic.c
+++ b/arch/powerpc/platforms/512x/mpc512x_generic.c
@@ -36,6 +36,13 @@ static int __init mpc512x_generic_probe(void)
 	if (!of_device_compatible_match(of_root, board))
 		return 0;
 
+	ppc_md_update(init, mpc512x_init);
+	ppc_md_update(setup_arch, mpc512x_setup_arch);
+	ppc_md_update(init_IRQ, mpc512x_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(restart, mpc512x_restart);
+
 	mpc512x_init_early();
 
 	return 1;
@@ -44,10 +51,4 @@ static int __init mpc512x_generic_probe(void)
 define_machine(mpc512x_generic) {
 	.name			= "MPC512x generic",
 	.probe			= mpc512x_generic_probe,
-	.init			= mpc512x_init,
-	.setup_arch		= mpc512x_setup_arch,
-	.init_IRQ		= mpc512x_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.restart		= mpc512x_restart,
 };
diff --git a/arch/powerpc/platforms/512x/pdm360ng.c b/arch/powerpc/platforms/512x/pdm360ng.c
index 1e911f42697d..a2fe160b8774 100644
--- a/arch/powerpc/platforms/512x/pdm360ng.c
+++ b/arch/powerpc/platforms/512x/pdm360ng.c
@@ -111,6 +111,13 @@ static int __init pdm360ng_probe(void)
 	if (!of_machine_is_compatible("ifm,pdm360ng"))
 		return 0;
 
+	ppc_md_update(setup_arch, mpc512x_setup_arch);
+	ppc_md_update(init, pdm360ng_init);
+	ppc_md_update(init_IRQ, mpc512x_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(restart, mpc512x_restart);
+
 	mpc512x_init_early();
 
 	return 1;
@@ -119,10 +126,4 @@ static int __init pdm360ng_probe(void)
 define_machine(pdm360ng) {
 	.name			= "PDM360NG",
 	.probe			= pdm360ng_probe,
-	.setup_arch		= mpc512x_setup_arch,
-	.init			= pdm360ng_init,
-	.init_IRQ		= mpc512x_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.restart		= mpc512x_restart,
 };
diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
index c3f43da64f68..8480d7a7bcd6 100644
--- a/arch/powerpc/platforms/52xx/efika.c
+++ b/arch/powerpc/platforms/52xx/efika.c
@@ -202,6 +202,23 @@ static int __init efika_probe(void)
 	if (strcmp(model, "EFIKA5K2"))
 		return 0;
 
+	ppc_md_update(setup_arch, efika_setup_arch);
+	ppc_md_update(discover_phbs, efika_pcisetup);
+	ppc_md_update(init, mpc52xx_declare_of_platform_devices);
+	ppc_md_update(show_cpuinfo, efika_show_cpuinfo);
+	ppc_md_update(init_IRQ, mpc52xx_init_irq);
+	ppc_md_update(get_irq, mpc52xx_get_irq);
+	ppc_md_update(restart, rtas_restart);
+	ppc_md_update(halt, rtas_halt);
+	ppc_md_update(set_rtc_time, rtas_set_rtc_time);
+	ppc_md_update(get_rtc_time, rtas_get_rtc_time);
+	ppc_md_update(progress, rtas_progress);
+	ppc_md_update(get_boot_time, rtas_get_boot_time);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+#ifdef CONFIG_PCI
+	ppc_md_update(phys_mem_access_prot, pci_phys_mem_access_prot);
+#endif
+
 	DMA_MODE_READ = 0x44;
 	DMA_MODE_WRITE = 0x48;
 
@@ -214,21 +231,5 @@ define_machine(efika)
 {
 	.name			= EFIKA_PLATFORM_NAME,
 	.probe			= efika_probe,
-	.setup_arch		= efika_setup_arch,
-	.discover_phbs		= efika_pcisetup,
-	.init			= mpc52xx_declare_of_platform_devices,
-	.show_cpuinfo		= efika_show_cpuinfo,
-	.init_IRQ		= mpc52xx_init_irq,
-	.get_irq		= mpc52xx_get_irq,
-	.restart		= rtas_restart,
-	.halt			= rtas_halt,
-	.set_rtc_time		= rtas_set_rtc_time,
-	.get_rtc_time		= rtas_get_rtc_time,
-	.progress		= rtas_progress,
-	.get_boot_time		= rtas_get_boot_time,
-	.calibrate_decr		= generic_calibrate_decr,
-#ifdef CONFIG_PCI
-	.phys_mem_access_prot	= pci_phys_mem_access_prot,
-#endif
 };
 
diff --git a/arch/powerpc/platforms/52xx/lite5200.c b/arch/powerpc/platforms/52xx/lite5200.c
index c39601b995f6..6972f3cbd7c7 100644
--- a/arch/powerpc/platforms/52xx/lite5200.c
+++ b/arch/powerpc/platforms/52xx/lite5200.c
@@ -177,17 +177,21 @@ static const char * const board[] __initconst = {
  */
 static int __init lite5200_probe(void)
 {
-	return of_device_compatible_match(of_root, board);
+	if (!of_device_compatible_match(of_root, board))
+		return 0;
+
+	ppc_md_update(setup_arch, lite5200_setup_arch);
+	ppc_md_update(discover_phbs, mpc52xx_setup_pci);
+	ppc_md_update(init, mpc52xx_declare_of_platform_devices);
+	ppc_md_update(init_IRQ, mpc52xx_init_irq);
+	ppc_md_update(get_irq, mpc52xx_get_irq);
+	ppc_md_update(restart, mpc52xx_restart);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
+	return 1;
 }
 
 define_machine(lite5200) {
 	.name 		= "lite5200",
 	.probe 		= lite5200_probe,
-	.setup_arch 	= lite5200_setup_arch,
-	.discover_phbs	= mpc52xx_setup_pci,
-	.init		= mpc52xx_declare_of_platform_devices,
-	.init_IRQ 	= mpc52xx_init_irq,
-	.get_irq 	= mpc52xx_get_irq,
-	.restart	= mpc52xx_restart,
-	.calibrate_decr	= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/52xx/media5200.c b/arch/powerpc/platforms/52xx/media5200.c
index dbf32604f1f6..632f72798727 100644
--- a/arch/powerpc/platforms/52xx/media5200.c
+++ b/arch/powerpc/platforms/52xx/media5200.c
@@ -233,17 +233,21 @@ static const char * const board[] __initconst = {
  */
 static int __init media5200_probe(void)
 {
-	return of_device_compatible_match(of_root, board);
+	if (!of_device_compatible_match(of_root, board))
+		return 0;
+
+	ppc_md_update(setup_arch, media5200_setup_arch);
+	ppc_md_update(discover_phbs, mpc52xx_setup_pci);
+	ppc_md_update(init, mpc52xx_declare_of_platform_devices);
+	ppc_md_update(init_IRQ, media5200_init_irq);
+	ppc_md_update(get_irq, mpc52xx_get_irq);
+	ppc_md_update(restart, mpc52xx_restart);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
+	return 1;
 }
 
 define_machine(media5200_platform) {
 	.name		= "media5200-platform",
 	.probe		= media5200_probe,
-	.setup_arch	= media5200_setup_arch,
-	.discover_phbs	= mpc52xx_setup_pci,
-	.init		= mpc52xx_declare_of_platform_devices,
-	.init_IRQ	= media5200_init_irq,
-	.get_irq	= mpc52xx_get_irq,
-	.restart	= mpc52xx_restart,
-	.calibrate_decr	= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/52xx/mpc5200_simple.c b/arch/powerpc/platforms/52xx/mpc5200_simple.c
index 18eb74a323ec..ea5d631312f1 100644
--- a/arch/powerpc/platforms/52xx/mpc5200_simple.c
+++ b/arch/powerpc/platforms/52xx/mpc5200_simple.c
@@ -63,17 +63,21 @@ static const char *board[] __initdata = {
  */
 static int __init mpc5200_simple_probe(void)
 {
-	return of_device_compatible_match(of_root, board);
+	if (!of_device_compatible_match(of_root, board))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc5200_simple_setup_arch);
+	ppc_md_update(discover_phbs, mpc52xx_setup_pci);
+	ppc_md_update(init, mpc52xx_declare_of_platform_devices);
+	ppc_md_update(init_IRQ, mpc52xx_init_irq);
+	ppc_md_update(get_irq, mpc52xx_get_irq);
+	ppc_md_update(restart, mpc52xx_restart);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
+	return 1;
 }
 
 define_machine(mpc5200_simple_platform) {
 	.name		= "mpc5200-simple-platform",
 	.probe		= mpc5200_simple_probe,
-	.setup_arch	= mpc5200_simple_setup_arch,
-	.discover_phbs	= mpc52xx_setup_pci,
-	.init		= mpc52xx_declare_of_platform_devices,
-	.init_IRQ	= mpc52xx_init_irq,
-	.get_irq	= mpc52xx_get_irq,
-	.restart	= mpc52xx_restart,
-	.calibrate_decr	= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/82xx/ep8248e.c b/arch/powerpc/platforms/82xx/ep8248e.c
index 3ca47f8a212e..23196a4138e4 100644
--- a/arch/powerpc/platforms/82xx/ep8248e.c
+++ b/arch/powerpc/platforms/82xx/ep8248e.c
@@ -305,17 +305,21 @@ machine_device_initcall(ep8248e, declare_of_platform_devices);
  */
 static int __init ep8248e_probe(void)
 {
-	return of_machine_is_compatible("fsl,ep8248e");
+	if (!of_machine_is_compatible("fsl,ep8248e"))
+		return 0;
+
+	ppc_md_update(setup_arch, ep8248e_setup_arch);
+	ppc_md_update(init_IRQ, ep8248e_pic_init);
+	ppc_md_update(get_irq, cpm2_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(restart, pq2_restart);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(ep8248e)
 {
 	.name = "Embedded Planet EP8248E",
 	.probe = ep8248e_probe,
-	.setup_arch = ep8248e_setup_arch,
-	.init_IRQ = ep8248e_pic_init,
-	.get_irq = cpm2_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
-	.restart = pq2_restart,
-	.progress = udbg_progress,
 };
diff --git a/arch/powerpc/platforms/82xx/km82xx.c b/arch/powerpc/platforms/82xx/km82xx.c
index 31fd4a5be0ee..74f75032439d 100644
--- a/arch/powerpc/platforms/82xx/km82xx.c
+++ b/arch/powerpc/platforms/82xx/km82xx.c
@@ -192,17 +192,21 @@ machine_device_initcall(km82xx, declare_of_platform_devices);
  */
 static int __init km82xx_probe(void)
 {
-	return of_machine_is_compatible("keymile,km82xx");
+	if (!of_machine_is_compatible("keymile,km82xx"))
+		return 0;
+
+	ppc_md_update(setup_arch, km82xx_setup_arch);
+	ppc_md_update(init_IRQ, km82xx_pic_init);
+	ppc_md_update(get_irq, cpm2_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(restart, pq2_restart);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(km82xx)
 {
 	.name = "Keymile km82xx",
 	.probe = km82xx_probe,
-	.setup_arch = km82xx_setup_arch,
-	.init_IRQ = km82xx_pic_init,
-	.get_irq = cpm2_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
-	.restart = pq2_restart,
-	.progress = udbg_progress,
 };
diff --git a/arch/powerpc/platforms/82xx/mpc8272_ads.c b/arch/powerpc/platforms/82xx/mpc8272_ads.c
index deacb2fa84f4..e4608ac9742b 100644
--- a/arch/powerpc/platforms/82xx/mpc8272_ads.c
+++ b/arch/powerpc/platforms/82xx/mpc8272_ads.c
@@ -194,18 +194,22 @@ machine_device_initcall(mpc8272_ads, declare_of_platform_devices);
  */
 static int __init mpc8272_ads_probe(void)
 {
-	return of_machine_is_compatible("fsl,mpc8272ads");
+	if (!of_machine_is_compatible("fsl,mpc8272ads"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc8272_ads_setup_arch);
+	ppc_md_update(discover_phbs, pq2_init_pci);
+	ppc_md_update(init_IRQ, mpc8272_ads_pic_init);
+	ppc_md_update(get_irq, cpm2_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(restart, pq2_restart);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc8272_ads)
 {
 	.name = "Freescale MPC8272 ADS",
 	.probe = mpc8272_ads_probe,
-	.setup_arch = mpc8272_ads_setup_arch,
-	.discover_phbs = pq2_init_pci,
-	.init_IRQ = mpc8272_ads_pic_init,
-	.get_irq = cpm2_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
-	.restart = pq2_restart,
-	.progress = udbg_progress,
 };
diff --git a/arch/powerpc/platforms/82xx/pq2fads.c b/arch/powerpc/platforms/82xx/pq2fads.c
index 794349c53f59..2ce3466a30b0 100644
--- a/arch/powerpc/platforms/82xx/pq2fads.c
+++ b/arch/powerpc/platforms/82xx/pq2fads.c
@@ -157,7 +157,18 @@ static void __init pq2fads_setup_arch(void)
  */
 static int __init pq2fads_probe(void)
 {
-	return of_machine_is_compatible("fsl,pq2fads");
+	if (!of_machine_is_compatible("fsl,pq2fads"))
+		return 0;
+
+	ppc_md_update(setup_arch, pq2fads_setup_arch);
+	ppc_md_update(discover_phbs, pq2_init_pci);
+	ppc_md_update(init_IRQ, pq2fads_pic_init);
+	ppc_md_update(get_irq, cpm2_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(restart, pq2_restart);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
@@ -179,11 +190,4 @@ define_machine(pq2fads)
 {
 	.name = "Freescale PQ2FADS",
 	.probe = pq2fads_probe,
-	.setup_arch = pq2fads_setup_arch,
-	.discover_phbs = pq2_init_pci,
-	.init_IRQ = pq2fads_pic_init,
-	.get_irq = cpm2_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
-	.restart = pq2_restart,
-	.progress = udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/asp834x.c b/arch/powerpc/platforms/83xx/asp834x.c
index 68061c2a57c1..1aafb506b1b0 100644
--- a/arch/powerpc/platforms/83xx/asp834x.c
+++ b/arch/powerpc/platforms/83xx/asp834x.c
@@ -37,18 +37,22 @@ machine_device_initcall(asp834x, mpc83xx_declare_of_platform_devices);
  */
 static int __init asp834x_probe(void)
 {
-	return of_machine_is_compatible("analogue-and-micro,asp8347e");
+	if (!of_machine_is_compatible("analogue-and-micro,asp8347e"))
+		return 0;
+
+	ppc_md_update(setup_arch, asp834x_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(asp834x) {
 	.name			= "ASP8347E",
 	.probe			= asp834x_probe,
-	.setup_arch		= asp834x_setup_arch,
-	.discover_phbs		= mpc83xx_setup_pci,
-	.init_IRQ		= mpc83xx_ipic_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.restart		= mpc83xx_restart,
-	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index 108e1e4d2683..949b7a776853 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -173,18 +173,22 @@ static int __init mpc83xx_km_probe(void)
 			break;
 		i++;
 	}
-	return (board[i] != NULL);
+	if (!board[i])
+		return 0;
+
+	ppc_md_update(setup_arch, mpc83xx_km_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc83xx_km) {
 	.name		= "mpc83xx-km-platform",
 	.probe		= mpc83xx_km_probe,
-	.setup_arch	= mpc83xx_km_setup_arch,
-	.discover_phbs	= mpc83xx_setup_pci,
-	.init_IRQ	= mpc83xx_ipic_init_IRQ,
-	.get_irq	= ipic_get_irq,
-	.restart	= mpc83xx_restart,
-	.time_init	= mpc83xx_time_init,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc830x_rdb.c b/arch/powerpc/platforms/83xx/mpc830x_rdb.c
index 956d4389effa..a4d7b0b29dd1 100644
--- a/arch/powerpc/platforms/83xx/mpc830x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc830x_rdb.c
@@ -39,7 +39,19 @@ static const char *board[] __initdata = {
  */
 static int __init mpc830x_rdb_probe(void)
 {
-	return of_device_compatible_match(of_root, board);
+	if (!of_device_compatible_match(of_root, board))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc830x_rdb_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 machine_device_initcall(mpc830x_rdb, mpc83xx_declare_of_platform_devices);
@@ -47,12 +59,4 @@ machine_device_initcall(mpc830x_rdb, mpc83xx_declare_of_platform_devices);
 define_machine(mpc830x_rdb) {
 	.name			= "MPC830x RDB",
 	.probe			= mpc830x_rdb_probe,
-	.setup_arch		= mpc830x_rdb_setup_arch,
-	.discover_phbs		= mpc83xx_setup_pci,
-	.init_IRQ		= mpc83xx_ipic_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.restart		= mpc83xx_restart,
-	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc831x_rdb.c b/arch/powerpc/platforms/83xx/mpc831x_rdb.c
index 3b578f080e3b..52b1facb2c45 100644
--- a/arch/powerpc/platforms/83xx/mpc831x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc831x_rdb.c
@@ -39,7 +39,19 @@ static const char *board[] __initdata = {
  */
 static int __init mpc831x_rdb_probe(void)
 {
-	return of_device_compatible_match(of_root, board);
+	if (!of_device_compatible_match(of_root, board))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc831x_rdb_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 machine_device_initcall(mpc831x_rdb, mpc83xx_declare_of_platform_devices);
@@ -47,12 +59,4 @@ machine_device_initcall(mpc831x_rdb, mpc83xx_declare_of_platform_devices);
 define_machine(mpc831x_rdb) {
 	.name			= "MPC831x RDB",
 	.probe			= mpc831x_rdb_probe,
-	.setup_arch		= mpc831x_rdb_setup_arch,
-	.discover_phbs		= mpc83xx_setup_pci,
-	.init_IRQ		= mpc83xx_ipic_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.restart		= mpc83xx_restart,
-	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc832x_mds.c b/arch/powerpc/platforms/83xx/mpc832x_mds.c
index 850d566ef900..1ab1874b448b 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_mds.c
@@ -94,7 +94,19 @@ machine_device_initcall(mpc832x_mds, mpc83xx_declare_of_platform_devices);
  */
 static int __init mpc832x_sys_probe(void)
 {
-	return of_machine_is_compatible("MPC832xMDS");
+	if (!of_machine_is_compatible("MPC832xMDS"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc831x_rdb_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc832x_mds) {
diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
index b6133a237a70..42399b438f8e 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
@@ -212,18 +212,22 @@ machine_device_initcall(mpc832x_rdb, mpc83xx_declare_of_platform_devices);
  */
 static int __init mpc832x_rdb_probe(void)
 {
-	return of_machine_is_compatible("MPC832xRDB");
+	if (!of_machine_is_compatible("MPC832xRDB"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc832x_rdb_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc832x_rdb) {
 	.name		= "MPC832x RDB",
 	.probe		= mpc832x_rdb_probe,
-	.setup_arch	= mpc832x_rdb_setup_arch,
-	.discover_phbs  = mpc83xx_setup_pci,
-	.init_IRQ	= mpc83xx_ipic_init_IRQ,
-	.get_irq	= ipic_get_irq,
-	.restart	= mpc83xx_restart,
-	.time_init	= mpc83xx_time_init,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc834x_itx.c b/arch/powerpc/platforms/83xx/mpc834x_itx.c
index 9630f3aa4d9c..cbfd35273b24 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_itx.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_itx.c
@@ -63,18 +63,22 @@ static void __init mpc834x_itx_setup_arch(void)
  */
 static int __init mpc834x_itx_probe(void)
 {
-	return of_machine_is_compatible("MPC834xMITX");
+	if (!of_machine_is_compatible("MPC834xMITX"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc834x_itx_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc834x_itx) {
 	.name			= "MPC834x ITX",
 	.probe			= mpc834x_itx_probe,
-	.setup_arch		= mpc834x_itx_setup_arch,
-	.discover_phbs  	= mpc83xx_setup_pci,
-	.init_IRQ		= mpc83xx_ipic_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.restart		= mpc83xx_restart,
-	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc834x_mds.c b/arch/powerpc/platforms/83xx/mpc834x_mds.c
index 6d91bdce0a18..d5829a90cbad 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_mds.c
@@ -84,18 +84,22 @@ machine_device_initcall(mpc834x_mds, mpc83xx_declare_of_platform_devices);
  */
 static int __init mpc834x_mds_probe(void)
 {
-	return of_machine_is_compatible("MPC834xMDS");
+	if (!of_machine_is_compatible("MPC834xMDS"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc834x_mds_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc834x_mds) {
 	.name			= "MPC834x MDS",
 	.probe			= mpc834x_mds_probe,
-	.setup_arch		= mpc834x_mds_setup_arch,
-	.discover_phbs  	= mpc83xx_setup_pci,
-	.init_IRQ		= mpc83xx_ipic_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.restart		= mpc83xx_restart,
-	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c b/arch/powerpc/platforms/83xx/mpc836x_mds.c
index da4cf52cb55b..5091f53f558c 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_mds.c
@@ -194,18 +194,22 @@ machine_arch_initcall(mpc836x_mds, mpc836x_usb_cfg);
  */
 static int __init mpc836x_mds_probe(void)
 {
-	return of_machine_is_compatible("MPC836xMDS");
+	if (!of_machine_is_compatible("MPC836xMDS"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc836x_mds_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc836x_mds) {
 	.name		= "MPC836x MDS",
 	.probe		= mpc836x_mds_probe,
-	.setup_arch	= mpc836x_mds_setup_arch,
-	.discover_phbs  = mpc83xx_setup_pci,
-	.init_IRQ	= mpc83xx_ipic_init_IRQ,
-	.get_irq	= ipic_get_irq,
-	.restart	= mpc83xx_restart,
-	.time_init	= mpc83xx_time_init,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc836x_rdk.c b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
index 3427ad0d9d38..19a86612c579 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_rdk.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
@@ -34,18 +34,22 @@ static void __init mpc836x_rdk_setup_arch(void)
  */
 static int __init mpc836x_rdk_probe(void)
 {
-	return of_machine_is_compatible("fsl,mpc8360rdk");
+	if (!of_machine_is_compatible("fsl,mpc8360rdk"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc836x_rdk_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc836x_rdk) {
 	.name		= "MPC836x RDK",
 	.probe		= mpc836x_rdk_probe,
-	.setup_arch	= mpc836x_rdk_setup_arch,
-	.discover_phbs  = mpc83xx_setup_pci,
-	.init_IRQ	= mpc83xx_ipic_init_IRQ,
-	.get_irq	= ipic_get_irq,
-	.restart	= mpc83xx_restart,
-	.time_init	= mpc83xx_time_init,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc837x_mds.c b/arch/powerpc/platforms/83xx/mpc837x_mds.c
index f28d166ea7db..dab4343b8a19 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_mds.c
@@ -86,18 +86,22 @@ machine_device_initcall(mpc837x_mds, mpc83xx_declare_of_platform_devices);
  */
 static int __init mpc837x_mds_probe(void)
 {
-	return of_machine_is_compatible("fsl,mpc837xmds");
+	if (!of_machine_is_compatible("fsl,mpc837xmds"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc837x_mds_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc837x_mds) {
 	.name			= "MPC837x MDS",
 	.probe			= mpc837x_mds_probe,
-	.setup_arch		= mpc837x_mds_setup_arch,
-	.discover_phbs  	= mpc83xx_setup_pci,
-	.init_IRQ		= mpc83xx_ipic_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.restart		= mpc83xx_restart,
-	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc837x_rdb.c b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
index 7fb7684c256b..a542cb240c3e 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
@@ -66,18 +66,22 @@ static const char * const board[] __initconst = {
  */
 static int __init mpc837x_rdb_probe(void)
 {
-	return of_device_compatible_match(of_root, board);
+	if (!of_device_compatible_match(of_root, board))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc837x_rdb_setup_arch);
+	ppc_md_update(discover_phbs, mpc83xx_setup_pci);
+	ppc_md_update(init_IRQ, mpc83xx_ipic_init_IRQ);
+	ppc_md_update(get_irq, ipic_get_irq);
+	ppc_md_update(restart, mpc83xx_restart);
+	ppc_md_update(time_init, mpc83xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc837x_rdb) {
 	.name			= "MPC837x RDB/WLAN",
 	.probe			= mpc837x_rdb_probe,
-	.setup_arch		= mpc837x_rdb_setup_arch,
-	.discover_phbs  	= mpc83xx_setup_pci,
-	.init_IRQ		= mpc83xx_ipic_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.restart		= mpc83xx_restart,
-	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/bsc913x_qds.c b/arch/powerpc/platforms/85xx/bsc913x_qds.c
index bad1423d012d..bdb148d96d9a 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_qds.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_qds.c
@@ -55,18 +55,22 @@ machine_arch_initcall(bsc9132_qds, mpc85xx_common_publish_devices);
 
 static int __init bsc9132_qds_probe(void)
 {
-	return of_machine_is_compatible("fsl,bsc9132qds");
+	if (!of_machine_is_compatible("fsl,bsc9132qds"))
+		return 0;
+
+	ppc_md_update(setup_arch, bsc913x_qds_setup_arch);
+	ppc_md_update(init_IRQ, bsc913x_qds_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(bsc9132_qds) {
 	.name			= "BSC9132 QDS",
 	.probe			= bsc9132_qds_probe,
-	.setup_arch		= bsc913x_qds_setup_arch,
-	.init_IRQ		= bsc913x_qds_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/bsc913x_rdb.c b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
index 6dc34569a940..5c66df5c4cc5 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_rdb.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
@@ -45,15 +45,19 @@ machine_device_initcall(bsc9131_rdb, mpc85xx_common_publish_devices);
 
 static int __init bsc9131_rdb_probe(void)
 {
-	return of_machine_is_compatible("fsl,bsc9131rdb");
+	if (!of_machine_is_compatible("fsl,bsc9131rdb"))
+		return 0;
+
+	ppc_md_update(setup_arch, bsc913x_rdb_setup_arch);
+	ppc_md_update(init_IRQ, bsc913x_rdb_pic_init);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(bsc9131_rdb) {
 	.name			= "BSC9131 RDB",
 	.probe			= bsc9131_rdb_probe,
-	.setup_arch		= bsc913x_rdb_setup_arch,
-	.init_IRQ		= bsc913x_rdb_pic_init,
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/c293pcie.c b/arch/powerpc/platforms/85xx/c293pcie.c
index 8c59eeb92507..1f4eca71624d 100644
--- a/arch/powerpc/platforms/85xx/c293pcie.c
+++ b/arch/powerpc/platforms/85xx/c293pcie.c
@@ -49,17 +49,19 @@ machine_arch_initcall(c293_pcie, mpc85xx_common_publish_devices);
  */
 static int __init c293_pcie_probe(void)
 {
-	if (of_machine_is_compatible("fsl,C293PCIE"))
-		return 1;
-	return 0;
+	if (!of_machine_is_compatible("fsl,C293PCIE"))
+		return 0;
+
+	ppc_md_update(setup_arch, c293_pcie_setup_arch);
+	ppc_md_update(init_IRQ, c293_pcie_pic_init);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(c293_pcie) {
 	.name			= "C293 PCIE",
 	.probe			= c293_pcie_probe,
-	.setup_arch		= c293_pcie_setup_arch,
-	.init_IRQ		= c293_pcie_pic_init,
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index f2da4d23da23..28cbf45398fe 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -139,6 +139,34 @@ static const char * const boards[] __initconst = {
 	NULL
 };
 
+static void __init corenet_generic_populate(void)
+{
+	ppc_md_update(setup_arch, corenet_gen_setup_arch);
+	ppc_md_update(init_IRQ, corenet_gen_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+/*
+ * Core reset may cause issues if using the proxy mode of MPICppc_md_update(
+ * So); use the mixed mode of MPIC if enabling CPU hotplugppc_md_update(
+ *
+ * Likewise); problems have been seen with kexec when coreint is enabledppc_md_update(
+ */
+#if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_KEXEC_CORE)
+	ppc_md_update(get_irq, mpic_get_irq);
+#else
+	ppc_md_update(get_irq, mpic_get_coreint_irq);
+#endif
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+#ifdef CONFIG_PPC64
+	ppc_md_update(power_save, book3e_idle);
+#else
+	ppc_md_update(power_save, e500_idle);
+#endif
+}
+
 /*
  * Called very early, device-tree isn't unflattened
  */
@@ -150,13 +178,17 @@ static int __init corenet_generic_probe(void)
 	extern struct smp_ops_t smp_85xx_ops;
 #endif
 
-	if (of_device_compatible_match(of_root, boards))
+	if (of_device_compatible_match(of_root, boards)) {
+		corenet_generic_populate();
 		return 1;
+	}
 
 	/* Check if we're running under the Freescale hypervisor */
 	for (i = 0; boards[i]; i++) {
 		snprintf(hv_compat, sizeof(hv_compat), "%s-hv", boards[i]);
 		if (of_machine_is_compatible(hv_compat)) {
+			corenet_generic_populate();
+
 			ppc_md_update(init_IRQ, ehv_pic_init);
 
 			ppc_md_update(get_irq, ehv_pic_get_irq);
@@ -182,28 +214,4 @@ static int __init corenet_generic_probe(void)
 define_machine(corenet_generic) {
 	.name			= "CoreNet Generic",
 	.probe			= corenet_generic_probe,
-	.setup_arch		= corenet_gen_setup_arch,
-	.init_IRQ		= corenet_gen_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-/*
- * Core reset may cause issues if using the proxy mode of MPIC.
- * So, use the mixed mode of MPIC if enabling CPU hotplug.
- *
- * Likewise, problems have been seen with kexec when coreint is enabled.
- */
-#if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_KEXEC_CORE)
-	.get_irq		= mpic_get_irq,
-#else
-	.get_irq		= mpic_get_coreint_irq,
-#endif
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-#ifdef CONFIG_PPC64
-	.power_save		= book3e_idle,
-#else
-	.power_save		= e500_idle,
-#endif
 };
diff --git a/arch/powerpc/platforms/85xx/ge_imp3a.c b/arch/powerpc/platforms/85xx/ge_imp3a.c
index 24a16c29c4a5..3df4339125a8 100644
--- a/arch/powerpc/platforms/85xx/ge_imp3a.c
+++ b/arch/powerpc/platforms/85xx/ge_imp3a.c
@@ -192,7 +192,21 @@ static void ge_imp3a_show_cpuinfo(struct seq_file *m)
  */
 static int __init ge_imp3a_probe(void)
 {
-	return of_machine_is_compatible("ge,IMP3A");
+	if (!of_machine_is_compatible("ge,IMP3A"))
+		return 0;
+
+	ppc_md_update(setup_arch, ge_imp3a_setup_arch);
+	ppc_md_update(init_IRQ, ge_imp3a_pic_init);
+	ppc_md_update(show_cpuinfo, ge_imp3a_show_cpuinfo);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 machine_arch_initcall(ge_imp3a, mpc85xx_common_publish_devices);
@@ -200,14 +214,4 @@ machine_arch_initcall(ge_imp3a, mpc85xx_common_publish_devices);
 define_machine(ge_imp3a) {
 	.name			= "GE_IMP3A",
 	.probe			= ge_imp3a_probe,
-	.setup_arch		= ge_imp3a_setup_arch,
-	.init_IRQ		= ge_imp3a_pic_init,
-	.show_cpuinfo		= ge_imp3a_show_cpuinfo,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/ksi8560.c b/arch/powerpc/platforms/85xx/ksi8560.c
index 67b6cdad925b..b5eccfc1a81c 100644
--- a/arch/powerpc/platforms/85xx/ksi8560.c
+++ b/arch/powerpc/platforms/85xx/ksi8560.c
@@ -175,16 +175,20 @@ machine_device_initcall(ksi8560, mpc85xx_common_publish_devices);
  */
 static int __init ksi8560_probe(void)
 {
-	return of_machine_is_compatible("emerson,KSI8560");
+	if (!of_machine_is_compatible("emerson,KSI8560"))
+		return 0;
+
+	ppc_md_update(setup_arch, ksi8560_setup_arch);
+	ppc_md_update(init_IRQ, ksi8560_pic_init);
+	ppc_md_update(show_cpuinfo, ksi8560_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(restart, machine_restart);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
+	return 1;
 }
 
 define_machine(ksi8560) {
 	.name			= "KSI8560",
 	.probe			= ksi8560_probe,
-	.setup_arch		= ksi8560_setup_arch,
-	.init_IRQ		= ksi8560_pic_init,
-	.show_cpuinfo		= ksi8560_show_cpuinfo,
-	.get_irq		= mpic_get_irq,
-	.restart		= machine_restart,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/85xx/mpc8536_ds.c b/arch/powerpc/platforms/85xx/mpc8536_ds.c
index 78ce62e645e6..66b7bf93a935 100644
--- a/arch/powerpc/platforms/85xx/mpc8536_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc8536_ds.c
@@ -57,19 +57,23 @@ machine_arch_initcall(mpc8536_ds, mpc85xx_common_publish_devices);
  */
 static int __init mpc8536_ds_probe(void)
 {
-	return of_machine_is_compatible("fsl,mpc8536ds");
+	if (!of_machine_is_compatible("fsl,mpc8536ds"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc8536_ds_setup_arch);
+	ppc_md_update(init_IRQ, mpc8536_ds_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc8536_ds) {
 	.name			= "MPC8536 DS",
 	.probe			= mpc8536_ds_probe,
-	.setup_arch		= mpc8536_ds_setup_arch,
-	.init_IRQ		= mpc8536_ds_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ads.c b/arch/powerpc/platforms/85xx/mpc85xx_ads.c
index e1d24b78725b..52e98a5b06eb 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ads.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ads.c
@@ -155,16 +155,20 @@ machine_arch_initcall(mpc85xx_ads, mpc85xx_common_publish_devices);
  */
 static int __init mpc85xx_ads_probe(void)
 {
-	return of_machine_is_compatible("MPC85xxADS");
+	if (!of_machine_is_compatible("MPC85xxADS"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc85xx_ads_setup_arch);
+	ppc_md_update(init_IRQ, mpc85xx_ads_pic_init);
+	ppc_md_update(show_cpuinfo, mpc85xx_ads_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc85xx_ads) {
 	.name			= "MPC85xx ADS",
 	.probe			= mpc85xx_ads_probe,
-	.setup_arch		= mpc85xx_ads_setup_arch,
-	.init_IRQ		= mpc85xx_ads_pic_init,
-	.show_cpuinfo		= mpc85xx_ads_show_cpuinfo,
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index bc7bdf0cab6e..14bb9e9c1637 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -373,7 +373,21 @@ static void mpc85xx_cds_show_cpuinfo(struct seq_file *m)
  */
 static int __init mpc85xx_cds_probe(void)
 {
-	return of_machine_is_compatible("MPC85xxCDS");
+	if (!of_machine_is_compatible("MPC85xxCDS"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc85xx_cds_setup_arch);
+	ppc_md_update(init_IRQ, mpc85xx_cds_pic_init);
+	ppc_md_update(show_cpuinfo, mpc85xx_cds_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, mpc85xx_cds_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 machine_arch_initcall(mpc85xx_cds, mpc85xx_common_publish_devices);
@@ -381,14 +395,4 @@ machine_arch_initcall(mpc85xx_cds, mpc85xx_common_publish_devices);
 define_machine(mpc85xx_cds) {
 	.name		= "MPC85xx CDS",
 	.probe		= mpc85xx_cds_probe,
-	.setup_arch	= mpc85xx_cds_setup_arch,
-	.init_IRQ	= mpc85xx_cds_pic_init,
-	.show_cpuinfo	= mpc85xx_cds_show_cpuinfo,
-	.get_irq	= mpic_get_irq,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= mpc85xx_cds_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.calibrate_decr = generic_calibrate_decr,
-	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 960203bd83cd..6d541f43b58f 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -162,7 +162,20 @@ static void __init mpc85xx_ds_setup_arch(void)
  */
 static int __init mpc8544_ds_probe(void)
 {
-	return !!of_machine_is_compatible("MPC8544DS");
+	if (!of_machine_is_compatible("MPC8544DS"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc85xx_ds_setup_arch);
+	ppc_md_update(init_IRQ, mpc85xx_ds_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 machine_arch_initcall(mpc8544_ds, mpc85xx_common_publish_devices);
@@ -174,7 +187,20 @@ machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
  */
 static int __init mpc8572_ds_probe(void)
 {
-	return !!of_machine_is_compatible("fsl,MPC8572DS");
+	if (!of_machine_is_compatible("fsl,MPC8572DS"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc85xx_ds_setup_arch);
+	ppc_md_update(init_IRQ, mpc85xx_ds_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 /*
@@ -182,47 +208,33 @@ static int __init mpc8572_ds_probe(void)
  */
 static int __init p2020_ds_probe(void)
 {
-	return !!of_machine_is_compatible("fsl,P2020DS");
+	if (!of_machine_is_compatible("fsl,P2020DS"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc85xx_ds_setup_arch);
+	ppc_md_update(init_IRQ, mpc85xx_ds_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mpc8544_ds) {
 	.name			= "MPC8544 DS",
 	.probe			= mpc8544_ds_probe,
-	.setup_arch		= mpc85xx_ds_setup_arch,
-	.init_IRQ		= mpc85xx_ds_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(mpc8572_ds) {
 	.name			= "MPC8572 DS",
 	.probe			= mpc8572_ds_probe,
-	.setup_arch		= mpc85xx_ds_setup_arch,
-	.init_IRQ		= mpc85xx_ds_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(p2020_ds) {
 	.name			= "P2020 DS",
 	.probe			= p2020_ds_probe,
-	.setup_arch		= mpc85xx_ds_setup_arch,
-	.init_IRQ		= mpc85xx_ds_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
index a74c1e9520f7..6aeaaea305b4 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@ -341,58 +341,69 @@ static void __init mpc85xx_mds_pic_init(void)
 
 static int __init mpc85xx_mds_probe(void)
 {
-	return of_machine_is_compatible("MPC85xxMDS");
+	if (!of_machine_is_compatible("MPC85xxMDS"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc85xx_mds_setup_arch);
+	ppc_md_update(init_IRQ, mpc85xx_mds_pic_init);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+	#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+	#endif
+
+	return 1;
 }
 
 define_machine(mpc8568_mds) {
 	.name		= "MPC8568 MDS",
 	.probe		= mpc85xx_mds_probe,
-	.setup_arch	= mpc85xx_mds_setup_arch,
-	.init_IRQ	= mpc85xx_mds_pic_init,
-	.get_irq	= mpic_get_irq,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress	= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
 };
 
 static int __init mpc8569_mds_probe(void)
 {
-	return of_machine_is_compatible("fsl,MPC8569EMDS");
+	if (!of_machine_is_compatible("fsl,MPC8569EMDS"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc85xx_mds_setup_arch);
+	ppc_md_update(init_IRQ, mpc85xx_mds_pic_init);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+
+	return 1;
 }
 
 define_machine(mpc8569_mds) {
 	.name		= "MPC8569 MDS",
 	.probe		= mpc8569_mds_probe,
-	.setup_arch	= mpc85xx_mds_setup_arch,
-	.init_IRQ	= mpc85xx_mds_pic_init,
-	.get_irq	= mpic_get_irq,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress	= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
 };
 
 static int __init p1021_mds_probe(void)
 {
-	return of_machine_is_compatible("fsl,P1021MDS");
+	if (!of_machine_is_compatible("fsl,P1021MDS"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc85xx_mds_setup_arch);
+	ppc_md_update(init_IRQ, mpc85xx_mds_pic_init);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
 
+	return 1;
 }
 
 define_machine(p1021_mds) {
 	.name		= "P1021 MDS",
 	.probe		= p1021_mds_probe,
-	.setup_arch	= mpc85xx_mds_setup_arch,
-	.init_IRQ	= mpc85xx_mds_pic_init,
-	.get_irq	= mpic_get_irq,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress	= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
 };
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index 14cad0505d82..a0976c5f834c 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -119,203 +119,168 @@ machine_arch_initcall(p1021_rdb_pc, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1025_rdb, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1024_rdb, mpc85xx_common_publish_devices);
 
+static void __init mpc85xx_rdb_populate(void)
+{
+	ppc_md_update(setup_arch, mpc85xx_rdb_setup_arch);
+	ppc_md_update(init_IRQ, mpc85xx_rdb_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+}
+
 /*
  * Called very early, device-tree isn't unflattened
  */
 static int __init p2020_rdb_probe(void)
 {
-	if (of_machine_is_compatible("fsl,P2020RDB"))
-		return 1;
-	return 0;
+	if (!of_machine_is_compatible("fsl,P2020RDB"))
+		return 0;
+
+	mpc85xx_rdb_populate();
+
+	return 1;
 }
 
 static int __init p1020_rdb_probe(void)
 {
-	if (of_machine_is_compatible("fsl,P1020RDB"))
-		return 1;
-	return 0;
+	if (!of_machine_is_compatible("fsl,P1020RDB"))
+		return 0;
+
+	mpc85xx_rdb_populate();
+
+	return 1;
 }
 
 static int __init p1020_rdb_pc_probe(void)
 {
-	return of_machine_is_compatible("fsl,P1020RDB-PC");
+	if (!of_machine_is_compatible("fsl,P1020RDB-PC"))
+		return 0;
+
+	mpc85xx_rdb_populate();
+
+	return 1;
 }
 
 static int __init p1020_rdb_pd_probe(void)
 {
-	return of_machine_is_compatible("fsl,P1020RDB-PD");
+	if (!of_machine_is_compatible("fsl,P1020RDB-PD"))
+		return 0;
+
+	mpc85xx_rdb_populate();
+
+	return 1;
 }
 
 static int __init p1021_rdb_pc_probe(void)
 {
-	if (of_machine_is_compatible("fsl,P1021RDB-PC"))
-		return 1;
-	return 0;
+	if (!of_machine_is_compatible("fsl,P1021RDB-PC"))
+		return 0;
+
+	mpc85xx_rdb_populate();
+
+	return 1;
 }
 
 static int __init p2020_rdb_pc_probe(void)
 {
-	if (of_machine_is_compatible("fsl,P2020RDB-PC"))
-		return 1;
-	return 0;
+	if (!of_machine_is_compatible("fsl,P2020RDB-PC"))
+		return 0;
+
+	mpc85xx_rdb_populate();
+
+	return 1;
 }
 
 static int __init p1025_rdb_probe(void)
 {
-	return of_machine_is_compatible("fsl,P1025RDB");
+	if (!of_machine_is_compatible("fsl,P1025RDB"))
+		return 0;
+
+	mpc85xx_rdb_populate();
+
+	return 1;
 }
 
 static int __init p1020_mbg_pc_probe(void)
 {
-	return of_machine_is_compatible("fsl,P1020MBG-PC");
+	if (!of_machine_is_compatible("fsl,P1020MBG-PC"))
+		return 0;
+
+	mpc85xx_rdb_populate();
+
+	return 1;
 }
 
 static int __init p1020_utm_pc_probe(void)
 {
-	return of_machine_is_compatible("fsl,P1020UTM-PC");
+	if (!of_machine_is_compatible("fsl,P1020UTM-PC"))
+		return 0;
+
+	mpc85xx_rdb_populate();
+
+	return 1;
 }
 
 static int __init p1024_rdb_probe(void)
 {
-	return of_machine_is_compatible("fsl,P1024RDB");
+	if (!of_machine_is_compatible("fsl,P1024RDB"))
+		return 0;
+
+	mpc85xx_rdb_populate();
+
+	return 1;
 }
 
 define_machine(p2020_rdb) {
 	.name			= "P2020 RDB",
 	.probe			= p2020_rdb_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(p1020_rdb) {
 	.name			= "P1020 RDB",
 	.probe			= p1020_rdb_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(p1021_rdb_pc) {
 	.name			= "P1021 RDB-PC",
 	.probe			= p1021_rdb_pc_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(p2020_rdb_pc) {
 	.name			= "P2020RDB-PC",
 	.probe			= p2020_rdb_pc_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(p1025_rdb) {
 	.name			= "P1025 RDB",
 	.probe			= p1025_rdb_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(p1020_mbg_pc) {
 	.name			= "P1020 MBG-PC",
 	.probe			= p1020_mbg_pc_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(p1020_utm_pc) {
 	.name			= "P1020 UTM-PC",
 	.probe			= p1020_utm_pc_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(p1020_rdb_pc) {
 	.name			= "P1020RDB-PC",
 	.probe			= p1020_rdb_pc_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(p1020_rdb_pd) {
 	.name			= "P1020RDB-PD",
 	.probe			= p1020_rdb_pd_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(p1024_rdb) {
 	.name			= "P1024 RDB",
 	.probe			= p1024_rdb_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/mvme2500.c b/arch/powerpc/platforms/85xx/mvme2500.c
index 1dc98fb60c1a..115e0c5f5fb6 100644
--- a/arch/powerpc/platforms/85xx/mvme2500.c
+++ b/arch/powerpc/platforms/85xx/mvme2500.c
@@ -47,19 +47,23 @@ machine_arch_initcall(mvme2500, mpc85xx_common_publish_devices);
  */
 static int __init mvme2500_probe(void)
 {
-	return of_machine_is_compatible("artesyn,MVME2500");
+	if (!of_machine_is_compatible("artesyn,MVME2500"))
+		return 0;
+
+	ppc_md_update(setup_arch, mvme2500_setup_arch);
+	ppc_md_update(init_IRQ, mvme2500_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(mvme2500) {
 	.name			= "MVME2500",
 	.probe			= mvme2500_probe,
-	.setup_arch		= mvme2500_setup_arch,
-	.init_IRQ		= mvme2500_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/p1010rdb.c b/arch/powerpc/platforms/85xx/p1010rdb.c
index 7ec9ced12eb3..187b78fb298b 100644
--- a/arch/powerpc/platforms/85xx/p1010rdb.c
+++ b/arch/powerpc/platforms/85xx/p1010rdb.c
@@ -56,23 +56,24 @@ machine_arch_initcall(p1010_rdb, mpc85xx_common_publish_devices);
  */
 static int __init p1010_rdb_probe(void)
 {
-	if (of_machine_is_compatible("fsl,P1010RDB"))
-		return 1;
-	if (of_machine_is_compatible("fsl,P1010RDB-PB"))
-		return 1;
-	return 0;
+	if (!of_machine_is_compatible("fsl,P1010RDB") &&
+	    !of_machine_is_compatible("fsl,P1010RDB-PB"))
+		return 0;
+
+	ppc_md_update(setup_arch, p1010_rdb_setup_arch);
+	ppc_md_update(init_IRQ, p1010_rdb_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(p1010_rdb) {
 	.name			= "P1010 RDB",
 	.probe			= p1010_rdb_probe,
-	.setup_arch		= p1010_rdb_setup_arch,
-	.init_IRQ		= p1010_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/p1022_ds.c b/arch/powerpc/platforms/85xx/p1022_ds.c
index 0fc89543235d..82a32a36114c 100644
--- a/arch/powerpc/platforms/85xx/p1022_ds.c
+++ b/arch/powerpc/platforms/85xx/p1022_ds.c
@@ -552,19 +552,23 @@ machine_arch_initcall(p1022_ds, mpc85xx_common_publish_devices);
  */
 static int __init p1022_ds_probe(void)
 {
-	return of_machine_is_compatible("fsl,p1022ds");
+	if (!of_machine_is_compatible("fsl,p1022ds"))
+		return 0;
+
+	ppc_md_update(setup_arch, p1022_ds_setup_arch);
+	ppc_md_update(init_IRQ, p1022_ds_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(p1022_ds) {
 	.name			= "P1022 DS",
 	.probe			= p1022_ds_probe,
-	.setup_arch		= p1022_ds_setup_arch,
-	.init_IRQ		= p1022_ds_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb	= fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/p1022_rdk.c b/arch/powerpc/platforms/85xx/p1022_rdk.c
index c3a9ca9a216b..e22b26ef2d7d 100644
--- a/arch/powerpc/platforms/85xx/p1022_rdk.c
+++ b/arch/powerpc/platforms/85xx/p1022_rdk.c
@@ -132,19 +132,23 @@ machine_arch_initcall(p1022_rdk, mpc85xx_common_publish_devices);
  */
 static int __init p1022_rdk_probe(void)
 {
-	return of_machine_is_compatible("fsl,p1022rdk");
+	if (!of_machine_is_compatible("fsl,p1022rdk"))
+		return 0;
+
+	ppc_md_update(setup_arch, p1022_rdk_setup_arch);
+	ppc_md_update(init_IRQ, p1022_rdk_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+		
+	return 1;
 }
 
 define_machine(p1022_rdk) {
 	.name			= "P1022 RDK",
 	.probe			= p1022_rdk_probe,
-	.setup_arch		= p1022_rdk_setup_arch,
-	.init_IRQ		= p1022_rdk_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/p1023_rdb.c b/arch/powerpc/platforms/85xx/p1023_rdb.c
index 8189838a5343..fd651ba84d43 100644
--- a/arch/powerpc/platforms/85xx/p1023_rdb.c
+++ b/arch/powerpc/platforms/85xx/p1023_rdb.c
@@ -95,20 +95,23 @@ static void __init mpc85xx_rdb_pic_init(void)
 
 static int __init p1023_rdb_probe(void)
 {
-	return of_machine_is_compatible("fsl,P1023RDB");
+	if (!of_machine_is_compatible("fsl,P1023RDB"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc85xx_rdb_setup_arch);
+	ppc_md_update(init_IRQ, mpc85xx_rdb_pic_init);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
 
+	return 1;
 }
 
 define_machine(p1023_rdb) {
 	.name			= "P1023 RDB",
 	.probe			= p1023_rdb_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
 };
diff --git a/arch/powerpc/platforms/85xx/ppa8548.c b/arch/powerpc/platforms/85xx/ppa8548.c
index 70df147419fa..cdb556523fb2 100644
--- a/arch/powerpc/platforms/85xx/ppa8548.c
+++ b/arch/powerpc/platforms/85xx/ppa8548.c
@@ -76,16 +76,20 @@ machine_device_initcall(ppa8548, declare_of_platform_devices);
  */
 static int __init ppa8548_probe(void)
 {
-	return of_machine_is_compatible("ppa8548");
+	if (!of_machine_is_compatible("ppa8548"))
+		return 0;
+
+	ppc_md_update(setup_arch, ppa8548_setup_arch);
+	ppc_md_update(init_IRQ, ppa8548_pic_init);
+	ppc_md_update(show_cpuinfo, ppa8548_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(ppa8548) {
 	.name		= "ppa8548",
 	.probe		= ppa8548_probe,
-	.setup_arch	= ppa8548_setup_arch,
-	.init_IRQ	= ppa8548_pic_init,
-	.show_cpuinfo	= ppa8548_show_cpuinfo,
-	.get_irq	= mpic_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
-	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/qemu_e500.c b/arch/powerpc/platforms/85xx/qemu_e500.c
index 873a27a384a3..04aed233a31b 100644
--- a/arch/powerpc/platforms/85xx/qemu_e500.c
+++ b/arch/powerpc/platforms/85xx/qemu_e500.c
@@ -50,7 +50,20 @@ static void __init qemu_e500_setup_arch(void)
  */
 static int __init qemu_e500_probe(void)
 {
-	return !!of_machine_is_compatible("fsl,qemu-e500");
+	if (!of_machine_is_compatible("fsl,qemu-e500"))
+		return 0;
+
+	ppc_md_update(setup_arch, qemu_e500_setup_arch);
+	ppc_md_update(init_IRQ, qemu_e500_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_coreint_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 machine_arch_initcall(qemu_e500, mpc85xx_common_publish_devices);
@@ -58,13 +71,4 @@ machine_arch_initcall(qemu_e500, mpc85xx_common_publish_devices);
 define_machine(qemu_e500) {
 	.name			= "QEMU e500",
 	.probe			= qemu_e500_probe,
-	.setup_arch		= qemu_e500_setup_arch,
-	.init_IRQ		= qemu_e500_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_coreint_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/socrates.c b/arch/powerpc/platforms/85xx/socrates.c
index 8bdd925f936c..382488abc067 100644
--- a/arch/powerpc/platforms/85xx/socrates.c
+++ b/arch/powerpc/platforms/85xx/socrates.c
@@ -74,18 +74,19 @@ machine_arch_initcall(socrates, mpc85xx_common_publish_devices);
  */
 static int __init socrates_probe(void)
 {
-	if (of_machine_is_compatible("abb,socrates"))
-		return 1;
+	if (!of_machine_is_compatible("abb,socrates"))
+		return 0;
 
-	return 0;
+	ppc_md_update(setup_arch, socrates_setup_arch);
+	ppc_md_update(init_IRQ, socrates_pic_init);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(socrates) {
 	.name			= "Socrates",
 	.probe			= socrates_probe,
-	.setup_arch		= socrates_setup_arch,
-	.init_IRQ		= socrates_pic_init,
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/stx_gp3.c b/arch/powerpc/platforms/85xx/stx_gp3.c
index 1d943461955e..188272917b94 100644
--- a/arch/powerpc/platforms/85xx/stx_gp3.c
+++ b/arch/powerpc/platforms/85xx/stx_gp3.c
@@ -88,16 +88,20 @@ machine_arch_initcall(stx_gp3, mpc85xx_common_publish_devices);
  */
 static int __init stx_gp3_probe(void)
 {
-	return of_machine_is_compatible("stx,gp3-8560");
+	if (!of_machine_is_compatible("stx,gp3-8560"))
+		return 0;
+
+	ppc_md_update(setup_arch, stx_gp3_setup_arch);
+	ppc_md_update(init_IRQ, stx_gp3_pic_init);
+	ppc_md_update(show_cpuinfo, stx_gp3_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(stx_gp3) {
 	.name			= "STX GP3",
 	.probe			= stx_gp3_probe,
-	.setup_arch		= stx_gp3_setup_arch,
-	.init_IRQ		= stx_gp3_pic_init,
-	.show_cpuinfo		= stx_gp3_show_cpuinfo,
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/tqm85xx.c b/arch/powerpc/platforms/85xx/tqm85xx.c
index 70c1ec342092..d5af4ed66923 100644
--- a/arch/powerpc/platforms/85xx/tqm85xx.c
+++ b/arch/powerpc/platforms/85xx/tqm85xx.c
@@ -117,16 +117,20 @@ static const char * const board[] __initconst = {
  */
 static int __init tqm85xx_probe(void)
 {
-	return of_device_compatible_match(of_root, board);
+	if (!of_device_compatible_match(of_root, board))
+		return 0;
+
+	ppc_md_update(setup_arch, tqm85xx_setup_arch);
+	ppc_md_update(init_IRQ, tqm85xx_pic_init);
+	ppc_md_update(show_cpuinfo, tqm85xx_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(tqm85xx) {
 	.name			= "TQM85xx",
 	.probe			= tqm85xx_probe,
-	.setup_arch		= tqm85xx_setup_arch,
-	.init_IRQ		= tqm85xx_pic_init,
-	.show_cpuinfo		= tqm85xx_show_cpuinfo,
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/twr_p102x.c b/arch/powerpc/platforms/85xx/twr_p102x.c
index 03d76552aa19..b24c4bcd5430 100644
--- a/arch/powerpc/platforms/85xx/twr_p102x.c
+++ b/arch/powerpc/platforms/85xx/twr_p102x.c
@@ -104,18 +104,22 @@ machine_arch_initcall(twr_p1025, mpc85xx_common_publish_devices);
 
 static int __init twr_p1025_probe(void)
 {
-	return of_machine_is_compatible("fsl,TWR-P1025");
+	if (!of_machine_is_compatible("fsl,TWR-P1025"))
+		return 0;
+
+	ppc_md_update(setup_arch, twr_p1025_setup_arch);
+	ppc_md_update(init_IRQ, twr_p1025_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 define_machine(twr_p1025) {
 	.name			= "TWR-P1025",
 	.probe			= twr_p1025_probe,
-	.setup_arch		= twr_p1025_setup_arch,
-	.init_IRQ		= twr_p1025_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/xes_mpc85xx.c b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
index d54e1ae56997..3193ba517575 100644
--- a/arch/powerpc/platforms/85xx/xes_mpc85xx.c
+++ b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
@@ -136,62 +136,63 @@ machine_arch_initcall(xes_mpc8572, mpc85xx_common_publish_devices);
 machine_arch_initcall(xes_mpc8548, mpc85xx_common_publish_devices);
 machine_arch_initcall(xes_mpc8540, mpc85xx_common_publish_devices);
 
+static void __init xes_mpc85xx_populate(void)
+{
+	ppc_md_update(setup_arch, xes_mpc85xx_setup_arch);
+	ppc_md_update(init_IRQ, xes_mpc85xx_pic_init);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+	ppc_md_update(pcibios_fixup_phb, fsl_pcibios_fixup_phb);
+#endif
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+}
+
 /*
  * Called very early, device-tree isn't unflattened
  */
 static int __init xes_mpc8572_probe(void)
 {
-	return of_machine_is_compatible("xes,MPC8572");
+	if (!of_machine_is_compatible("xes,MPC8572"))
+		return 0;
+
+	xes_mpc85xx_populate();
+
+	return 1;
 }
 
 static int __init xes_mpc8548_probe(void)
 {
-	return of_machine_is_compatible("xes,MPC8548");
+	if (!of_machine_is_compatible("xes,MPC8548"))
+		return 0;
+
+	xes_mpc85xx_populate();
+
+	return 1;
 }
 
 static int __init xes_mpc8540_probe(void)
 {
-	return of_machine_is_compatible("xes,MPC8540");
+	if (!of_machine_is_compatible("xes,MPC8540"))
+		return 0;
+
+	xes_mpc85xx_populate();
+
+	return 1;
 }
 
 define_machine(xes_mpc8572) {
 	.name			= "X-ES MPC8572",
 	.probe			= xes_mpc8572_probe,
-	.setup_arch		= xes_mpc85xx_setup_arch,
-	.init_IRQ		= xes_mpc85xx_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(xes_mpc8548) {
 	.name			= "X-ES MPC8548",
 	.probe			= xes_mpc8548_probe,
-	.setup_arch		= xes_mpc85xx_setup_arch,
-	.init_IRQ		= xes_mpc85xx_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
 
 define_machine(xes_mpc8540) {
 	.name			= "X-ES MPC8540",
 	.probe			= xes_mpc8540_probe,
-	.setup_arch		= xes_mpc85xx_setup_arch,
-	.init_IRQ		= xes_mpc85xx_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/86xx/gef_ppc9a.c b/arch/powerpc/platforms/86xx/gef_ppc9a.c
index 44bbbc535e1d..897be72b49c2 100644
--- a/arch/powerpc/platforms/86xx/gef_ppc9a.c
+++ b/arch/powerpc/platforms/86xx/gef_ppc9a.c
@@ -185,10 +185,21 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_USB,
  */
 static int __init gef_ppc9a_probe(void)
 {
-	if (of_machine_is_compatible("gef,ppc9a"))
-		return 1;
+	if (!of_machine_is_compatible("gef,ppc9a"))
+		return 0;
+
+	ppc_md_update(setup_arch, gef_ppc9a_setup_arch);
+	ppc_md_update(init_IRQ, gef_ppc9a_init_irq);
+	ppc_md_update(show_cpuinfo, gef_ppc9a_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(time_init, mpc86xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+#endif
 
-	return 0;
+	return 1;
 }
 
 machine_arch_initcall(gef_ppc9a, mpc86xx_common_publish_devices);
@@ -196,14 +207,4 @@ machine_arch_initcall(gef_ppc9a, mpc86xx_common_publish_devices);
 define_machine(gef_ppc9a) {
 	.name			= "GE PPC9A",
 	.probe			= gef_ppc9a_probe,
-	.setup_arch		= gef_ppc9a_setup_arch,
-	.init_IRQ		= gef_ppc9a_init_irq,
-	.show_cpuinfo		= gef_ppc9a_show_cpuinfo,
-	.get_irq		= mpic_get_irq,
-	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-#endif
 };
diff --git a/arch/powerpc/platforms/86xx/gef_sbc310.c b/arch/powerpc/platforms/86xx/gef_sbc310.c
index 46d6d3d4957a..b4d3b4346192 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc310.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc310.c
@@ -172,10 +172,21 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_USB,
  */
 static int __init gef_sbc310_probe(void)
 {
-	if (of_machine_is_compatible("gef,sbc310"))
-		return 1;
+	if (!of_machine_is_compatible("gef,sbc310"))
+		return 0;
+
+	ppc_md_update(setup_arch, gef_sbc310_setup_arch);
+	ppc_md_update(init_IRQ, gef_sbc310_init_irq);
+	ppc_md_update(show_cpuinfo, gef_sbc310_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(time_init, mpc86xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+#endif
 
-	return 0;
+	return 1;
 }
 
 machine_arch_initcall(gef_sbc310, mpc86xx_common_publish_devices);
@@ -183,14 +194,4 @@ machine_arch_initcall(gef_sbc310, mpc86xx_common_publish_devices);
 define_machine(gef_sbc310) {
 	.name			= "GE SBC310",
 	.probe			= gef_sbc310_probe,
-	.setup_arch		= gef_sbc310_setup_arch,
-	.init_IRQ		= gef_sbc310_init_irq,
-	.show_cpuinfo		= gef_sbc310_show_cpuinfo,
-	.get_irq		= mpic_get_irq,
-	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-#endif
 };
diff --git a/arch/powerpc/platforms/86xx/gef_sbc610.c b/arch/powerpc/platforms/86xx/gef_sbc610.c
index acf2c6c3c1eb..6d051877963c 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc610.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc610.c
@@ -162,10 +162,21 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_USB,
  */
 static int __init gef_sbc610_probe(void)
 {
-	if (of_machine_is_compatible("gef,sbc610"))
-		return 1;
+	if (!of_machine_is_compatible("gef,sbc610"))
+		return 0;
+
+	ppc_md_update(setup_arch, gef_sbc610_setup_arch);
+	ppc_md_update(init_IRQ, gef_sbc610_init_irq);
+	ppc_md_update(show_cpuinfo, gef_sbc610_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(time_init, mpc86xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+#endif
 
-	return 0;
+	return 1;
 }
 
 machine_arch_initcall(gef_sbc610, mpc86xx_common_publish_devices);
@@ -173,14 +184,4 @@ machine_arch_initcall(gef_sbc610, mpc86xx_common_publish_devices);
 define_machine(gef_sbc610) {
 	.name			= "GE SBC610",
 	.probe			= gef_sbc610_probe,
-	.setup_arch		= gef_sbc610_setup_arch,
-	.init_IRQ		= gef_sbc610_init_irq,
-	.show_cpuinfo		= gef_sbc610_show_cpuinfo,
-	.get_irq		= mpic_get_irq,
-	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-#endif
 };
diff --git a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
index f3aa916ace73..a83cfaefbd9c 100644
--- a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
+++ b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
@@ -310,22 +310,23 @@ static void __init mpc86xx_hpcd_setup_arch(void)
  */
 static int __init mpc86xx_hpcd_probe(void)
 {
-	if (of_machine_is_compatible("fsl,MPC8610HPCD"))
-		return 1;	/* Looks good */
+	if (!of_machine_is_compatible("fsl,MPC8610HPCD"))
+		return 0;	/* Looks good */
+
+	ppc_md_update(setup_arch, mpc86xx_hpcd_setup_arch);
+	ppc_md_update(init_IRQ, mpc86xx_init_irq);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(time_init, mpc86xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+#endif
 
-	return 0;
+	return 1;
 }
 
 define_machine(mpc86xx_hpcd) {
 	.name			= "MPC86xx HPCD",
 	.probe			= mpc86xx_hpcd_probe,
-	.setup_arch		= mpc86xx_hpcd_setup_arch,
-	.init_IRQ		= mpc86xx_init_irq,
-	.get_irq		= mpic_get_irq,
-	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-#endif
 };
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
index caa47e2c9313..c8316ffec569 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
@@ -91,10 +91,21 @@ mpc86xx_hpcn_show_cpuinfo(struct seq_file *m)
  */
 static int __init mpc86xx_hpcn_probe(void)
 {
-	if (of_machine_is_compatible("fsl,mpc8641hpcn"))
-		return 1;	/* Looks good */
+	if (!of_machine_is_compatible("fsl,mpc8641hpcn"))
+		return 0;	/* Looks good */
+
+	ppc_md_update(setup_arch, mpc86xx_hpcn_setup_arch);
+	ppc_md_update(init_IRQ, mpc86xx_init_irq);
+	ppc_md_update(show_cpuinfo, mpc86xx_hpcn_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(time_init, mpc86xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+#endif
 
-	return 0;
+	return 1;
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
@@ -114,14 +125,4 @@ machine_arch_initcall(mpc86xx_hpcn, declare_of_platform_devices);
 define_machine(mpc86xx_hpcn) {
 	.name			= "MPC86xx HPCN",
 	.probe			= mpc86xx_hpcn_probe,
-	.setup_arch		= mpc86xx_hpcn_setup_arch,
-	.init_IRQ		= mpc86xx_init_irq,
-	.show_cpuinfo		= mpc86xx_hpcn_show_cpuinfo,
-	.get_irq		= mpic_get_irq,
-	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-#endif
 };
diff --git a/arch/powerpc/platforms/86xx/mvme7100.c b/arch/powerpc/platforms/86xx/mvme7100.c
index c6af6e333e2e..598068326ec2 100644
--- a/arch/powerpc/platforms/86xx/mvme7100.c
+++ b/arch/powerpc/platforms/86xx/mvme7100.c
@@ -77,7 +77,20 @@ static int __init mvme7100_probe(void)
 {
 	unsigned long root = of_get_flat_dt_root();
 
-	return of_flat_dt_is_compatible(root, "artesyn,MVME7100");
+	if (!of_flat_dt_is_compatible(root, "artesyn,MVME7100"))
+		return 0;
+
+	ppc_md_update(setup_arch, mvme7100_setup_arch);
+	ppc_md_update(init_IRQ, mpc86xx_init_irq);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(time_init, mpc86xx_time_init);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+#ifdef CONFIG_PCI
+	ppc_md_update(pcibios_fixup_bus, fsl_pcibios_fixup_bus);
+#endif
+
+	return 1;
 }
 
 static void mvme7100_usb_host_fixup(struct pci_dev *pdev)
@@ -102,13 +115,4 @@ machine_arch_initcall(mvme7100, mpc86xx_common_publish_devices);
 define_machine(mvme7100) {
 	.name			= "MVME7100",
 	.probe			= mvme7100_probe,
-	.setup_arch		= mvme7100_setup_arch,
-	.init_IRQ		= mpc86xx_init_irq,
-	.get_irq		= mpic_get_irq,
-	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-#endif
 };
diff --git a/arch/powerpc/platforms/8xx/adder875.c b/arch/powerpc/platforms/8xx/adder875.c
index 651486acb896..bb626adcc1d3 100644
--- a/arch/powerpc/platforms/8xx/adder875.c
+++ b/arch/powerpc/platforms/8xx/adder875.c
@@ -85,7 +85,17 @@ static void __init adder875_setup(void)
 
 static int __init adder875_probe(void)
 {
-	return of_machine_is_compatible("analogue-and-micro,adder875");
+	if (!of_machine_is_compatible("analogue-and-micro,adder875"))
+		return 0;
+
+	ppc_md_update(setup_arch, adder875_setup);
+	ppc_md_update(init_IRQ, mpc8xx_pics_init);
+	ppc_md_update(get_irq, mpc8xx_get_irq);
+	ppc_md_update(restart, mpc8xx_restart);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
@@ -103,10 +113,4 @@ machine_device_initcall(adder875, declare_of_platform_devices);
 define_machine(adder875) {
 	.name = "Adder MPC875",
 	.probe = adder875_probe,
-	.setup_arch = adder875_setup,
-	.init_IRQ = mpc8xx_pics_init,
-	.get_irq = mpc8xx_get_irq,
-	.restart = mpc8xx_restart,
-	.calibrate_decr = generic_calibrate_decr,
-	.progress = udbg_progress,
 };
diff --git a/arch/powerpc/platforms/8xx/ep88xc.c b/arch/powerpc/platforms/8xx/ep88xc.c
index ebcf34a14789..ff898f966d75 100644
--- a/arch/powerpc/platforms/8xx/ep88xc.c
+++ b/arch/powerpc/platforms/8xx/ep88xc.c
@@ -143,7 +143,17 @@ static void __init ep88xc_setup_arch(void)
 
 static int __init ep88xc_probe(void)
 {
-	return of_machine_is_compatible("fsl,ep88xc");
+	if (!of_machine_is_compatible("fsl,ep88xc"))
+		return 0;
+
+	ppc_md_update(setup_arch, ep88xc_setup_arch);
+	ppc_md_update(init_IRQ, mpc8xx_pics_init);
+	ppc_md_update(get_irq, mpc8xx_get_irq);
+	ppc_md_update(restart, mpc8xx_restart);
+	ppc_md_update(calibrate_decr, mpc8xx_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
@@ -165,10 +175,4 @@ machine_device_initcall(ep88xc, declare_of_platform_devices);
 define_machine(ep88xc) {
 	.name = "Embedded Planet EP88xC",
 	.probe = ep88xc_probe,
-	.setup_arch = ep88xc_setup_arch,
-	.init_IRQ = mpc8xx_pics_init,
-	.get_irq	= mpc8xx_get_irq,
-	.restart = mpc8xx_restart,
-	.calibrate_decr = mpc8xx_calibrate_decr,
-	.progress = udbg_progress,
 };
diff --git a/arch/powerpc/platforms/8xx/mpc86xads_setup.c b/arch/powerpc/platforms/8xx/mpc86xads_setup.c
index 8d02f5ff4481..26d6358a83c4 100644
--- a/arch/powerpc/platforms/8xx/mpc86xads_setup.c
+++ b/arch/powerpc/platforms/8xx/mpc86xads_setup.c
@@ -118,7 +118,19 @@ static void __init mpc86xads_setup_arch(void)
 
 static int __init mpc86xads_probe(void)
 {
-	return of_machine_is_compatible("fsl,mpc866ads");
+	if (!of_machine_is_compatible("fsl,mpc866ads"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc86xads_setup_arch);
+	ppc_md_update(init_IRQ, mpc8xx_pics_init);
+	ppc_md_update(get_irq, mpc8xx_get_irq);
+	ppc_md_update(restart, mpc8xx_restart);
+	ppc_md_update(calibrate_decr, mpc8xx_calibrate_decr);
+	ppc_md_update(set_rtc_time, mpc8xx_set_rtc_time);
+	ppc_md_update(get_rtc_time, mpc8xx_get_rtc_time);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
@@ -139,12 +151,4 @@ machine_device_initcall(mpc86x_ads, declare_of_platform_devices);
 define_machine(mpc86x_ads) {
 	.name			= "MPC86x ADS",
 	.probe			= mpc86xads_probe,
-	.setup_arch		= mpc86xads_setup_arch,
-	.init_IRQ		= mpc8xx_pics_init,
-	.get_irq		= mpc8xx_get_irq,
-	.restart		= mpc8xx_restart,
-	.calibrate_decr		= mpc8xx_calibrate_decr,
-	.set_rtc_time		= mpc8xx_set_rtc_time,
-	.get_rtc_time		= mpc8xx_get_rtc_time,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/8xx/mpc885ads_setup.c b/arch/powerpc/platforms/8xx/mpc885ads_setup.c
index a0c83c1905c6..2c137412f4db 100644
--- a/arch/powerpc/platforms/8xx/mpc885ads_setup.c
+++ b/arch/powerpc/platforms/8xx/mpc885ads_setup.c
@@ -193,7 +193,17 @@ static void __init mpc885ads_setup_arch(void)
 
 static int __init mpc885ads_probe(void)
 {
-	return of_machine_is_compatible("fsl,mpc885ads");
+	if (!of_machine_is_compatible("fsl,mpc885ads"))
+		return 0;
+
+	ppc_md_update(setup_arch, mpc885ads_setup_arch);
+	ppc_md_update(init_IRQ, mpc8xx_pics_init);
+	ppc_md_update(get_irq, mpc8xx_get_irq);
+	ppc_md_update(restart, mpc8xx_restart);
+	ppc_md_update(calibrate_decr, mpc8xx_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
@@ -215,10 +225,4 @@ machine_device_initcall(mpc885_ads, declare_of_platform_devices);
 define_machine(mpc885_ads) {
 	.name			= "Freescale MPC885 ADS",
 	.probe			= mpc885ads_probe,
-	.setup_arch		= mpc885ads_setup_arch,
-	.init_IRQ		= mpc8xx_pics_init,
-	.get_irq		= mpc8xx_get_irq,
-	.restart		= mpc8xx_restart,
-	.calibrate_decr		= mpc8xx_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/8xx/tqm8xx_setup.c b/arch/powerpc/platforms/8xx/tqm8xx_setup.c
index 4cea8b1afa44..e9ebe66a2ab9 100644
--- a/arch/powerpc/platforms/8xx/tqm8xx_setup.c
+++ b/arch/powerpc/platforms/8xx/tqm8xx_setup.c
@@ -119,7 +119,19 @@ static void __init tqm8xx_setup_arch(void)
 
 static int __init tqm8xx_probe(void)
 {
-	return of_machine_is_compatible("tqc,tqm8xx");
+	if (!of_machine_is_compatible("tqc,tqm8xx"))
+		return 0;
+
+	ppc_md_update(setup_arch, tqm8xx_setup_arch);
+	ppc_md_update(init_IRQ, mpc8xx_pics_init);
+	ppc_md_update(get_irq, mpc8xx_get_irq);
+	ppc_md_update(restart, mpc8xx_restart);
+	ppc_md_update(calibrate_decr, mpc8xx_calibrate_decr);
+	ppc_md_update(set_rtc_time, mpc8xx_set_rtc_time);
+	ppc_md_update(get_rtc_time, mpc8xx_get_rtc_time);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
@@ -141,12 +153,4 @@ machine_device_initcall(tqm8xx, declare_of_platform_devices);
 define_machine(tqm8xx) {
 	.name			= "TQM8xx",
 	.probe			= tqm8xx_probe,
-	.setup_arch		= tqm8xx_setup_arch,
-	.init_IRQ		= mpc8xx_pics_init,
-	.get_irq		= mpc8xx_get_irq,
-	.restart		= mpc8xx_restart,
-	.calibrate_decr		= mpc8xx_calibrate_decr,
-	.set_rtc_time		= mpc8xx_set_rtc_time,
-	.get_rtc_time		= mpc8xx_get_rtc_time,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/amigaone/setup.c b/arch/powerpc/platforms/amigaone/setup.c
index dc09a0d99e43..324e256a61e2 100644
--- a/arch/powerpc/platforms/amigaone/setup.c
+++ b/arch/powerpc/platforms/amigaone/setup.c
@@ -141,30 +141,30 @@ void __noreturn amigaone_restart(char *cmd)
 
 static int __init amigaone_probe(void)
 {
-	if (of_machine_is_compatible("eyetech,amigaone")) {
-		/*
-		 * Coherent memory access cause complete system lockup! Thus
-		 * disable this CPU feature, even if the CPU needs it.
-		 */
-		cur_cpu_spec->cpu_features &= ~CPU_FTR_NEED_COHERENT;
-
-		DMA_MODE_READ = 0x44;
-		DMA_MODE_WRITE = 0x48;
-
-		return 1;
-	}
-
-	return 0;
+	if (!of_machine_is_compatible("eyetech,amigaone"))
+		return 0;
+
+	ppc_md_update(setup_arch, amigaone_setup_arch);
+	ppc_md_update(discover_phbs, amigaone_discover_phbs);
+	ppc_md_update(show_cpuinfo, amigaone_show_cpuinfo);
+	ppc_md_update(init_IRQ, amigaone_init_IRQ);
+	ppc_md_update(restart, amigaone_restart);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	/*
+	 * Coherent memory access cause complete system lockup! Thus
+	 * disable this CPU feature, even if the CPU needs it.
+	 */
+	cur_cpu_spec->cpu_features &= ~CPU_FTR_NEED_COHERENT;
+
+	DMA_MODE_READ = 0x44;
+	DMA_MODE_WRITE = 0x48;
+
+	return 1;
 }
 
 define_machine(amigaone) {
 	.name			= "AmigaOne",
 	.probe			= amigaone_probe,
-	.setup_arch		= amigaone_setup_arch,
-	.discover_phbs		= amigaone_discover_phbs,
-	.show_cpuinfo		= amigaone_show_cpuinfo,
-	.init_IRQ		= amigaone_init_IRQ,
-	.restart		= amigaone_restart,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/cell/setup.c b/arch/powerpc/platforms/cell/setup.c
index edefa785d2ef..ffd50587e327 100644
--- a/arch/powerpc/platforms/cell/setup.c
+++ b/arch/powerpc/platforms/cell/setup.c
@@ -249,6 +249,18 @@ static int __init cell_probe(void)
 	    !of_machine_is_compatible("IBM,CPBW-1.0"))
 		return 0;
 
+	ppc_md_update(setup_arch, cell_setup_arch);
+	ppc_md_update(show_cpuinfo, cell_show_cpuinfo);
+	ppc_md_update(restart, rtas_restart);
+	ppc_md_update(halt, rtas_halt);
+	ppc_md_update(get_boot_time, rtas_get_boot_time);
+	ppc_md_update(get_rtc_time, rtas_get_rtc_time);
+	ppc_md_update(set_rtc_time, rtas_set_rtc_time);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, cell_progress);
+	ppc_md_update(init_IRQ, cell_init_irq);
+	ppc_md_update(pci_setup_phb, cell_setup_phb);
+
 	pm_power_off = rtas_power_off;
 
 	return 1;
@@ -257,17 +269,6 @@ static int __init cell_probe(void)
 define_machine(cell) {
 	.name			= "Cell",
 	.probe			= cell_probe,
-	.setup_arch		= cell_setup_arch,
-	.show_cpuinfo		= cell_show_cpuinfo,
-	.restart		= rtas_restart,
-	.halt			= rtas_halt,
-	.get_boot_time		= rtas_get_boot_time,
-	.get_rtc_time		= rtas_get_rtc_time,
-	.set_rtc_time		= rtas_set_rtc_time,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= cell_progress,
-	.init_IRQ       	= cell_init_irq,
-	.pci_setup_phb		= cell_setup_phb,
 };
 
 struct pci_controller_ops cell_pci_controller_ops;
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index 6fad19201f5b..f33535b03d50 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -556,6 +556,19 @@ static int __init chrp_probe(void)
  	if (strcmp(dtype, "chrp"))
 		return 0;
 
+	ppc_md_update(setup_arch, chrp_setup_arch);
+	ppc_md_update(discover_phbs, chrp_find_bridges);
+	ppc_md_update(init, chrp_init2);
+	ppc_md_update(show_cpuinfo, chrp_show_cpuinfo);
+	ppc_md_update(init_IRQ, chrp_init_IRQ);
+	ppc_md_update(restart, rtas_restart);
+	ppc_md_update(halt, rtas_halt);
+	ppc_md_update(time_init, chrp_time_init);
+	ppc_md_update(set_rtc_time, chrp_set_rtc_time);
+	ppc_md_update(get_rtc_time, chrp_get_rtc_time);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(phys_mem_access_prot, pci_phys_mem_access_prot);
+
 	DMA_MODE_READ = 0x44;
 	DMA_MODE_WRITE = 0x48;
 
@@ -569,16 +582,4 @@ static int __init chrp_probe(void)
 define_machine(chrp) {
 	.name			= "CHRP",
 	.probe			= chrp_probe,
-	.setup_arch		= chrp_setup_arch,
-	.discover_phbs		= chrp_find_bridges,
-	.init			= chrp_init2,
-	.show_cpuinfo		= chrp_show_cpuinfo,
-	.init_IRQ		= chrp_init_IRQ,
-	.restart		= rtas_restart,
-	.halt			= rtas_halt,
-	.time_init		= chrp_time_init,
-	.set_rtc_time		= chrp_set_rtc_time,
-	.get_rtc_time		= chrp_get_rtc_time,
-	.calibrate_decr		= generic_calibrate_decr,
-	.phys_mem_access_prot	= pci_phys_mem_access_prot,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/gamecube.c b/arch/powerpc/platforms/embedded6xx/gamecube.c
index ade928f7ea73..6d493e3f5f68 100644
--- a/arch/powerpc/platforms/embedded6xx/gamecube.c
+++ b/arch/powerpc/platforms/embedded6xx/gamecube.c
@@ -54,6 +54,14 @@ static int __init gamecube_probe(void)
 	if (!of_machine_is_compatible("nintendo,gamecube"))
 		return 0;
 
+	ppc_md_update(restart, gamecube_restart);
+	ppc_md_update(halt, gamecube_halt);
+	ppc_md_update(init_IRQ, flipper_pic_probe);
+	ppc_md_update(get_irq, flipper_pic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+	ppc_md_update(machine_shutdown, gamecube_shutdown);
+
 	pm_power_off = gamecube_power_off;
 
 	ug_udbg_init();
@@ -69,13 +77,6 @@ static void gamecube_shutdown(void)
 define_machine(gamecube) {
 	.name			= "gamecube",
 	.probe			= gamecube_probe,
-	.restart		= gamecube_restart,
-	.halt			= gamecube_halt,
-	.init_IRQ		= flipper_pic_probe,
-	.get_irq		= flipper_pic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-	.machine_shutdown	= gamecube_shutdown,
 };
 
 
diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index 5dac4067a3a0..248dbcb12e17 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -239,6 +239,17 @@ static int __init holly_probe(void)
 {
 	if (!of_machine_is_compatible("ibm,holly"))
 		return 0;
+
+	ppc_md_update(setup_arch, holly_setup_arch);
+	ppc_md_update(discover_phbs, holly_init_pci);
+	ppc_md_update(init_IRQ, holly_init_IRQ);
+	ppc_md_update(show_cpuinfo, holly_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(restart, holly_restart);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(machine_check_exception, ppc750_machine_check_exception);
+	ppc_md_update(progress, udbg_progress);
+
 	return 1;
 }
 
@@ -259,13 +270,4 @@ static int ppc750_machine_check_exception(struct pt_regs *regs)
 define_machine(holly){
 	.name                   	= "PPC750 GX/CL TSI",
 	.probe                  	= holly_probe,
-	.setup_arch             	= holly_setup_arch,
-	.discover_phbs			= holly_init_pci,
-	.init_IRQ               	= holly_init_IRQ,
-	.show_cpuinfo           	= holly_show_cpuinfo,
-	.get_irq                	= mpic_get_irq,
-	.restart                	= holly_restart,
-	.calibrate_decr         	= generic_calibrate_decr,
-	.machine_check_exception	= ppc750_machine_check_exception,
-	.progress               	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/linkstation.c b/arch/powerpc/platforms/embedded6xx/linkstation.c
index eb8342e7f84e..a81f30897087 100644
--- a/arch/powerpc/platforms/embedded6xx/linkstation.c
+++ b/arch/powerpc/platforms/embedded6xx/linkstation.c
@@ -147,6 +147,15 @@ static int __init linkstation_probe(void)
 	if (!of_machine_is_compatible("linkstation"))
 		return 0;
 
+	ppc_md_update(setup_arch , linkstation_setup_arch);
+	ppc_md_update(discover_phbs, linkstation_setup_pci);
+	ppc_md_update(init_IRQ, linkstation_init_IRQ);
+	ppc_md_update(show_cpuinfo, linkstation_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(restart, linkstation_restart);
+	ppc_md_update(halt, linkstation_halt);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
 	pm_power_off = linkstation_power_off;
 
 	return 1;
@@ -155,12 +164,4 @@ static int __init linkstation_probe(void)
 define_machine(linkstation){
 	.name 			= "Buffalo Linkstation",
 	.probe 			= linkstation_probe,
-	.setup_arch 		= linkstation_setup_arch,
-	.discover_phbs		= linkstation_setup_pci,
-	.init_IRQ 		= linkstation_init_IRQ,
-	.show_cpuinfo 		= linkstation_show_cpuinfo,
-	.get_irq 		= mpic_get_irq,
-	.restart 		= linkstation_restart,
-	.halt	 		= linkstation_halt,
-	.calibrate_decr 	= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index f833624a8532..26e86c974315 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -162,6 +162,17 @@ static int __init mpc7448_hpc2_probe(void)
 {
 	if (!of_machine_is_compatible("mpc74xx"))
 		return 0;
+
+	ppc_md_update(setup_arch, mpc7448_hpc2_setup_arch);
+	ppc_md_update(discover_phbs, mpc7448_hpc2_setup_pci);
+	ppc_md_update(init_IRQ, mpc7448_hpc2_init_IRQ);
+	ppc_md_update(show_cpuinfo, mpc7448_hpc2_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(restart, mpc7448_hpc2_restart);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(machine_check_exception, mpc7448_machine_check_exception);
+	ppc_md_update(progress, udbg_progress);
+
 	return 1;
 }
 
@@ -182,13 +193,4 @@ static int mpc7448_machine_check_exception(struct pt_regs *regs)
 define_machine(mpc7448_hpc2){
 	.name 			= "MPC7448 HPC2",
 	.probe 			= mpc7448_hpc2_probe,
-	.setup_arch 		= mpc7448_hpc2_setup_arch,
-	.discover_phbs		= mpc7448_hpc2_setup_pci,
-	.init_IRQ 		= mpc7448_hpc2_init_IRQ,
-	.show_cpuinfo 		= mpc7448_hpc2_show_cpuinfo,
-	.get_irq 		= mpic_get_irq,
-	.restart 		= mpc7448_hpc2_restart,
-	.calibrate_decr 	= generic_calibrate_decr,
-	.machine_check_exception= mpc7448_machine_check_exception,
-	.progress 		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index 04a98cb1c53c..22cb6d732989 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -190,7 +190,19 @@ static void __noreturn mvme5100_restart(char *cmd)
  */
 static int __init mvme5100_probe(void)
 {
-	return of_machine_is_compatible("MVME5100");
+	if (!of_machine_is_compatible("MVME5100"))
+		return 0;
+
+	ppc_md_update(setup_arch, mvme5100_setup_arch);
+	ppc_md_update(discover_phbs, mvme5100_setup_pci);
+	ppc_md_update(init_IRQ, mvme5100_pic_init);
+	ppc_md_update(show_cpuinfo, mvme5100_show_cpuinfo);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(restart, mvme5100_restart);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+
+	return 1;
 }
 
 static int __init probe_of_platform_devices(void)
@@ -205,12 +217,4 @@ machine_device_initcall(mvme5100, probe_of_platform_devices);
 define_machine(mvme5100) {
 	.name			= "MVME5100",
 	.probe			= mvme5100_probe,
-	.setup_arch		= mvme5100_setup_arch,
-	.discover_phbs		= mvme5100_setup_pci,
-	.init_IRQ		= mvme5100_pic_init,
-	.show_cpuinfo		= mvme5100_show_cpuinfo,
-	.get_irq		= mpic_get_irq,
-	.restart		= mvme5100_restart,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/storcenter.c b/arch/powerpc/platforms/embedded6xx/storcenter.c
index e188b90f7016..66a99612517e 100644
--- a/arch/powerpc/platforms/embedded6xx/storcenter.c
+++ b/arch/powerpc/platforms/embedded6xx/storcenter.c
@@ -113,16 +113,20 @@ static void __noreturn storcenter_restart(char *cmd)
 
 static int __init storcenter_probe(void)
 {
-	return of_machine_is_compatible("iomega,storcenter");
+	if (!of_machine_is_compatible("iomega,storcenter"))
+		return 0;
+
+	ppc_md_update(setup_arch, storcenter_setup_arch);
+	ppc_md_update(discover_phbs, storcenter_setup_pci);
+	ppc_md_update(init_IRQ, storcenter_init_IRQ);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(restart, storcenter_restart);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
+	return 1;
 }
 
 define_machine(storcenter){
 	.name 			= "IOMEGA StorCenter",
 	.probe 			= storcenter_probe,
-	.setup_arch 		= storcenter_setup_arch,
-	.discover_phbs 		= storcenter_setup_pci,
-	.init_IRQ 		= storcenter_init_IRQ,
-	.get_irq 		= mpic_get_irq,
-	.restart 		= storcenter_restart,
-	.calibrate_decr 	= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
index d8b005d7ef79..53d927e7b463 100644
--- a/arch/powerpc/platforms/embedded6xx/wii.c
+++ b/arch/powerpc/platforms/embedded6xx/wii.c
@@ -158,6 +158,15 @@ static int __init wii_probe(void)
 	if (!of_machine_is_compatible("nintendo,wii"))
 		return 0;
 
+	ppc_md_update(setup_arch, wii_setup_arch);
+	ppc_md_update(restart, wii_restart);
+	ppc_md_update(halt, wii_halt);
+	ppc_md_update(init_IRQ, wii_pic_probe);
+	ppc_md_update(get_irq, flipper_pic_get_irq);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, udbg_progress);
+	ppc_md_update(machine_shutdown, wii_shutdown);
+
 	pm_power_off = wii_power_off;
 
 	ug_udbg_init();
@@ -189,12 +198,4 @@ device_initcall(wii_device_probe);
 define_machine(wii) {
 	.name			= "wii",
 	.probe			= wii_probe,
-	.setup_arch		= wii_setup_arch,
-	.restart		= wii_restart,
-	.halt			= wii_halt,
-	.init_IRQ		= wii_pic_probe,
-	.get_irq		= flipper_pic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-	.machine_shutdown	= wii_shutdown,
 };
diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index a60aaa13b265..0c6a400cd7fd 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -280,6 +280,20 @@ static int __init maple_probe(void)
 	    !of_machine_is_compatible("Momentum,Apache"))
 		return 0;
 
+	ppc_md_update(setup_arch, maple_setup_arch);
+	ppc_md_update(discover_phbs, maple_pci_init);
+	ppc_md_update(init_IRQ, maple_init_IRQ);
+	ppc_md_update(pci_irq_fixup, maple_pci_irq_fixup);
+	ppc_md_update(pci_get_legacy_ide_irq, maple_pci_get_legacy_ide_irq);
+	ppc_md_update(restart, maple_restart);
+	ppc_md_update(halt, maple_halt);
+	ppc_md_update(get_boot_time, maple_get_boot_time);
+	ppc_md_update(set_rtc_time, maple_set_rtc_time);
+	ppc_md_update(get_rtc_time, maple_get_rtc_time);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, maple_progress);
+	ppc_md_update(power_save, power4_idle);
+
 	pm_power_off = maple_power_off;
 
 	iommu_init_early_dart(&maple_pci_controller_ops);
@@ -347,17 +361,4 @@ machine_device_initcall(maple, maple_cpc925_edac_setup);
 define_machine(maple) {
 	.name			= "Maple",
 	.probe			= maple_probe,
-	.setup_arch		= maple_setup_arch,
-	.discover_phbs		= maple_pci_init,
-	.init_IRQ		= maple_init_IRQ,
-	.pci_irq_fixup		= maple_pci_irq_fixup,
-	.pci_get_legacy_ide_irq	= maple_pci_get_legacy_ide_irq,
-	.restart		= maple_restart,
-	.halt			= maple_halt,
-	.get_boot_time		= maple_get_boot_time,
-	.set_rtc_time		= maple_set_rtc_time,
-	.get_rtc_time		= maple_get_rtc_time,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= maple_progress,
-	.power_save		= power4_idle,
 };
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index 0b02603bdb74..4347bd4fb320 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -23,7 +23,14 @@ static void __init microwatt_init_IRQ(void)
 
 static int __init microwatt_probe(void)
 {
-	return of_machine_is_compatible("microwatt-soc");
+	if (!of_machine_is_compatible("microwatt-soc"))
+		return 0;
+
+	ppc_md_update(init_IRQ, microwatt_init_IRQ);
+	ppc_md_update(progress, udbg_progress);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+
+	return 1;
 }
 
 static int __init microwatt_populate(void)
@@ -35,7 +42,4 @@ machine_arch_initcall(microwatt, microwatt_populate);
 define_machine(microwatt) {
 	.name			= "microwatt",
 	.probe			= microwatt_probe,
-	.init_IRQ		= microwatt_init_IRQ,
-	.progress		= udbg_progress,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index 376797eb7894..66e909029eb7 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -424,6 +424,16 @@ static int __init pas_probe(void)
 	    !of_machine_is_compatible("pasemi,pwrficient"))
 		return 0;
 
+	ppc_md_update(setup_arch, pas_setup_arch);
+	ppc_md_update(discover_phbs, pas_pci_init);
+	ppc_md_update(init_IRQ, pas_init_IRQ);
+	ppc_md_update(get_irq, mpic_get_irq);
+	ppc_md_update(restart, pas_restart);
+	ppc_md_update(get_boot_time, pas_get_boot_time);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, pas_progress);
+	ppc_md_update(machine_check_exception , pas_machine_check_handler);
+
 #ifdef CONFIG_PPC_PASEMI_NEMO
 	/*
 	 * Check for the Nemo motherboard here, if we are running on one
@@ -443,13 +453,4 @@ static int __init pas_probe(void)
 define_machine(pasemi) {
 	.name			= "PA Semi PWRficient",
 	.probe			= pas_probe,
-	.setup_arch		= pas_setup_arch,
-	.discover_phbs		= pas_pci_init,
-	.init_IRQ		= pas_init_IRQ,
-	.get_irq		= mpic_get_irq,
-	.restart		= pas_restart,
-	.get_boot_time		= pas_get_boot_time,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= pas_progress,
-	.machine_check_exception = pas_machine_check_handler,
 };
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 86aee3f2483f..93d763a0b6d0 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -580,6 +580,30 @@ static int __init pmac_probe(void)
 	    !of_machine_is_compatible("MacRISC"))
 		return 0;
 
+	ppc_md_update(setup_arch, pmac_setup_arch);
+	ppc_md_update(discover_phbs, pmac_pci_init);
+	ppc_md_update(show_cpuinfo, pmac_show_cpuinfo);
+	ppc_md_update(init_IRQ, pmac_pic_init);
+	ppc_md_update(get_irq, NULL);/* changed later */
+	ppc_md_update(pci_irq_fixup, pmac_pci_irq_fixup);
+	ppc_md_update(restart, pmac_restart);
+	ppc_md_update(halt, pmac_halt);
+	ppc_md_update(time_init, pmac_time_init);
+	ppc_md_update(get_boot_time, pmac_get_boot_time);
+	ppc_md_update(set_rtc_time, pmac_set_rtc_time);
+	ppc_md_update(get_rtc_time, pmac_get_rtc_time);
+	ppc_md_update(calibrate_decr, pmac_calibrate_decr);
+	ppc_md_update(feature_call, pmac_do_feature_call);
+	ppc_md_update(progress, udbg_progress);
+#ifdef CONFIG_PPC64
+	ppc_md_update(power_save, power4_idle);
+	ppc_md_update(enable_pmcs, power4_enable_pmcs);
+#endif /* CONFIG_PPC64 */
+#ifdef CONFIG_PPC32
+	ppc_md_update(pcibios_after_init, pmac_pcibios_after_init);
+	ppc_md_update(phys_mem_access_prot, pci_phys_mem_access_prot);
+#endif
+
 #ifdef CONFIG_PPC32
 	/* isa_io_base gets set in pmac_pci_init */
 	DMA_MODE_READ = 1;
@@ -596,27 +620,4 @@ static int __init pmac_probe(void)
 define_machine(powermac) {
 	.name			= "PowerMac",
 	.probe			= pmac_probe,
-	.setup_arch		= pmac_setup_arch,
-	.discover_phbs		= pmac_pci_init,
-	.show_cpuinfo		= pmac_show_cpuinfo,
-	.init_IRQ		= pmac_pic_init,
-	.get_irq		= NULL,	/* changed later */
-	.pci_irq_fixup		= pmac_pci_irq_fixup,
-	.restart		= pmac_restart,
-	.halt			= pmac_halt,
-	.time_init		= pmac_time_init,
-	.get_boot_time		= pmac_get_boot_time,
-	.set_rtc_time		= pmac_set_rtc_time,
-	.get_rtc_time		= pmac_get_rtc_time,
-	.calibrate_decr		= pmac_calibrate_decr,
-	.feature_call		= pmac_do_feature_call,
-	.progress		= udbg_progress,
-#ifdef CONFIG_PPC64
-	.power_save		= power4_idle,
-	.enable_pmcs		= power4_enable_pmcs,
-#endif /* CONFIG_PPC64 */
-#ifdef CONFIG_PPC32
-	.pcibios_after_init	= pmac_pcibios_after_init,
-	.phys_mem_access_prot	= pci_phys_mem_access_prot,
-#endif
 };
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 6f6ceef2a9f5..ba0ac4738488 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -471,11 +471,57 @@ static void __init pnv_setup_machdep_opal(void)
 	ppc_md_update(handle_hmi_exception, opal_handle_hmi_exception);
 }
 
+/*
+ * Returns the cpu frequency for 'cpu' in Hz. This is used by
+ * /proc/cpuinfo
+ */
+static unsigned long pnv_get_proc_freq(unsigned int cpu)
+{
+	unsigned long ret_freq;
+
+	ret_freq = cpufreq_get(cpu) * 1000ul;
+
+	/*
+	 * If the backend cpufreq driver does not exist,
+         * then fallback to old way of reporting the clockrate.
+	 */
+	if (!ret_freq)
+		ret_freq = ppc_proc_freq;
+	return ret_freq;
+}
+
+static long pnv_machine_check_early(struct pt_regs *regs)
+{
+	long handled = 0;
+
+	if (cur_cpu_spec && cur_cpu_spec->machine_check_early)
+		handled = cur_cpu_spec->machine_check_early(regs);
+
+	return handled;
+}
+
 static int __init pnv_probe(void)
 {
 	if (!of_machine_is_compatible("ibm,powernv"))
 		return 0;
 
+	ppc_md_update(setup_arch, pnv_setup_arch);
+	ppc_md_update(init_IRQ, pnv_init_IRQ);
+	ppc_md_update(show_cpuinfo, pnv_show_cpuinfo);
+	ppc_md_update(get_proc_freq, pnv_get_proc_freq);
+	ppc_md_update(discover_phbs, pnv_pci_init);
+	ppc_md_update(progress, pnv_progress);
+	ppc_md_update(machine_shutdown, pnv_shutdown);
+	ppc_md_update(power_save, NULL);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(machine_check_early, pnv_machine_check_early);
+#ifdef CONFIG_KEXEC_CORE
+	ppc_md_update(kexec_cpu_down, pnv_kexec_cpu_down);
+#endif
+#ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
+	ppc_md_update(memory_block_size, pnv_memory_block_size);
+#endif
+
 	if (firmware_has_feature(FW_FEATURE_OPAL))
 		pnv_setup_machdep_opal();
 
@@ -508,52 +554,7 @@ void __init pnv_tm_init(void)
 }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
-/*
- * Returns the cpu frequency for 'cpu' in Hz. This is used by
- * /proc/cpuinfo
- */
-static unsigned long pnv_get_proc_freq(unsigned int cpu)
-{
-	unsigned long ret_freq;
-
-	ret_freq = cpufreq_get(cpu) * 1000ul;
-
-	/*
-	 * If the backend cpufreq driver does not exist,
-         * then fallback to old way of reporting the clockrate.
-	 */
-	if (!ret_freq)
-		ret_freq = ppc_proc_freq;
-	return ret_freq;
-}
-
-static long pnv_machine_check_early(struct pt_regs *regs)
-{
-	long handled = 0;
-
-	if (cur_cpu_spec && cur_cpu_spec->machine_check_early)
-		handled = cur_cpu_spec->machine_check_early(regs);
-
-	return handled;
-}
-
 define_machine(powernv) {
 	.name			= "PowerNV",
 	.probe			= pnv_probe,
-	.setup_arch		= pnv_setup_arch,
-	.init_IRQ		= pnv_init_IRQ,
-	.show_cpuinfo		= pnv_show_cpuinfo,
-	.get_proc_freq          = pnv_get_proc_freq,
-	.discover_phbs		= pnv_pci_init,
-	.progress		= pnv_progress,
-	.machine_shutdown	= pnv_shutdown,
-	.power_save             = NULL,
-	.calibrate_decr		= generic_calibrate_decr,
-	.machine_check_early	= pnv_machine_check_early,
-#ifdef CONFIG_KEXEC_CORE
-	.kexec_cpu_down		= pnv_kexec_cpu_down,
-#endif
-#ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
-	.memory_block_size	= pnv_memory_block_size,
-#endif
 };
diff --git a/arch/powerpc/platforms/ps3/setup.c b/arch/powerpc/platforms/ps3/setup.c
index 04c037ec8b79..57d89c741bb4 100644
--- a/arch/powerpc/platforms/ps3/setup.c
+++ b/arch/powerpc/platforms/ps3/setup.c
@@ -260,6 +260,20 @@ void __init ps3_early_mm_init(void)
 	ps3_hpte_init(htab_size);
 }
 
+#if defined(CONFIG_KEXEC_CORE)
+static void ps3_kexec_cpu_down(int crash_shutdown, int secondary)
+{
+	int cpu = smp_processor_id();
+
+	DBG(" -> %s:%d: (%d)\n", __func__, __LINE__, cpu);
+
+	ps3_smp_cleanup_cpu(cpu);
+	ps3_shutdown_IRQ(cpu);
+
+	DBG(" <- %s:%d\n", __func__, __LINE__);
+}
+#endif
+
 static int __init ps3_probe(void)
 {
 	DBG(" -> %s:%d\n", __func__, __LINE__);
@@ -267,6 +281,19 @@ static int __init ps3_probe(void)
 	if (!of_machine_is_compatible("sony,ps3"))
 		return 0;
 
+	ppc_md_update(setup_arch, ps3_setup_arch);
+	ppc_md_update(init_IRQ, ps3_init_IRQ);
+	ppc_md_update(panic, ps3_panic);
+	ppc_md_update(get_boot_time, ps3_get_boot_time);
+	ppc_md_update(set_dabr, ps3_set_dabr);
+	ppc_md_update(calibrate_decr, ps3_calibrate_decr);
+	ppc_md_update(progress, ps3_progress);
+	ppc_md_update(restart, ps3_restart);
+	ppc_md_update(halt, ps3_halt);
+#if defined(CONFIG_KEXEC_CORE)
+	ppc_md_update(kexec_cpu_down, ps3_kexec_cpu_down);
+#endif
+
 	ps3_os_area_save_params();
 
 	pm_power_off = ps3_power_off;
@@ -275,33 +302,7 @@ static int __init ps3_probe(void)
 	return 1;
 }
 
-#if defined(CONFIG_KEXEC_CORE)
-static void ps3_kexec_cpu_down(int crash_shutdown, int secondary)
-{
-	int cpu = smp_processor_id();
-
-	DBG(" -> %s:%d: (%d)\n", __func__, __LINE__, cpu);
-
-	ps3_smp_cleanup_cpu(cpu);
-	ps3_shutdown_IRQ(cpu);
-
-	DBG(" <- %s:%d\n", __func__, __LINE__);
-}
-#endif
-
 define_machine(ps3) {
 	.name				= "PS3",
 	.probe				= ps3_probe,
-	.setup_arch			= ps3_setup_arch,
-	.init_IRQ			= ps3_init_IRQ,
-	.panic				= ps3_panic,
-	.get_boot_time			= ps3_get_boot_time,
-	.set_dabr			= ps3_set_dabr,
-	.calibrate_decr			= ps3_calibrate_decr,
-	.progress			= ps3_progress,
-	.restart			= ps3_restart,
-	.halt				= ps3_halt,
-#if defined(CONFIG_KEXEC_CORE)
-	.kexec_cpu_down			= ps3_kexec_cpu_down,
-#endif
 };
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index e14abc326a49..7a96dc1388ca 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1041,6 +1041,31 @@ static int __init pSeries_probe(void)
 	    of_machine_is_compatible("IBM,CBEA"))
 		return 0;
 
+	ppc_md_update(setup_arch, pSeries_setup_arch);
+	ppc_md_update(init_IRQ, pseries_init_irq);
+	ppc_md_update(show_cpuinfo, pSeries_show_cpuinfo);
+	ppc_md_update(log_error, pSeries_log_error);
+	ppc_md_update(discover_phbs, pSeries_discover_phbs);
+	ppc_md_update(pcibios_fixup, pSeries_final_fixup);
+	ppc_md_update(restart, rtas_restart);
+	ppc_md_update(halt, rtas_halt);
+	ppc_md_update(panic, pseries_panic);
+	ppc_md_update(get_boot_time, rtas_get_boot_time);
+	ppc_md_update(get_rtc_time, rtas_get_rtc_time);
+	ppc_md_update(set_rtc_time, rtas_set_rtc_time);
+	ppc_md_update(calibrate_decr, generic_calibrate_decr);
+	ppc_md_update(progress, rtas_progress);
+	ppc_md_update(system_reset_exception , pSeries_system_reset_exception);
+	ppc_md_update(machine_check_early, pseries_machine_check_realmode);
+	ppc_md_update(machine_check_exception , pSeries_machine_check_exception);
+#ifdef CONFIG_KEXEC_CORE
+	ppc_md_update(machine_kexec, pSeries_machine_kexec);
+	ppc_md_update(kexec_cpu_down, pseries_kexec_cpu_down);
+#endif
+#ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
+	ppc_md_update(memory_block_size, pseries_memory_block_size);
+#endif
+
 	pm_power_off = pseries_power_off;
 
 	pr_debug("Machine is%s LPAR !\n",
@@ -1065,28 +1090,4 @@ struct pci_controller_ops pseries_pci_controller_ops = {
 define_machine(pseries) {
 	.name			= "pSeries",
 	.probe			= pSeries_probe,
-	.setup_arch		= pSeries_setup_arch,
-	.init_IRQ		= pseries_init_irq,
-	.show_cpuinfo		= pSeries_show_cpuinfo,
-	.log_error		= pSeries_log_error,
-	.discover_phbs		= pSeries_discover_phbs,
-	.pcibios_fixup		= pSeries_final_fixup,
-	.restart		= rtas_restart,
-	.halt			= rtas_halt,
-	.panic			= pseries_panic,
-	.get_boot_time		= rtas_get_boot_time,
-	.get_rtc_time		= rtas_get_rtc_time,
-	.set_rtc_time		= rtas_set_rtc_time,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= rtas_progress,
-	.system_reset_exception = pSeries_system_reset_exception,
-	.machine_check_early	= pseries_machine_check_realmode,
-	.machine_check_exception = pSeries_machine_check_exception,
-#ifdef CONFIG_KEXEC_CORE
-	.machine_kexec          = pSeries_machine_kexec,
-	.kexec_cpu_down         = pseries_kexec_cpu_down,
-#endif
-#ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
-	.memory_block_size	= pseries_memory_block_size,
-#endif
 };
-- 
2.25.0

