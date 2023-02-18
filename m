Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D3869B8FE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 10:17:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJjl04XKJz3fV0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 20:17:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJjjP5fFHz3fFM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 20:16:25 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PJjj80vQFz9scv;
	Sat, 18 Feb 2023 10:16:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MRZnRvdBfwD4; Sat, 18 Feb 2023 10:16:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PJjj766Cfz9scs;
	Sat, 18 Feb 2023 10:16:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C1ED68B768;
	Sat, 18 Feb 2023 10:16:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kVCOcBdb0UZf; Sat, 18 Feb 2023 10:16:11 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.180])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 230318B764;
	Sat, 18 Feb 2023 10:16:11 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31I9G618642525
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 18 Feb 2023 10:16:06 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31I9G3Pw642523;
	Sat, 18 Feb 2023 10:16:03 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 03/10] powerpc/platforms: Use 'compatible' property for simple cases
Date: Sat, 18 Feb 2023 10:15:46 +0100
Message-Id: <129f6562db5119a3f1bd762ee696a6298cfe4fec.1676711562.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <6cb9865d916231c38401ba34ad1a98c249fae135.1676711562.git.christophe.leroy@csgroup.eu>
References: <6cb9865d916231c38401ba34ad1a98c249fae135.1676711562.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676711718; l=61261; s=20211009; h=from:subject:message-id; bh=Kqmnjr0FIr4pksoU7gEi/qCxU4wRaJfRS7sP/DyL4do=; b=+vi59begALyzvYdVzFj8XQtD2FRaC2hz1UrYHRm6PAmug3YvHh/5iVoAbmzZmao1nvWz54+eteoU dyDJC3X0AZ/6ESkTrdVkGiaReyVBaxqJkC2/ZiNQF1MBD4dejGqV
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

Use the new 'compatible' property for simple cases.

checkpatch complains about the new compatible being undocumented
but in reality nothing is new so just ignore it for the time
being.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/44x/canyonlands.c      |  9 +--
 arch/powerpc/platforms/44x/ebony.c            |  4 +-
 arch/powerpc/platforms/44x/iss4xx.c           | 13 +--
 arch/powerpc/platforms/44x/sam440ep.c         |  4 +-
 arch/powerpc/platforms/44x/warp.c             | 10 +--
 arch/powerpc/platforms/512x/mpc5121_ads.c     |  4 +-
 arch/powerpc/platforms/512x/pdm360ng.c        |  4 +-
 arch/powerpc/platforms/52xx/media5200.c       | 16 +---
 arch/powerpc/platforms/82xx/ep8248e.c         | 10 +--
 arch/powerpc/platforms/82xx/km82xx.c          | 10 +--
 arch/powerpc/platforms/82xx/mpc8272_ads.c     | 10 +--
 arch/powerpc/platforms/82xx/pq2fads.c         | 10 +--
 arch/powerpc/platforms/83xx/asp834x.c         | 10 +--
 arch/powerpc/platforms/83xx/mpc832x_mds.c     | 10 +--
 arch/powerpc/platforms/83xx/mpc832x_rdb.c     | 10 +--
 arch/powerpc/platforms/83xx/mpc834x_itx.c     | 10 +--
 arch/powerpc/platforms/83xx/mpc834x_mds.c     | 10 +--
 arch/powerpc/platforms/83xx/mpc836x_mds.c     | 10 +--
 arch/powerpc/platforms/83xx/mpc836x_rdk.c     | 10 +--
 arch/powerpc/platforms/83xx/mpc837x_mds.c     | 10 +--
 arch/powerpc/platforms/85xx/bsc913x_qds.c     | 11 +--
 arch/powerpc/platforms/85xx/bsc913x_rdb.c     | 11 +--
 arch/powerpc/platforms/85xx/c293pcie.c        | 12 +--
 arch/powerpc/platforms/85xx/ge_imp3a.c        | 10 +--
 arch/powerpc/platforms/85xx/ksi8560.c         | 10 +--
 arch/powerpc/platforms/85xx/mpc8536_ds.c      | 10 +--
 arch/powerpc/platforms/85xx/mpc85xx_ads.c     | 10 +--
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     | 11 +--
 arch/powerpc/platforms/85xx/mpc85xx_ds.c      | 30 +------
 arch/powerpc/platforms/85xx/mpc85xx_mds.c     | 22 +----
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c     | 81 +++----------------
 arch/powerpc/platforms/85xx/mvme2500.c        | 10 +--
 arch/powerpc/platforms/85xx/p1022_ds.c        | 10 +--
 arch/powerpc/platforms/85xx/p1022_rdk.c       | 10 +--
 arch/powerpc/platforms/85xx/p1023_rdb.c       |  8 +-
 arch/powerpc/platforms/85xx/ppa8548.c         | 10 +--
 arch/powerpc/platforms/85xx/qemu_e500.c       | 10 +--
 arch/powerpc/platforms/85xx/socrates.c        | 13 +--
 arch/powerpc/platforms/85xx/stx_gp3.c         | 10 +--
 arch/powerpc/platforms/85xx/twr_p102x.c       |  7 +-
 arch/powerpc/platforms/85xx/xes_mpc85xx.c     | 24 +-----
 arch/powerpc/platforms/86xx/gef_ppc9a.c       | 18 +----
 arch/powerpc/platforms/86xx/gef_sbc310.c      | 18 +----
 arch/powerpc/platforms/86xx/gef_sbc610.c      | 18 +----
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c    | 13 +--
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c    | 14 +---
 arch/powerpc/platforms/8xx/adder875.c         |  7 +-
 arch/powerpc/platforms/8xx/ep88xc.c           |  7 +-
 arch/powerpc/platforms/8xx/mpc86xads_setup.c  |  7 +-
 arch/powerpc/platforms/8xx/mpc885ads_setup.c  |  7 +-
 arch/powerpc/platforms/8xx/tqm8xx_setup.c     |  7 +-
 arch/powerpc/platforms/amigaone/setup.c       | 21 +++--
 arch/powerpc/platforms/embedded6xx/gamecube.c |  4 +-
 arch/powerpc/platforms/embedded6xx/holly.c    | 12 +--
 .../platforms/embedded6xx/linkstation.c       |  4 +-
 .../platforms/embedded6xx/mpc7448_hpc2.c      | 12 +--
 arch/powerpc/platforms/embedded6xx/mvme5100.c | 10 +--
 .../platforms/embedded6xx/storcenter.c        |  7 +-
 arch/powerpc/platforms/embedded6xx/wii.c      |  4 +-
 arch/powerpc/platforms/microwatt/setup.c      |  7 +-
 arch/powerpc/platforms/powernv/setup.c        |  4 +-
 arch/powerpc/platforms/ps3/setup.c            |  4 +-
 62 files changed, 88 insertions(+), 631 deletions(-)

diff --git a/arch/powerpc/platforms/44x/canyonlands.c b/arch/powerpc/platforms/44x/canyonlands.c
index 5b23aef8bdef..ba561ca6c25f 100644
--- a/arch/powerpc/platforms/44x/canyonlands.c
+++ b/arch/powerpc/platforms/44x/canyonlands.c
@@ -39,11 +39,9 @@ machine_device_initcall(canyonlands, ppc460ex_device_probe);
 
 static int __init ppc460ex_probe(void)
 {
-	if (of_machine_is_compatible("amcc,canyonlands")) {
-		pci_set_flags(PCI_REASSIGN_ALL_RSRC);
-		return 1;
-	}
-	return 0;
+	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
+
+	return 1;
 }
 
 /* USB PHY fixup code on Canyonlands kit. */
