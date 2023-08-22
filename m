Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D17839CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 08:16:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVJyl28Vjz3cPK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 16:16:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVJxm34wWz2y1b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 16:15:56 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RVJxZ61TPz9vw8;
	Tue, 22 Aug 2023 08:15:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I13ZQsdCp2iD; Tue, 22 Aug 2023 08:15:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RVJxY2VGCz9vw6;
	Tue, 22 Aug 2023 08:15:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5212B8B779;
	Tue, 22 Aug 2023 08:15:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id RNf6ZCMML_nr; Tue, 22 Aug 2023 08:15:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.234.16])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 11E498B766;
	Tue, 22 Aug 2023 08:15:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37M6DKw8825675
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 08:13:20 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37M6DJ65825670;
	Tue, 22 Aug 2023 08:13:19 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/85xx: Mark some functions static and add missing includes to fix no previous prototype error
Date: Tue, 22 Aug 2023 08:13:13 +0200
Message-ID: <c90780017b624b91771a3e4240dcbadc68137915.1692684784.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692684792; l=9629; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=/MwMhKyCwtRgbWNMb9EDcEVmn0M3rv4Lr0EXwT/HClM=; b=NkMmGpAb5NKJrUbKzmee1MhhHiAWsbW6v3BTNts+UiI/RNKy6hWmRsmTMW6jsOTnOftdU7wc9 IH70UXDCBERAzam/9msGgsqPLRg97ad/ofEKYfqEGAn71OGuU8k6Kyo
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

corenet{32/64}_smp_defconfig leads to:

  CC      arch/powerpc/sysdev/ehv_pic.o
arch/powerpc/sysdev/ehv_pic.c:45:6: error: no previous prototype for 'ehv_pic_unmask_irq' [-Werror=missing-prototypes]
   45 | void ehv_pic_unmask_irq(struct irq_data *d)
      |      ^~~~~~~~~~~~~~~~~~
arch/powerpc/sysdev/ehv_pic.c:52:6: error: no previous prototype for 'ehv_pic_mask_irq' [-Werror=missing-prototypes]
   52 | void ehv_pic_mask_irq(struct irq_data *d)
      |      ^~~~~~~~~~~~~~~~
arch/powerpc/sysdev/ehv_pic.c:59:6: error: no previous prototype for 'ehv_pic_end_irq' [-Werror=missing-prototypes]
   59 | void ehv_pic_end_irq(struct irq_data *d)
      |      ^~~~~~~~~~~~~~~
