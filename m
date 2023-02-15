Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B64697D48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 14:28:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGzRV5KCPz3fQg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 00:28:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGzQV3qXbz3fTl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 00:27:30 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PGzQR4FDVz9sm7;
	Wed, 15 Feb 2023 14:27:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1mz3cyOUCVl; Wed, 15 Feb 2023 14:27:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PGzNR3Whbz9spr;
	Wed, 15 Feb 2023 14:25:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6ACA38B7CC;
	Wed, 15 Feb 2023 13:53:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lXWtLdTQgWL6; Wed, 15 Feb 2023 13:53:57 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 344E78B7CA;
	Wed, 15 Feb 2023 13:53:57 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31FCrsrO217597
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 13:53:54 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31FCrsGX217596;
	Wed, 15 Feb 2023 13:53:54 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 6/9] powerpc: Make generic_calibrate_decr() the default
Date: Wed, 15 Feb 2023 13:53:35 +0100
Message-Id: <bdc27ab80c90a2f981fb43c62cf092d28582f8a1.1676465585.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <04ed69b4226633ab90983d7efb5bd4791078fe71.1676465585.git.christophe.leroy@csgroup.eu>
References: <04ed69b4226633ab90983d7efb5bd4791078fe71.1676465585.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676465615; l=46533; s=20211009; h=from:subject:message-id; bh=LJgbMbYy+S6sUKjXBDNL1DL+WqWGV8yNx2BBU1+Bz2Y=; b=dm7ULb3KU+S15zm0tiTfgjxrCS2LGXhoyMi0Rn6H1z93BCpWCpOeip+Xfhs3aZSRB3nclKa8pHcX Q/CI6ejoDa7v9U8NvHNGjEty9wwHTmGTVXsRTobqbJ5CnukwsYMP
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

ppc_md.calibrate_decr() is a mandatory item. Its nullity is never
checked so it must be non null on all platforms.

Most platforms define generic_calibrate_decr() as their
ppc_md.calibrate_decr(). Have time_init() call
generic_calibrate_decr() when ppc_md.calibrate_decr() is NULL,
and remove default assignment from all machines.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/time.c                        |  6 +++++-
 arch/powerpc/platforms/40x/ppc40x_simple.c        |  1 -
 arch/powerpc/platforms/44x/canyonlands.c          |  1 -
 arch/powerpc/platforms/44x/ebony.c                |  1 -
 arch/powerpc/platforms/44x/fsp2.c                 |  1 -
 arch/powerpc/platforms/44x/iss4xx.c               |  1 -
 arch/powerpc/platforms/44x/ppc44x_simple.c        |  1 -
 arch/powerpc/platforms/44x/ppc476.c               |  2 --
 arch/powerpc/platforms/44x/sam440ep.c             |  1 -
 arch/powerpc/platforms/44x/warp.c                 |  1 -
 arch/powerpc/platforms/512x/mpc5121_ads.c         |  1 -
 arch/powerpc/platforms/512x/mpc512x_generic.c     |  1 -
 arch/powerpc/platforms/512x/pdm360ng.c            |  1 -
 arch/powerpc/platforms/52xx/efika.c               |  1 -
 arch/powerpc/platforms/52xx/lite5200.c            |  1 -
 arch/powerpc/platforms/52xx/media5200.c           |  1 -
 arch/powerpc/platforms/52xx/mpc5200_simple.c      |  1 -
 arch/powerpc/platforms/82xx/ep8248e.c             |  1 -
 arch/powerpc/platforms/82xx/km82xx.c              |  1 -
 arch/powerpc/platforms/82xx/mpc8272_ads.c         |  1 -
 arch/powerpc/platforms/82xx/pq2fads.c             |  1 -
 arch/powerpc/platforms/83xx/asp834x.c             |  1 -
 arch/powerpc/platforms/83xx/km83xx.c              |  1 -
 arch/powerpc/platforms/83xx/mpc830x_rdb.c         |  1 -
 arch/powerpc/platforms/83xx/mpc831x_rdb.c         |  1 -
 arch/powerpc/platforms/83xx/mpc832x_mds.c         |  1 -
 arch/powerpc/platforms/83xx/mpc832x_rdb.c         |  1 -
 arch/powerpc/platforms/83xx/mpc834x_itx.c         |  1 -
 arch/powerpc/platforms/83xx/mpc834x_mds.c         |  1 -
 arch/powerpc/platforms/83xx/mpc836x_mds.c         |  1 -
 arch/powerpc/platforms/83xx/mpc836x_rdk.c         |  1 -
 arch/powerpc/platforms/83xx/mpc837x_mds.c         |  1 -
 arch/powerpc/platforms/83xx/mpc837x_rdb.c         |  1 -
 arch/powerpc/platforms/85xx/bsc913x_qds.c         |  1 -
 arch/powerpc/platforms/85xx/bsc913x_rdb.c         |  1 -
 arch/powerpc/platforms/85xx/c293pcie.c            |  1 -
 arch/powerpc/platforms/85xx/corenet_generic.c     |  1 -
 arch/powerpc/platforms/85xx/ge_imp3a.c            |  1 -
 arch/powerpc/platforms/85xx/ksi8560.c             |  1 -
 arch/powerpc/platforms/85xx/mpc8536_ds.c          |  1 -
 arch/powerpc/platforms/85xx/mpc85xx_ads.c         |  1 -
 arch/powerpc/platforms/85xx/mpc85xx_cds.c         |  1 -
 arch/powerpc/platforms/85xx/mpc85xx_ds.c          |  3 ---
 arch/powerpc/platforms/85xx/mpc85xx_mds.c         |  3 ---
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c         | 10 ----------
 arch/powerpc/platforms/85xx/mvme2500.c            |  1 -
 arch/powerpc/platforms/85xx/p1010rdb.c            |  1 -
 arch/powerpc/platforms/85xx/p1022_ds.c            |  1 -
 arch/powerpc/platforms/85xx/p1022_rdk.c           |  1 -
 arch/powerpc/platforms/85xx/p1023_rdb.c           |  1 -
 arch/powerpc/platforms/85xx/ppa8548.c             |  1 -
 arch/powerpc/platforms/85xx/qemu_e500.c           |  1 -
 arch/powerpc/platforms/85xx/socrates.c            |  1 -
 arch/powerpc/platforms/85xx/stx_gp3.c             |  1 -
 arch/powerpc/platforms/85xx/tqm85xx.c             |  1 -
 arch/powerpc/platforms/85xx/twr_p102x.c           |  1 -
 arch/powerpc/platforms/85xx/xes_mpc85xx.c         |  3 ---
 arch/powerpc/platforms/86xx/gef_ppc9a.c           |  1 -
 arch/powerpc/platforms/86xx/gef_sbc310.c          |  1 -
 arch/powerpc/platforms/86xx/gef_sbc610.c          |  1 -
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c        |  1 -
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c        |  1 -
 arch/powerpc/platforms/86xx/mvme7100.c            |  1 -
 arch/powerpc/platforms/8xx/adder875.c             |  1 -
 arch/powerpc/platforms/amigaone/setup.c           |  1 -
 arch/powerpc/platforms/cell/setup.c               |  1 -
 arch/powerpc/platforms/chrp/setup.c               |  1 -
 arch/powerpc/platforms/embedded6xx/gamecube.c     |  1 -
 arch/powerpc/platforms/embedded6xx/holly.c        |  1 -
 arch/powerpc/platforms/embedded6xx/linkstation.c  |  1 -
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c |  1 -
 arch/powerpc/platforms/embedded6xx/mvme5100.c     |  1 -
 arch/powerpc/platforms/embedded6xx/storcenter.c   |  1 -
 arch/powerpc/platforms/embedded6xx/wii.c          |  1 -
 arch/powerpc/platforms/maple/setup.c              |  1 -
 arch/powerpc/platforms/microwatt/setup.c          |  1 -
 arch/powerpc/platforms/pasemi/setup.c             |  1 -
 arch/powerpc/platforms/powernv/setup.c            |  1 -
 arch/powerpc/platforms/pseries/setup.c            |  1 -
 79 files changed, 5 insertions(+), 95 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index e26eb6618ae5..101d6833c89f 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -887,7 +887,11 @@ void __init time_init(void)
 	unsigned shift;
 
 	/* Normal PowerPC with timebase register */