@@ -110,6 +108,7 @@ static int __init ppc460ex_canyonlands_fixup(void)
 machine_device_initcall(canyonlands, ppc460ex_canyonlands_fixup);
 define_machine(canyonlands) {
 	.name = "Canyonlands",
+	.compatible = "amcc,canyonlands",
 	.probe = ppc460ex_probe,
 	.progress = udbg_progress,
 	.init_IRQ = uic_init_tree,
diff --git a/arch/powerpc/platforms/44x/ebony.c b/arch/powerpc/platforms/44x/ebony.c
index 0d8f202bc45f..5b9e57b4cd65 100644
--- a/arch/powerpc/platforms/44x/ebony.c
+++ b/arch/powerpc/platforms/44x/ebony.c
@@ -45,9 +45,6 @@ machine_device_initcall(ebony, ebony_device_probe);
  */
 static int __init ebony_probe(void)
 {
-	if (!of_machine_is_compatible("ibm,ebony"))
-		return 0;
-
 	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
 
 	return 1;
@@ -55,6 +52,7 @@ static int __init ebony_probe(void)
 
 define_machine(ebony) {
 	.name			= "Ebony",
+	.compatible		= "ibm,ebony",
 	.probe			= ebony_probe,
 	.progress		= udbg_progress,
 	.init_IRQ		= uic_init_tree,
diff --git a/arch/powerpc/platforms/44x/iss4xx.c b/arch/powerpc/platforms/44x/iss4xx.c
index c5f82591408c..e779bd3d2291 100644
--- a/arch/powerpc/platforms/44x/iss4xx.c
+++ b/arch/powerpc/platforms/44x/iss4xx.c
@@ -140,20 +140,9 @@ static void __init iss4xx_setup_arch(void)
 	iss4xx_smp_init();
 }
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init iss4xx_probe(void)
-{
-	if (!of_machine_is_compatible("ibm,iss-4xx"))
-		return 0;
-
-	return 1;
-}
-
 define_machine(iss4xx) {
 	.name			= "ISS-4xx",
-	.probe			= iss4xx_probe,
+	.compatible		= "ibm,iss-4xx",
 	.progress		= udbg_progress,
 	.init_IRQ		= iss4xx_init_irq,
 	.setup_arch		= iss4xx_setup_arch,
diff --git a/arch/powerpc/platforms/44x/sam440ep.c b/arch/powerpc/platforms/44x/sam440ep.c
index ed854b53877e..8b281e027477 100644
--- a/arch/powerpc/platforms/44x/sam440ep.c
+++ b/arch/powerpc/platforms/44x/sam440ep.c
@@ -41,9 +41,6 @@ machine_device_initcall(sam440ep, sam440ep_device_probe);
 
 static int __init sam440ep_probe(void)
 {
-	if (!of_machine_is_compatible("acube,sam440ep"))
-		return 0;
-
 	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
 
 	return 1;
@@ -51,6 +48,7 @@ static int __init sam440ep_probe(void)
 
 define_machine(sam440ep) {
 	.name 			= "Sam440ep",
+	.compatible		= "acube,sam440ep",
 	.probe 			= sam440ep_probe,
 	.progress 		= udbg_progress,
 	.init_IRQ 		= uic_init_tree,
diff --git a/arch/powerpc/platforms/44x/warp.c b/arch/powerpc/platforms/44x/warp.c
index cefa313c09f0..acbc356e8a19 100644
--- a/arch/powerpc/platforms/44x/warp.c
+++ b/arch/powerpc/platforms/44x/warp.c
@@ -41,17 +41,9 @@ static int __init warp_device_probe(void)
 }
 machine_device_initcall(warp, warp_device_probe);
 
-static int __init warp_probe(void)
-{
-	if (!of_machine_is_compatible("pika,warp"))
-		return 0;
-
-	return 1;
-}
-
 define_machine(warp) {
 	.name		= "Warp",
-	.probe 		= warp_probe,
+	.compatible	= "pika,warp",
 	.progress 	= udbg_progress,
 	.init_IRQ 	= uic_init_tree,
 	.get_irq 	= uic_get_irq,
diff --git a/arch/powerpc/platforms/512x/mpc5121_ads.c b/arch/powerpc/platforms/512x/mpc5121_ads.c
index fc3fb999cd74..0b6a2d3fd343 100644
--- a/arch/powerpc/platforms/512x/mpc5121_ads.c
+++ b/arch/powerpc/platforms/512x/mpc5121_ads.c
@@ -53,9 +53,6 @@ static void __init mpc5121_ads_init_IRQ(void)
  */
 static int __init mpc5121_ads_probe(void)
 {
-	if (!of_machine_is_compatible("fsl,mpc5121ads"))
-		return 0;
-
 	mpc512x_init_early();
 
 	return 1;
@@ -63,6 +60,7 @@ static int __init mpc5121_ads_probe(void)
 
 define_machine(mpc5121_ads) {
 	.name			= "MPC5121 ADS",
+	.compatible		= "fsl,mpc5121ads",
 	.probe			= mpc5121_ads_probe,
 	.setup_arch		= mpc5121_ads_setup_arch,
 	.discover_phbs		= mpc5121_ads_setup_pci,
diff --git a/arch/powerpc/platforms/512x/pdm360ng.c b/arch/powerpc/platforms/512x/pdm360ng.c
index 1e911f42697d..d3a4eeb47bb1 100644
--- a/arch/powerpc/platforms/512x/pdm360ng.c
+++ b/arch/powerpc/platforms/512x/pdm360ng.c
@@ -108,9 +108,6 @@ void __init pdm360ng_init(void)
 
 static int __init pdm360ng_probe(void)
 {
-	if (!of_machine_is_compatible("ifm,pdm360ng"))
-		return 0;
-
 	mpc512x_init_early();
 
 	return 1;
@@ -118,6 +115,7 @@ static int __init pdm360ng_probe(void)
 
 define_machine(pdm360ng) {
 	.name			= "PDM360NG",
+	.compatible		= "ifm,pdm360ng",
 	.probe			= pdm360ng_probe,
 	.setup_arch		= mpc512x_setup_arch,
 	.init			= pdm360ng_init,
diff --git a/arch/powerpc/platforms/52xx/media5200.c b/arch/powerpc/platforms/52xx/media5200.c
index 33a35fff11b5..a9c92c6ccbcf 100644
--- a/arch/powerpc/platforms/52xx/media5200.c
+++ b/arch/powerpc/platforms/52xx/media5200.c
@@ -227,23 +227,9 @@ static void __init media5200_setup_arch(void)
 
 }
 
-/* list of the supported boards */
-static const char * const board[] __initconst = {
-	"fsl,media5200",
-	NULL
-};
-
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init media5200_probe(void)
-{
-	return of_device_compatible_match(of_root, board);
-}
-
 define_machine(media5200_platform) {
 	.name		= "media5200-platform",
-	.probe		= media5200_probe,
+	.compatible	= "fsl,media5200",
 	.setup_arch	= media5200_setup_arch,
 	.discover_phbs	= mpc52xx_setup_pci,
 	.init		= mpc52xx_declare_of_platform_devices,
diff --git a/arch/powerpc/platforms/82xx/ep8248e.c b/arch/powerpc/platforms/82xx/ep8248e.c
index 28e627f8a320..66defdaf816f 100644
--- a/arch/powerpc/platforms/82xx/ep8248e.c
+++ b/arch/powerpc/platforms/82xx/ep8248e.c
@@ -301,18 +301,10 @@ static int __init declare_of_platform_devices(void)
 }
 machine_device_initcall(ep8248e, declare_of_platform_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init ep8248e_probe(void)
-{
-	return of_machine_is_compatible("fsl,ep8248e");
-}
-
 define_machine(ep8248e)
 {
 	.name = "Embedded Planet EP8248E",
-	.probe = ep8248e_probe,
+	.compatible = "fsl,ep8248e",
 	.setup_arch = ep8248e_setup_arch,
 	.init_IRQ = ep8248e_pic_init,
 	.get_irq = cpm2_get_irq,
diff --git a/arch/powerpc/platforms/82xx/km82xx.c b/arch/powerpc/platforms/82xx/km82xx.c
index 1c8bbf4251d9..8ab575d70080 100644
--- a/arch/powerpc/platforms/82xx/km82xx.c
+++ b/arch/powerpc/platforms/82xx/km82xx.c
@@ -188,18 +188,10 @@ static int __init declare_of_platform_devices(void)
 }
 machine_device_initcall(km82xx, declare_of_platform_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init km82xx_probe(void)
-{
-	return of_machine_is_compatible("keymile,km82xx");
-}
-
 define_machine(km82xx)
 {
 	.name = "Keymile km82xx",
-	.probe = km82xx_probe,
+	.compatible = "keymile,km82xx",
 	.setup_arch = km82xx_setup_arch,
 	.init_IRQ = km82xx_pic_init,
 	.get_irq = cpm2_get_irq,
diff --git a/arch/powerpc/platforms/82xx/mpc8272_ads.c b/arch/powerpc/platforms/82xx/mpc8272_ads.c
index 0b5b9dec16d5..5dd034ed2c87 100644
--- a/arch/powerpc/platforms/82xx/mpc8272_ads.c
+++ b/arch/powerpc/platforms/82xx/mpc8272_ads.c
@@ -191,18 +191,10 @@ static int __init declare_of_platform_devices(void)
 }
 machine_device_initcall(mpc8272_ads, declare_of_platform_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc8272_ads_probe(void)
-{
-	return of_machine_is_compatible("fsl,mpc8272ads");
-}
-
 define_machine(mpc8272_ads)
 {
 	.name = "Freescale MPC8272 ADS",
-	.probe = mpc8272_ads_probe,
+	.compatible = "fsl,mpc8272ads",
 	.setup_arch = mpc8272_ads_setup_arch,
 	.discover_phbs = pq2_init_pci,
 	.init_IRQ = mpc8272_ads_pic_init,
diff --git a/arch/powerpc/platforms/82xx/pq2fads.c b/arch/powerpc/platforms/82xx/pq2fads.c
index ac9113d524af..d91dfdc634e9 100644
--- a/arch/powerpc/platforms/82xx/pq2fads.c
+++ b/arch/powerpc/platforms/82xx/pq2fads.c
@@ -154,14 +154,6 @@ static void __init pq2fads_setup_arch(void)
 		ppc_md.progress("pq2fads_setup_arch(), finish", 0);
 }
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init pq2fads_probe(void)
-{
-	return of_machine_is_compatible("fsl,pq2fads");
-}
-
 static const struct of_device_id of_bus_ids[] __initconst = {
 	{ .name = "soc", },
 	{ .name = "cpm", },
@@ -180,7 +172,7 @@ machine_device_initcall(pq2fads, declare_of_platform_devices);
 define_machine(pq2fads)
 {
 	.name = "Freescale PQ2FADS",
-	.probe = pq2fads_probe,
+	.compatible = "fsl,pq2fads",
 	.setup_arch = pq2fads_setup_arch,
 	.discover_phbs = pq2_init_pci,
 	.init_IRQ = pq2fads_pic_init,
diff --git a/arch/powerpc/platforms/83xx/asp834x.c b/arch/powerpc/platforms/83xx/asp834x.c
index 68061c2a57c1..8f3d995027fe 100644
--- a/arch/powerpc/platforms/83xx/asp834x.c
+++ b/arch/powerpc/platforms/83xx/asp834x.c
@@ -32,17 +32,9 @@ static void __init asp834x_setup_arch(void)
 
 machine_device_initcall(asp834x, mpc83xx_declare_of_platform_devices);
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init asp834x_probe(void)
-{
-	return of_machine_is_compatible("analogue-and-micro,asp8347e");
-}
-
 define_machine(asp834x) {
 	.name			= "ASP8347E",
-	.probe			= asp834x_probe,
+	.compatible		= "analogue-and-micro,asp8347e",
 	.setup_arch		= asp834x_setup_arch,
 	.discover_phbs		= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
diff --git a/arch/powerpc/platforms/83xx/mpc832x_mds.c b/arch/powerpc/platforms/83xx/mpc832x_mds.c
index 435344405d2c..01035eff7d2e 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_mds.c
@@ -88,17 +88,9 @@ static void __init mpc832x_sys_setup_arch(void)
 
 machine_device_initcall(mpc832x_mds, mpc83xx_declare_of_platform_devices);
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc832x_sys_probe(void)
-{
-	return of_machine_is_compatible("MPC832xMDS");
-}
-
 define_machine(mpc832x_mds) {
 	.name 		= "MPC832x MDS",
-	.probe 		= mpc832x_sys_probe,
+	.compatible	= "MPC832xMDS",
 	.setup_arch 	= mpc832x_sys_setup_arch,
 	.discover_phbs	= mpc83xx_setup_pci,
 	.init_IRQ	= mpc83xx_ipic_init_IRQ,
diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
index caa96edf0e72..6b7b852e48bf 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
@@ -212,17 +212,9 @@ static void __init mpc832x_rdb_setup_arch(void)
 
 machine_device_initcall(mpc832x_rdb, mpc83xx_declare_of_platform_devices);
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc832x_rdb_probe(void)
-{
-	return of_machine_is_compatible("MPC832xRDB");
-}
-
 define_machine(mpc832x_rdb) {
 	.name		= "MPC832x RDB",
-	.probe		= mpc832x_rdb_probe,
+	.compatible	= "MPC832xRDB",
 	.setup_arch	= mpc832x_rdb_setup_arch,
 	.discover_phbs  = mpc83xx_setup_pci,
 	.init_IRQ	= mpc83xx_ipic_init_IRQ,
diff --git a/arch/powerpc/platforms/83xx/mpc834x_itx.c b/arch/powerpc/platforms/83xx/mpc834x_itx.c
index 6a110f275304..92ff7be472c3 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_itx.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_itx.c
@@ -57,17 +57,9 @@ static void __init mpc834x_itx_setup_arch(void)
 	mpc834x_usb_cfg();
 }
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc834x_itx_probe(void)
-{
-	return of_machine_is_compatible("MPC834xMITX");
-}
-
 define_machine(mpc834x_itx) {
 	.name			= "MPC834x ITX",
-	.probe			= mpc834x_itx_probe,
+	.compatible		= "MPC834xMITX",
 	.setup_arch		= mpc834x_itx_setup_arch,
 	.discover_phbs  	= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
diff --git a/arch/powerpc/platforms/83xx/mpc834x_mds.c b/arch/powerpc/platforms/83xx/mpc834x_mds.c
index 7dde5a75332b..8e45c034daaf 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_mds.c
@@ -79,17 +79,9 @@ static void __init mpc834x_mds_setup_arch(void)
 
 machine_device_initcall(mpc834x_mds, mpc83xx_declare_of_platform_devices);
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc834x_mds_probe(void)
-{
-	return of_machine_is_compatible("MPC834xMDS");
-}
-
 define_machine(mpc834x_mds) {
 	.name			= "MPC834x MDS",
-	.probe			= mpc834x_mds_probe,
+	.compatible		= "MPC834xMDS",
 	.setup_arch		= mpc834x_mds_setup_arch,
 	.discover_phbs  	= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c b/arch/powerpc/platforms/83xx/mpc836x_mds.c
index b1e6665be5d3..4ae2b6e4b513 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_mds.c
@@ -188,17 +188,9 @@ static int __init mpc836x_usb_cfg(void)
 machine_arch_initcall(mpc836x_mds, mpc836x_usb_cfg);
 #endif /* CONFIG_QE_USB */
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc836x_mds_probe(void)
-{
-	return of_machine_is_compatible("MPC836xMDS");
-}
-
 define_machine(mpc836x_mds) {
 	.name		= "MPC836x MDS",
-	.probe		= mpc836x_mds_probe,
+	.compatible	= "MPC836xMDS",
 	.setup_arch	= mpc836x_mds_setup_arch,
 	.discover_phbs  = mpc83xx_setup_pci,
 	.init_IRQ	= mpc83xx_ipic_init_IRQ,
diff --git a/arch/powerpc/platforms/83xx/mpc836x_rdk.c b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
index 731bc5ce726d..231a5df0399b 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_rdk.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
@@ -28,17 +28,9 @@ static void __init mpc836x_rdk_setup_arch(void)
 	mpc83xx_setup_arch();
 }
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened.
- */
-static int __init mpc836x_rdk_probe(void)
-{
-	return of_machine_is_compatible("fsl,mpc8360rdk");
-}
-
 define_machine(mpc836x_rdk) {
 	.name		= "MPC836x RDK",
-	.probe		= mpc836x_rdk_probe,
+	.compatible	= "fsl,mpc8360rdk",
 	.setup_arch	= mpc836x_rdk_setup_arch,
 	.discover_phbs  = mpc83xx_setup_pci,
 	.init_IRQ	= mpc83xx_ipic_init_IRQ,
diff --git a/arch/powerpc/platforms/83xx/mpc837x_mds.c b/arch/powerpc/platforms/83xx/mpc837x_mds.c
index fa3538803af7..0c10100756d4 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_mds.c
@@ -81,17 +81,9 @@ static void __init mpc837x_mds_setup_arch(void)
 
 machine_device_initcall(mpc837x_mds, mpc83xx_declare_of_platform_devices);
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc837x_mds_probe(void)
-{
-	return of_machine_is_compatible("fsl,mpc837xmds");
-}
-
 define_machine(mpc837x_mds) {
 	.name			= "MPC837x MDS",
-	.probe			= mpc837x_mds_probe,
+	.compatible		= "fsl,mpc837xmds",
 	.setup_arch		= mpc837x_mds_setup_arch,
 	.discover_phbs  	= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
diff --git a/arch/powerpc/platforms/85xx/bsc913x_qds.c b/arch/powerpc/platforms/85xx/bsc913x_qds.c
index bcbbeb5a972a..902a867352c2 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_qds.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_qds.c
@@ -50,18 +50,9 @@ static void __init bsc913x_qds_setup_arch(void)
 
 machine_arch_initcall(bsc9132_qds, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-
-static int __init bsc9132_qds_probe(void)
-{
-	return of_machine_is_compatible("fsl,bsc9132qds");
-}
-
 define_machine(bsc9132_qds) {
 	.name			= "BSC9132 QDS",
-	.probe			= bsc9132_qds_probe,
+	.compatible		= "fsl,bsc9132qds",
 	.setup_arch		= bsc913x_qds_setup_arch,
 	.init_IRQ		= bsc913x_qds_pic_init,
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/85xx/bsc913x_rdb.c b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
index f78e5d3deedb..58a44953b936 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_rdb.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
@@ -40,18 +40,9 @@ static void __init bsc913x_rdb_setup_arch(void)
 
 machine_device_initcall(bsc9131_rdb, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-
-static int __init bsc9131_rdb_probe(void)
-{
-	return of_machine_is_compatible("fsl,bsc9131rdb");
-}
-
 define_machine(bsc9131_rdb) {
 	.name			= "BSC9131 RDB",
-	.probe			= bsc9131_rdb_probe,
+	.compatible		= "fsl,bsc9131rdb",
 	.setup_arch		= bsc913x_rdb_setup_arch,
 	.init_IRQ		= bsc913x_rdb_pic_init,
 	.get_irq		= mpic_get_irq,
diff --git a/arch/powerpc/platforms/85xx/c293pcie.c b/arch/powerpc/platforms/85xx/c293pcie.c
index 58a398c89e97..fbf1875e5835 100644
--- a/arch/powerpc/platforms/85xx/c293pcie.c
+++ b/arch/powerpc/platforms/85xx/c293pcie.c
@@ -45,19 +45,9 @@ static void __init c293_pcie_setup_arch(void)
 
 machine_arch_initcall(c293_pcie, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init c293_pcie_probe(void)
-{
-	if (of_machine_is_compatible("fsl,C293PCIE"))
-		return 1;
-	return 0;
-}
-
 define_machine(c293_pcie) {
 	.name			= "C293 PCIE",
-	.probe			= c293_pcie_probe,
+	.compatible		= "fsl,C293PCIE",
 	.setup_arch		= c293_pcie_setup_arch,
 	.init_IRQ		= c293_pcie_pic_init,
 	.get_irq		= mpic_get_irq,
diff --git a/arch/powerpc/platforms/85xx/ge_imp3a.c b/arch/powerpc/platforms/85xx/ge_imp3a.c
index e3e8f18825a1..1bfd4ea13038 100644
--- a/arch/powerpc/platforms/85xx/ge_imp3a.c
+++ b/arch/powerpc/platforms/85xx/ge_imp3a.c
@@ -190,19 +190,11 @@ static void ge_imp3a_show_cpuinfo(struct seq_file *m)
 		ge_imp3a_get_cpci_is_syscon() ? "yes" : "no");
 }
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init ge_imp3a_probe(void)
-{
-	return of_machine_is_compatible("ge,IMP3A");
-}
-
 machine_arch_initcall(ge_imp3a, mpc85xx_common_publish_devices);
 
 define_machine(ge_imp3a) {
 	.name			= "GE_IMP3A",
-	.probe			= ge_imp3a_probe,
+	.compatible		= "ge,IMP3A",
 	.setup_arch		= ge_imp3a_setup_arch,
 	.init_IRQ		= ge_imp3a_pic_init,
 	.show_cpuinfo		= ge_imp3a_show_cpuinfo,
diff --git a/arch/powerpc/platforms/85xx/ksi8560.c b/arch/powerpc/platforms/85xx/ksi8560.c
index a22f02b0fc77..548d478e5194 100644
--- a/arch/powerpc/platforms/85xx/ksi8560.c
+++ b/arch/powerpc/platforms/85xx/ksi8560.c
@@ -172,17 +172,9 @@ static void ksi8560_show_cpuinfo(struct seq_file *m)
 
 machine_device_initcall(ksi8560, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init ksi8560_probe(void)
-{
-	return of_machine_is_compatible("emerson,KSI8560");
-}
-
 define_machine(ksi8560) {
 	.name			= "KSI8560",
-	.probe			= ksi8560_probe,
+	.compatible		= "emerson,KSI8560",
 	.setup_arch		= ksi8560_setup_arch,
 	.init_IRQ		= ksi8560_pic_init,
 	.show_cpuinfo		= ksi8560_show_cpuinfo,
diff --git a/arch/powerpc/platforms/85xx/mpc8536_ds.c b/arch/powerpc/platforms/85xx/mpc8536_ds.c
index e5d7386ad612..9900cf2cd392 100644
--- a/arch/powerpc/platforms/85xx/mpc8536_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc8536_ds.c
@@ -52,17 +52,9 @@ static void __init mpc8536_ds_setup_arch(void)
 
 machine_arch_initcall(mpc8536_ds, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc8536_ds_probe(void)
-{
-	return of_machine_is_compatible("fsl,mpc8536ds");
-}
-
 define_machine(mpc8536_ds) {
 	.name			= "MPC8536 DS",
-	.probe			= mpc8536_ds_probe,
+	.compatible		= "fsl,mpc8536ds",
 	.setup_arch		= mpc8536_ds_setup_arch,
 	.init_IRQ		= mpc8536_ds_pic_init,
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ads.c b/arch/powerpc/platforms/85xx/mpc85xx_ads.c
index a34fc037957d..dd5302ab406d 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ads.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ads.c
@@ -151,17 +151,9 @@ static void mpc85xx_ads_show_cpuinfo(struct seq_file *m)
 
 machine_arch_initcall(mpc85xx_ads, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc85xx_ads_probe(void)
-{
-	return of_machine_is_compatible("MPC85xxADS");
-}
-
 define_machine(mpc85xx_ads) {
 	.name			= "MPC85xx ADS",
-	.probe			= mpc85xx_ads_probe,
+	.compatible		= "MPC85xxADS",
 	.setup_arch		= mpc85xx_ads_setup_arch,
 	.init_IRQ		= mpc85xx_ads_pic_init,
 	.show_cpuinfo		= mpc85xx_ads_show_cpuinfo,
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index 0b8f2101c5fb..d7568b35ec78 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -370,20 +370,11 @@ static void mpc85xx_cds_show_cpuinfo(struct seq_file *m)
 	seq_printf(m, "PLL setting\t: 0x%x\n", ((phid1 >> 24) & 0x3f));
 }
 
-
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc85xx_cds_probe(void)
-{
-	return of_machine_is_compatible("MPC85xxCDS");
-}
-
 machine_arch_initcall(mpc85xx_cds, mpc85xx_common_publish_devices);
 
 define_machine(mpc85xx_cds) {
 	.name		= "MPC85xx CDS",
-	.probe		= mpc85xx_cds_probe,
+	.compatible	= "MPC85xxCDS",
 	.setup_arch	= mpc85xx_cds_setup_arch,
 	.init_IRQ	= mpc85xx_cds_pic_init,
 	.show_cpuinfo	= mpc85xx_cds_show_cpuinfo,
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index f8d2c97f39bd..b4feb251b57e 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -158,37 +158,13 @@ static void __init mpc85xx_ds_setup_arch(void)
 	printk("MPC85xx DS board from Freescale Semiconductor\n");
 }
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc8544_ds_probe(void)
-{
-	return !!of_machine_is_compatible("MPC8544DS");
-}
-
 machine_arch_initcall(mpc8544_ds, mpc85xx_common_publish_devices);
 machine_arch_initcall(mpc8572_ds, mpc85xx_common_publish_devices);
 machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc8572_ds_probe(void)
-{
-	return !!of_machine_is_compatible("fsl,MPC8572DS");
-}
-
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init p2020_ds_probe(void)
-{
-	return !!of_machine_is_compatible("fsl,P2020DS");
-}
-
 define_machine(mpc8544_ds) {
 	.name			= "MPC8544 DS",
-	.probe			= mpc8544_ds_probe,
+	.compatible		= "MPC8544DS",
 	.setup_arch		= mpc85xx_ds_setup_arch,
 	.init_IRQ		= mpc85xx_ds_pic_init,
 #ifdef CONFIG_PCI
@@ -202,7 +178,7 @@ define_machine(mpc8544_ds) {
 
 define_machine(mpc8572_ds) {
 	.name			= "MPC8572 DS",
-	.probe			= mpc8572_ds_probe,
+	.compatible		= "fsl,MPC8572DS",
 	.setup_arch		= mpc85xx_ds_setup_arch,
 	.init_IRQ		= mpc85xx_ds_pic_init,
 #ifdef CONFIG_PCI
@@ -216,7 +192,7 @@ define_machine(mpc8572_ds) {
 
 define_machine(p2020_ds) {
 	.name			= "P2020 DS",
-	.probe			= p2020_ds_probe,
+	.compatible		= "fsl,P2020DS",
 	.setup_arch		= mpc85xx_ds_setup_arch,
 	.init_IRQ		= mpc85xx_ds_pic_init,
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
index 3a2ac410af18..721322e04c79 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@ -339,14 +339,9 @@ static void __init mpc85xx_mds_pic_init(void)
 	mpic_init(mpic);
 }
 
-static int __init mpc85xx_mds_probe(void)
-{
-	return of_machine_is_compatible("MPC85xxMDS");
-}
-
 define_machine(mpc8568_mds) {
 	.name		= "MPC8568 MDS",
-	.probe		= mpc85xx_mds_probe,
+	.compatible	= "MPC85xxMDS",
 	.setup_arch	= mpc85xx_mds_setup_arch,
 	.init_IRQ	= mpc85xx_mds_pic_init,
 	.get_irq	= mpic_get_irq,
@@ -358,14 +353,9 @@ define_machine(mpc8568_mds) {
 #endif
 };
 
-static int __init mpc8569_mds_probe(void)
-{
-	return of_machine_is_compatible("fsl,MPC8569EMDS");
-}
-
 define_machine(mpc8569_mds) {
 	.name		= "MPC8569 MDS",
-	.probe		= mpc8569_mds_probe,
+	.compatible	= "fsl,MPC8569EMDS",
 	.setup_arch	= mpc85xx_mds_setup_arch,
 	.init_IRQ	= mpc85xx_mds_pic_init,
 	.get_irq	= mpic_get_irq,
@@ -377,15 +367,9 @@ define_machine(mpc8569_mds) {
 #endif
 };
 
-static int __init p1021_mds_probe(void)
-{
-	return of_machine_is_compatible("fsl,P1021MDS");
-
-}
-
 define_machine(p1021_mds) {
 	.name		= "P1021 MDS",
-	.probe		= p1021_mds_probe,
+	.compatible	= "fsl,P1021MDS",
 	.setup_arch	= mpc85xx_mds_setup_arch,
 	.init_IRQ	= mpc85xx_mds_pic_init,
 	.get_irq	= mpic_get_irq,
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index d99aba158235..9754feaebcd4 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -119,70 +119,9 @@ machine_arch_initcall(p1021_rdb_pc, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1025_rdb, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1024_rdb, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init p2020_rdb_probe(void)
-{
-	if (of_machine_is_compatible("fsl,P2020RDB"))
-		return 1;
-	return 0;
-}
-
-static int __init p1020_rdb_probe(void)
-{
-	if (of_machine_is_compatible("fsl,P1020RDB"))
-		return 1;
-	return 0;
-}
-
-static int __init p1020_rdb_pc_probe(void)
-{
-	return of_machine_is_compatible("fsl,P1020RDB-PC");
-}
-
-static int __init p1020_rdb_pd_probe(void)
-{
-	return of_machine_is_compatible("fsl,P1020RDB-PD");
-}
-
-static int __init p1021_rdb_pc_probe(void)
-{
-	if (of_machine_is_compatible("fsl,P1021RDB-PC"))
-		return 1;
-	return 0;
-}
-
-static int __init p2020_rdb_pc_probe(void)
-{
-	if (of_machine_is_compatible("fsl,P2020RDB-PC"))
-		return 1;
-	return 0;
-}
-
-static int __init p1025_rdb_probe(void)
-{
-	return of_machine_is_compatible("fsl,P1025RDB");
-}
-
-static int __init p1020_mbg_pc_probe(void)
-{
-	return of_machine_is_compatible("fsl,P1020MBG-PC");
-}
-
-static int __init p1020_utm_pc_probe(void)
-{
-	return of_machine_is_compatible("fsl,P1020UTM-PC");
-}
-
-static int __init p1024_rdb_probe(void)
-{
-	return of_machine_is_compatible("fsl,P1024RDB");
-}
-
 define_machine(p2020_rdb) {
 	.name			= "P2020 RDB",
-	.probe			= p2020_rdb_probe,
+	.compatible		= "fsl,P2020RDB",
 	.setup_arch		= mpc85xx_rdb_setup_arch,
 	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
@@ -196,7 +135,7 @@ define_machine(p2020_rdb) {
 
 define_machine(p1020_rdb) {
 	.name			= "P1020 RDB",
-	.probe			= p1020_rdb_probe,
+	.compatible		= "fsl,P1020RDB",
 	.setup_arch		= mpc85xx_rdb_setup_arch,
 	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
@@ -210,7 +149,7 @@ define_machine(p1020_rdb) {
 
 define_machine(p1021_rdb_pc) {
 	.name			= "P1021 RDB-PC",
-	.probe			= p1021_rdb_pc_probe,
+	.compatible		= "fsl,P1021RDB-PC",
 	.setup_arch		= mpc85xx_rdb_setup_arch,
 	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
@@ -224,7 +163,7 @@ define_machine(p1021_rdb_pc) {
 
 define_machine(p2020_rdb_pc) {
 	.name			= "P2020RDB-PC",
-	.probe			= p2020_rdb_pc_probe,
+	.compatible		= "fsl,P2020RDB-PC",
 	.setup_arch		= mpc85xx_rdb_setup_arch,
 	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
@@ -238,7 +177,7 @@ define_machine(p2020_rdb_pc) {
 
 define_machine(p1025_rdb) {
 	.name			= "P1025 RDB",
-	.probe			= p1025_rdb_probe,
+	.compatible		= "fsl,P1025RDB",
 	.setup_arch		= mpc85xx_rdb_setup_arch,
 	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
@@ -252,7 +191,7 @@ define_machine(p1025_rdb) {
 
 define_machine(p1020_mbg_pc) {
 	.name			= "P1020 MBG-PC",
-	.probe			= p1020_mbg_pc_probe,
+	.compatible		= "fsl,P1020MBG-PC",
 	.setup_arch		= mpc85xx_rdb_setup_arch,
 	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
@@ -266,7 +205,7 @@ define_machine(p1020_mbg_pc) {
 
 define_machine(p1020_utm_pc) {
 	.name			= "P1020 UTM-PC",
-	.probe			= p1020_utm_pc_probe,
+	.compatible		= "fsl,P1020UTM-PC",
 	.setup_arch		= mpc85xx_rdb_setup_arch,
 	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
@@ -280,7 +219,7 @@ define_machine(p1020_utm_pc) {
 
 define_machine(p1020_rdb_pc) {
 	.name			= "P1020RDB-PC",
-	.probe			= p1020_rdb_pc_probe,
+	.compatible		= "fsl,P1020RDB-PC",
 	.setup_arch		= mpc85xx_rdb_setup_arch,
 	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
@@ -294,7 +233,7 @@ define_machine(p1020_rdb_pc) {
 
 define_machine(p1020_rdb_pd) {
 	.name			= "P1020RDB-PD",
-	.probe			= p1020_rdb_pd_probe,
+	.compatible		= "fsl,P1020RDB-PD",
 	.setup_arch		= mpc85xx_rdb_setup_arch,
 	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
@@ -308,7 +247,7 @@ define_machine(p1020_rdb_pd) {
 
 define_machine(p1024_rdb) {
 	.name			= "P1024 RDB",
-	.probe			= p1024_rdb_probe,
+	.compatible		= "fsl,P1024RDB",
 	.setup_arch		= mpc85xx_rdb_setup_arch,
 	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/85xx/mvme2500.c b/arch/powerpc/platforms/85xx/mvme2500.c
index 69d5aa082a4b..ee1383e811d9 100644
--- a/arch/powerpc/platforms/85xx/mvme2500.c
+++ b/arch/powerpc/platforms/85xx/mvme2500.c
@@ -43,17 +43,9 @@ static void __init mvme2500_setup_arch(void)
 
 machine_arch_initcall(mvme2500, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mvme2500_probe(void)
-{
-	return of_machine_is_compatible("artesyn,MVME2500");
-}
-
 define_machine(mvme2500) {
 	.name			= "MVME2500",
-	.probe			= mvme2500_probe,
+	.compatible		= "artesyn,MVME2500",
 	.setup_arch		= mvme2500_setup_arch,
 	.init_IRQ		= mvme2500_pic_init,
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/85xx/p1022_ds.c b/arch/powerpc/platforms/85xx/p1022_ds.c
index 537599906146..15a684ce9201 100644
--- a/arch/powerpc/platforms/85xx/p1022_ds.c
+++ b/arch/powerpc/platforms/85xx/p1022_ds.c
@@ -549,17 +549,9 @@ static void __init p1022_ds_setup_arch(void)
 
 machine_arch_initcall(p1022_ds, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init p1022_ds_probe(void)
-{
-	return of_machine_is_compatible("fsl,p1022ds");
-}
-
 define_machine(p1022_ds) {
 	.name			= "P1022 DS",
-	.probe			= p1022_ds_probe,
+	.compatible		= "fsl,p1022ds",
 	.setup_arch		= p1022_ds_setup_arch,
 	.init_IRQ		= p1022_ds_pic_init,
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/85xx/p1022_rdk.c b/arch/powerpc/platforms/85xx/p1022_rdk.c
index bc58a99164c9..aee9ffc0eb17 100644
--- a/arch/powerpc/platforms/85xx/p1022_rdk.c
+++ b/arch/powerpc/platforms/85xx/p1022_rdk.c
@@ -129,17 +129,9 @@ static void __init p1022_rdk_setup_arch(void)
 
 machine_arch_initcall(p1022_rdk, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init p1022_rdk_probe(void)
-{
-	return of_machine_is_compatible("fsl,p1022rdk");
-}
-
 define_machine(p1022_rdk) {
 	.name			= "P1022 RDK",
-	.probe			= p1022_rdk_probe,
+	.compatible		= "fsl,p1022rdk",
 	.setup_arch		= p1022_rdk_setup_arch,
 	.init_IRQ		= p1022_rdk_pic_init,
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/85xx/p1023_rdb.c b/arch/powerpc/platforms/85xx/p1023_rdb.c
index c04868eb2eb1..37e78f40d424 100644
--- a/arch/powerpc/platforms/85xx/p1023_rdb.c
+++ b/arch/powerpc/platforms/85xx/p1023_rdb.c
@@ -94,15 +94,9 @@ static void __init mpc85xx_rdb_pic_init(void)
 	mpic_init(mpic);
 }
 
-static int __init p1023_rdb_probe(void)
-{
-	return of_machine_is_compatible("fsl,P1023RDB");
-
-}
-
 define_machine(p1023_rdb) {
 	.name			= "P1023 RDB",
-	.probe			= p1023_rdb_probe,
+	.compatible		= "fsl,P1023RDB",
 	.setup_arch		= mpc85xx_rdb_setup_arch,
 	.init_IRQ		= mpc85xx_rdb_pic_init,
 	.get_irq		= mpic_get_irq,
diff --git a/arch/powerpc/platforms/85xx/ppa8548.c b/arch/powerpc/platforms/85xx/ppa8548.c
index 0faf2990bf2c..b030d0e7b06b 100644
--- a/arch/powerpc/platforms/85xx/ppa8548.c
+++ b/arch/powerpc/platforms/85xx/ppa8548.c
@@ -72,17 +72,9 @@ static int __init declare_of_platform_devices(void)
 }
 machine_device_initcall(ppa8548, declare_of_platform_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init ppa8548_probe(void)
-{
-	return of_machine_is_compatible("ppa8548");
-}
-
 define_machine(ppa8548) {
 	.name		= "ppa8548",
-	.probe		= ppa8548_probe,
+	.compatible	= "ppa8548",
 	.setup_arch	= ppa8548_setup_arch,
 	.init_IRQ	= ppa8548_pic_init,
 	.show_cpuinfo	= ppa8548_show_cpuinfo,
diff --git a/arch/powerpc/platforms/85xx/qemu_e500.c b/arch/powerpc/platforms/85xx/qemu_e500.c
index 1639e222cc33..335815a2d121 100644
--- a/arch/powerpc/platforms/85xx/qemu_e500.c
+++ b/arch/powerpc/platforms/85xx/qemu_e500.c
@@ -46,19 +46,11 @@ static void __init qemu_e500_setup_arch(void)
 	mpc85xx_smp_init();
 }
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init qemu_e500_probe(void)
-{
-	return !!of_machine_is_compatible("fsl,qemu-e500");
-}
-
 machine_arch_initcall(qemu_e500, mpc85xx_common_publish_devices);
 
 define_machine(qemu_e500) {
 	.name			= "QEMU e500",
-	.probe			= qemu_e500_probe,
+	.compatible		= "fsl,qemu-e500",
 	.setup_arch		= qemu_e500_setup_arch,
 	.init_IRQ		= qemu_e500_pic_init,
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/85xx/socrates.c b/arch/powerpc/platforms/85xx/socrates.c
index 09f64470c765..f603a3905801 100644
--- a/arch/powerpc/platforms/85xx/socrates.c
+++ b/arch/powerpc/platforms/85xx/socrates.c
@@ -69,20 +69,9 @@ static void __init socrates_setup_arch(void)
 
 machine_arch_initcall(socrates, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init socrates_probe(void)
-{
-	if (of_machine_is_compatible("abb,socrates"))
-		return 1;
-
-	return 0;
-}
-
 define_machine(socrates) {
 	.name			= "Socrates",
-	.probe			= socrates_probe,
+	.compatible		= "abb,socrates",
 	.setup_arch		= socrates_setup_arch,
 	.init_IRQ		= socrates_pic_init,
 	.get_irq		= mpic_get_irq,
diff --git a/arch/powerpc/platforms/85xx/stx_gp3.c b/arch/powerpc/platforms/85xx/stx_gp3.c
index 6b1fe7bb3a8c..9f37b25e7a82 100644
--- a/arch/powerpc/platforms/85xx/stx_gp3.c
+++ b/arch/powerpc/platforms/85xx/stx_gp3.c
@@ -83,17 +83,9 @@ static void stx_gp3_show_cpuinfo(struct seq_file *m)
 
 machine_arch_initcall(stx_gp3, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init stx_gp3_probe(void)
-{
-	return of_machine_is_compatible("stx,gp3-8560");
-}
-
 define_machine(stx_gp3) {
 	.name			= "STX GP3",
-	.probe			= stx_gp3_probe,
+	.compatible		= "stx,gp3-8560",
 	.setup_arch		= stx_gp3_setup_arch,
 	.init_IRQ		= stx_gp3_pic_init,
 	.show_cpuinfo		= stx_gp3_show_cpuinfo,
diff --git a/arch/powerpc/platforms/85xx/twr_p102x.c b/arch/powerpc/platforms/85xx/twr_p102x.c
index eaec099b4077..34b1e9cf9f34 100644
--- a/arch/powerpc/platforms/85xx/twr_p102x.c
+++ b/arch/powerpc/platforms/85xx/twr_p102x.c
@@ -103,14 +103,9 @@ static void __init twr_p1025_setup_arch(void)
 
 machine_arch_initcall(twr_p1025, mpc85xx_common_publish_devices);
 
-static int __init twr_p1025_probe(void)
-{
-	return of_machine_is_compatible("fsl,TWR-P1025");
-}
-
 define_machine(twr_p1025) {
 	.name			= "TWR-P1025",
-	.probe			= twr_p1025_probe,
+	.compatible		= "fsl,TWR-P1025",
 	.setup_arch		= twr_p1025_setup_arch,
 	.init_IRQ		= twr_p1025_pic_init,
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/85xx/xes_mpc85xx.c b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
index 5836e4ecb7a0..57c38a8f40e8 100644
--- a/arch/powerpc/platforms/85xx/xes_mpc85xx.c
+++ b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
@@ -136,27 +136,9 @@ machine_arch_initcall(xes_mpc8572, mpc85xx_common_publish_devices);
 machine_arch_initcall(xes_mpc8548, mpc85xx_common_publish_devices);
 machine_arch_initcall(xes_mpc8540, mpc85xx_common_publish_devices);
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init xes_mpc8572_probe(void)
-{
-	return of_machine_is_compatible("xes,MPC8572");
-}
-
-static int __init xes_mpc8548_probe(void)
-{
-	return of_machine_is_compatible("xes,MPC8548");
-}
-
-static int __init xes_mpc8540_probe(void)
-{
-	return of_machine_is_compatible("xes,MPC8540");
-}
-
 define_machine(xes_mpc8572) {
 	.name			= "X-ES MPC8572",
-	.probe			= xes_mpc8572_probe,
+	.compatible		= "xes,MPC8572",
 	.setup_arch		= xes_mpc85xx_setup_arch,
 	.init_IRQ		= xes_mpc85xx_pic_init,
 #ifdef CONFIG_PCI
@@ -170,7 +152,7 @@ define_machine(xes_mpc8572) {
 
 define_machine(xes_mpc8548) {
 	.name			= "X-ES MPC8548",
-	.probe			= xes_mpc8548_probe,
+	.compatible		= "xes,MPC8548",
 	.setup_arch		= xes_mpc85xx_setup_arch,
 	.init_IRQ		= xes_mpc85xx_pic_init,
 #ifdef CONFIG_PCI
@@ -184,7 +166,7 @@ define_machine(xes_mpc8548) {
 
 define_machine(xes_mpc8540) {
 	.name			= "X-ES MPC8540",
-	.probe			= xes_mpc8540_probe,
+	.compatible		= "xes,MPC8540",
 	.setup_arch		= xes_mpc85xx_setup_arch,
 	.init_IRQ		= xes_mpc85xx_pic_init,
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/86xx/gef_ppc9a.c b/arch/powerpc/platforms/86xx/gef_ppc9a.c
index 8e358fa0bc41..2b656a763537 100644
--- a/arch/powerpc/platforms/86xx/gef_ppc9a.c
+++ b/arch/powerpc/platforms/86xx/gef_ppc9a.c
@@ -175,27 +175,11 @@ static void gef_ppc9a_nec_fixup(struct pci_dev *pdev)
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_USB,
 	gef_ppc9a_nec_fixup);
 
-/*
- * Called very early, device-tree isn't unflattened
- *
- * This function is called to determine whether the BSP is compatible with the
- * supplied device-tree, which is assumed to be the correct one for the actual
- * board. It is expected that, in the future, a kernel may support multiple
- * boards.
- */
-static int __init gef_ppc9a_probe(void)
-{
-	if (of_machine_is_compatible("gef,ppc9a"))
-		return 1;
-
-	return 0;
-}
-
 machine_arch_initcall(gef_ppc9a, mpc86xx_common_publish_devices);
 
 define_machine(gef_ppc9a) {
 	.name			= "GE PPC9A",
-	.probe			= gef_ppc9a_probe,
+	.compatible		= "gef,ppc9a",
 	.setup_arch		= gef_ppc9a_setup_arch,
 	.init_IRQ		= gef_ppc9a_init_irq,
 	.show_cpuinfo		= gef_ppc9a_show_cpuinfo,
diff --git a/arch/powerpc/platforms/86xx/gef_sbc310.c b/arch/powerpc/platforms/86xx/gef_sbc310.c
index b5b2733567cb..f38ab6bdfeb5 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc310.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc310.c
@@ -162,27 +162,11 @@ static void gef_sbc310_nec_fixup(struct pci_dev *pdev)
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_USB,
 	gef_sbc310_nec_fixup);
 
-/*
- * Called very early, device-tree isn't unflattened
- *
- * This function is called to determine whether the BSP is compatible with the
- * supplied device-tree, which is assumed to be the correct one for the actual
- * board. It is expected that, in the future, a kernel may support multiple
- * boards.
- */
-static int __init gef_sbc310_probe(void)
-{
-	if (of_machine_is_compatible("gef,sbc310"))
-		return 1;
-
-	return 0;
-}
-
 machine_arch_initcall(gef_sbc310, mpc86xx_common_publish_devices);
 
 define_machine(gef_sbc310) {
 	.name			= "GE SBC310",
-	.probe			= gef_sbc310_probe,
+	.compatible		= "gef,sbc310",
 	.setup_arch		= gef_sbc310_setup_arch,
 	.init_IRQ		= gef_sbc310_init_irq,
 	.show_cpuinfo		= gef_sbc310_show_cpuinfo,
diff --git a/arch/powerpc/platforms/86xx/gef_sbc610.c b/arch/powerpc/platforms/86xx/gef_sbc610.c
index bb4c8e6b44d0..09d59f92eaac 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc610.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc610.c
@@ -152,27 +152,11 @@ static void gef_sbc610_nec_fixup(struct pci_dev *pdev)
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_USB,
 	gef_sbc610_nec_fixup);
 
-/*
- * Called very early, device-tree isn't unflattened
- *
- * This function is called to determine whether the BSP is compatible with the
- * supplied device-tree, which is assumed to be the correct one for the actual
- * board. It is expected that, in the future, a kernel may support multiple
- * boards.
- */
-static int __init gef_sbc610_probe(void)
-{
-	if (of_machine_is_compatible("gef,sbc610"))
-		return 1;
-
-	return 0;
-}
-
 machine_arch_initcall(gef_sbc610, mpc86xx_common_publish_devices);
 
 define_machine(gef_sbc610) {
 	.name			= "GE SBC610",
-	.probe			= gef_sbc610_probe,
+	.compatible		= "gef,sbc610",
 	.setup_arch		= gef_sbc610_setup_arch,
 	.init_IRQ		= gef_sbc610_init_irq,
 	.show_cpuinfo		= gef_sbc610_show_cpuinfo,
diff --git a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
index b593b9afd30a..22ec5d7dc09d 100644
--- a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
+++ b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
@@ -307,20 +307,9 @@ static void __init mpc86xx_hpcd_setup_arch(void)
 	printk("MPC86xx HPCD board from Freescale Semiconductor\n");
 }
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc86xx_hpcd_probe(void)
-{
-	if (of_machine_is_compatible("fsl,MPC8610HPCD"))
-		return 1;	/* Looks good */
-
-	return 0;
-}
-
 define_machine(mpc86xx_hpcd) {
 	.name			= "MPC86xx HPCD",
-	.probe			= mpc86xx_hpcd_probe,
+	.compatible		= "fsl,MPC8610HPCD",
 	.setup_arch		= mpc86xx_hpcd_setup_arch,
 	.init_IRQ		= mpc86xx_init_irq,
 	.get_irq		= mpic_get_irq,
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
index 5294394c9c07..61eccb2d689d 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
@@ -85,18 +85,6 @@ mpc86xx_hpcn_show_cpuinfo(struct seq_file *m)
 	seq_printf(m, "SVR\t\t: 0x%x\n", svid);
 }
 
-
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc86xx_hpcn_probe(void)
-{
-	if (of_machine_is_compatible("fsl,mpc8641hpcn"))
-		return 1;	/* Looks good */
-
-	return 0;
-}
-
 static const struct of_device_id of_bus_ids[] __initconst = {
 	{ .compatible = "fsl,srio", },
 	{},
@@ -113,7 +101,7 @@ machine_arch_initcall(mpc86xx_hpcn, declare_of_platform_devices);
 
 define_machine(mpc86xx_hpcn) {
 	.name			= "MPC86xx HPCN",
-	.probe			= mpc86xx_hpcn_probe,
+	.compatible		= "fsl,MPC8610HPCD",
 	.setup_arch		= mpc86xx_hpcn_setup_arch,
 	.init_IRQ		= mpc86xx_init_irq,
 	.show_cpuinfo		= mpc86xx_hpcn_show_cpuinfo,
diff --git a/arch/powerpc/platforms/8xx/adder875.c b/arch/powerpc/platforms/8xx/adder875.c
index 10e6e4fe77fc..68bb0da3d3ee 100644
--- a/arch/powerpc/platforms/8xx/adder875.c
+++ b/arch/powerpc/platforms/8xx/adder875.c
@@ -83,11 +83,6 @@ static void __init adder875_setup(void)
 	init_ioports();
 }
 
-static int __init adder875_probe(void)
-{
-	return of_machine_is_compatible("analogue-and-micro,adder875");
-}
-
 static const struct of_device_id of_bus_ids[] __initconst = {
 	{ .compatible = "simple-bus", },
 	{},
@@ -102,7 +97,7 @@ machine_device_initcall(adder875, declare_of_platform_devices);
 
 define_machine(adder875) {
 	.name = "Adder MPC875",
-	.probe = adder875_probe,
+	.compatible = "analogue-and-micro,adder875",
 	.setup_arch = adder875_setup,
 	.init_IRQ = mpc8xx_pic_init,
 	.get_irq = mpc8xx_get_irq,
diff --git a/arch/powerpc/platforms/8xx/ep88xc.c b/arch/powerpc/platforms/8xx/ep88xc.c
index b3b22520b435..fc276a29d67f 100644
--- a/arch/powerpc/platforms/8xx/ep88xc.c
+++ b/arch/powerpc/platforms/8xx/ep88xc.c
@@ -142,11 +142,6 @@ static void __init ep88xc_setup_arch(void)
 	                          BCSR8_PHY2_ENABLE | BCSR8_PHY2_POWER);
 }
 
-static int __init ep88xc_probe(void)
-{
-	return of_machine_is_compatible("fsl,ep88xc");
-}
-
 static const struct of_device_id of_bus_ids[] __initconst = {
 	{ .name = "soc", },
 	{ .name = "cpm", },
@@ -165,7 +160,7 @@ machine_device_initcall(ep88xc, declare_of_platform_devices);
 
 define_machine(ep88xc) {
 	.name = "Embedded Planet EP88xC",
-	.probe = ep88xc_probe,
+	.compatible = "fsl,ep88xc",
 	.setup_arch = ep88xc_setup_arch,
 	.init_IRQ = mpc8xx_pic_init,
 	.get_irq	= mpc8xx_get_irq,
diff --git a/arch/powerpc/platforms/8xx/mpc86xads_setup.c b/arch/powerpc/platforms/8xx/mpc86xads_setup.c
index 03267e4a44a9..11b3d1116db1 100644
--- a/arch/powerpc/platforms/8xx/mpc86xads_setup.c
+++ b/arch/powerpc/platforms/8xx/mpc86xads_setup.c
@@ -117,11 +117,6 @@ static void __init mpc86xads_setup_arch(void)
 	iounmap(bcsr_io);
 }
 
-static int __init mpc86xads_probe(void)
-{
-	return of_machine_is_compatible("fsl,mpc866ads");
-}
-
 static const struct of_device_id of_bus_ids[] __initconst = {
 	{ .name = "soc", },
 	{ .name = "cpm", },
@@ -139,7 +134,7 @@ machine_device_initcall(mpc86x_ads, declare_of_platform_devices);
 
 define_machine(mpc86x_ads) {
 	.name			= "MPC86x ADS",
-	.probe			= mpc86xads_probe,
+	.compatible		= "fsl,mpc866ads",
 	.setup_arch		= mpc86xads_setup_arch,
 	.init_IRQ		= mpc8xx_pic_init,
 	.get_irq		= mpc8xx_get_irq,
diff --git a/arch/powerpc/platforms/8xx/mpc885ads_setup.c b/arch/powerpc/platforms/8xx/mpc885ads_setup.c
index b1e39f96de00..2fc7cacbcd96 100644
--- a/arch/powerpc/platforms/8xx/mpc885ads_setup.c
+++ b/arch/powerpc/platforms/8xx/mpc885ads_setup.c
@@ -192,11 +192,6 @@ static void __init mpc885ads_setup_arch(void)
 	}
 }
 
-static int __init mpc885ads_probe(void)
-{
-	return of_machine_is_compatible("fsl,mpc885ads");
-}
-
 static const struct of_device_id of_bus_ids[] __initconst = {
 	{ .name = "soc", },
 	{ .name = "cpm", },
@@ -215,7 +210,7 @@ machine_device_initcall(mpc885_ads, declare_of_platform_devices);
 
 define_machine(mpc885_ads) {
 	.name			= "Freescale MPC885 ADS",
-	.probe			= mpc885ads_probe,
+	.compatible		= "fsl,mpc885ads",
 	.setup_arch		= mpc885ads_setup_arch,
 	.init_IRQ		= mpc8xx_pic_init,
 	.get_irq		= mpc8xx_get_irq,
diff --git a/arch/powerpc/platforms/8xx/tqm8xx_setup.c b/arch/powerpc/platforms/8xx/tqm8xx_setup.c
index ffcfd17a5fa3..7d8eb50bb9cd 100644
--- a/arch/powerpc/platforms/8xx/tqm8xx_setup.c
+++ b/arch/powerpc/platforms/8xx/tqm8xx_setup.c
@@ -121,11 +121,6 @@ static void __init tqm8xx_setup_arch(void)
 	init_ioports();
 }
 
-static int __init tqm8xx_probe(void)
-{
-	return of_machine_is_compatible("tqc,tqm8xx");
-}
-
 static const struct of_device_id of_bus_ids[] __initconst = {
 	{ .name = "soc", },
 	{ .name = "cpm", },
@@ -144,7 +139,7 @@ machine_device_initcall(tqm8xx, declare_of_platform_devices);
 
 define_machine(tqm8xx) {
 	.name			= "TQM8xx",
-	.probe			= tqm8xx_probe,
+	.compatible		= "tqc,tqm8xx",
 	.setup_arch		= tqm8xx_setup_arch,
 	.init_IRQ		= mpc8xx_pic_init,
 	.get_irq		= mpc8xx_get_irq,
diff --git a/arch/powerpc/platforms/amigaone/setup.c b/arch/powerpc/platforms/amigaone/setup.c
index 397ce6a40bd0..ba3b4a5688fb 100644
--- a/arch/powerpc/platforms/amigaone/setup.c
+++ b/arch/powerpc/platforms/amigaone/setup.c
@@ -143,24 +143,21 @@ void __noreturn amigaone_restart(char *cmd)
 
 static int __init amigaone_probe(void)
 {
-	if (of_machine_is_compatible("eyetech,amigaone")) {
-		/*
-		 * Coherent memory access cause complete system lockup! Thus
-		 * disable this CPU feature, even if the CPU needs it.
-		 */
-		cur_cpu_spec->cpu_features &= ~CPU_FTR_NEED_COHERENT;
+	/*
+	 * Coherent memory access cause complete system lockup! Thus
+	 * disable this CPU feature, even if the CPU needs it.
+	 */
+	cur_cpu_spec->cpu_features &= ~CPU_FTR_NEED_COHERENT;
 
-		DMA_MODE_READ = 0x44;
-		DMA_MODE_WRITE = 0x48;
+	DMA_MODE_READ = 0x44;
+	DMA_MODE_WRITE = 0x48;
 
-		return 1;
-	}
-
-	return 0;
+	return 1;
 }
 
 define_machine(amigaone) {
 	.name			= "AmigaOne",
+	.compatible		= "eyetech,amigaone",
 	.probe			= amigaone_probe,
 	.setup_arch		= amigaone_setup_arch,
 	.discover_phbs		= amigaone_discover_phbs,
diff --git a/arch/powerpc/platforms/embedded6xx/gamecube.c b/arch/powerpc/platforms/embedded6xx/gamecube.c
index 5c2575adcc7e..4fc84ff95b5e 100644
--- a/arch/powerpc/platforms/embedded6xx/gamecube.c
+++ b/arch/powerpc/platforms/embedded6xx/gamecube.c
@@ -50,9 +50,6 @@ static void __noreturn gamecube_halt(void)
 
 static int __init gamecube_probe(void)
 {
-	if (!of_machine_is_compatible("nintendo,gamecube"))
-		return 0;
-
 	pm_power_off = gamecube_power_off;
 
 	ug_udbg_init();
@@ -67,6 +64,7 @@ static void gamecube_shutdown(void)
 
 define_machine(gamecube) {
 	.name			= "gamecube",
+	.compatible		= "nintendo,gamecube",
 	.probe			= gamecube_probe,
 	.restart		= gamecube_restart,
 	.halt			= gamecube_halt,
diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index bebc5a972694..67949c85c398 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -241,16 +241,6 @@ static void __noreturn holly_restart(char *cmd)
 	for (;;) ;
 }
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init holly_probe(void)
-{
-	if (!of_machine_is_compatible("ibm,holly"))
-		return 0;
-	return 1;
-}
-
 static int ppc750_machine_check_exception(struct pt_regs *regs)
 {
 	const struct exception_table_entry *entry;
@@ -267,7 +257,7 @@ static int ppc750_machine_check_exception(struct pt_regs *regs)
 
 define_machine(holly){
 	.name                   	= "PPC750 GX/CL TSI",
-	.probe                  	= holly_probe,
+	.compatible			= "ibm,holly",
 	.setup_arch             	= holly_setup_arch,
 	.discover_phbs			= holly_init_pci,
 	.init_IRQ               	= holly_init_IRQ,
diff --git a/arch/powerpc/platforms/embedded6xx/linkstation.c b/arch/powerpc/platforms/embedded6xx/linkstation.c
index 1830e1ac1f8f..f04fd234c9ab 100644
--- a/arch/powerpc/platforms/embedded6xx/linkstation.c
+++ b/arch/powerpc/platforms/embedded6xx/linkstation.c
@@ -143,9 +143,6 @@ static void linkstation_show_cpuinfo(struct seq_file *m)
 
 static int __init linkstation_probe(void)
 {
-	if (!of_machine_is_compatible("linkstation"))
-		return 0;
-
 	pm_power_off = linkstation_power_off;
 
 	return 1;
@@ -153,6 +150,7 @@ static int __init linkstation_probe(void)
 
 define_machine(linkstation){
 	.name 			= "Buffalo Linkstation",
+	.compatible		= "linkstation",
 	.probe 			= linkstation_probe,
 	.setup_arch 		= linkstation_setup_arch,
 	.discover_phbs		= linkstation_setup_pci,
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index ddf0c652af80..6821fb6644ac 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -159,16 +159,6 @@ static void __noreturn mpc7448_hpc2_restart(char *cmd)
 	for (;;) ;		/* Spin until reset happens */
 }
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc7448_hpc2_probe(void)
-{
-	if (!of_machine_is_compatible("mpc74xx"))
-		return 0;
-	return 1;
-}
-
 static int mpc7448_machine_check_exception(struct pt_regs *regs)
 {
 	const struct exception_table_entry *entry;
@@ -185,7 +175,7 @@ static int mpc7448_machine_check_exception(struct pt_regs *regs)
 
 define_machine(mpc7448_hpc2){
 	.name 			= "MPC7448 HPC2",
-	.probe 			= mpc7448_hpc2_probe,
+	.compatible		= "mpc74xx",
 	.setup_arch 		= mpc7448_hpc2_setup_arch,
 	.discover_phbs		= mpc7448_hpc2_setup_pci,
 	.init_IRQ 		= mpc7448_hpc2_init_IRQ,
diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index 4854cc592cec..7e57de576ef7 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -186,14 +186,6 @@ static void __noreturn mvme5100_restart(char *cmd)
 		;
 }
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mvme5100_probe(void)
-{
-	return of_machine_is_compatible("MVME5100");
-}
-
 static int __init probe_of_platform_devices(void)
 {
 
@@ -205,7 +197,7 @@ machine_device_initcall(mvme5100, probe_of_platform_devices);
 
 define_machine(mvme5100) {
 	.name			= "MVME5100",
-	.probe			= mvme5100_probe,
+	.compatible		= "MVME5100",
 	.setup_arch		= mvme5100_setup_arch,
 	.discover_phbs		= mvme5100_setup_pci,
 	.init_IRQ		= mvme5100_pic_init,
diff --git a/arch/powerpc/platforms/embedded6xx/storcenter.c b/arch/powerpc/platforms/embedded6xx/storcenter.c
index 5f16e80b6ed6..ab85af37117f 100644
--- a/arch/powerpc/platforms/embedded6xx/storcenter.c
+++ b/arch/powerpc/platforms/embedded6xx/storcenter.c
@@ -110,14 +110,9 @@ static void __noreturn storcenter_restart(char *cmd)
 	for (;;) ;
 }
 
-static int __init storcenter_probe(void)
-{
-	return of_machine_is_compatible("iomega,storcenter");
-}
-
 define_machine(storcenter){
 	.name 			= "IOMEGA StorCenter",
-	.probe 			= storcenter_probe,
+	.compatible		= "iomega,storcenter",
 	.setup_arch 		= storcenter_setup_arch,
 	.discover_phbs 		= storcenter_setup_pci,
 	.init_IRQ 		= storcenter_init_IRQ,
diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
index f4e654a9d4ff..f2cc00e6f12f 100644
--- a/arch/powerpc/platforms/embedded6xx/wii.c
+++ b/arch/powerpc/platforms/embedded6xx/wii.c
@@ -141,9 +141,6 @@ static void __init wii_pic_probe(void)
 
 static int __init wii_probe(void)
 {
-	if (!of_machine_is_compatible("nintendo,wii"))
-		return 0;
-
 	pm_power_off = wii_power_off;
 
 	ug_udbg_init();
@@ -174,6 +171,7 @@ device_initcall(wii_device_probe);
 
 define_machine(wii) {
 	.name			= "wii",
+	.compatible		= "nintendo,wii",
 	.probe			= wii_probe,
 	.setup_arch		= wii_setup_arch,
 	.restart		= wii_restart,
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index 6b32539395a4..f08edcde7bee 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -23,11 +23,6 @@ static void __init microwatt_init_IRQ(void)
 	xics_init();
 }
 
-static int __init microwatt_probe(void)
-{
-	return of_machine_is_compatible("microwatt-soc");
-}
-
 static int __init microwatt_populate(void)
 {
 	return of_platform_default_populate(NULL, NULL, NULL);
@@ -41,7 +36,7 @@ static void __init microwatt_setup_arch(void)
 
 define_machine(microwatt) {
 	.name			= "microwatt",
-	.probe			= microwatt_probe,
+	.compatible		= "microwatt-soc",
 	.init_IRQ		= microwatt_init_IRQ,
 	.setup_arch		= microwatt_setup_arch,
 	.progress		= udbg_progress,
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 61ab2d38ff4b..f89731670448 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -512,9 +512,6 @@ static void __init pnv_setup_machdep_opal(void)
 
 static int __init pnv_probe(void)
 {
-	if (!of_machine_is_compatible("ibm,powernv"))
-		return 0;
-
 	if (firmware_has_feature(FW_FEATURE_OPAL))
 		pnv_setup_machdep_opal();
 
@@ -578,6 +575,7 @@ static long pnv_machine_check_early(struct pt_regs *regs)
 
 define_machine(powernv) {
 	.name			= "PowerNV",
+	.compatible		= "ibm,powernv",
 	.probe			= pnv_probe,
 	.setup_arch		= pnv_setup_arch,
 	.init_IRQ		= pnv_init_IRQ,
diff --git a/arch/powerpc/platforms/ps3/setup.c b/arch/powerpc/platforms/ps3/setup.c
index d7495785fe47..5144f11359f7 100644
--- a/arch/powerpc/platforms/ps3/setup.c
+++ b/arch/powerpc/platforms/ps3/setup.c
@@ -264,9 +264,6 @@ static int __init ps3_probe(void)
 {
 	DBG(" -> %s:%d\n", __func__, __LINE__);
 
-	if (!of_machine_is_compatible("sony,ps3"))
-		return 0;
-
 	ps3_os_area_save_params();
 
 	pm_power_off = ps3_power_off;
@@ -291,6 +288,7 @@ static void ps3_kexec_cpu_down(int crash_shutdown, int secondary)
 
 define_machine(ps3) {
 	.name				= "PS3",
+	.compatible			= "sony,ps3",
 	.probe				= ps3_probe,
 	.setup_arch			= ps3_setup_arch,
 	.init_IRQ			= ps3_init_IRQ,
-- 
2.39.1