arch/powerpc/sysdev/ehv_pic.c:66:6: error: no previous prototype for 'ehv_pic_direct_end_irq' [-Werror=missing-prototypes]
   66 | void ehv_pic_direct_end_irq(struct irq_data *d)
      |      ^~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/sysdev/ehv_pic.c:71:5: error: no previous prototype for 'ehv_pic_set_affinity' [-Werror=missing-prototypes]
   71 | int ehv_pic_set_affinity(struct irq_data *d, const struct cpumask *dest,
      |     ^~~~~~~~~~~~~~~~~~~~
arch/powerpc/sysdev/ehv_pic.c:112:5: error: no previous prototype for 'ehv_pic_set_irq_type' [-Werror=missing-prototypes]
  112 | int ehv_pic_set_irq_type(struct irq_data *d, unsigned int flow_type)
      |     ^~~~~~~~~~~~~~~~~~~~
  CC      arch/powerpc/sysdev/fsl_rio.o
arch/powerpc/sysdev/fsl_rio.c:102:5: error: no previous prototype for 'fsl_rio_mcheck_exception' [-Werror=missing-prototypes]
  102 | int fsl_rio_mcheck_exception(struct pt_regs *regs)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/sysdev/fsl_rio.c:306:5: error: no previous prototype for 'fsl_map_inb_mem' [-Werror=missing-prototypes]
  306 | int fsl_map_inb_mem(struct rio_mport *mport, dma_addr_t lstart,
      |     ^~~~~~~~~~~~~~~
arch/powerpc/sysdev/fsl_rio.c:357:6: error: no previous prototype for 'fsl_unmap_inb_mem' [-Werror=missing-prototypes]
  357 | void fsl_unmap_inb_mem(struct rio_mport *mport, dma_addr_t lstart)
      |      ^~~~~~~~~~~~~~~~~
arch/powerpc/sysdev/fsl_rio.c:445:5: error: no previous prototype for 'fsl_rio_setup' [-Werror=missing-prototypes]
  445 | int fsl_rio_setup(struct platform_device *dev)
      |     ^~~~~~~~~~~~~
  CC      arch/powerpc/sysdev/fsl_rmu.o
arch/powerpc/sysdev/fsl_rmu.c:362:6: error: no previous prototype for 'msg_unit_error_handler' [-Werror=missing-prototypes]
  362 | void msg_unit_error_handler(void)
      |      ^~~~~~~~~~~~~~~~~~~~~~
  CC      arch/powerpc/platforms/85xx/corenet_generic.o
arch/powerpc/platforms/85xx/corenet_generic.c:33:13: error: no previous prototype for 'corenet_gen_pic_init' [-Werror=missing-prototypes]
   33 | void __init corenet_gen_pic_init(void)
      |             ^~~~~~~~~~~~~~~~~~~~
arch/powerpc/platforms/85xx/corenet_generic.c:51:13: error: no previous prototype for 'corenet_gen_setup_arch' [-Werror=missing-prototypes]
   51 | void __init corenet_gen_setup_arch(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/platforms/85xx/corenet_generic.c:104:12: error: no previous prototype for 'corenet_gen_publish_devices' [-Werror=missing-prototypes]
  104 | int __init corenet_gen_publish_devices(void)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC      arch/powerpc/platforms/85xx/qemu_e500.o
arch/powerpc/platforms/85xx/qemu_e500.c:28:13: error: no previous prototype for 'qemu_e500_pic_init' [-Werror=missing-prototypes]
   28 | void __init qemu_e500_pic_init(void)
      |             ^~~~~~~~~~~~~~~~~~
  CC      arch/powerpc/kernel/pmc.o
arch/powerpc/kernel/pmc.c:78:6: error: no previous prototype for 'power4_enable_pmcs' [-Werror=missing-prototypes]
   78 | void power4_enable_pmcs(void)
      |      ^~~~~~~~~~~~~~~~~~

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/kernel/pmc.c                     |  2 +-
 arch/powerpc/platforms/85xx/corenet_generic.c |  6 +++---
 arch/powerpc/platforms/85xx/qemu_e500.c       |  2 +-
 arch/powerpc/sysdev/ehv_pic.c                 | 12 ++++++------
 arch/powerpc/sysdev/fsl_rio.c                 |  9 +++++----
 arch/powerpc/sysdev/fsl_rmu.c                 |  2 +-
 6 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/pmc.c b/arch/powerpc/kernel/pmc.c
index 15414c8a2837..9fabb4d9235e 100644
--- a/arch/powerpc/kernel/pmc.c
+++ b/arch/powerpc/kernel/pmc.c
@@ -74,7 +74,7 @@ void release_pmc_hardware(void)
 }
 EXPORT_SYMBOL_GPL(release_pmc_hardware);
 
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S_64
 void power4_enable_pmcs(void)
 {
 	unsigned long hid0;
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index bfde391c42f4..645fcca77cde 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -30,7 +30,7 @@
 #include "smp.h"
 #include "mpc85xx.h"
 
-void __init corenet_gen_pic_init(void)
+static void __init corenet_gen_pic_init(void)
 {
 	struct mpic *mpic;
 	unsigned int flags = MPIC_BIG_ENDIAN | MPIC_SINGLE_DEST_CPU |
@@ -48,7 +48,7 @@ void __init corenet_gen_pic_init(void)
 /*
  * Setup the architecture
  */
-void __init corenet_gen_setup_arch(void)
+static void __init corenet_gen_setup_arch(void)
 {
 	mpc85xx_smp_init();
 
@@ -101,7 +101,7 @@ static const struct of_device_id of_device_ids[] = {
 	{}
 };
 
-int __init corenet_gen_publish_devices(void)
+static int __init corenet_gen_publish_devices(void)
 {
 	return of_platform_bus_probe(NULL, of_device_ids, NULL);
 }
diff --git a/arch/powerpc/platforms/85xx/qemu_e500.c b/arch/powerpc/platforms/85xx/qemu_e500.c
index 6e4b1ddf292b..3cd2f3bd4223 100644
--- a/arch/powerpc/platforms/85xx/qemu_e500.c
+++ b/arch/powerpc/platforms/85xx/qemu_e500.c
@@ -25,7 +25,7 @@
 #include "smp.h"
 #include "mpc85xx.h"
 
-void __init qemu_e500_pic_init(void)
+static void __init qemu_e500_pic_init(void)
 {
 	struct mpic *mpic;
 	unsigned int flags = MPIC_BIG_ENDIAN | MPIC_SINGLE_DEST_CPU |
diff --git a/arch/powerpc/sysdev/ehv_pic.c b/arch/powerpc/sysdev/ehv_pic.c
index c7327b836d2b..040827671d21 100644
--- a/arch/powerpc/sysdev/ehv_pic.c
+++ b/arch/powerpc/sysdev/ehv_pic.c
@@ -42,33 +42,33 @@ static u32 __iomem *mpic_percpu_base_vaddr;
  * Linux descriptor level callbacks
  */
 
-void ehv_pic_unmask_irq(struct irq_data *d)
+static void ehv_pic_unmask_irq(struct irq_data *d)
 {
 	unsigned int src = virq_to_hw(d->irq);
 
 	ev_int_set_mask(src, 0);
 }
 
-void ehv_pic_mask_irq(struct irq_data *d)
+static void ehv_pic_mask_irq(struct irq_data *d)
 {
 	unsigned int src = virq_to_hw(d->irq);
 
 	ev_int_set_mask(src, 1);
 }
 
-void ehv_pic_end_irq(struct irq_data *d)
+static void ehv_pic_end_irq(struct irq_data *d)
 {
 	unsigned int src = virq_to_hw(d->irq);
 
 	ev_int_eoi(src);
 }
 
-void ehv_pic_direct_end_irq(struct irq_data *d)
+static void ehv_pic_direct_end_irq(struct irq_data *d)
 {
 	out_be32(mpic_percpu_base_vaddr + MPIC_EOI / 4, 0);
 }
 
-int ehv_pic_set_affinity(struct irq_data *d, const struct cpumask *dest,
+static int ehv_pic_set_affinity(struct irq_data *d, const struct cpumask *dest,
 			 bool force)
 {
 	unsigned int src = virq_to_hw(d->irq);
@@ -109,7 +109,7 @@ static unsigned int ehv_pic_type_to_vecpri(unsigned int type)
 	}
 }
 
-int ehv_pic_set_irq_type(struct irq_data *d, unsigned int flow_type)
+static int ehv_pic_set_irq_type(struct irq_data *d, unsigned int flow_type)
 {
 	unsigned int src = virq_to_hw(d->irq);
 	unsigned int vecpri, vold, vnew, prio, cpu_dest;
diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index efd8f6291ea6..f9b214b299e7 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -33,6 +33,7 @@
 #include <linux/io.h>
 #include <linux/uaccess.h>
 #include <asm/machdep.h>
+#include <asm/rio.h>
 
 #include "fsl_rio.h"
 
@@ -303,8 +304,8 @@ static void fsl_rio_inbound_mem_init(struct rio_priv *priv)
 		out_be32(&priv->inb_atmu_regs[i].riwar, 0);
 }
 
-int fsl_map_inb_mem(struct rio_mport *mport, dma_addr_t lstart,
-	u64 rstart, u64 size, u32 flags)
+static int fsl_map_inb_mem(struct rio_mport *mport, dma_addr_t lstart,
+			   u64 rstart, u64 size, u32 flags)
 {
 	struct rio_priv *priv = mport->priv;
 	u32 base_size;
@@ -354,7 +355,7 @@ int fsl_map_inb_mem(struct rio_mport *mport, dma_addr_t lstart,
 	return 0;
 }
 
-void fsl_unmap_inb_mem(struct rio_mport *mport, dma_addr_t lstart)
+static void fsl_unmap_inb_mem(struct rio_mport *mport, dma_addr_t lstart)
 {
 	u32 win_start_shift, base_start_shift;
 	struct rio_priv *priv = mport->priv;
@@ -442,7 +443,7 @@ static inline void fsl_rio_info(struct device *dev, u32 ccsr)
  * master port with system-specific info, and registers the
  * master port with the RapidIO subsystem.
  */
-int fsl_rio_setup(struct platform_device *dev)
+static int fsl_rio_setup(struct platform_device *dev)
 {
 	struct rio_ops *ops;
 	struct rio_mport *port;
diff --git a/arch/powerpc/sysdev/fsl_rmu.c b/arch/powerpc/sysdev/fsl_rmu.c
index 58221b6e1465..f956591cb64e 100644
--- a/arch/powerpc/sysdev/fsl_rmu.c
+++ b/arch/powerpc/sysdev/fsl_rmu.c
@@ -359,7 +359,7 @@ fsl_rio_dbell_handler(int irq, void *dev_instance)
 	return IRQ_HANDLED;
 }
 
-void msg_unit_error_handler(void)
+static void msg_unit_error_handler(void)
 {
 
 	/*XXX: Error recovery is not implemented, we just clear errors */
-- 
2.41.0