-	ppc_md.calibrate_decr();
+	if (ppc_md.calibrate_decr)
+		ppc_md.calibrate_decr();
+	else
+		generic_calibrate_decr();
+
 	printk(KERN_DEBUG "time_init: decrementer frequency = %lu.%.6lu MHz\n",
 	       ppc_tb_freq / 1000000, ppc_tb_freq % 1000000);
 	printk(KERN_DEBUG "time_init: processor frequency   = %lu.%.6lu MHz\n",
diff --git a/arch/powerpc/platforms/40x/ppc40x_simple.c b/arch/powerpc/platforms/40x/ppc40x_simple.c
index dce696c32679..e454e9d2eff1 100644
--- a/arch/powerpc/platforms/40x/ppc40x_simple.c
+++ b/arch/powerpc/platforms/40x/ppc40x_simple.c
@@ -74,5 +74,4 @@ define_machine(ppc40x_simple) {
 	.init_IRQ = uic_init_tree,
 	.get_irq = uic_get_irq,
 	.restart = ppc4xx_reset_system,
-	.calibrate_decr = generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/canyonlands.c b/arch/powerpc/platforms/44x/canyonlands.c
index ba561ca6c25f..8742a10d9e0c 100644
--- a/arch/powerpc/platforms/44x/canyonlands.c
+++ b/arch/powerpc/platforms/44x/canyonlands.c
@@ -114,5 +114,4 @@ define_machine(canyonlands) {
 	.init_IRQ = uic_init_tree,
 	.get_irq = uic_get_irq,
 	.restart = ppc4xx_reset_system,
-	.calibrate_decr = generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/ebony.c b/arch/powerpc/platforms/44x/ebony.c
index 5b9e57b4cd65..4861310c8dc0 100644
--- a/arch/powerpc/platforms/44x/ebony.c
+++ b/arch/powerpc/platforms/44x/ebony.c
@@ -58,5 +58,4 @@ define_machine(ebony) {
 	.init_IRQ		= uic_init_tree,
 	.get_irq		= uic_get_irq,
 	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index 56d91dbef577..f6b8d02e08b0 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -313,5 +313,4 @@ define_machine(fsp2) {
 	.init_IRQ		= fsp2_irq_init,
 	.get_irq		= uic_get_irq,
 	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/iss4xx.c b/arch/powerpc/platforms/44x/iss4xx.c
index e779bd3d2291..981972e8347f 100644
--- a/arch/powerpc/platforms/44x/iss4xx.c
+++ b/arch/powerpc/platforms/44x/iss4xx.c
@@ -147,5 +147,4 @@ define_machine(iss4xx) {
 	.init_IRQ		= iss4xx_init_irq,
 	.setup_arch		= iss4xx_setup_arch,
 	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/ppc44x_simple.c b/arch/powerpc/platforms/44x/ppc44x_simple.c
index 2a0dcdf04b21..971786ff1a7b 100644
--- a/arch/powerpc/platforms/44x/ppc44x_simple.c
+++ b/arch/powerpc/platforms/44x/ppc44x_simple.c
@@ -82,5 +82,4 @@ define_machine(ppc44x_simple) {
 	.init_IRQ = uic_init_tree,
 	.get_irq = uic_get_irq,
 	.restart = ppc4xx_reset_system,
-	.calibrate_decr = generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index f0b411cc7bb7..603938ae8ca0 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -276,7 +276,6 @@ define_machine(ppc47x_akebono) {
 	.init_IRQ		= ppc47x_init_irq,
 	.setup_arch		= ppc47x_setup_arch,
 	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
 };
 
 define_machine(ppc47x_currituck) {
@@ -288,5 +287,4 @@ define_machine(ppc47x_currituck) {
 	.pci_irq_fixup		= ppc47x_pci_irq_fixup,
 	.setup_arch		= ppc47x_setup_arch,
 	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/44x/sam440ep.c b/arch/powerpc/platforms/44x/sam440ep.c
index 8b281e027477..5cdaa4068e41 100644
--- a/arch/powerpc/platforms/44x/sam440ep.c
+++ b/arch/powerpc/platforms/44x/sam440ep.c
@@ -54,7 +54,6 @@ define_machine(sam440ep) {
 	.init_IRQ 		= uic_init_tree,
 	.get_irq 		= uic_get_irq,
 	.restart		= ppc4xx_reset_system,
-	.calibrate_decr 	= generic_calibrate_decr,
 };
 
 static struct i2c_board_info sam440ep_rtc_info = {
diff --git a/arch/powerpc/platforms/44x/warp.c b/arch/powerpc/platforms/44x/warp.c
index acbc356e8a19..bfeb9bdc3258 100644
--- a/arch/powerpc/platforms/44x/warp.c
+++ b/arch/powerpc/platforms/44x/warp.c
@@ -48,7 +48,6 @@ define_machine(warp) {
 	.init_IRQ 	= uic_init_tree,
 	.get_irq 	= uic_get_irq,
 	.restart	= ppc4xx_reset_system,
-	.calibrate_decr = generic_calibrate_decr,
 };
 
 
diff --git a/arch/powerpc/platforms/512x/mpc5121_ads.c b/arch/powerpc/platforms/512x/mpc5121_ads.c
index 0b6a2d3fd343..80b25ce076bc 100644
--- a/arch/powerpc/platforms/512x/mpc5121_ads.c
+++ b/arch/powerpc/platforms/512x/mpc5121_ads.c
@@ -67,6 +67,5 @@ define_machine(mpc5121_ads) {
 	.init			= mpc512x_init,
 	.init_IRQ		= mpc5121_ads_init_IRQ,
 	.get_irq		= ipic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.restart		= mpc512x_restart,
 };
diff --git a/arch/powerpc/platforms/512x/mpc512x_generic.c b/arch/powerpc/platforms/512x/mpc512x_generic.c
index 364564c995bd..97dfaac8f7ff 100644
--- a/arch/powerpc/platforms/512x/mpc512x_generic.c
+++ b/arch/powerpc/platforms/512x/mpc512x_generic.c
@@ -47,6 +47,5 @@ define_machine(mpc512x_generic) {
 	.setup_arch		= mpc512x_setup_arch,
 	.init_IRQ		= mpc512x_init_IRQ,
 	.get_irq		= ipic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.restart		= mpc512x_restart,
 };
diff --git a/arch/powerpc/platforms/512x/pdm360ng.c b/arch/powerpc/platforms/512x/pdm360ng.c
index d3a4eeb47bb1..4bdec1c25de7 100644
--- a/arch/powerpc/platforms/512x/pdm360ng.c
+++ b/arch/powerpc/platforms/512x/pdm360ng.c
@@ -121,6 +121,5 @@ define_machine(pdm360ng) {
 	.init			= pdm360ng_init,
 	.init_IRQ		= mpc512x_init_IRQ,
 	.get_irq		= ipic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.restart		= mpc512x_restart,
 };
diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
index e0647720ed5e..364d040c0d69 100644
--- a/arch/powerpc/platforms/52xx/efika.c
+++ b/arch/powerpc/platforms/52xx/efika.c
@@ -226,7 +226,6 @@ define_machine(efika)
 	.get_rtc_time		= rtas_get_rtc_time,
 	.progress		= rtas_progress,
 	.get_boot_time		= rtas_get_boot_time,
-	.calibrate_decr		= generic_calibrate_decr,
 #ifdef CONFIG_PCI
 	.phys_mem_access_prot	= pci_phys_mem_access_prot,
 #endif
diff --git a/arch/powerpc/platforms/52xx/lite5200.c b/arch/powerpc/platforms/52xx/lite5200.c
index 7ea9b6ce0591..0fd67b3ffc3e 100644
--- a/arch/powerpc/platforms/52xx/lite5200.c
+++ b/arch/powerpc/platforms/52xx/lite5200.c
@@ -189,5 +189,4 @@ define_machine(lite5200) {
 	.init_IRQ 	= mpc52xx_init_irq,
 	.get_irq 	= mpc52xx_get_irq,
 	.restart	= mpc52xx_restart,
-	.calibrate_decr	= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/52xx/media5200.c b/arch/powerpc/platforms/52xx/media5200.c
index a9c92c6ccbcf..19626cd42406 100644
--- a/arch/powerpc/platforms/52xx/media5200.c
+++ b/arch/powerpc/platforms/52xx/media5200.c
@@ -236,5 +236,4 @@ define_machine(media5200_platform) {
 	.init_IRQ	= media5200_init_irq,
 	.get_irq	= mpc52xx_get_irq,
 	.restart	= mpc52xx_restart,
-	.calibrate_decr	= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/52xx/mpc5200_simple.c b/arch/powerpc/platforms/52xx/mpc5200_simple.c
index cc349d579061..f1e85e86f5e5 100644
--- a/arch/powerpc/platforms/52xx/mpc5200_simple.c
+++ b/arch/powerpc/platforms/52xx/mpc5200_simple.c
@@ -76,5 +76,4 @@ define_machine(mpc5200_simple_platform) {
 	.init_IRQ	= mpc52xx_init_irq,
 	.get_irq	= mpc52xx_get_irq,
 	.restart	= mpc52xx_restart,
-	.calibrate_decr	= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/82xx/ep8248e.c b/arch/powerpc/platforms/82xx/ep8248e.c
index 66defdaf816f..8f1856ba692e 100644
--- a/arch/powerpc/platforms/82xx/ep8248e.c
+++ b/arch/powerpc/platforms/82xx/ep8248e.c
@@ -308,7 +308,6 @@ define_machine(ep8248e)
 	.setup_arch = ep8248e_setup_arch,
 	.init_IRQ = ep8248e_pic_init,
 	.get_irq = cpm2_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
 	.restart = pq2_restart,
 	.progress = udbg_progress,
 };
diff --git a/arch/powerpc/platforms/82xx/km82xx.c b/arch/powerpc/platforms/82xx/km82xx.c
index 8ab575d70080..51c9bfd97592 100644
--- a/arch/powerpc/platforms/82xx/km82xx.c
+++ b/arch/powerpc/platforms/82xx/km82xx.c
@@ -195,7 +195,6 @@ define_machine(km82xx)
 	.setup_arch = km82xx_setup_arch,
 	.init_IRQ = km82xx_pic_init,
 	.get_irq = cpm2_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
 	.restart = pq2_restart,
 	.progress = udbg_progress,
 };
diff --git a/arch/powerpc/platforms/82xx/mpc8272_ads.c b/arch/powerpc/platforms/82xx/mpc8272_ads.c
index 5dd034ed2c87..f9b2b1617eeb 100644
--- a/arch/powerpc/platforms/82xx/mpc8272_ads.c
+++ b/arch/powerpc/platforms/82xx/mpc8272_ads.c
@@ -199,7 +199,6 @@ define_machine(mpc8272_ads)
 	.discover_phbs = pq2_init_pci,
 	.init_IRQ = mpc8272_ads_pic_init,
 	.get_irq = cpm2_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
 	.restart = pq2_restart,
 	.progress = udbg_progress,
 };
diff --git a/arch/powerpc/platforms/82xx/pq2fads.c b/arch/powerpc/platforms/82xx/pq2fads.c
index d91dfdc634e9..4080cb4253d3 100644
--- a/arch/powerpc/platforms/82xx/pq2fads.c
+++ b/arch/powerpc/platforms/82xx/pq2fads.c
@@ -177,7 +177,6 @@ define_machine(pq2fads)
 	.discover_phbs = pq2_init_pci,
 	.init_IRQ = pq2fads_pic_init,
 	.get_irq = cpm2_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
 	.restart = pq2_restart,
 	.progress = udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/asp834x.c b/arch/powerpc/platforms/83xx/asp834x.c
index 8f3d995027fe..6870d0c34f1d 100644
--- a/arch/powerpc/platforms/83xx/asp834x.c
+++ b/arch/powerpc/platforms/83xx/asp834x.c
@@ -41,6 +41,5 @@ define_machine(asp834x) {
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
 	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index 907acdecc94a..26ddc7136547 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -184,6 +184,5 @@ define_machine(mpc83xx_km) {
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
 	.time_init	= mpc83xx_time_init,
-	.calibrate_decr	= generic_calibrate_decr,
 	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc830x_rdb.c b/arch/powerpc/platforms/83xx/mpc830x_rdb.c
index 956d4389effa..534bb227480d 100644
--- a/arch/powerpc/platforms/83xx/mpc830x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc830x_rdb.c
@@ -53,6 +53,5 @@ define_machine(mpc830x_rdb) {
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
 	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc831x_rdb.c b/arch/powerpc/platforms/83xx/mpc831x_rdb.c
index 3b578f080e3b..7b901ab3b864 100644
--- a/arch/powerpc/platforms/83xx/mpc831x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc831x_rdb.c
@@ -53,6 +53,5 @@ define_machine(mpc831x_rdb) {
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
 	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc832x_mds.c b/arch/powerpc/platforms/83xx/mpc832x_mds.c
index 01035eff7d2e..c08f043e3963 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_mds.c
@@ -97,6 +97,5 @@ define_machine(mpc832x_mds) {
 	.get_irq 	= ipic_get_irq,
 	.restart 	= mpc83xx_restart,
 	.time_init 	= mpc83xx_time_init,
-	.calibrate_decr	= generic_calibrate_decr,
 	.progress 	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
index 6b7b852e48bf..af6774f145e3 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
@@ -221,6 +221,5 @@ define_machine(mpc832x_rdb) {
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
 	.time_init	= mpc83xx_time_init,
-	.calibrate_decr	= generic_calibrate_decr,
 	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc834x_itx.c b/arch/powerpc/platforms/83xx/mpc834x_itx.c
index 92ff7be472c3..e45b98ff02d8 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_itx.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_itx.c
@@ -66,6 +66,5 @@ define_machine(mpc834x_itx) {
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
 	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc834x_mds.c b/arch/powerpc/platforms/83xx/mpc834x_mds.c
index 8e45c034daaf..d08974a60848 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_mds.c
@@ -88,6 +88,5 @@ define_machine(mpc834x_mds) {
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
 	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c b/arch/powerpc/platforms/83xx/mpc836x_mds.c
index 4ae2b6e4b513..84c08fdf503c 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_mds.c
@@ -197,6 +197,5 @@ define_machine(mpc836x_mds) {
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
 	.time_init	= mpc83xx_time_init,
-	.calibrate_decr	= generic_calibrate_decr,
 	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc836x_rdk.c b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
index 231a5df0399b..1fc9d1235a7c 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_rdk.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
@@ -37,6 +37,5 @@ define_machine(mpc836x_rdk) {
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
 	.time_init	= mpc83xx_time_init,
-	.calibrate_decr	= generic_calibrate_decr,
 	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc837x_mds.c b/arch/powerpc/platforms/83xx/mpc837x_mds.c
index 0c10100756d4..c2055ef35b63 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_mds.c
@@ -90,6 +90,5 @@ define_machine(mpc837x_mds) {
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
 	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/83xx/mpc837x_rdb.c b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
index 5d48c6842098..39e78018dd0b 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
@@ -78,6 +78,5 @@ define_machine(mpc837x_rdb) {
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
 	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/bsc913x_qds.c b/arch/powerpc/platforms/85xx/bsc913x_qds.c
index 902a867352c2..a029aa090538 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_qds.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_qds.c
@@ -59,6 +59,5 @@ define_machine(bsc9132_qds) {
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/bsc913x_rdb.c b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
index 58a44953b936..361b4371d073 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_rdb.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
@@ -46,6 +46,5 @@ define_machine(bsc9131_rdb) {
 	.setup_arch		= bsc913x_rdb_setup_arch,
 	.init_IRQ		= bsc913x_rdb_pic_init,
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/c293pcie.c b/arch/powerpc/platforms/85xx/c293pcie.c
index fbf1875e5835..34975708be79 100644
--- a/arch/powerpc/platforms/85xx/c293pcie.c
+++ b/arch/powerpc/platforms/85xx/c293pcie.c
@@ -51,6 +51,5 @@ define_machine(c293_pcie) {
 	.setup_arch		= c293_pcie_setup_arch,
 	.init_IRQ		= c293_pcie_pic_init,
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index 2c539de2d629..bfde391c42f4 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -198,7 +198,6 @@ define_machine(corenet_generic) {
 #else
 	.get_irq		= mpic_get_coreint_irq,
 #endif
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 	.power_save		= e500_idle,
 };
diff --git a/arch/powerpc/platforms/85xx/ge_imp3a.c b/arch/powerpc/platforms/85xx/ge_imp3a.c
index 1bfd4ea13038..3678a1fbf5ad 100644
--- a/arch/powerpc/platforms/85xx/ge_imp3a.c
+++ b/arch/powerpc/platforms/85xx/ge_imp3a.c
@@ -203,6 +203,5 @@ define_machine(ge_imp3a) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/ksi8560.c b/arch/powerpc/platforms/85xx/ksi8560.c
index 548d478e5194..af38c3aec042 100644
--- a/arch/powerpc/platforms/85xx/ksi8560.c
+++ b/arch/powerpc/platforms/85xx/ksi8560.c
@@ -180,5 +180,4 @@ define_machine(ksi8560) {
 	.show_cpuinfo		= ksi8560_show_cpuinfo,
 	.get_irq		= mpic_get_irq,
 	.restart		= machine_restart,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/85xx/mpc8536_ds.c b/arch/powerpc/platforms/85xx/mpc8536_ds.c
index 9900cf2cd392..58ab3831913f 100644
--- a/arch/powerpc/platforms/85xx/mpc8536_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc8536_ds.c
@@ -62,6 +62,5 @@ define_machine(mpc8536_ds) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ads.c b/arch/powerpc/platforms/85xx/mpc85xx_ads.c
index dd5302ab406d..7c67438e76f8 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ads.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ads.c
@@ -158,6 +158,5 @@ define_machine(mpc85xx_ads) {
 	.init_IRQ		= mpc85xx_ads_pic_init,
 	.show_cpuinfo		= mpc85xx_ads_show_cpuinfo,
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index d7568b35ec78..0e6964c7fdd6 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -383,6 +383,5 @@ define_machine(mpc85xx_cds) {
 	.pcibios_fixup_bus	= mpc85xx_cds_fixup_bus,
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
-	.calibrate_decr = generic_calibrate_decr,
 	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index b4feb251b57e..70167b8f00a3 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -172,7 +172,6 @@ define_machine(mpc8544_ds) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -186,7 +185,6 @@ define_machine(mpc8572_ds) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -200,6 +198,5 @@ define_machine(p2020_ds) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
index 721322e04c79..28a04928250f 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@ -345,7 +345,6 @@ define_machine(mpc8568_mds) {
 	.setup_arch	= mpc85xx_mds_setup_arch,
 	.init_IRQ	= mpc85xx_mds_pic_init,
 	.get_irq	= mpic_get_irq,
-	.calibrate_decr	= generic_calibrate_decr,
 	.progress	= udbg_progress,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
@@ -359,7 +358,6 @@ define_machine(mpc8569_mds) {
 	.setup_arch	= mpc85xx_mds_setup_arch,
 	.init_IRQ	= mpc85xx_mds_pic_init,
 	.get_irq	= mpic_get_irq,
-	.calibrate_decr	= generic_calibrate_decr,
 	.progress	= udbg_progress,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
@@ -373,7 +371,6 @@ define_machine(p1021_mds) {
 	.setup_arch	= mpc85xx_mds_setup_arch,
 	.init_IRQ	= mpc85xx_mds_pic_init,
 	.get_irq	= mpic_get_irq,
-	.calibrate_decr	= generic_calibrate_decr,
 	.progress	= udbg_progress,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index 9754feaebcd4..aa24793ad25c 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -129,7 +129,6 @@ define_machine(p2020_rdb) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -143,7 +142,6 @@ define_machine(p1020_rdb) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -157,7 +155,6 @@ define_machine(p1021_rdb_pc) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -171,7 +168,6 @@ define_machine(p2020_rdb_pc) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -185,7 +181,6 @@ define_machine(p1025_rdb) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -199,7 +194,6 @@ define_machine(p1020_mbg_pc) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -213,7 +207,6 @@ define_machine(p1020_utm_pc) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -227,7 +220,6 @@ define_machine(p1020_rdb_pc) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -241,7 +233,6 @@ define_machine(p1020_rdb_pd) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -255,6 +246,5 @@ define_machine(p1024_rdb) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/mvme2500.c b/arch/powerpc/platforms/85xx/mvme2500.c
index ee1383e811d9..1b59e45a0c64 100644
--- a/arch/powerpc/platforms/85xx/mvme2500.c
+++ b/arch/powerpc/platforms/85xx/mvme2500.c
@@ -53,6 +53,5 @@ define_machine(mvme2500) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/p1010rdb.c b/arch/powerpc/platforms/85xx/p1010rdb.c
index 8ba9306a96b6..14ec79a32746 100644
--- a/arch/powerpc/platforms/85xx/p1010rdb.c
+++ b/arch/powerpc/platforms/85xx/p1010rdb.c
@@ -73,6 +73,5 @@ define_machine(p1010_rdb) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/p1022_ds.c b/arch/powerpc/platforms/85xx/p1022_ds.c
index 15a684ce9201..23d0926298b9 100644
--- a/arch/powerpc/platforms/85xx/p1022_ds.c
+++ b/arch/powerpc/platforms/85xx/p1022_ds.c
@@ -559,6 +559,5 @@ define_machine(p1022_ds) {
 	.pcibios_fixup_phb	= fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/p1022_rdk.c b/arch/powerpc/platforms/85xx/p1022_rdk.c
index aee9ffc0eb17..d1159150c3b5 100644
--- a/arch/powerpc/platforms/85xx/p1022_rdk.c
+++ b/arch/powerpc/platforms/85xx/p1022_rdk.c
@@ -139,6 +139,5 @@ define_machine(p1022_rdk) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/p1023_rdb.c b/arch/powerpc/platforms/85xx/p1023_rdb.c
index e199fc44fc2f..9df0439a9382 100644
--- a/arch/powerpc/platforms/85xx/p1023_rdb.c
+++ b/arch/powerpc/platforms/85xx/p1023_rdb.c
@@ -100,7 +100,6 @@ define_machine(p1023_rdb) {
 	.setup_arch		= p1023_rdb_setup_arch,
 	.init_IRQ		= p1023_rdb_pic_init,
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
diff --git a/arch/powerpc/platforms/85xx/ppa8548.c b/arch/powerpc/platforms/85xx/ppa8548.c
index b030d0e7b06b..acd19c52ad43 100644
--- a/arch/powerpc/platforms/85xx/ppa8548.c
+++ b/arch/powerpc/platforms/85xx/ppa8548.c
@@ -79,6 +79,5 @@ define_machine(ppa8548) {
 	.init_IRQ	= ppa8548_pic_init,
 	.show_cpuinfo	= ppa8548_show_cpuinfo,
 	.get_irq	= mpic_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
 	.progress	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/qemu_e500.c b/arch/powerpc/platforms/85xx/qemu_e500.c
index 335815a2d121..6e4b1ddf292b 100644
--- a/arch/powerpc/platforms/85xx/qemu_e500.c
+++ b/arch/powerpc/platforms/85xx/qemu_e500.c
@@ -58,7 +58,6 @@ define_machine(qemu_e500) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_coreint_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 	.power_save		= e500_idle,
 };
diff --git a/arch/powerpc/platforms/85xx/socrates.c b/arch/powerpc/platforms/85xx/socrates.c
index f603a3905801..9fa1338bc002 100644
--- a/arch/powerpc/platforms/85xx/socrates.c
+++ b/arch/powerpc/platforms/85xx/socrates.c
@@ -75,6 +75,5 @@ define_machine(socrates) {
 	.setup_arch		= socrates_setup_arch,
 	.init_IRQ		= socrates_pic_init,
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/stx_gp3.c b/arch/powerpc/platforms/85xx/stx_gp3.c
index 9f37b25e7a82..5e2646b4c039 100644
--- a/arch/powerpc/platforms/85xx/stx_gp3.c
+++ b/arch/powerpc/platforms/85xx/stx_gp3.c
@@ -90,6 +90,5 @@ define_machine(stx_gp3) {
 	.init_IRQ		= stx_gp3_pic_init,
 	.show_cpuinfo		= stx_gp3_show_cpuinfo,
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/tqm85xx.c b/arch/powerpc/platforms/85xx/tqm85xx.c
index d187f4b8bff6..80effb028bf4 100644
--- a/arch/powerpc/platforms/85xx/tqm85xx.c
+++ b/arch/powerpc/platforms/85xx/tqm85xx.c
@@ -127,6 +127,5 @@ define_machine(tqm85xx) {
 	.init_IRQ		= tqm85xx_pic_init,
 	.show_cpuinfo		= tqm85xx_show_cpuinfo,
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/twr_p102x.c b/arch/powerpc/platforms/85xx/twr_p102x.c
index 34b1e9cf9f34..b88e23a334a4 100644
--- a/arch/powerpc/platforms/85xx/twr_p102x.c
+++ b/arch/powerpc/platforms/85xx/twr_p102x.c
@@ -112,6 +112,5 @@ define_machine(twr_p1025) {
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/85xx/xes_mpc85xx.c b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
index 57c38a8f40e8..184013e6601e 100644
--- a/arch/powerpc/platforms/85xx/xes_mpc85xx.c
+++ b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
@@ -146,7 +146,6 @@ define_machine(xes_mpc8572) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -160,7 +159,6 @@ define_machine(xes_mpc8548) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
 
@@ -174,6 +172,5 @@ define_machine(xes_mpc8540) {
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/86xx/gef_ppc9a.c b/arch/powerpc/platforms/86xx/gef_ppc9a.c
index 2b656a763537..f0512e51300c 100644
--- a/arch/powerpc/platforms/86xx/gef_ppc9a.c
+++ b/arch/powerpc/platforms/86xx/gef_ppc9a.c
@@ -185,7 +185,6 @@ define_machine(gef_ppc9a) {
 	.show_cpuinfo		= gef_ppc9a_show_cpuinfo,
 	.get_irq		= mpic_get_irq,
 	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
diff --git a/arch/powerpc/platforms/86xx/gef_sbc310.c b/arch/powerpc/platforms/86xx/gef_sbc310.c
index f38ab6bdfeb5..1430b524d982 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc310.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc310.c
@@ -172,7 +172,6 @@ define_machine(gef_sbc310) {
 	.show_cpuinfo		= gef_sbc310_show_cpuinfo,
 	.get_irq		= mpic_get_irq,
 	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
diff --git a/arch/powerpc/platforms/86xx/gef_sbc610.c b/arch/powerpc/platforms/86xx/gef_sbc610.c
index 09d59f92eaac..c92af0d964e1 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc610.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc610.c
@@ -162,7 +162,6 @@ define_machine(gef_sbc610) {
 	.show_cpuinfo		= gef_sbc610_show_cpuinfo,
 	.get_irq		= mpic_get_irq,
 	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
diff --git a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
index 22ec5d7dc09d..6a403705ae44 100644
--- a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
+++ b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
@@ -314,7 +314,6 @@ define_machine(mpc86xx_hpcd) {
 	.init_IRQ		= mpc86xx_init_irq,
 	.get_irq		= mpic_get_irq,
 	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
index 61eccb2d689d..7b00ebd2d7f8 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
@@ -107,7 +107,6 @@ define_machine(mpc86xx_hpcn) {
 	.show_cpuinfo		= mpc86xx_hpcn_show_cpuinfo,
 	.get_irq		= mpic_get_irq,
 	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
diff --git a/arch/powerpc/platforms/86xx/mvme7100.c b/arch/powerpc/platforms/86xx/mvme7100.c
index b2cc32a32d0b..c0ac40514361 100644
--- a/arch/powerpc/platforms/86xx/mvme7100.c
+++ b/arch/powerpc/platforms/86xx/mvme7100.c
@@ -108,7 +108,6 @@ define_machine(mvme7100) {
 	.init_IRQ		= mpc86xx_init_irq,
 	.get_irq		= mpic_get_irq,
 	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
diff --git a/arch/powerpc/platforms/8xx/adder875.c b/arch/powerpc/platforms/8xx/adder875.c
index 68bb0da3d3ee..7e83eb6746f4 100644
--- a/arch/powerpc/platforms/8xx/adder875.c
+++ b/arch/powerpc/platforms/8xx/adder875.c
@@ -102,6 +102,5 @@ define_machine(adder875) {
 	.init_IRQ = mpc8xx_pic_init,
 	.get_irq = mpc8xx_get_irq,
 	.restart = mpc8xx_restart,
-	.calibrate_decr = generic_calibrate_decr,
 	.progress = udbg_progress,
 };
diff --git a/arch/powerpc/platforms/amigaone/setup.c b/arch/powerpc/platforms/amigaone/setup.c
index ba3b4a5688fb..6c6e714a7521 100644
--- a/arch/powerpc/platforms/amigaone/setup.c
+++ b/arch/powerpc/platforms/amigaone/setup.c
@@ -164,6 +164,5 @@ define_machine(amigaone) {
 	.show_cpuinfo		= amigaone_show_cpuinfo,
 	.init_IRQ		= amigaone_init_IRQ,
 	.restart		= amigaone_restart,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/cell/setup.c b/arch/powerpc/platforms/cell/setup.c
index 47eaf75349f2..9e07d101bcee 100644
--- a/arch/powerpc/platforms/cell/setup.c
+++ b/arch/powerpc/platforms/cell/setup.c
@@ -265,7 +265,6 @@ define_machine(cell) {
 	.get_boot_time		= rtas_get_boot_time,
 	.get_rtc_time		= rtas_get_rtc_time,
 	.set_rtc_time		= rtas_set_rtc_time,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= cell_progress,
 	.init_IRQ       	= cell_init_irq,
 	.pci_setup_phb		= cell_setup_phb,
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index ec63c0558db6..5db82cd365cf 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -582,6 +582,5 @@ define_machine(chrp) {
 	.time_init		= chrp_time_init,
 	.set_rtc_time		= chrp_set_rtc_time,
 	.get_rtc_time		= chrp_get_rtc_time,
-	.calibrate_decr		= generic_calibrate_decr,
 	.phys_mem_access_prot	= pci_phys_mem_access_prot,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/gamecube.c b/arch/powerpc/platforms/embedded6xx/gamecube.c
index 60cdc2852c7a..e3b2c7464732 100644
--- a/arch/powerpc/platforms/embedded6xx/gamecube.c
+++ b/arch/powerpc/platforms/embedded6xx/gamecube.c
@@ -70,7 +70,6 @@ define_machine(gamecube) {
 	.halt			= gamecube_halt,
 	.init_IRQ		= flipper_pic_probe,
 	.get_irq		= flipper_pic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 	.machine_shutdown	= gamecube_shutdown,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index 67949c85c398..a167ee88fbf9 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -264,7 +264,6 @@ define_machine(holly){
 	.show_cpuinfo           	= holly_show_cpuinfo,
 	.get_irq                	= mpic_get_irq,
 	.restart                	= holly_restart,
-	.calibrate_decr         	= generic_calibrate_decr,
 	.machine_check_exception	= ppc750_machine_check_exception,
 	.progress               	= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/linkstation.c b/arch/powerpc/platforms/embedded6xx/linkstation.c
index f04fd234c9ab..9c10aac40c7b 100644
--- a/arch/powerpc/platforms/embedded6xx/linkstation.c
+++ b/arch/powerpc/platforms/embedded6xx/linkstation.c
@@ -159,5 +159,4 @@ define_machine(linkstation){
 	.get_irq 		= mpic_get_irq,
 	.restart 		= linkstation_restart,
 	.halt	 		= linkstation_halt,
-	.calibrate_decr 	= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index 6821fb6644ac..ec93d69dc0ee 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -182,7 +182,6 @@ define_machine(mpc7448_hpc2){
 	.show_cpuinfo 		= mpc7448_hpc2_show_cpuinfo,
 	.get_irq 		= mpic_get_irq,
 	.restart 		= mpc7448_hpc2_restart,
-	.calibrate_decr 	= generic_calibrate_decr,
 	.machine_check_exception= mpc7448_machine_check_exception,
 	.progress 		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index 7e57de576ef7..00bec0f051be 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -204,6 +204,5 @@ define_machine(mvme5100) {
 	.show_cpuinfo		= mvme5100_show_cpuinfo,
 	.get_irq		= mpic_get_irq,
 	.restart		= mvme5100_restart,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/storcenter.c b/arch/powerpc/platforms/embedded6xx/storcenter.c
index ab85af37117f..e49880e8dab8 100644
--- a/arch/powerpc/platforms/embedded6xx/storcenter.c
+++ b/arch/powerpc/platforms/embedded6xx/storcenter.c
@@ -118,5 +118,4 @@ define_machine(storcenter){
 	.init_IRQ 		= storcenter_init_IRQ,
 	.get_irq 		= mpic_get_irq,
 	.restart 		= storcenter_restart,
-	.calibrate_decr 	= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
index 635c393d307a..b54382a8ccc6 100644
--- a/arch/powerpc/platforms/embedded6xx/wii.c
+++ b/arch/powerpc/platforms/embedded6xx/wii.c
@@ -175,7 +175,6 @@ define_machine(wii) {
 	.halt			= wii_halt,
 	.init_IRQ		= wii_pic_probe,
 	.get_irq		= flipper_pic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 	.machine_shutdown	= wii_shutdown,
 };
diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index c26c379e1cc8..d766fca48988 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -357,7 +357,6 @@ define_machine(maple) {
 	.get_boot_time		= maple_get_boot_time,
 	.set_rtc_time		= maple_set_rtc_time,
 	.get_rtc_time		= maple_get_rtc_time,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= maple_progress,
 	.power_save		= power4_idle,
 };
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index f08edcde7bee..5e1c0997170d 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -40,5 +40,4 @@ define_machine(microwatt) {
 	.init_IRQ		= microwatt_init_IRQ,
 	.setup_arch		= microwatt_setup_arch,
 	.progress		= udbg_progress,
-	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index 2aef49e04dd4..5c5b4a034f9e 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -449,7 +449,6 @@ define_machine(pasemi) {
 	.get_irq		= mpic_get_irq,
 	.restart		= pas_restart,
 	.get_boot_time		= pas_get_boot_time,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= pas_progress,
 	.machine_check_exception = pas_machine_check_handler,
 };
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index f89731670448..5e9c6b55809f 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -585,7 +585,6 @@ define_machine(powernv) {
 	.progress		= pnv_progress,
 	.machine_shutdown	= pnv_shutdown,
 	.power_save             = NULL,
-	.calibrate_decr		= generic_calibrate_decr,
 	.machine_check_early	= pnv_machine_check_early,
 #ifdef CONFIG_KEXEC_CORE
 	.kexec_cpu_down		= pnv_kexec_cpu_down,
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 8ef3270515a9..0828cd2b6af0 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1142,7 +1142,6 @@ define_machine(pseries) {
 	.get_boot_time		= rtas_get_boot_time,
 	.get_rtc_time		= rtas_get_rtc_time,
 	.set_rtc_time		= rtas_set_rtc_time,
-	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= rtas_progress,
 	.system_reset_exception = pSeries_system_reset_exception,
 	.machine_check_early	= pseries_machine_check_realmode,
-- 
2.39.1



