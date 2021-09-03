Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924FC3FFEF6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 13:22:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1FlC3B1Hz3dhl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 21:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1Fg85GTjz30Qc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 21:19:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H1FfZ3GBbz9sV2;
 Fri,  3 Sep 2021 13:18:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgluIiBzCIvH; Fri,  3 Sep 2021 13:18:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H1FfZ10SJz9sT4;
 Fri,  3 Sep 2021 13:18:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0D5A68B8E5;
 Fri,  3 Sep 2021 13:18:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mOKryr0DCUUG; Fri,  3 Sep 2021 13:18:45 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C9A88B764;
 Fri,  3 Sep 2021 13:18:44 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3CFDF63D74; Fri,  3 Sep 2021 11:18:44 +0000 (UTC)
Message-Id: <297d2c530690c14407923ed28688e8fc7a2727a3.1630667612.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1630667612.git.christophe.leroy@csgroup.eu>
References: <cover.1630667612.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 09/11] powerpc/platforms: Use ppc_md. helpers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  3 Sep 2021 11:18:44 +0000 (UTC)
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

Instead of playing directly with ppc_md. structure fields,
use the newly defined helpers.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/archrandom.h         |  4 +-
 arch/powerpc/include/asm/iommu.h              |  3 +-
 arch/powerpc/include/asm/machdep.h            |  3 +-
 arch/powerpc/include/asm/pci.h                |  4 +-
 arch/powerpc/include/asm/pmac_feature.h       |  4 +-
 arch/powerpc/kernel/dawr.c                    |  4 +-
 arch/powerpc/kernel/dma-mask.c                |  3 +-
 arch/powerpc/kernel/epapr_paravirt.c          |  2 +-
 arch/powerpc/kernel/idle.c                    |  6 +--
 arch/powerpc/kernel/irq.c                     |  5 +--
 arch/powerpc/kernel/mce.c                     |  7 ++-
 arch/powerpc/kernel/mce_power.c               |  4 +-
 arch/powerpc/kernel/nvram_64.c                | 18 ++++----
 arch/powerpc/kernel/of_platform.c             |  4 +-
 arch/powerpc/kernel/pci-common.c              | 41 +++++++----------
 arch/powerpc/kernel/pci_32.c                  |  6 +--
 arch/powerpc/kernel/pci_64.c                  |  5 +--
 arch/powerpc/kernel/process.c                 |  4 +-
 arch/powerpc/kernel/setup-common.c            | 26 +++++------
 arch/powerpc/kernel/setup_32.c                | 12 +++--
 arch/powerpc/kernel/setup_64.c                |  4 +-
 arch/powerpc/kernel/sysfs.c                   | 11 +++--
 arch/powerpc/kernel/time.c                    | 32 +++++++-------
 arch/powerpc/kernel/traps.c                   | 11 +++--
 arch/powerpc/kexec/core.c                     |  4 +-
 arch/powerpc/kexec/core_64.c                  |  9 ++--
 arch/powerpc/kexec/crash.c                    |  6 +--
 arch/powerpc/kvm/book3s_hv_ras.c              |  3 +-
 arch/powerpc/mm/book3s32/mmu.c                | 10 ++---
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  2 +-
 arch/powerpc/mm/init_32.c                     | 12 ++---
 arch/powerpc/mm/mem.c                         |  6 +--
 arch/powerpc/platforms/44x/idle.c             |  4 +-
 arch/powerpc/platforms/44x/iss4xx.c           |  4 +-
 arch/powerpc/platforms/44x/ppc476.c           |  6 +--
 arch/powerpc/platforms/4xx/cpm.c              |  2 +-
 arch/powerpc/platforms/52xx/efika.c           |  3 +-
 arch/powerpc/platforms/52xx/lite5200.c        |  3 +-
 arch/powerpc/platforms/52xx/media5200.c       |  3 +-
 arch/powerpc/platforms/52xx/mpc5200_simple.c  |  3 +-
 arch/powerpc/platforms/52xx/mpc52xx_pci.c     | 10 ++---
 arch/powerpc/platforms/82xx/ep8248e.c         |  6 +--
 arch/powerpc/platforms/82xx/km82xx.c          |  6 +--
 arch/powerpc/platforms/82xx/mpc8272_ads.c     |  6 +--
 arch/powerpc/platforms/82xx/pq2.c             |  2 +-
 arch/powerpc/platforms/82xx/pq2fads.c         |  6 +--
 arch/powerpc/platforms/83xx/misc.c            |  3 +-
 arch/powerpc/platforms/85xx/bsc913x_qds.c     |  3 +-
 arch/powerpc/platforms/85xx/bsc913x_rdb.c     |  3 +-
 arch/powerpc/platforms/85xx/c293pcie.c        |  3 +-
 arch/powerpc/platforms/85xx/corenet_generic.c |  8 ++--
 arch/powerpc/platforms/85xx/ge_imp3a.c        |  3 +-
 arch/powerpc/platforms/85xx/ksi8560.c         |  3 +-
 arch/powerpc/platforms/85xx/mpc8536_ds.c      |  3 +-
 arch/powerpc/platforms/85xx/mpc85xx_ads.c     |  3 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     | 11 +++--
 arch/powerpc/platforms/85xx/mpc85xx_ds.c      |  5 +--
 arch/powerpc/platforms/85xx/mpc85xx_mds.c     |  3 +-
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  3 +-
 arch/powerpc/platforms/85xx/mvme2500.c        |  3 +-
 arch/powerpc/platforms/85xx/p1010rdb.c        |  3 +-
 arch/powerpc/platforms/85xx/p1022_ds.c        |  3 +-
 arch/powerpc/platforms/85xx/p1022_rdk.c       |  3 +-
 arch/powerpc/platforms/85xx/p1023_rdb.c       |  3 +-
 arch/powerpc/platforms/85xx/ppa8548.c         |  3 +-
 arch/powerpc/platforms/85xx/qemu_e500.c       |  2 +-
 arch/powerpc/platforms/85xx/sgy_cts1000.c     |  4 +-
 arch/powerpc/platforms/85xx/smp.c             |  7 ++-
 arch/powerpc/platforms/85xx/socrates.c        |  3 +-
 arch/powerpc/platforms/85xx/stx_gp3.c         |  3 +-
 arch/powerpc/platforms/85xx/tqm85xx.c         |  3 +-
 arch/powerpc/platforms/85xx/twr_p102x.c       |  3 +-
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c    |  3 +-
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c    |  5 +--
 arch/powerpc/platforms/86xx/mvme7100.c        |  3 +-
 arch/powerpc/platforms/amigaone/setup.c       |  5 +--
 arch/powerpc/platforms/cell/interrupt.c       |  2 +-
 arch/powerpc/platforms/cell/pervasive.c       |  4 +-
 arch/powerpc/platforms/cell/ras.c             |  2 +-
 arch/powerpc/platforms/chrp/nvram.c           |  6 +--
 arch/powerpc/platforms/chrp/setup.c           | 23 +++++-----
 arch/powerpc/platforms/embedded6xx/holly.c    |  8 ++--
 .../platforms/embedded6xx/mpc7448_hpc2.c      |  9 ++--
 arch/powerpc/platforms/embedded6xx/mvme5100.c |  3 +-
 arch/powerpc/platforms/embedded6xx/wii.c      |  3 +-
 arch/powerpc/platforms/maple/pci.c            |  2 +-
 arch/powerpc/platforms/maple/setup.c          |  6 +--
 arch/powerpc/platforms/microwatt/rng.c        |  2 +-
 arch/powerpc/platforms/pasemi/idle.c          |  4 +-
 arch/powerpc/platforms/powermac/nvram.c       | 44 +++++++++----------
 arch/powerpc/platforms/powermac/pci.c         |  2 +-
 arch/powerpc/platforms/powermac/pic.c         |  4 +-
 arch/powerpc/platforms/powermac/smp.c         | 18 ++++----
 arch/powerpc/platforms/powernv/eeh-powernv.c  |  2 +-
 arch/powerpc/platforms/powernv/idle.c         |  4 +-
 arch/powerpc/platforms/powernv/opal-nvram.c   |  6 +--
 arch/powerpc/platforms/powernv/pci-ioda.c     | 12 ++---
 arch/powerpc/platforms/powernv/rng.c          |  4 +-
 arch/powerpc/platforms/powernv/setup.c        | 18 ++++----
 arch/powerpc/platforms/powernv/smp.c          |  2 +-
 arch/powerpc/platforms/ps3/interrupt.c        |  2 +-
 arch/powerpc/platforms/ps3/setup.c            |  2 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c  |  2 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |  4 +-
 arch/powerpc/platforms/pseries/msi.c          |  4 +-
 arch/powerpc/platforms/pseries/nvram.c        |  8 ++--
 arch/powerpc/platforms/pseries/pci.c          |  4 +-
 arch/powerpc/platforms/pseries/rng.c          |  2 +-
 arch/powerpc/platforms/pseries/setup.c        | 31 ++++++-------
 arch/powerpc/sysdev/dart_iommu.c              |  2 +-
 arch/powerpc/sysdev/fsl_pci.c                 |  6 +--
 arch/powerpc/sysdev/indirect_pci.c            |  8 ++--
 arch/powerpc/sysdev/mmio_nvram.c              | 10 ++---
 arch/powerpc/sysdev/mpic.c                    |  2 +-
 arch/powerpc/sysdev/tsi108_pci.c              |  8 ++--
 arch/powerpc/sysdev/xics/xics-common.c        |  2 +-
 arch/powerpc/sysdev/xive/common.c             |  2 +-
 arch/powerpc/xmon/xmon.c                      |  4 +-
 drivers/ata/pata_macio.c                      | 10 ++---
 drivers/char/nvram.c                          |  4 +-
 drivers/macintosh/via-pmu.c                   |  4 +-
 include/linux/nvram.h                         | 19 ++++----
 sound/ppc/pmac.c                              |  3 +-
 123 files changed, 347 insertions(+), 438 deletions(-)

diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
index 9a53e29680f4..4f858298c010 100644
--- a/arch/powerpc/include/asm/archrandom.h
+++ b/arch/powerpc/include/asm/archrandom.h
@@ -18,8 +18,8 @@ static inline bool __must_check arch_get_random_int(unsigned int *v)
 
 static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
 {
-	if (ppc_md.get_random_seed)
-		return ppc_md.get_random_seed(v);
+	if (ppc_md_has(get_random_seed))
+		return ppc_md_call(get_random_seed)(v);
 
 	return false;
 }
diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index c361212ac160..c4d21a5db5db 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -282,8 +282,7 @@ extern void iommu_init_early_pasemi(void);
 #if defined(CONFIG_PPC64) && defined(CONFIG_PM)
 static inline void iommu_restore(void)
 {
-	if (ppc_md.iommu_restore)
-		ppc_md.iommu_restore();
+	ppc_md_call_cond(iommu_restore)();
 }
 #endif
 
diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 51949ab0abfe..ed5a1b5be7b5 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -237,8 +237,7 @@ extern struct machdep_calls *machine_id;
 
 static inline void log_error(char *buf, unsigned int err_type, int fatal)
 {
-	if (ppc_md.log_error)
-		ppc_md.log_error(buf, err_type, fatal);
+	ppc_md_call_cond(log_error)(buf, err_type, fatal);
 }
 
 #define __define_machine_initcall(mach, fn, id) \
diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index d1f53260725c..d77f8793d30e 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -42,8 +42,8 @@
 #define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
 static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 {
-	if (ppc_md.pci_get_legacy_ide_irq)
-		return ppc_md.pci_get_legacy_ide_irq(dev, channel);
+	if (ppc_md_has(pci_get_legacy_ide_irq))
+		return ppc_md_call(pci_get_legacy_ide_irq)(dev, channel);
 	return channel ? 15 : 14;
 }
 
diff --git a/arch/powerpc/include/asm/pmac_feature.h b/arch/powerpc/include/asm/pmac_feature.h
index e08e829261b6..c07b108262a4 100644
--- a/arch/powerpc/include/asm/pmac_feature.h
+++ b/arch/powerpc/include/asm/pmac_feature.h
@@ -146,9 +146,9 @@ struct device_node;
 static inline long pmac_call_feature(int selector, struct device_node* node,
 					long param, long value)
 {
-	if (!ppc_md.feature_call || !machine_is(powermac))
+	if (!ppc_md_has(feature_call) || !machine_is(powermac))
 		return -ENODEV;
-	return ppc_md.feature_call(selector, node, param, value);
+	return ppc_md_call(feature_call)(selector, node, param, value);
 }
 
 /* PMAC_FTR_SERIAL_ENABLE	(struct device_node* node, int param, int value)
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
index 64e423d2fe0f..decb9786404f 100644
--- a/arch/powerpc/kernel/dawr.c
+++ b/arch/powerpc/kernel/dawr.c
@@ -35,8 +35,8 @@ int set_dawr(int nr, struct arch_hw_breakpoint *brk)
 	mrd = ((brk->hw_len + 7) >> 3) - 1;
 	dawrx |= (mrd & 0x3f) << (63 - 53);
 
-	if (ppc_md.set_dawr)
-		return ppc_md.set_dawr(nr, dawr, dawrx);
+	if (ppc_md_has(set_dawr))
+		return ppc_md_call(set_dawr)(nr, dawr, dawrx);
 
 	if (nr == 0) {
 		mtspr(SPRN_DAWR0, dawr);
diff --git a/arch/powerpc/kernel/dma-mask.c b/arch/powerpc/kernel/dma-mask.c
index ffbbbc432612..19152c085e06 100644
--- a/arch/powerpc/kernel/dma-mask.c
+++ b/arch/powerpc/kernel/dma-mask.c
@@ -6,7 +6,6 @@
 
 void arch_dma_set_mask(struct device *dev, u64 dma_mask)
 {
-	if (ppc_md.dma_set_mask)
-		ppc_md.dma_set_mask(dev, dma_mask);
+	ppc_md_call_cond(dma_set_mask)(dev, dma_mask);
 }
 EXPORT_SYMBOL(arch_dma_set_mask);
diff --git a/arch/powerpc/kernel/epapr_paravirt.c b/arch/powerpc/kernel/epapr_paravirt.c
index 93b0f3ec8fb0..785f82df0cd5 100644
--- a/arch/powerpc/kernel/epapr_paravirt.c
+++ b/arch/powerpc/kernel/epapr_paravirt.c
@@ -65,7 +65,7 @@ static int __init epapr_idle_init(void)
 {
 #if !defined(CONFIG_64BIT) || defined(CONFIG_PPC_BOOK3E_64)
 	if (epapr_has_idle)
-		ppc_md.power_save = epapr_ev_idle;
+		ppc_md_update(power_save, epapr_ev_idle);
 #endif
 
 	return 0;
diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
index 1f835539fda4..a131d5caa288 100644
--- a/arch/powerpc/kernel/idle.c
+++ b/arch/powerpc/kernel/idle.c
@@ -35,7 +35,7 @@ EXPORT_SYMBOL(cpuidle_disable);
 
 static int __init powersave_off(char *arg)
 {
-	ppc_md.power_save = NULL;
+	ppc_md_update(power_save, NULL);
 	cpuidle_disable = IDLE_POWERSAVE_OFF;
 	return 0;
 }
@@ -45,8 +45,8 @@ void arch_cpu_idle(void)
 {
 	ppc64_runlatch_off();
 
-	if (ppc_md.power_save) {
-		ppc_md.power_save();
+	if (ppc_md_has(power_save)) {
+		ppc_md_call(power_save)();
 		/*
 		 * Some power_save functions return with
 		 * interrupts enabled, some don't.
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 551b653228c4..a4741b4498c3 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -736,7 +736,7 @@ void __do_irq(struct pt_regs *regs)
 	 *
 	 * This will typically lower the interrupt line to the CPU
 	 */
-	irq = ppc_md.get_irq();
+	irq = ppc_md_call(get_irq)();
 
 	/* We can hard enable interrupts now to allow perf interrupts */
 	may_hard_irq_enable();
@@ -801,8 +801,7 @@ void __init init_IRQ(void)
 	if (IS_ENABLED(CONFIG_VMAP_STACK))
 		vmap_irqstack_init();
 
-	if (ppc_md.init_IRQ)
-		ppc_md.init_IRQ();
+	ppc_md_call_cond(init_IRQ)();
 }
 
 #if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 47a683cd00d2..686f5c00f4c6 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -595,8 +595,8 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
 	/*
 	 * See if platform is capable of handling machine check.
 	 */
-	if (ppc_md.machine_check_early)
-		handled = ppc_md.machine_check_early(regs);
+	if (ppc_md_has(machine_check_early))
+		handled = ppc_md_call(machine_check_early)(regs);
 
 	return handled;
 }
@@ -721,8 +721,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(hmi_exception_realmode)
 
 	wait_for_subcore_guest_exit();
 
-	if (ppc_md.hmi_exception_early)
-		ppc_md.hmi_exception_early(regs);
+	ppc_md_call_cond(hmi_exception_early)(regs);
 
 	wait_for_tb_resync();
 
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index c2f55fe7092d..5cc0eee69e67 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -685,8 +685,8 @@ static long mce_handle_ue_error(struct pt_regs *regs,
 	 * different way and hence we can recover from this MC.
 	 */
 
-	if (ppc_md.mce_check_early_recovery) {
-		if (ppc_md.mce_check_early_recovery(regs))
+	if (ppc_md_has(mce_check_early_recovery)) {
+		if (ppc_md_call(mce_check_early_recovery)(regs))
 			return 1;
 	}
 
diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index 3c8d9bbb51cf..80ce34e4b1de 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -197,13 +197,13 @@ int nvram_write_os_partition(struct nvram_os_partition *part,
 
 	tmp_index = part->index;
 
-	rc = ppc_md.nvram_write((char *)&info, sizeof(info), &tmp_index);
+	rc = ppc_md_call(nvram_write)((char *)&info, sizeof(info), &tmp_index);
 	if (rc <= 0) {
 		pr_err("%s: Failed nvram_write (%d)\n", __func__, rc);
 		return rc;
 	}
 
-	rc = ppc_md.nvram_write(buff, length, &tmp_index);
+	rc = ppc_md_call(nvram_write)(buff, length, &tmp_index);
 	if (rc <= 0) {
 		pr_err("%s: Failed nvram_write (%d)\n", __func__, rc);
 		return rc;
@@ -233,14 +233,14 @@ int nvram_read_partition(struct nvram_os_partition *part, char *buff,
 	tmp_index = part->index;
 
 	if (part->os_partition) {
-		rc = ppc_md.nvram_read((char *)&info, sizeof(info), &tmp_index);
+		rc = ppc_md_call(nvram_read)((char *)&info, sizeof(info), &tmp_index);
 		if (rc <= 0) {
 			pr_err("%s: Failed nvram_read (%d)\n", __func__, rc);
 			return rc;
 		}
 	}
 
-	rc = ppc_md.nvram_read(buff, length, &tmp_index);
+	rc = ppc_md_call(nvram_read)(buff, length, &tmp_index);
 	if (rc <= 0) {
 		pr_err("%s: Failed nvram_read (%d)\n", __func__, rc);
 		return rc;
@@ -731,7 +731,7 @@ static int __init nvram_write_header(struct nvram_partition * part)
 	phead.length = cpu_to_be16(phead.length);
 
 	tmp_index = part->index;
-	rc = ppc_md.nvram_write((char *)&phead, NVRAM_HEADER_LEN, &tmp_index);
+	rc = ppc_md_call(nvram_write)((char *)&phead, NVRAM_HEADER_LEN, &tmp_index);
 
 	return rc;
 }
@@ -930,7 +930,7 @@ loff_t __init nvram_create_partition(const char *name, int sig,
 	for (tmp_index = new_part->index + NVRAM_HEADER_LEN;
 	     tmp_index <  ((size - 1) * NVRAM_BLOCK_LEN);
 	     tmp_index += NVRAM_BLOCK_LEN) {
-		rc = ppc_md.nvram_write(nv_init_vals, NVRAM_BLOCK_LEN, &tmp_index);
+		rc = ppc_md_call(nvram_write)(nv_init_vals, NVRAM_BLOCK_LEN, &tmp_index);
 		if (rc <= 0) {
 			pr_err("%s: nvram_write failed (%d)\n",
 			       __func__, rc);
@@ -991,9 +991,9 @@ int __init nvram_scan_partitions(void)
 	int total_size;
 	int err;
 
-	if (ppc_md.nvram_size == NULL || ppc_md.nvram_size() <= 0)
+	if (!ppc_md_has(nvram_size) || ppc_md_call(nvram_size)() <= 0)
 		return -ENODEV;
-	total_size = ppc_md.nvram_size();
+	total_size = ppc_md_call(nvram_size)();
 	
 	header = kmalloc(NVRAM_HEADER_LEN, GFP_KERNEL);
 	if (!header) {
@@ -1003,7 +1003,7 @@ int __init nvram_scan_partitions(void)
 
 	while (cur_index < total_size) {
 
-		err = ppc_md.nvram_read(header, NVRAM_HEADER_LEN, &cur_index);
+		err = ppc_md_call(nvram_read)(header, NVRAM_HEADER_LEN, &cur_index);
 		if (err != NVRAM_HEADER_LEN) {
 			printk(KERN_ERR "nvram_scan_partitions: Error parsing "
 			       "nvram partitions\n");
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index f89376ff633e..96de8700d3e9 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -37,7 +37,7 @@ static int of_pci_phb_probe(struct platform_device *dev)
 	struct pci_controller *phb;
 
 	/* Check if we can do that ... */
-	if (ppc_md.pci_setup_phb == NULL)
+	if (!ppc_md_has(pci_setup_phb))
 		return -ENODEV;
 
 	pr_info("Setting up PCI bus %pOF\n", dev->dev.of_node);
@@ -51,7 +51,7 @@ static int of_pci_phb_probe(struct platform_device *dev)
 	phb->parent = &dev->dev;
 
 	/* Setup the PHB using arch provided callback */
-	if (ppc_md.pci_setup_phb(phb)) {
+	if (ppc_md_call(pci_setup_phb)(phb)) {
 		pcibios_free_controller(phb);
 		return -ENODEV;
 	}
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index c3573430919d..a4d957dc80c0 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -229,8 +229,8 @@ void pcibios_reset_secondary_bus(struct pci_dev *dev)
 
 resource_size_t pcibios_default_alignment(void)
 {
-	if (ppc_md.pcibios_default_alignment)
-		return ppc_md.pcibios_default_alignment();
+	if (ppc_md_has(pcibios_default_alignment))
+		return ppc_md_call(pcibios_default_alignment)();
 
 	return 0;
 }
@@ -238,24 +238,24 @@ resource_size_t pcibios_default_alignment(void)
 #ifdef CONFIG_PCI_IOV
 resource_size_t pcibios_iov_resource_alignment(struct pci_dev *pdev, int resno)
 {
-	if (ppc_md.pcibios_iov_resource_alignment)
-		return ppc_md.pcibios_iov_resource_alignment(pdev, resno);
+	if (ppc_md_has(pcibios_iov_resource_alignment))
+		return ppc_md_call(pcibios_iov_resource_alignment)(pdev, resno);
 
 	return pci_iov_resource_size(pdev, resno);
 }
 
 int pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
-	if (ppc_md.pcibios_sriov_enable)
-		return ppc_md.pcibios_sriov_enable(pdev, num_vfs);
+	if (ppc_md_has(pcibios_sriov_enable))
+		return ppc_md_call(pcibios_sriov_enable)(pdev, num_vfs);
 
 	return 0;
 }
 
 int pcibios_sriov_disable(struct pci_dev *pdev)
 {
-	if (ppc_md.pcibios_sriov_disable)
-		return ppc_md.pcibios_sriov_disable(pdev);
+	if (ppc_md_has(pcibios_sriov_disable))
+		return ppc_md_call(pcibios_sriov_disable)(pdev);
 
 	return 0;
 }
@@ -850,8 +850,8 @@ int pci_proc_domain(struct pci_bus *bus)
 
 int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
 {
-	if (ppc_md.pcibios_root_bridge_prepare)
-		return ppc_md.pcibios_root_bridge_prepare(bridge);
+	if (ppc_md_has(pcibios_root_bridge_prepare))
+		return ppc_md_call(pcibios_root_bridge_prepare)(bridge);
 
 	return 0;
 }
@@ -901,8 +901,7 @@ static void pcibios_fixup_resources(struct pci_dev *dev)
 	}
 
 	/* Call machine specific resource fixup */
-	if (ppc_md.pcibios_fixup_resources)
-		ppc_md.pcibios_fixup_resources(dev);
+	ppc_md_call_cond(pcibios_fixup_resources)(dev);
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pcibios_fixup_resources);
 
@@ -1024,8 +1023,7 @@ void pcibios_setup_bus_self(struct pci_bus *bus)
 	/* Platform specific bus fixups. This is currently only used
 	 * by fsl_pci and I'm hoping to get rid of it at some point
 	 */
-	if (ppc_md.pcibios_fixup_bus)
-		ppc_md.pcibios_fixup_bus(bus);
+	ppc_md_call_cond(pcibios_fixup_bus)(bus);
 
 	/* Setup bus DMA mappings */
 	phb = pci_bus_to_host(bus);
@@ -1052,11 +1050,9 @@ void pcibios_bus_add_device(struct pci_dev *dev)
 
 	/* Read default IRQs and fixup if necessary */
 	pci_read_irq_line(dev);
-	if (ppc_md.pci_irq_fixup)
-		ppc_md.pci_irq_fixup(dev);
+	ppc_md_call_cond(pci_irq_fixup)(dev);
 
-	if (ppc_md.pcibios_bus_add_device)
-		ppc_md.pcibios_bus_add_device(dev);
+	ppc_md_call_cond(pcibios_bus_add_device)(dev);
 }
 
 int pcibios_add_device(struct pci_dev *dev)
@@ -1064,8 +1060,7 @@ int pcibios_add_device(struct pci_dev *dev)
 	struct irq_domain *d;
 
 #ifdef CONFIG_PCI_IOV
-	if (ppc_md.pcibios_fixup_sriov)
-		ppc_md.pcibios_fixup_sriov(dev);
+	ppc_md_call_cond(pcibios_fixup_sriov)(dev);
 #endif /* CONFIG_PCI_IOV */
 
 	d = dev_get_msi_domain(&dev->bus->dev);
@@ -1673,8 +1668,7 @@ void pcibios_scan_phb(struct pci_controller *hose)
 	/* Platform gets a chance to do some global fixups before
 	 * we proceed to resource allocation
 	 */
-	if (ppc_md.pcibios_fixup_phb)
-		ppc_md.pcibios_fixup_phb(hose);
+	ppc_md_call_cond(pcibios_fixup_phb)(hose);
 
 	/* Configure PCI Express settings */
 	if (bus && !pci_has_flag(PCI_PROBE_ONLY)) {
@@ -1709,8 +1703,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, PCI_ANY_ID, fixup_hide_host_re
 
 static int __init discover_phbs(void)
 {
-	if (ppc_md.discover_phbs)
-		ppc_md.discover_phbs();
+	ppc_md_call_cond(discover_phbs)();
 
 	return 0;
 }
diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index b49e1060a3bf..b58a4f38f1d1 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -264,12 +264,10 @@ static int __init pcibios_init(void)
 	pcibios_resource_survey();
 
 	/* Call machine dependent fixup */
-	if (ppc_md.pcibios_fixup)
-		ppc_md.pcibios_fixup();
+	ppc_md_call_cond(pcibios_fixup)();
 
 	/* Call machine dependent post-init code */
-	if (ppc_md.pcibios_after_init)
-		ppc_md.pcibios_after_init();
+	ppc_md_call_cond(pcibios_after_init)();
 
 	return 0;
 }
diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index 3fb7e572abed..661f6764fcdd 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -46,7 +46,7 @@ static int __init pcibios_init(void)
 	/* For now, override phys_mem_access_prot. If we need it,g
 	 * later, we may move that initialization to each ppc_md
 	 */
-	ppc_md.phys_mem_access_prot = pci_phys_mem_access_prot;
+	ppc_md_update(phys_mem_access_prot, pci_phys_mem_access_prot);
 
 	/* On ppc64, we always enable PCI domains and we keep domain 0
 	 * backward compatible in /proc for video cards
@@ -65,8 +65,7 @@ static int __init pcibios_init(void)
 		pci_bus_add_devices(hose->bus);
 
 	/* Call machine dependent fixup */
-	if (ppc_md.pcibios_fixup)
-		ppc_md.pcibios_fixup();
+	ppc_md_call_cond(pcibios_fixup)();
 
 	printk(KERN_DEBUG "PCI: Probing PCI hardware done\n");
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 50436b52c213..5f3970a11d76 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -814,8 +814,8 @@ static inline int set_dabr(struct arch_hw_breakpoint *brk)
 	dabr = brk->address | (brk->type & HW_BRK_TYPE_DABR);
 	dabrx = ((brk->type >> 3) & 0x7);
 
-	if (ppc_md.set_dabr)
-		return ppc_md.set_dabr(dabr, dabrx);
+	if (ppc_md_has(set_dabr))
+		return ppc_md_call(set_dabr)(dabr, dabrx);
 
 	if (IS_ENABLED(CONFIG_PPC_ADV_DEBUG_REGS)) {
 		mtspr(SPRN_DAC1, dabr);
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 96e88209e605..9e2e1c4c6c62 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -132,8 +132,7 @@ void machine_shutdown(void)
 	 */
 	fadump_cleanup();
 
-	if (ppc_md.machine_shutdown)
-		ppc_md.machine_shutdown();
+	ppc_md_call_cond(machine_shutdown)();
 }
 
 static void machine_hang(void)
@@ -147,8 +146,7 @@ static void machine_hang(void)
 void machine_restart(char *cmd)
 {
 	machine_shutdown();
-	if (ppc_md.restart)
-		ppc_md.restart(cmd);
+	ppc_md_call_cond(restart)(cmd);
 
 	smp_send_stop();
 
@@ -176,8 +174,7 @@ EXPORT_SYMBOL_GPL(pm_power_off);
 void machine_halt(void)
 {
 	machine_shutdown();
-	if (ppc_md.halt)
-		ppc_md.halt();
+	ppc_md_call_cond(halt)();
 
 	smp_send_stop();
 	machine_hang();
@@ -210,8 +207,7 @@ static void show_cpuinfo_summary(struct seq_file *m)
 		seq_printf(m, "model\t\t: %s\n", model);
 	of_node_put(root);
 
-	if (ppc_md.show_cpuinfo != NULL)
-		ppc_md.show_cpuinfo(m);
+	ppc_md_call_cond(show_cpuinfo)(m);
 
 	/* Display the amount of memory */
 	if (IS_ENABLED(CONFIG_PPC32))
@@ -265,12 +261,12 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 
 	/*
 	 * Platforms that have variable clock rates, should implement
-	 * the method ppc_md.get_proc_freq() that reports the clock
+	 * the method ppc_md_call(get_proc_freq)() that reports the clock
 	 * rate of a given cpu. The rest can use ppc_proc_freq to
 	 * report the clock rate that is same across all cpus.
 	 */
-	if (ppc_md.get_proc_freq)
-		proc_freq = ppc_md.get_proc_freq(cpu_id);
+	if (ppc_md_has(get_proc_freq))
+		proc_freq = ppc_md_call(get_proc_freq)(cpu_id);
 	else
 		proc_freq = ppc_proc_freq;
 
@@ -694,8 +690,7 @@ static int ppc_panic_event(struct notifier_block *this,
 	 * firmware-assisted dump and let firmware handle everything else.
 	 */
 	crash_fadump(NULL, ptr);
-	if (ppc_md.panic)
-		ppc_md.panic(ptr);  /* May not return */
+	ppc_md_call_cond(panic)(ptr);  /* May not return */
 	return NOTIFY_DONE;
 }
 
@@ -727,7 +722,7 @@ void __init setup_panic(void)
 					       &kernel_offset_notifier);
 
 	/* PPC64 always does a hard irq disable in its panic handler */
-	if (!IS_ENABLED(CONFIG_PPC64) && !ppc_md.panic)
+	if (!IS_ENABLED(CONFIG_PPC64) && !ppc_md_has(panic))
 		return;
 	atomic_notifier_chain_register(&panic_notifier_list, &ppc_panic_block);
 }
@@ -924,8 +919,7 @@ void __init setup_arch(char **cmdline_p)
 
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
 
-	if (ppc_md.setup_arch)
-		ppc_md.setup_arch();
+	ppc_md_call_cond(setup_arch)();
 
 	setup_barrier_nospec();
 	setup_spectre_v2();
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 7ec5c47fce0e..c7afeff8abb2 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -126,13 +126,11 @@ __setup("l3cr=", ppc_setup_l3cr);
 static int __init ppc_init(void)
 {
 	/* clear the progress line */
-	if (ppc_md.progress)
-		ppc_md.progress("             ", 0xffff);
+	ppc_md_call_cond(progress)("             ", 0xffff);
 
 	/* call platform init */
-	if (ppc_md.init != NULL) {
-		ppc_md.init();
-	}
+	ppc_md_call_cond(init)();
+
 	return 0;
 }
 arch_initcall(ppc_init);
@@ -203,13 +201,13 @@ void __init setup_power_save(void)
 #ifdef CONFIG_PPC_BOOK3S_32
 	if (cpu_has_feature(CPU_FTR_CAN_DOZE) ||
 	    cpu_has_feature(CPU_FTR_CAN_NAP))
-		ppc_md.power_save = ppc6xx_idle;
+		ppc_md_update(power_save, ppc6xx_idle);
 #endif
 
 #ifdef CONFIG_E500
 	if (cpu_has_feature(CPU_FTR_CAN_DOZE) ||
 	    cpu_has_feature(CPU_FTR_CAN_NAP))
-		ppc_md.power_save = e500_idle;
+		ppc_md_update(power_save, e500_idle);
 #endif
 }
 
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index eaa79a0996d1..786e48ba8003 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -915,8 +915,8 @@ void __init setup_per_cpu_areas(void)
 #ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
 unsigned long memory_block_size_bytes(void)
 {
-	if (ppc_md.memory_block_size)
-		return ppc_md.memory_block_size();
+	if (ppc_md_has(memory_block_size))
+		return ppc_md_call(memory_block_size)();
 
 	return MIN_MEMORY_BLOCK_SIZE;
 }
diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index defecb3b1b15..e18a50b845a4 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -543,8 +543,7 @@ void ppc_enable_pmcs(void)
 
 	__this_cpu_write(pmcs_enabled, 1);
 
-	if (ppc_md.enable_pmcs)
-		ppc_md.enable_pmcs();
+	ppc_md_call_cond(enable_pmcs)();
 }
 EXPORT_SYMBOL(ppc_enable_pmcs);
 
@@ -1023,16 +1022,16 @@ static int unregister_cpu_online(unsigned int cpu)
 #ifdef CONFIG_ARCH_CPU_PROBE_RELEASE
 ssize_t arch_cpu_probe(const char *buf, size_t count)
 {
-	if (ppc_md.cpu_probe)
-		return ppc_md.cpu_probe(buf, count);
+	if (ppc_md_has(cpu_probe))
+		return ppc_md_call(cpu_probe)(buf, count);
 
 	return -EINVAL;
 }
 
 ssize_t arch_cpu_release(const char *buf, size_t count)
 {
-	if (ppc_md.cpu_release)
-		return ppc_md.cpu_release(buf, count);
+	if (ppc_md_has(cpu_release))
+		return ppc_md_call(cpu_release)(buf, count);
 
 	return -EINVAL;
 }
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index cae8f03a44fe..13d07836a8b0 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -634,8 +634,7 @@ void timer_broadcast_interrupt(void)
 /* Overrides the weak version in kernel/power/main.c */
 void arch_suspend_disable_irqs(void)
 {
-	if (ppc_md.suspend_disable_irqs)
-		ppc_md.suspend_disable_irqs();
+	ppc_md_call_cond(suspend_disable_irqs)();
 
 	/* Disable the decrementer, so that it doesn't interfere
 	 * with suspending.
@@ -651,8 +650,7 @@ void arch_suspend_enable_irqs(void)
 {
 	local_irq_enable();
 
-	if (ppc_md.suspend_enable_irqs)
-		ppc_md.suspend_enable_irqs();
+	ppc_md_call_cond(suspend_enable_irqs)();
 }
 #endif
 
@@ -772,12 +770,12 @@ int update_persistent_clock64(struct timespec64 now)
 {
 	struct rtc_time tm;
 
-	if (!ppc_md.set_rtc_time)
+	if (!ppc_md_has(set_rtc_time))
 		return -ENODEV;
 
 	rtc_time64_to_tm(now.tv_sec + 1 + timezone_offset, &tm);
 
-	return ppc_md.set_rtc_time(&tm);
+	return ppc_md_call(set_rtc_time)(&tm);
 }
 
 static void __read_persistent_clock(struct timespec64 *ts)
@@ -789,20 +787,20 @@ static void __read_persistent_clock(struct timespec64 *ts)
 	/* XXX this is a litle fragile but will work okay in the short term */
 	if (first) {
 		first = 0;
-		if (ppc_md.time_init)
-			timezone_offset = ppc_md.time_init();
+		if (ppc_md_has(time_init))
+			timezone_offset = ppc_md_call(time_init)();
 
 		/* get_boot_time() isn't guaranteed to be safe to call late */
-		if (ppc_md.get_boot_time) {
-			ts->tv_sec = ppc_md.get_boot_time() - timezone_offset;
+		if (ppc_md_has(get_boot_time)) {
+			ts->tv_sec = ppc_md_call(get_boot_time)() - timezone_offset;
 			return;
 		}
 	}
-	if (!ppc_md.get_rtc_time) {
+	if (!ppc_md_has(get_rtc_time)) {
 		ts->tv_sec = 0;
 		return;
 	}
-	ppc_md.get_rtc_time(&tm);
+	ppc_md_call(get_rtc_time)(&tm);
 
 	ts->tv_sec = rtc_tm_to_time64(&tm);
 }
@@ -946,7 +944,7 @@ void __init time_init(void)
 	unsigned shift;
 
 	/* Normal PowerPC with timebase register */
-	ppc_md.calibrate_decr();
+	ppc_md_call(calibrate_decr)();
 	printk(KERN_DEBUG "time_init: decrementer frequency = %lu.%.6lu MHz\n",
 	       ppc_tb_freq / 1000000, ppc_tb_freq % 1000000);
 	printk(KERN_DEBUG "time_init: processor frequency   = %lu.%.6lu MHz\n",
@@ -1050,16 +1048,16 @@ void calibrate_delay(void)
 #if IS_ENABLED(CONFIG_RTC_DRV_GENERIC)
 static int rtc_generic_get_time(struct device *dev, struct rtc_time *tm)
 {
-	ppc_md.get_rtc_time(tm);
+	ppc_md_call(get_rtc_time)(tm);
 	return 0;
 }
 
 static int rtc_generic_set_time(struct device *dev, struct rtc_time *tm)
 {
-	if (!ppc_md.set_rtc_time)
+	if (!ppc_md_has(set_rtc_time))
 		return -EOPNOTSUPP;
 
-	if (ppc_md.set_rtc_time(tm) < 0)
+	if (ppc_md_call(set_rtc_time)(tm) < 0)
 		return -EOPNOTSUPP;
 
 	return 0;
@@ -1074,7 +1072,7 @@ static int __init rtc_init(void)
 {
 	struct platform_device *pdev;
 
-	if (!ppc_md.get_rtc_time)
+	if (!ppc_md_has(get_rtc_time))
 		return -ENODEV;
 
 	pdev = platform_device_register_data(NULL, "rtc-generic", -1,
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 96bec6349876..f629f28d9b80 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -456,8 +456,8 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 	__this_cpu_inc(irq_stat.sreset_irqs);
 
 	/* See if any machine dependent calls */
-	if (ppc_md.system_reset_exception) {
-		if (ppc_md.system_reset_exception(regs))
+	if (ppc_md_has(system_reset_exception)) {
+		if (ppc_md_call(system_reset_exception)(regs))
 			goto out;
 	}
 
@@ -822,8 +822,8 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
 	 * that assumes the board gets a first chance, so let's keep it
 	 * that way for now and fix things later. --BenH.
 	 */
-	if (ppc_md.machine_check_exception)
-		recover = ppc_md.machine_check_exception(regs);
+	if (ppc_md_has(machine_check_exception))
+		recover = ppc_md_call(machine_check_exception)(regs);
 	else if (cur_cpu_spec->machine_check)
 		recover = cur_cpu_spec->machine_check(regs);
 
@@ -1057,8 +1057,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 	}
 #endif /* CONFIG_VSX */
 
-	if (ppc_md.handle_hmi_exception)
-		ppc_md.handle_hmi_exception(regs);
+	ppc_md_call_cond(handle_hmi_exception)(regs);
 
 	set_irq_regs(old_regs);
 }
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index a2242017e55f..6fd61825c943 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -87,8 +87,8 @@ void machine_kexec(struct kimage *image)
 	save_ftrace_enabled = __ftrace_enabled_save();
 	this_cpu_disable_ftrace();
 
-	if (ppc_md.machine_kexec)
-		ppc_md.machine_kexec(image);
+	if (ppc_md_has(machine_kexec))
+		ppc_md_call(machine_kexec)(image);
 	else
 		default_machine_kexec(image);
 
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 66678518b938..0cd3d57db5f5 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -153,8 +153,7 @@ static void kexec_smp_down(void *arg)
 	 * Now every CPU has IRQs off, we can clear out any pending
 	 * IPIs and be sure that no more will come in after this.
 	 */
-	if (ppc_md.kexec_cpu_down)
-		ppc_md.kexec_cpu_down(0, 1);
+	ppc_md_call_cond(kexec_cpu_down)(0, 1);
 
 	reset_sprs();
 
@@ -244,8 +243,7 @@ static void kexec_prepare_cpus(void)
 	kexec_prepare_cpus_wait(KEXEC_STATE_REAL_MODE);
 
 	/* after we tell the others to go down */
-	if (ppc_md.kexec_cpu_down)
-		ppc_md.kexec_cpu_down(0, 0);
+	ppc_md_call_cond(kexec_cpu_down)(0, 0);
 
 	put_cpu();
 }
@@ -264,8 +262,7 @@ static void kexec_prepare_cpus(void)
 	 * UP to an SMP kernel.
 	 */
 	smp_release_cpus();
-	if (ppc_md.kexec_cpu_down)
-		ppc_md.kexec_cpu_down(0, 0);
+	ppc_md_call_cond(kexec_cpu_down)(0, 0);
 	local_irq_disable();
 	hard_irq_disable();
 }
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index 10f997e6bb95..9e2b56b04869 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -90,8 +90,7 @@ void crash_ipi_callback(struct pt_regs *regs)
 	while (!time_to_dump)
 		cpu_relax();
 
-	if (ppc_md.kexec_cpu_down)
-		ppc_md.kexec_cpu_down(1, 1);
+	ppc_md_call_cond(kexec_cpu_down)(1, 1);
 
 #ifdef CONFIG_PPC64
 	kexec_smp_wait();
@@ -373,6 +372,5 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	crash_shutdown_cpu = -1;
 	__debugger_fault_handler = old_handler;
 
-	if (ppc_md.kexec_cpu_down)
-		ppc_md.kexec_cpu_down(1, 0);
+	ppc_md_call_cond(kexec_cpu_down)(1, 0);
 }
diff --git a/arch/powerpc/kvm/book3s_hv_ras.c b/arch/powerpc/kvm/book3s_hv_ras.c
index d4bca93b79f6..62baa228c356 100644
--- a/arch/powerpc/kvm/book3s_hv_ras.c
+++ b/arch/powerpc/kvm/book3s_hv_ras.c
@@ -295,8 +295,7 @@ long kvmppc_realmode_hmi_handler(void)
 	 * subcore on this core have completed guest->host partition
 	 * switch. Now it is safe to call HMI handler.
 	 */
-	if (ppc_md.hmi_exception_early)
-		ppc_md.hmi_exception_early(NULL);
+	ppc_md_call_cond(hmi_exception_early)(NULL);
 
 	/*
 	 * Check if this thread is responsible to resync TB.
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 27061583a010..9f4ccdd36224 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -353,7 +353,7 @@ void __init MMU_init_hw(void)
 	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return;
 
-	if ( ppc_md.progress ) ppc_md.progress("hash:enter", 0x105);
+	ppc_md_call_cond(progress)("hash:enter", 0x105);
 
 #define LG_HPTEG_SIZE	6		/* 64 bytes per HPTEG */
 #define SDR1_LOW_BITS	((n_hpteg - 1) >> 10)
@@ -377,7 +377,7 @@ void __init MMU_init_hw(void)
 	/*
 	 * Find some memory for the hash table.
 	 */
-	if ( ppc_md.progress ) ppc_md.progress("hash:find piece", 0x322);
+	ppc_md_call_cond(progress)("hash:find piece", 0x322);
 	Hash = memblock_alloc(Hash_size, Hash_size);
 	if (!Hash)
 		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
@@ -402,10 +402,8 @@ void __init MMU_init_hw_patch(void)
 	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return;
 
-	if (ppc_md.progress)
-		ppc_md.progress("hash:patch", 0x345);
-	if (ppc_md.progress)
-		ppc_md.progress("hash:done", 0x205);
+	ppc_md_call_cond(progress)("hash:patch", 0x345);
+	ppc_md_call_cond(progress)("hash:done", 0x205);
 
 	/* WARNING: Make sure nothing can trigger a KASAN check past this point */
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ae20add7954a..aedc3638116f 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -562,7 +562,7 @@ void __init radix__early_init_devtree(void)
 
 	/*
 	 * Max mapping size used when mapping pages. We don't use
-	 * ppc_md.memory_block_size() here because this get called
+	 * ppc_md_call(memory_block_size)() here because this get called
 	 * early and we don't have machine probe called yet. Also
 	 * the pseries implementation only check for ibm,lmb-size.
 	 * All hypervisor supporting radix do expose that device
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index 3d690be48e84..1125be46e645 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -114,8 +114,7 @@ static void __init MMU_setup(void)
  */
 void __init MMU_init(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("MMU:enter", 0x111);
+	ppc_md_call_cond(progress)("MMU:enter", 0x111);
 
 	/* parse args from command line */
 	MMU_setup();
@@ -153,20 +152,17 @@ void __init MMU_init(void)
 	}
 
 	/* Initialize the MMU hardware */
-	if (ppc_md.progress)
-		ppc_md.progress("MMU:hw init", 0x300);
+	ppc_md_call_cond(progress)("MMU:hw init", 0x300);
 	MMU_init_hw();
 
 	/* Map in all of RAM starting at KERNELBASE */
-	if (ppc_md.progress)
-		ppc_md.progress("MMU:mapin", 0x301);
+	ppc_md_call_cond(progress)("MMU:mapin", 0x301);
 	mapin_ram();
 
 	/* Initialize early top-down ioremap allocator */
 	ioremap_bot = IOREMAP_TOP;
 
-	if (ppc_md.progress)
-		ppc_md.progress("MMU:exit", 0x211);
+	ppc_md_call_cond(progress)("MMU:exit", 0x211);
 
 	/* From now on, btext is no longer BAT mapped if it was at all */
 #ifdef CONFIG_BOOTX_TEXT
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index ad198b439222..43fc072f290c 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -34,8 +34,8 @@ EXPORT_SYMBOL(empty_zero_page);
 pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 			      unsigned long size, pgprot_t vma_prot)
 {
-	if (ppc_md.phys_mem_access_prot)
-		return ppc_md.phys_mem_access_prot(file, pfn, size, vma_prot);
+	if (ppc_md_has(phys_mem_access_prot))
+		return ppc_md_call(phys_mem_access_prot)(file, pfn, size, vma_prot);
 
 	if (!page_is_ram(pfn))
 		vma_prot = pgprot_noncached(vma_prot);
@@ -311,7 +311,7 @@ void __init mem_init(void)
 
 void free_initmem(void)
 {
-	ppc_md.progress = ppc_printk_progress;
+	ppc_md_update(progress, ppc_printk_progress);
 	mark_initmem_nx();
 	init_mem_is_free = true;
 	free_initmem_default(POISON_FREE_INITMEM);
diff --git a/arch/powerpc/platforms/44x/idle.c b/arch/powerpc/platforms/44x/idle.c
index f533b495e7db..f370dc8d655b 100644
--- a/arch/powerpc/platforms/44x/idle.c
+++ b/arch/powerpc/platforms/44x/idle.c
@@ -32,7 +32,7 @@ int __init ppc44x_idle_init(void)
 	if (!mode_spin) {
 		/* If we are not setting spin mode 
                    then we set to wait mode */
-		ppc_md.power_save = &ppc44x_idle;
+		ppc_md_update(power_save, &ppc44x_idle);
 	}
 
 	return 0;
@@ -45,7 +45,7 @@ static int __init idle_param(char *p)
 
 	if (!strcmp("spin", p)) {
 		mode_spin = 1;
-		ppc_md.power_save = NULL;
+		ppc_md_update(power_save, NULL);
 	}
 
 	return 0;
diff --git a/arch/powerpc/platforms/44x/iss4xx.c b/arch/powerpc/platforms/44x/iss4xx.c
index c5f82591408c..37cc6551f0d4 100644
--- a/arch/powerpc/platforms/44x/iss4xx.c
+++ b/arch/powerpc/platforms/44x/iss4xx.c
@@ -61,7 +61,7 @@ static void __init iss4xx_init_irq(void)
 	/* Check type and do appropriate initialization */
 	if (of_device_is_compatible(np, "ibm,uic")) {
 		uic_init_tree();
-		ppc_md.get_irq = uic_get_irq;
+		ppc_md_update(get_irq, uic_get_irq);
 #ifdef CONFIG_MPIC
 	} else if (of_device_is_compatible(np, "chrp,open-pic")) {
 		/* The MPIC driver will get everything it needs from the
@@ -70,7 +70,7 @@ static void __init iss4xx_init_irq(void)
 		struct mpic *mpic = mpic_alloc(np, 0, MPIC_NO_RESET, 0, 0, " MPIC     ");
 		BUG_ON(mpic == NULL);
 		mpic_init(mpic);
-		ppc_md.get_irq = mpic_get_irq;
+		ppc_md_update(get_irq, mpic_get_irq);
 #endif
 	} else
 		panic("Unrecognized top level interrupt controller");
diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index 07f7e3ce67b5..f905bed1dadf 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -89,7 +89,7 @@ static void __noreturn avr_reset_system(char *cmd)
 static int avr_probe(struct i2c_client *client)
 {
 	avr_i2c_client = client;
-	ppc_md.restart = avr_reset_system;
+	ppc_md_update(restart, avr_reset_system);
 	pm_power_off = avr_power_off_system;
 	return 0;
 }
@@ -137,7 +137,7 @@ static void __init ppc47x_init_irq(void)
 			mpic_alloc(np, 0, MPIC_NO_RESET, 0, 0, " MPIC     ");
 		BUG_ON(mpic == NULL);
 		mpic_init(mpic);
-		ppc_md.get_irq = mpic_get_irq;
+		ppc_md_update(get_irq, mpic_get_irq);
 	} else
 		panic("Unrecognized top level interrupt controller");
 }
@@ -275,7 +275,7 @@ static int __init ppc47x_probe(void)
 		return 1;
 
 	if (of_machine_is_compatible("ibm,currituck")) {
-		ppc_md.pci_irq_fixup = ppc47x_pci_irq_fixup;
+		ppc_md_update(pci_irq_fixup, ppc47x_pci_irq_fixup);
 		return 1;
 	}
 
diff --git a/arch/powerpc/platforms/4xx/cpm.c b/arch/powerpc/platforms/4xx/cpm.c
index ae8b812c9202..32bf994e877a 100644
--- a/arch/powerpc/platforms/4xx/cpm.c
+++ b/arch/powerpc/platforms/4xx/cpm.c
@@ -251,7 +251,7 @@ static int __init cpm_init(void)
 
 	if (!cpm.powersave_off) {
 		cpm_idle_config(CPM_IDLE_WAIT);
-		ppc_md.power_save = &cpm_idle;
+		ppc_md_update(power_save, &cpm_idle);
 	}
 
 	np = of_find_compatible_node(NULL, NULL, "ibm,cpm");
diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
index 3b7d70d71692..c3f43da64f68 100644
--- a/arch/powerpc/platforms/52xx/efika.c
+++ b/arch/powerpc/platforms/52xx/efika.c
@@ -190,8 +190,7 @@ static void __init efika_setup_arch(void)
 	mpc52xx_pm_init();
 #endif
 
-	if (ppc_md.progress)
-		ppc_md.progress("Linux/PPC " UTS_RELEASE " running on Efika ;-)\n", 0x0);
+	ppc_md_call_cond(progress)("Linux/PPC " UTS_RELEASE " running on Efika ;-)\n", 0x0);
 }
 
 static int __init efika_probe(void)
diff --git a/arch/powerpc/platforms/52xx/lite5200.c b/arch/powerpc/platforms/52xx/lite5200.c
index 04cc97397095..c39601b995f6 100644
--- a/arch/powerpc/platforms/52xx/lite5200.c
+++ b/arch/powerpc/platforms/52xx/lite5200.c
@@ -147,8 +147,7 @@ static void lite5200_resume_finish(void __iomem *mbar)
 
 static void __init lite5200_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("lite5200_setup_arch()", 0);
+	ppc_md_call_cond(progress)("lite5200_setup_arch()", 0);
 
 	/* Map important registers from the internal memory map */
 	mpc52xx_map_common_devices();
diff --git a/arch/powerpc/platforms/52xx/media5200.c b/arch/powerpc/platforms/52xx/media5200.c
index 110c444f4bc7..dbf32604f1f6 100644
--- a/arch/powerpc/platforms/52xx/media5200.c
+++ b/arch/powerpc/platforms/52xx/media5200.c
@@ -192,8 +192,7 @@ static void __init media5200_setup_arch(void)
 	struct mpc52xx_gpio __iomem *gpio;
 	u32 port_config;
 
-	if (ppc_md.progress)
-		ppc_md.progress("media5200_setup_arch()", 0);
+	ppc_md_call_cond(progress)("media5200_setup_arch()", 0);
 
 	/* Map important registers from the internal memory map */
 	mpc52xx_map_common_devices();
diff --git a/arch/powerpc/platforms/52xx/mpc5200_simple.c b/arch/powerpc/platforms/52xx/mpc5200_simple.c
index b9f5675b0a1d..18eb74a323ec 100644
--- a/arch/powerpc/platforms/52xx/mpc5200_simple.c
+++ b/arch/powerpc/platforms/52xx/mpc5200_simple.c
@@ -32,8 +32,7 @@
  */
 static void __init mpc5200_simple_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc5200_simple_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mpc5200_simple_setup_arch()", 0);
 
 	/* Map important registers from the internal memory map */
 	mpc52xx_map_common_devices();
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pci.c b/arch/powerpc/platforms/52xx/mpc52xx_pci.c
index af0f79995214..2c49c6caf81f 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_pci.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_pci.c
@@ -110,8 +110,8 @@ mpc52xx_pci_read_config(struct pci_bus *bus, unsigned int devfn,
 	struct pci_controller *hose = pci_bus_to_host(bus);
 	u32 value;
 
-	if (ppc_md.pci_exclude_device)
-		if (ppc_md.pci_exclude_device(hose, bus->number, devfn))
+	if (ppc_md_has(pci_exclude_device))
+		if (ppc_md_call(pci_exclude_device)(hose, bus->number, devfn))
 			return PCIBIOS_DEVICE_NOT_FOUND;
 
 	out_be32(hose->cfg_addr,
@@ -167,8 +167,8 @@ mpc52xx_pci_write_config(struct pci_bus *bus, unsigned int devfn,
 	struct pci_controller *hose = pci_bus_to_host(bus);
 	u32 value, mask;
 
-	if (ppc_md.pci_exclude_device)
-		if (ppc_md.pci_exclude_device(hose, bus->number, devfn))
+	if (ppc_md_has(pci_exclude_device))
+		if (ppc_md_call(pci_exclude_device)(hose, bus->number, devfn))
 			return PCIBIOS_DEVICE_NOT_FOUND;
 
 	out_be32(hose->cfg_addr,
@@ -387,7 +387,7 @@ mpc52xx_add_bridge(struct device_node *node)
 
 	/* There are some PCI quirks on the 52xx, register the hook to
 	 * fix them. */
-	ppc_md.pcibios_fixup_resources = mpc52xx_pci_fixup_resources;
+	ppc_md_update(pcibios_fixup_resources, mpc52xx_pci_fixup_resources);
 
 	/* Alloc and initialize the pci controller.  Values in the device
 	 * tree are needed to configure the 52xx PCI controller.  Rather
diff --git a/arch/powerpc/platforms/82xx/ep8248e.c b/arch/powerpc/platforms/82xx/ep8248e.c
index 369ebb1b7af1..3ca47f8a212e 100644
--- a/arch/powerpc/platforms/82xx/ep8248e.c
+++ b/arch/powerpc/platforms/82xx/ep8248e.c
@@ -250,8 +250,7 @@ static void __init init_ioports(void)
 
 static void __init ep8248e_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("ep8248e_setup_arch()", 0);
+	ppc_md_call_cond(progress)("ep8248e_setup_arch()", 0);
 
 	cpm2_reset();
 
@@ -281,8 +280,7 @@ static void __init ep8248e_setup_arch(void)
 
 	init_ioports();
 
-	if (ppc_md.progress)
-		ppc_md.progress("ep8248e_setup_arch(), finish", 0);
+	ppc_md_call_cond(progress)("ep8248e_setup_arch(), finish", 0);
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
diff --git a/arch/powerpc/platforms/82xx/km82xx.c b/arch/powerpc/platforms/82xx/km82xx.c
index 745ed61df5d8..31fd4a5be0ee 100644
--- a/arch/powerpc/platforms/82xx/km82xx.c
+++ b/arch/powerpc/platforms/82xx/km82xx.c
@@ -160,8 +160,7 @@ static void __init init_ioports(void)
 
 static void __init km82xx_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("km82xx_setup_arch()", 0);
+	ppc_md_call_cond(progress)("km82xx_setup_arch()", 0);
 
 	cpm2_reset();
 
@@ -172,8 +171,7 @@ static void __init km82xx_setup_arch(void)
 
 	init_ioports();
 
-	if (ppc_md.progress)
-		ppc_md.progress("km82xx_setup_arch(), finish", 0);
+	ppc_md_call_cond(progress)("km82xx_setup_arch(), finish", 0);
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
diff --git a/arch/powerpc/platforms/82xx/mpc8272_ads.c b/arch/powerpc/platforms/82xx/mpc8272_ads.c
index 0b5b9dec16d5..deacb2fa84f4 100644
--- a/arch/powerpc/platforms/82xx/mpc8272_ads.c
+++ b/arch/powerpc/platforms/82xx/mpc8272_ads.c
@@ -134,8 +134,7 @@ static void __init mpc8272_ads_setup_arch(void)
 	struct device_node *np;
 	__be32 __iomem *bcsr;
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc8272_ads_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mpc8272_ads_setup_arch()", 0);
 
 	cpm2_reset();
 
@@ -172,8 +171,7 @@ static void __init mpc8272_ads_setup_arch(void)
 
 	init_ioports();
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc8272_ads_setup_arch(), finish", 0);
+	ppc_md_call_cond(progress)("mpc8272_ads_setup_arch(), finish", 0);
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
diff --git a/arch/powerpc/platforms/82xx/pq2.c b/arch/powerpc/platforms/82xx/pq2.c
index 3b5cb39a564c..fee7ea4519df 100644
--- a/arch/powerpc/platforms/82xx/pq2.c
+++ b/arch/powerpc/platforms/82xx/pq2.c
@@ -72,7 +72,7 @@ void __init pq2_init_pci(void)
 {
 	struct device_node *np;
 
-	ppc_md.pci_exclude_device = pq2_pci_exclude_device;
+	ppc_md_update(pci_exclude_device, pq2_pci_exclude_device);
 
 	for_each_compatible_node(np, NULL, "fsl,pq2-pci")
 		pq2_pci_add_bridge(np);
diff --git a/arch/powerpc/platforms/82xx/pq2fads.c b/arch/powerpc/platforms/82xx/pq2fads.c
index ac9113d524af..794349c53f59 100644
--- a/arch/powerpc/platforms/82xx/pq2fads.c
+++ b/arch/powerpc/platforms/82xx/pq2fads.c
@@ -117,8 +117,7 @@ static void __init pq2fads_setup_arch(void)
 	struct device_node *np;
 	__be32 __iomem *bcsr;
 
-	if (ppc_md.progress)
-		ppc_md.progress("pq2fads_setup_arch()", 0);
+	ppc_md_call_cond(progress)("pq2fads_setup_arch()", 0);
 
 	cpm2_reset();
 
@@ -150,8 +149,7 @@ static void __init pq2fads_setup_arch(void)
 	/* Enable external IRQs */
 	clrbits32(&cpm2_immr->im_siu_conf.siu_82xx.sc_siumcr, 0x0c000000);
 
-	if (ppc_md.progress)
-		ppc_md.progress("pq2fads_setup_arch(), finish", 0);
+	ppc_md_call_cond(progress)("pq2fads_setup_arch(), finish", 0);
 }
 
 /*
diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index 3285dabcf923..e9e671ff68a4 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -121,8 +121,7 @@ void __init mpc83xx_setup_pci(void)
 
 void __init mpc83xx_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc83xx_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mpc83xx_setup_arch()", 0);
 
 	if (!__map_without_bats) {
 		phys_addr_t immrbase = get_immrbase();
diff --git a/arch/powerpc/platforms/85xx/bsc913x_qds.c b/arch/powerpc/platforms/85xx/bsc913x_qds.c
index bcbbeb5a972a..bad1423d012d 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_qds.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_qds.c
@@ -36,8 +36,7 @@ void __init bsc913x_qds_pic_init(void)
  */
 static void __init bsc913x_qds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("bsc913x_qds_setup_arch()", 0);
+	ppc_md_call_cond(progress)("bsc913x_qds_setup_arch()", 0);
 
 #if defined(CONFIG_SMP)
 	mpc85xx_smp_init();
diff --git a/arch/powerpc/platforms/85xx/bsc913x_rdb.c b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
index f78e5d3deedb..6dc34569a940 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_rdb.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
@@ -32,8 +32,7 @@ void __init bsc913x_rdb_pic_init(void)
  */
 static void __init bsc913x_rdb_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("bsc913x_rdb_setup_arch()", 0);
+	ppc_md_call_cond(progress)("bsc913x_rdb_setup_arch()", 0);
 
 	pr_info("bsc913x board from Freescale Semiconductor\n");
 }
diff --git a/arch/powerpc/platforms/85xx/c293pcie.c b/arch/powerpc/platforms/85xx/c293pcie.c
index 8d9a2503dd0f..8c59eeb92507 100644
--- a/arch/powerpc/platforms/85xx/c293pcie.c
+++ b/arch/powerpc/platforms/85xx/c293pcie.c
@@ -35,8 +35,7 @@ void __init c293_pcie_pic_init(void)
  */
 static void __init c293_pcie_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("c293_pcie_setup_arch()", 0);
+	ppc_md_call_cond(progress)("c293_pcie_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index 17ae75d62518..f2da4d23da23 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -157,12 +157,12 @@ static int __init corenet_generic_probe(void)
 	for (i = 0; boards[i]; i++) {
 		snprintf(hv_compat, sizeof(hv_compat), "%s-hv", boards[i]);
 		if (of_machine_is_compatible(hv_compat)) {
-			ppc_md.init_IRQ = ehv_pic_init;
+			ppc_md_update(init_IRQ, ehv_pic_init);
 
-			ppc_md.get_irq = ehv_pic_get_irq;
-			ppc_md.restart = fsl_hv_restart;
+			ppc_md_update(get_irq, ehv_pic_get_irq);
+			ppc_md_update(restart, fsl_hv_restart);
 			pm_power_off = fsl_hv_halt;
-			ppc_md.halt = fsl_hv_halt;
+			ppc_md_update(halt, fsl_hv_halt);
 #ifdef CONFIG_SMP
 			/*
 			 * Disable the timebase sync operations because we
diff --git a/arch/powerpc/platforms/85xx/ge_imp3a.c b/arch/powerpc/platforms/85xx/ge_imp3a.c
index 83a0f7a1f0de..24a16c29c4a5 100644
--- a/arch/powerpc/platforms/85xx/ge_imp3a.c
+++ b/arch/powerpc/platforms/85xx/ge_imp3a.c
@@ -103,8 +103,7 @@ static void __init ge_imp3a_setup_arch(void)
 {
 	struct device_node *regs;
 
-	if (ppc_md.progress)
-		ppc_md.progress("ge_imp3a_setup_arch()", 0);
+	ppc_md_call_cond(progress)("ge_imp3a_setup_arch()", 0);
 
 	mpc85xx_smp_init();
 
diff --git a/arch/powerpc/platforms/85xx/ksi8560.c b/arch/powerpc/platforms/85xx/ksi8560.c
index 6ef8580fdc0e..67b6cdad925b 100644
--- a/arch/powerpc/platforms/85xx/ksi8560.c
+++ b/arch/powerpc/platforms/85xx/ksi8560.c
@@ -134,8 +134,7 @@ static void __init ksi8560_setup_arch(void)
 	else
 		printk(KERN_ERR "Can't find CPLD in device tree\n");
 
-	if (ppc_md.progress)
-		ppc_md.progress("ksi8560_setup_arch()", 0);
+	ppc_md_call_cond(progress)("ksi8560_setup_arch()", 0);
 
 #ifdef CONFIG_CPM2
 	cpm2_reset();
diff --git a/arch/powerpc/platforms/85xx/mpc8536_ds.c b/arch/powerpc/platforms/85xx/mpc8536_ds.c
index 53bccb8bbcbe..78ce62e645e6 100644
--- a/arch/powerpc/platforms/85xx/mpc8536_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc8536_ds.c
@@ -41,8 +41,7 @@ void __init mpc8536_ds_pic_init(void)
  */
 static void __init mpc8536_ds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc8536_ds_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mpc8536_ds_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ads.c b/arch/powerpc/platforms/85xx/mpc85xx_ads.c
index a34fc037957d..e1d24b78725b 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ads.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ads.c
@@ -122,8 +122,7 @@ static void __init init_ioports(void)
 
 static void __init mpc85xx_ads_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_ads_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mpc85xx_ads_setup_arch()", 0);
 
 #ifdef CONFIG_CPM2
 	cpm2_reset();
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index 172d2b7cfeb7..bc7bdf0cab6e 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -317,8 +317,7 @@ static void __init mpc85xx_cds_setup_arch(void)
 	struct device_node *np;
 	int cds_pci_slot;
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_cds_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mpc85xx_cds_setup_arch()", 0);
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,mpc8548cds-fpga");
 	if (!np) {
@@ -333,17 +332,17 @@ static void __init mpc85xx_cds_setup_arch(void)
 		return;
 	}
 
-	if (ppc_md.progress) {
+	if (ppc_md_has(progress)) {
 		char buf[40];
 		cds_pci_slot = ((in_8(&cadmus->cm_csr) >> 6) & 0x3) + 1;
 		snprintf(buf, 40, "CDS Version = 0x%x in slot %d\n",
 				in_8(&cadmus->cm_ver), cds_pci_slot);
-		ppc_md.progress(buf, 0);
+		ppc_md_call(progress)(buf, 0);
 	}
 
 #ifdef CONFIG_PCI
-	ppc_md.pci_irq_fixup = mpc85xx_cds_pci_irq_fixup;
-	ppc_md.pci_exclude_device = mpc85xx_exclude_device;
+	ppc_md_update(pci_irq_fixup, mpc85xx_cds_pci_irq_fixup);
+	ppc_md_update(pci_exclude_device, mpc85xx_exclude_device);
 #endif
 
 	mpc85xx_cds_pci_assign_primary();
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 2157a8017aa4..960203bd83cd 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -135,7 +135,7 @@ static void __init mpc85xx_ds_uli_init(void)
 		node = pci_with_uli;
 
 		if (pci_with_uli == fsl_pci_primary) {
-			ppc_md.pci_exclude_device = mpc85xx_exclude_device;
+			ppc_md_update(pci_exclude_device, mpc85xx_exclude_device);
 			break;
 		}
 	}
@@ -147,8 +147,7 @@ static void __init mpc85xx_ds_uli_init(void)
  */
 static void __init mpc85xx_ds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_ds_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mpc85xx_ds_setup_arch()", 0);
 
 	swiotlb_detect_4g();
 	fsl_pci_assign_primary();
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
index 7759eca7d535..a74c1e9520f7 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@ -273,8 +273,7 @@ static void __init mpc85xx_mds_qe_init(void) { }
 
 static void __init mpc85xx_mds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_mds_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mpc85xx_mds_setup_arch()", 0);
 
 	mpc85xx_smp_init();
 
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index 80a80174768c..14cad0505d82 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -64,8 +64,7 @@ void __init mpc85xx_rdb_pic_init(void)
  */
 static void __init mpc85xx_rdb_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_rdb_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mpc85xx_rdb_setup_arch()", 0);
 
 	mpc85xx_smp_init();
 
diff --git a/arch/powerpc/platforms/85xx/mvme2500.c b/arch/powerpc/platforms/85xx/mvme2500.c
index 69d5aa082a4b..1dc98fb60c1a 100644
--- a/arch/powerpc/platforms/85xx/mvme2500.c
+++ b/arch/powerpc/platforms/85xx/mvme2500.c
@@ -35,8 +35,7 @@ void __init mvme2500_pic_init(void)
  */
 static void __init mvme2500_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mvme2500_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mvme2500_setup_arch()", 0);
 	fsl_pci_assign_primary();
 	pr_info("MVME2500 board from Artesyn\n");
 }
diff --git a/arch/powerpc/platforms/85xx/p1010rdb.c b/arch/powerpc/platforms/85xx/p1010rdb.c
index 24855284b14a..7ec9ced12eb3 100644
--- a/arch/powerpc/platforms/85xx/p1010rdb.c
+++ b/arch/powerpc/platforms/85xx/p1010rdb.c
@@ -42,8 +42,7 @@ void __init p1010_rdb_pic_init(void)
  */
 static void __init p1010_rdb_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("p1010_rdb_setup_arch()", 0);
+	ppc_md_call_cond(progress)("p1010_rdb_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 
diff --git a/arch/powerpc/platforms/85xx/p1022_ds.c b/arch/powerpc/platforms/85xx/p1022_ds.c
index 1f1af0557470..0fc89543235d 100644
--- a/arch/powerpc/platforms/85xx/p1022_ds.c
+++ b/arch/powerpc/platforms/85xx/p1022_ds.c
@@ -470,8 +470,7 @@ early_param("video", early_video_setup);
  */
 static void __init p1022_ds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("p1022_ds_setup_arch()", 0);
+	ppc_md_call_cond(progress)("p1022_ds_setup_arch()", 0);
 
 #if defined(CONFIG_FB_FSL_DIU) || defined(CONFIG_FB_FSL_DIU_MODULE)
 	diu_ops.set_monitor_port	= p1022ds_set_monitor_port;
diff --git a/arch/powerpc/platforms/85xx/p1022_rdk.c b/arch/powerpc/platforms/85xx/p1022_rdk.c
index fd9e3e7ef234..c3a9ca9a216b 100644
--- a/arch/powerpc/platforms/85xx/p1022_rdk.c
+++ b/arch/powerpc/platforms/85xx/p1022_rdk.c
@@ -109,8 +109,7 @@ void __init p1022_rdk_pic_init(void)
  */
 static void __init p1022_rdk_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("p1022_rdk_setup_arch()", 0);
+	ppc_md_call_cond(progress)("p1022_rdk_setup_arch()", 0);
 
 #if defined(CONFIG_FB_FSL_DIU) || defined(CONFIG_FB_FSL_DIU_MODULE)
 	diu_ops.set_pixel_clock		= p1022rdk_set_pixel_clock;
diff --git a/arch/powerpc/platforms/85xx/p1023_rdb.c b/arch/powerpc/platforms/85xx/p1023_rdb.c
index 3b9cc4979641..8189838a5343 100644
--- a/arch/powerpc/platforms/85xx/p1023_rdb.c
+++ b/arch/powerpc/platforms/85xx/p1023_rdb.c
@@ -41,8 +41,7 @@ static void __init mpc85xx_rdb_setup_arch(void)
 {
 	struct device_node *np;
 
-	if (ppc_md.progress)
-		ppc_md.progress("p1023_rdb_setup_arch()", 0);
+	ppc_md_call_cond(progress)("p1023_rdb_setup_arch()", 0);
 
 	/* Map BCSR area */
 	np = of_find_node_by_name(NULL, "bcsr");
diff --git a/arch/powerpc/platforms/85xx/ppa8548.c b/arch/powerpc/platforms/85xx/ppa8548.c
index 0faf2990bf2c..70df147419fa 100644
--- a/arch/powerpc/platforms/85xx/ppa8548.c
+++ b/arch/powerpc/platforms/85xx/ppa8548.c
@@ -37,8 +37,7 @@ static void __init ppa8548_pic_init(void)
  */
 static void __init ppa8548_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("ppa8548_setup_arch()", 0);
+	ppc_md_call_cond(progress)("ppa8548_setup_arch()", 0);
 }
 
 static void ppa8548_show_cpuinfo(struct seq_file *m)
diff --git a/arch/powerpc/platforms/85xx/qemu_e500.c b/arch/powerpc/platforms/85xx/qemu_e500.c
index a4127b0b161f..873a27a384a3 100644
--- a/arch/powerpc/platforms/85xx/qemu_e500.c
+++ b/arch/powerpc/platforms/85xx/qemu_e500.c
@@ -38,7 +38,7 @@ void __init qemu_e500_pic_init(void)
 
 static void __init qemu_e500_setup_arch(void)
 {
-	ppc_md.progress("qemu_e500_setup_arch()", 0);
+	ppc_md_call_cond(progress)("qemu_e500_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 	swiotlb_detect_4g();
diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/platforms/85xx/sgy_cts1000.c
index 98ae64075193..e70d040fd769 100644
--- a/arch/powerpc/platforms/85xx/sgy_cts1000.c
+++ b/arch/powerpc/platforms/85xx/sgy_cts1000.c
@@ -117,7 +117,7 @@ static int gpio_halt_probe(struct platform_device *pdev)
 	}
 
 	/* Register our halt function */
-	ppc_md.halt = gpio_halt_cb;
+	ppc_md_update(halt, gpio_halt_cb);
 	pm_power_off = gpio_halt_cb;
 
 	printk(KERN_INFO "gpio-halt: registered GPIO %d (%d trigger, %d"
@@ -134,7 +134,7 @@ static int gpio_halt_remove(struct platform_device *pdev)
 
 		free_irq(irq, halt_node);
 
-		ppc_md.halt = NULL;
+		ppc_md_update(halt, NULL);
 		pm_power_off = NULL;
 
 		gpio_free(gpio);
diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index c6df294054fe..ad57821e40df 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -380,8 +380,7 @@ void mpc85xx_smp_kexec_cpu_down(int crash_shutdown, int secondary)
 
 static void mpc85xx_smp_kexec_down(void *arg)
 {
-	if (ppc_md.kexec_cpu_down)
-		ppc_md.kexec_cpu_down(0,1);
+	ppc_md_call_cond(kexec_cpu_down)(0,1);
 }
 #else
 void mpc85xx_smp_kexec_cpu_down(int crash_shutdown, int secondary)
@@ -513,7 +512,7 @@ void __init mpc85xx_smp_init(void)
 	smp_ops = &smp_85xx_ops;
 
 #ifdef CONFIG_KEXEC_CORE
-	ppc_md.kexec_cpu_down = mpc85xx_smp_kexec_cpu_down;
-	ppc_md.machine_kexec = mpc85xx_smp_machine_kexec;
+	ppc_md_update(kexec_cpu_down, mpc85xx_smp_kexec_cpu_down);
+	ppc_md_update(machine_kexec, mpc85xx_smp_machine_kexec);
 #endif
 }
diff --git a/arch/powerpc/platforms/85xx/socrates.c b/arch/powerpc/platforms/85xx/socrates.c
index 166b3515ba73..8bdd925f936c 100644
--- a/arch/powerpc/platforms/85xx/socrates.c
+++ b/arch/powerpc/platforms/85xx/socrates.c
@@ -62,8 +62,7 @@ static void __init socrates_pic_init(void)
  */
 static void __init socrates_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("socrates_setup_arch()", 0);
+	ppc_md_call_cond(progress)("socrates_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 }
diff --git a/arch/powerpc/platforms/85xx/stx_gp3.c b/arch/powerpc/platforms/85xx/stx_gp3.c
index 69e917e3ba1c..1d943461955e 100644
--- a/arch/powerpc/platforms/85xx/stx_gp3.c
+++ b/arch/powerpc/platforms/85xx/stx_gp3.c
@@ -56,8 +56,7 @@ static void __init stx_gp3_pic_init(void)
  */
 static void __init stx_gp3_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("stx_gp3_setup_arch()", 0);
+	ppc_md_call_cond(progress)("stx_gp3_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 
diff --git a/arch/powerpc/platforms/85xx/tqm85xx.c b/arch/powerpc/platforms/85xx/tqm85xx.c
index 95a1a1118a31..70c1ec342092 100644
--- a/arch/powerpc/platforms/85xx/tqm85xx.c
+++ b/arch/powerpc/platforms/85xx/tqm85xx.c
@@ -55,8 +55,7 @@ static void __init tqm85xx_pic_init(void)
  */
 static void __init tqm85xx_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("tqm85xx_setup_arch()", 0);
+	ppc_md_call_cond(progress)("tqm85xx_setup_arch()", 0);
 
 #ifdef CONFIG_CPM2
 	cpm2_reset();
diff --git a/arch/powerpc/platforms/85xx/twr_p102x.c b/arch/powerpc/platforms/85xx/twr_p102x.c
index eaec099b4077..03d76552aa19 100644
--- a/arch/powerpc/platforms/85xx/twr_p102x.c
+++ b/arch/powerpc/platforms/85xx/twr_p102x.c
@@ -45,8 +45,7 @@ static void __init twr_p1025_pic_init(void)
  */
 static void __init twr_p1025_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("twr_p1025_setup_arch()", 0);
+	ppc_md_call_cond(progress)("twr_p1025_setup_arch()", 0);
 
 	mpc85xx_smp_init();
 
diff --git a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
index 7733d0607da2..f3aa916ace73 100644
--- a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
+++ b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
@@ -275,8 +275,7 @@ static void __init mpc86xx_hpcd_setup_arch(void)
 	struct resource r;
 	unsigned char *pixis;
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc86xx_hpcd_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mpc86xx_hpcd_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
index a6b8ffcbf01a..caa47e2c9313 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
@@ -57,11 +57,10 @@ static int mpc86xx_exclude_device(struct pci_controller *hose,
 static void __init
 mpc86xx_hpcn_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc86xx_hpcn_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mpc86xx_hpcn_setup_arch()", 0);
 
 #ifdef CONFIG_PCI
-	ppc_md.pci_exclude_device = mpc86xx_exclude_device;
+	ppc_md_update(pci_exclude_device, mpc86xx_exclude_device);
 #endif
 
 	printk("MPC86xx HPCN board from Freescale Semiconductor\n");
diff --git a/arch/powerpc/platforms/86xx/mvme7100.c b/arch/powerpc/platforms/86xx/mvme7100.c
index ee983613570c..c6af6e333e2e 100644
--- a/arch/powerpc/platforms/86xx/mvme7100.c
+++ b/arch/powerpc/platforms/86xx/mvme7100.c
@@ -42,8 +42,7 @@ static void __init mvme7100_setup_arch(void)
 	void __iomem *mvme7100_regs = NULL;
 	u8 reg;
 
-	if (ppc_md.progress)
-		ppc_md.progress("mvme7100_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mvme7100_setup_arch()", 0);
 
 #ifdef CONFIG_SMP
 	mpc86xx_smp_init();
diff --git a/arch/powerpc/platforms/amigaone/setup.c b/arch/powerpc/platforms/amigaone/setup.c
index 9d252c554f7f..dc09a0d99e43 100644
--- a/arch/powerpc/platforms/amigaone/setup.c
+++ b/arch/powerpc/platforms/amigaone/setup.c
@@ -66,8 +66,7 @@ static int __init amigaone_add_bridge(struct device_node *dev)
 
 void __init amigaone_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("Linux/PPC "UTS_RELEASE"\n", 0);
+	ppc_md_call_cond(progress)("Linux/PPC "UTS_RELEASE"\n", 0);
 }
 
 static void __init amigaone_discover_phbs(void)
@@ -107,7 +106,7 @@ void __init amigaone_init_IRQ(void)
 		       " address, polling\n");
 
 	i8259_init(pic, int_ack);
-	ppc_md.get_irq = i8259_irq;
+	ppc_md_update(get_irq, i8259_irq);
 	irq_set_default_host(i8259_get_host());
 }
 
diff --git a/arch/powerpc/platforms/cell/interrupt.c b/arch/powerpc/platforms/cell/interrupt.c
index 0873a7a20271..ee95af4585fc 100644
--- a/arch/powerpc/platforms/cell/interrupt.c
+++ b/arch/powerpc/platforms/cell/interrupt.c
@@ -366,7 +366,7 @@ void __init iic_init_IRQ(void)
 		panic("IIC: Failed to initialize !\n");
 
 	/* Set master interrupt handling function */
-	ppc_md.get_irq = iic_get_irq;
+	ppc_md_update(get_irq, iic_get_irq);
 
 	/* Enable on current CPU */
 	iic_setup_cpu();
diff --git a/arch/powerpc/platforms/cell/pervasive.c b/arch/powerpc/platforms/cell/pervasive.c
index 5b9a7e9f144b..277351f72b87 100644
--- a/arch/powerpc/platforms/cell/pervasive.c
+++ b/arch/powerpc/platforms/cell/pervasive.c
@@ -120,6 +120,6 @@ void __init cbe_pervasive_init(void)
 					    CBE_PMD_PAUSE_ZERO_CONTROL);
 	}
 
-	ppc_md.power_save = cbe_power_save;
-	ppc_md.system_reset_exception = cbe_system_reset_exception;
+	ppc_md_update(power_save, cbe_power_save);
+	ppc_md_update(system_reset_exception, cbe_system_reset_exception);
 }
diff --git a/arch/powerpc/platforms/cell/ras.c b/arch/powerpc/platforms/cell/ras.c
index 4325c05bedd9..46f89f8d960b 100644
--- a/arch/powerpc/platforms/cell/ras.c
+++ b/arch/powerpc/platforms/cell/ras.c
@@ -341,7 +341,7 @@ void __init cbe_ras_init(void)
 	 * Install machine check handler. Leave setting of precise mode to
 	 * what the firmware did for now
 	 */
-	ppc_md.machine_check_exception = cbe_machine_check_handler;
+	ppc_md_update(machine_check_exception, cbe_machine_check_handler);
 	mb();
 
 	/*
diff --git a/arch/powerpc/platforms/chrp/nvram.c b/arch/powerpc/platforms/chrp/nvram.c
index e820332b59a0..931738ac7560 100644
--- a/arch/powerpc/platforms/chrp/nvram.c
+++ b/arch/powerpc/platforms/chrp/nvram.c
@@ -85,9 +85,9 @@ void __init chrp_nvram_init(void)
 	printk(KERN_INFO "CHRP nvram contains %u bytes\n", nvram_size);
 	of_node_put(nvram);
 
-	ppc_md.nvram_read_val  = chrp_nvram_read_val;
-	ppc_md.nvram_write_val = chrp_nvram_write_val;
-	ppc_md.nvram_size      = chrp_nvram_size;
+	ppc_md_update(nvram_read_val, chrp_nvram_read_val);
+	ppc_md_update(nvram_write_val, chrp_nvram_write_val);
+	ppc_md_update(nvram_size, chrp_nvram_size);
 
 	return;
 }
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index 3cfc382841e5..6fad19201f5b 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -312,7 +312,7 @@ static void __init chrp_setup_arch(void)
 		_chrp_type = _CHRP_briq;
 		/* Map the SPOR register on briq and change the restart hook */
 		briq_SPOR = ioremap(0xff0000e8, 4);
-		ppc_md.restart = briq_restart;
+		ppc_md_update(restart, briq_restart);
 	} else {
 		/* Let's assume it is an IBM chrp if all else fails */
 		_chrp_type = _CHRP_IBM;
@@ -322,13 +322,13 @@ static void __init chrp_setup_arch(void)
 
 	rtas_initialize();
 	if (rtas_token("display-character") >= 0)
-		ppc_md.progress = rtas_progress;
+		ppc_md_update(progress, rtas_progress);
 
 	/* use RTAS time-of-day routines if available */
 	if (rtas_token("get-time-of-day") != RTAS_UNKNOWN_SERVICE) {
-		ppc_md.get_boot_time	= rtas_get_boot_time;
-		ppc_md.get_rtc_time	= rtas_get_rtc_time;
-		ppc_md.set_rtc_time	= rtas_set_rtc_time;
+		ppc_md_update(get_boot_time, rtas_get_boot_time);
+		ppc_md_update(get_rtc_time, rtas_get_rtc_time);
+		ppc_md_update(set_rtc_time, rtas_set_rtc_time);
 	}
 
 	/* On pegasos, enable the L2 cache if not already done by OF */
@@ -343,7 +343,7 @@ static void __init chrp_setup_arch(void)
 	 * Print the banner, then scroll down so boot progress
 	 * can be printed.  -- Cort
 	 */
-	if (ppc_md.progress) ppc_md.progress("Linux/PPC "UTS_RELEASE"\n", 0x0);
+	ppc_md_call_cond(progress)("Linux/PPC "UTS_RELEASE"\n", 0x0);
 }
 
 static void chrp_8259_cascade(struct irq_desc *desc)
@@ -433,7 +433,7 @@ static void __init chrp_find_openpic(void)
 	}
 
 	mpic_init(chrp_mpic);
-	ppc_md.get_irq = mpic_get_irq;
+	ppc_md_update(get_irq, mpic_get_irq);
  bail:
 	of_node_put(root);
 	of_node_put(np);
@@ -482,8 +482,8 @@ static void __init chrp_find_8259(void)
 		       " address, polling\n");
 
 	i8259_init(pic, chrp_int_ack);
-	if (ppc_md.get_irq == NULL) {
-		ppc_md.get_irq = i8259_irq;
+	if (!ppc_md_has(get_irq)) {
+		ppc_md_update(get_irq, i8259_irq);
 		irq_set_default_host(i8259_get_host());
 	}
 	if (chrp_mpic != NULL) {
@@ -513,7 +513,7 @@ static void __init chrp_init_IRQ(void)
 #endif /* CONFIG_SMP */
 
 	if (_chrp_type == _CHRP_Pegasos)
-		ppc_md.get_irq        = i8259_irq;
+		ppc_md_update(get_irq, i8259_irq);
 
 #if defined(CONFIG_VT) && defined(CONFIG_INPUT_ADBHID) && defined(CONFIG_XMON)
 	/* see if there is a keyboard in the device tree
@@ -544,8 +544,7 @@ chrp_init2(void)
 	request_region(0x80,0x10,"dma page reg");
 	request_region(0xc0,0x20,"dma2");
 
-	if (ppc_md.progress)
-		ppc_md.progress("  Have fun!    ", 0x7777);
+	ppc_md_call_cond(progress)("  Have fun!    ", 0x7777);
 }
 
 static int __init chrp_probe(void)
diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index 7a85b117f7a4..5dac4067a3a0 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -112,8 +112,7 @@ static void __init holly_init_pci(void)
 {
 	struct device_node *np;
 
-	if (ppc_md.progress)
-		ppc_md.progress("holly_setup_arch():set_bridge", 0);
+	ppc_md_call_cond(progress)("holly_setup_arch():set_bridge", 0);
 
 	/* setup PCI host bridge */
 	holly_remap_bridge();
@@ -122,9 +121,8 @@ static void __init holly_init_pci(void)
 	if (np)
 		tsi108_setup_pci(np, HOLLY_PCI_CFG_PHYS, 1);
 
-	ppc_md.pci_exclude_device = holly_exclude_device;
-	if (ppc_md.progress)
-		ppc_md.progress("tsi108: resources set", 0x100);
+	ppc_md_update(pci_exclude_device, holly_exclude_device);
+	ppc_md_call_cond(progress)("tsi108: resources set", 0x100);
 }
 
 static void __init holly_setup_arch(void)
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index 9eb9abb5bce2..f833624a8532 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -62,16 +62,15 @@ static void __init mpc7448_hpc2_setup_pci(void)
 {
 #ifdef CONFIG_PCI
 	struct device_node *np;
-	if (ppc_md.progress)
-		ppc_md.progress("mpc7448_hpc2_setup_pci():set_bridge", 0);
+
+	ppc_md_call_cond(progress)("mpc7448_hpc2_setup_pci():set_bridge", 0);
 
 	/* setup PCI host bridge */
 	for_each_compatible_node(np, "pci", "tsi108-pci")
 		tsi108_setup_pci(np, MPC7448HPC2_PCI_CFG_PHYS, 0);
 
-	ppc_md.pci_exclude_device = mpc7448_hpc2_exclude_device;
-	if (ppc_md.progress)
-		ppc_md.progress("tsi108: resources set", 0x100);
+	ppc_md_update(pci_exclude_device, mpc7448_hpc2_exclude_device);
+	ppc_md_call_cond(progress)("tsi108: resources set", 0x100);
 #endif
 }
 
diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index c06a0490d157..04a98cb1c53c 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -154,8 +154,7 @@ static const struct of_device_id mvme5100_of_bus_ids[] __initconst = {
  */
 static void __init mvme5100_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mvme5100_setup_arch()", 0);
+	ppc_md_call_cond(progress)("mvme5100_setup_arch()", 0);
 
 	restart = ioremap(BOARD_MODRST_REG, 4);
 }
diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
index a802ef957d63..d8b005d7ef79 100644
--- a/arch/powerpc/platforms/embedded6xx/wii.c
+++ b/arch/powerpc/platforms/embedded6xx/wii.c
@@ -143,8 +143,7 @@ static void wii_power_off(void)
 
 static void __noreturn wii_halt(void)
 {
-	if (ppc_md.restart)
-		ppc_md.restart(NULL);
+	ppc_md_call_cond(restart)(NULL);
 	wii_spin();
 }
 
diff --git a/arch/powerpc/platforms/maple/pci.c b/arch/powerpc/platforms/maple/pci.c
index 37875e478b3a..33a2ad465cfb 100644
--- a/arch/powerpc/platforms/maple/pci.c
+++ b/arch/powerpc/platforms/maple/pci.c
@@ -623,7 +623,7 @@ void __init maple_pci_init(void)
 	if (ht && maple_add_bridge(ht) != 0)
 		of_node_put(ht);
 
-	ppc_md.pcibios_root_bridge_prepare = maple_pci_root_bridge_prepare;
+	ppc_md_update(pcibios_root_bridge_prepare, maple_pci_root_bridge_prepare);
 
 	/* Tell pci.c to not change any resource allocations.  */
 	pci_add_flags(PCI_PROBE_ONLY);
diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index 4e9ad5bf3efb..a60aaa13b265 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -164,9 +164,9 @@ static void __init maple_use_rtas_reboot_and_halt_if_present(void)
 {
 	if (rtas_service_present("system-reboot") &&
 	    rtas_service_present("power-off")) {
-		ppc_md.restart = rtas_restart;
+		ppc_md_update(restart, rtas_restart);
 		pm_power_off = rtas_power_off;
-		ppc_md.halt = rtas_halt;
+		ppc_md_update(halt, rtas_halt);
 	}
 }
 
@@ -260,7 +260,7 @@ static void __init maple_init_IRQ(void)
 
 	/* All ISUs are setup, complete initialization */
 	mpic_init(mpic);
-	ppc_md.get_irq = mpic_get_irq;
+	ppc_md_update(get_irq, mpic_get_irq);
 	of_node_put(mpic_node);
 	of_node_put(root);
 }
diff --git a/arch/powerpc/platforms/microwatt/rng.c b/arch/powerpc/platforms/microwatt/rng.c
index 3d8ee6eb7dad..acc3034565f1 100644
--- a/arch/powerpc/platforms/microwatt/rng.c
+++ b/arch/powerpc/platforms/microwatt/rng.c
@@ -36,7 +36,7 @@ static __init int rng_init(void)
 
 	for (i = 0; i < 10; i++) {
 		if (microwatt_get_random_darn(&val)) {
-			ppc_md.get_random_seed = microwatt_get_random_darn;
+			ppc_md_update(get_random_seed, microwatt_get_random_darn);
 			return 0;
 		}
 	}
diff --git a/arch/powerpc/platforms/pasemi/idle.c b/arch/powerpc/platforms/pasemi/idle.c
index 6087c70ed2ef..676fdec607b1 100644
--- a/arch/powerpc/platforms/pasemi/idle.c
+++ b/arch/powerpc/platforms/pasemi/idle.c
@@ -70,8 +70,8 @@ static int __init pasemi_idle_init(void)
 	current_mode = 0;
 #endif
 
-	ppc_md.system_reset_exception = pasemi_system_reset_exception;
-	ppc_md.power_save = modes[current_mode].entry;
+	ppc_md_update(system_reset_exception, pasemi_system_reset_exception);
+	ppc_md_update(power_save, modes[current_mode].entry);
 	pr_info("Using PA6T idle loop (%s)\n", modes[current_mode].name);
 
 	return 0;
diff --git a/arch/powerpc/platforms/powermac/nvram.c b/arch/powerpc/platforms/powermac/nvram.c
index 853ccc4480e2..2e8224f61743 100644
--- a/arch/powerpc/platforms/powermac/nvram.c
+++ b/arch/powerpc/platforms/powermac/nvram.c
@@ -449,7 +449,7 @@ static void __init lookup_partitions(void)
 		buffer[16] = 0;
 		do {
 			for (i=0;i<16;i++)
-				buffer[i] = ppc_md.nvram_read_val(offset+i);
+				buffer[i] = ppc_md_call(nvram_read_val)(offset+i);
 			if (!strcmp(hdr->name, "common"))
 				nvram_partitions[pmac_nvram_OF] = offset + 0x10;
 			if (!strcmp(hdr->name, "APL,MacOS75")) {
@@ -533,13 +533,13 @@ static int __init core99_nvram_setup(struct device_node *dp, unsigned long addr)
 	for (i=0; i<NVRAM_SIZE; i++)
 		nvram_image[i] = nvram_data[i + core99_bank*NVRAM_SIZE];
 
-	ppc_md.nvram_read_val	= core99_nvram_read_byte;
-	ppc_md.nvram_write_val	= core99_nvram_write_byte;
-	ppc_md.nvram_read	= core99_nvram_read;
-	ppc_md.nvram_write	= core99_nvram_write;
-	ppc_md.nvram_size	= core99_nvram_size;
-	ppc_md.nvram_sync	= core99_nvram_sync;
-	ppc_md.machine_shutdown	= core99_nvram_sync;
+	ppc_md_update(nvram_read_val, core99_nvram_read_byte);
+	ppc_md_update(nvram_write_val, core99_nvram_write_byte);
+	ppc_md_update(nvram_read, core99_nvram_read);
+	ppc_md_update(nvram_write, core99_nvram_write);
+	ppc_md_update(nvram_size, core99_nvram_size);
+	ppc_md_update(nvram_sync, core99_nvram_sync);
+	ppc_md_update(machine_shutdown, core99_nvram_sync);
 	/* 
 	 * Maybe we could be smarter here though making an exclusive list
 	 * of known flash chips is a bit nasty as older OF didn't provide us
@@ -592,27 +592,27 @@ int __init pmac_nvram_init(void)
 	if (machine_is(chrp) && nvram_naddrs == 1) {
 		nvram_data = ioremap(r1.start, s1);
 		nvram_mult = 1;
-		ppc_md.nvram_read_val	= direct_nvram_read_byte;
-		ppc_md.nvram_write_val	= direct_nvram_write_byte;
-		ppc_md.nvram_size	= ppc32_nvram_size;
+		ppc_md_update(nvram_read_val, direct_nvram_read_byte);
+		ppc_md_update(nvram_write_val, direct_nvram_write_byte);
+		ppc_md_update(nvram_size, ppc32_nvram_size);
 	} else if (nvram_naddrs == 1) {
 		nvram_data = ioremap(r1.start, s1);
 		nvram_mult = (s1 + NVRAM_SIZE - 1) / NVRAM_SIZE;
-		ppc_md.nvram_read_val	= direct_nvram_read_byte;
-		ppc_md.nvram_write_val	= direct_nvram_write_byte;
-		ppc_md.nvram_size	= ppc32_nvram_size;
+		ppc_md_update(nvram_read_val, direct_nvram_read_byte);
+		ppc_md_update(nvram_write_val, direct_nvram_write_byte);
+		ppc_md_update(nvram_size, ppc32_nvram_size);
 	} else if (nvram_naddrs == 2) {
 		nvram_addr = ioremap(r1.start, s1);
 		nvram_data = ioremap(r2.start, s2);
-		ppc_md.nvram_read_val	= indirect_nvram_read_byte;
-		ppc_md.nvram_write_val	= indirect_nvram_write_byte;
-		ppc_md.nvram_size	= ppc32_nvram_size;
+		ppc_md_update(nvram_read_val, indirect_nvram_read_byte);
+		ppc_md_update(nvram_write_val, indirect_nvram_write_byte);
+		ppc_md_update(nvram_size, ppc32_nvram_size);
 	} else if (nvram_naddrs == 0 && sys_ctrler == SYS_CTRLER_PMU) {
 #ifdef CONFIG_ADB_PMU
 		nvram_naddrs = -1;
-		ppc_md.nvram_read_val	= pmu_nvram_read_byte;
-		ppc_md.nvram_write_val	= pmu_nvram_write_byte;
-		ppc_md.nvram_size	= ppc32_nvram_size;
+		ppc_md_update(nvram_read_val, pmu_nvram_read_byte);
+		ppc_md_update(nvram_write_val, pmu_nvram_write_byte);
+		ppc_md_update(nvram_size, ppc32_nvram_size);
 #endif /* CONFIG_ADB_PMU */
 	} else {
 		printk(KERN_ERR "Incompatible type of NVRAM\n");
@@ -638,7 +638,7 @@ u8 pmac_xpram_read(int xpaddr)
 	if (offset < 0 || xpaddr < 0 || xpaddr > 0x100)
 		return 0xff;
 
-	return ppc_md.nvram_read_val(xpaddr + offset);
+	return ppc_md_call(nvram_read_val)(xpaddr + offset);
 }
 
 void pmac_xpram_write(int xpaddr, u8 data)
@@ -648,7 +648,7 @@ void pmac_xpram_write(int xpaddr, u8 data)
 	if (offset < 0 || xpaddr < 0 || xpaddr > 0x100)
 		return;
 
-	ppc_md.nvram_write_val(xpaddr + offset, data);
+	ppc_md_call(nvram_write_val)(xpaddr + offset, data);
 }
 
 EXPORT_SYMBOL(pmac_get_partition);
diff --git a/arch/powerpc/platforms/powermac/pci.c b/arch/powerpc/platforms/powermac/pci.c
index e9abe0f2e7f0..b597e7bcb83b 100644
--- a/arch/powerpc/platforms/powermac/pci.c
+++ b/arch/powerpc/platforms/powermac/pci.c
@@ -933,7 +933,7 @@ void __init pmac_pci_init(void)
 	if (ht && pmac_add_bridge(ht) != 0)
 		of_node_put(ht);
 
-	ppc_md.pcibios_root_bridge_prepare = pmac_pci_root_bridge_prepare;
+	ppc_md_update(pcibios_root_bridge_prepare, pmac_pci_root_bridge_prepare);
 	/* pmac_check_ht_link(); */
 
 #else /* CONFIG_PPC64 */
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 4921bccf0376..4fee59f5fcf4 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -286,7 +286,7 @@ static void __init pmac_pic_probe_oldstyle(void)
 	struct resource r;
 
 	/* Set our get_irq function */
-	ppc_md.get_irq = pmac_pic_get_irq;
+	ppc_md_update(get_irq, pmac_pic_get_irq);
 
 	/*
 	 * Find the interrupt controller type & node
@@ -497,7 +497,7 @@ static int __init pmac_pic_probe_mpic(void)
 		return -ENODEV;
 
 	/* Set master handler */
-	ppc_md.get_irq = mpic_get_irq;
+	ppc_md_update(get_irq, mpic_get_irq);
 
 	/* Setup master */
 	mpic1 = pmac_setup_one_mpic(master, 1);
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 3256a316e884..ed449573b0b0 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -246,7 +246,7 @@ static void __init psurge_quad_init(void)
 {
 	int procbits;
 
-	if (ppc_md.progress) ppc_md.progress("psurge_quad_init", 0x351);
+	ppc_md_call_cond(progress)("psurge_quad_init", 0x351);
 	procbits = ~PSURGE_QUAD_IN(PSURGE_QUAD_WHICH_CPU);
 	if (psurge_type == PSURGE_QUAD_ICEGRASS)
 		PSURGE_QUAD_BIS(PSURGE_QUAD_RESET_CTL, procbits);
@@ -325,7 +325,7 @@ static void __init smp_psurge_probe(void)
 	for (i = 1; i < ncpus ; ++i)
 		set_cpu_present(i, true);
 
-	if (ppc_md.progress) ppc_md.progress("smp_psurge_probe - done", 0x352);
+	ppc_md_call_cond(progress)("smp_psurge_probe - done", 0x352);
 }
 
 static int __init smp_psurge_kick_cpu(int nr)
@@ -345,7 +345,7 @@ static int __init smp_psurge_kick_cpu(int nr)
 		asm volatile("dcbf 0,%0" : : "r" (a) : "memory");
 	asm volatile("sync");
 
-	if (ppc_md.progress) ppc_md.progress("smp_psurge_kick_cpu", 0x353);
+	ppc_md_call_cond(progress)("smp_psurge_kick_cpu", 0x353);
 
 	/* This is going to freeze the timeebase, we disable interrupts */
 	local_irq_save(flags);
@@ -392,7 +392,7 @@ static int __init smp_psurge_kick_cpu(int nr)
 	if (psurge_type == PSURGE_DUAL)
 		psurge_set_ipi(1);
 
-	if (ppc_md.progress) ppc_md.progress("smp_psurge_kick_cpu - done", 0x354);
+	ppc_md_call_cond(progress)("smp_psurge_kick_cpu - done", 0x354);
 
 	return 0;
 }
@@ -762,7 +762,7 @@ static void __init smp_core99_probe(void)
 	struct device_node *cpus;
 	int ncpus = 0;
 
-	if (ppc_md.progress) ppc_md.progress("smp_core99_probe", 0x345);
+	ppc_md_call_cond(progress)("smp_core99_probe", 0x345);
 
 	/* Count CPUs in the device-tree */
 	for_each_node_by_type(cpus, "cpu")
@@ -799,8 +799,7 @@ static int smp_core99_kick_cpu(int nr)
 	if (nr < 0 || nr > 3)
 		return -ENOENT;
 
-	if (ppc_md.progress)
-		ppc_md.progress("smp_core99_kick_cpu", 0x346);
+	ppc_md_call_cond(progress)("smp_core99_kick_cpu", 0x346);
 
 	local_irq_save(flags);
 
@@ -827,7 +826,7 @@ static int smp_core99_kick_cpu(int nr)
 	patch_instruction(vector, ppc_inst(save_vector));
 
 	local_irq_restore(flags);
-	if (ppc_md.progress) ppc_md.progress("smp_core99_kick_cpu done", 0x347);
+	ppc_md_call_cond(progress)("smp_core99_kick_cpu done", 0x347);
 
 	return 0;
 }
@@ -897,8 +896,7 @@ static void __init smp_core99_bringup_done(void)
 				  smp_core99_cpu_online, NULL);
 #endif
 
-	if (ppc_md.progress)
-		ppc_md.progress("smp_core99_bringup_done", 0x349);
+	ppc_md_call_cond(progress)("smp_core99_bringup_done", 0x349);
 }
 #endif /* CONFIG_PPC64 */
 
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 89e22c460ebf..6f76442faf77 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1701,7 +1701,7 @@ static int __init eeh_powernv_init(void)
 	 * size needs to be set before calling eeh_init().
 	 */
 	eeh_set_pe_aux_size(max_diag_size);
-	ppc_md.pcibios_bus_add_device = pnv_pcibios_bus_add_device;
+	ppc_md_update(pcibios_bus_add_device, pnv_pcibios_bus_add_device);
 
 	ret = eeh_init(&pnv_eeh_ops);
 	if (!ret)
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index e3ffdc8e8567..5568dd112b46 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1244,7 +1244,7 @@ static void __init pnv_arch300_idle_init(void)
 	if (unlikely(!default_stop_found)) {
 		pr_warn("cpuidle-powernv: No suitable default stop state found. Disabling platform idle.\n");
 	} else {
-		ppc_md.power_save = arch300_idle;
+		ppc_md_update(power_save, arch300_idle);
 		pr_info("cpuidle-powernv: Default stop: psscr = 0x%016llx,mask=0x%016llx\n",
 			pnv_default_stop_val, pnv_default_stop_mask);
 	}
@@ -1478,7 +1478,7 @@ static int __init pnv_init_idle_states(void)
 		update_subcore_sibling_mask();
 
 		if (supported_cpuidle_states & OPAL_PM_NAP_ENABLED) {
-			ppc_md.power_save = power7_idle;
+			ppc_md_update(power_save, power7_idle);
 			power7_offline_type = PNV_THREAD_NAP;
 		}
 
diff --git a/arch/powerpc/platforms/powernv/opal-nvram.c b/arch/powerpc/platforms/powernv/opal-nvram.c
index 380bc2d7ebbf..22ef9a07ab52 100644
--- a/arch/powerpc/platforms/powernv/opal-nvram.c
+++ b/arch/powerpc/platforms/powernv/opal-nvram.c
@@ -106,8 +106,8 @@ void __init opal_nvram_init(void)
 	pr_info("OPAL nvram setup, %u bytes\n", nvram_size);
 	of_node_put(np);
 
-	ppc_md.nvram_read = opal_nvram_read;
-	ppc_md.nvram_write = opal_nvram_write;
-	ppc_md.nvram_size = opal_nvram_size;
+	ppc_md_update(nvram_read, opal_nvram_read);
+	ppc_md_update(nvram_write, opal_nvram_write);
+	ppc_md_update(nvram_size, opal_nvram_size);
 }
 
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 3dd35c327d1c..2ecda9e0abd7 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3160,7 +3160,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	 * for the P2P bridge bars so that each PCI bus (excluding
 	 * the child P2P bridges) can form individual PE.
 	 */
-	ppc_md.pcibios_fixup = pnv_pci_ioda_fixup;
+	ppc_md_update(pcibios_fixup, pnv_pci_ioda_fixup);
 
 	switch (phb->type) {
 	case PNV_PHB_NPU_OCAPI:
@@ -3170,13 +3170,13 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 		hose->controller_ops = pnv_pci_ioda_controller_ops;
 	}
 
-	ppc_md.pcibios_default_alignment = pnv_pci_default_alignment;
+	ppc_md_update(pcibios_default_alignment, pnv_pci_default_alignment);
 
 #ifdef CONFIG_PCI_IOV
-	ppc_md.pcibios_fixup_sriov = pnv_pci_ioda_fixup_iov;
-	ppc_md.pcibios_iov_resource_alignment = pnv_pci_iov_resource_alignment;
-	ppc_md.pcibios_sriov_enable = pnv_pcibios_sriov_enable;
-	ppc_md.pcibios_sriov_disable = pnv_pcibios_sriov_disable;
+	ppc_md_update(pcibios_fixup_sriov, pnv_pci_ioda_fixup_iov);
+	ppc_md_update(pcibios_iov_resource_alignment, pnv_pci_iov_resource_alignment);
+	ppc_md_update(pcibios_sriov_enable, pnv_pcibios_sriov_enable);
+	ppc_md_update(pcibios_sriov_disable, pnv_pcibios_sriov_disable);
 #endif
 
 	pci_add_flags(PCI_REASSIGN_ALL_RSRC);
diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index 72c25295c1c2..cf8235f8263b 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -90,7 +90,7 @@ static int initialise_darn(void)
 
 	for (i = 0; i < 10; i++) {
 		if (powernv_get_random_darn(&val)) {
-			ppc_md.get_random_seed = powernv_get_random_darn;
+			ppc_md_update(get_random_seed, powernv_get_random_darn);
 			return 0;
 		}
 	}
@@ -161,7 +161,7 @@ static __init int rng_create(struct device_node *dn)
 
 	pr_info_once("Registering arch random hook.\n");
 
-	ppc_md.get_random_seed = powernv_get_random_long;
+	ppc_md_update(get_random_seed, powernv_get_random_long);
 
 	return 0;
 }
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index a8db3f153063..6f6ceef2a9f5 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -227,7 +227,7 @@ static void __init pnv_init_IRQ(void)
 	if (!xive_native_init())
 		xics_init();
 
-	WARN_ON(!ppc_md.get_irq);
+	WARN_ON(!ppc_md_has(get_irq));
 }
 
 static void pnv_show_cpuinfo(struct seq_file *m)
@@ -457,18 +457,18 @@ static unsigned long pnv_memory_block_size(void)
 
 static void __init pnv_setup_machdep_opal(void)
 {
-	ppc_md.get_boot_time = opal_get_boot_time;
-	ppc_md.restart = pnv_restart;
+	ppc_md_update(get_boot_time, opal_get_boot_time);
+	ppc_md_update(restart, pnv_restart);
 	pm_power_off = pnv_power_off;
-	ppc_md.halt = pnv_halt;
+	ppc_md_update(halt, pnv_halt);
 	/* ppc_md.system_reset_exception gets filled in by pnv_smp_init() */
-	ppc_md.machine_check_exception = opal_machine_check;
-	ppc_md.mce_check_early_recovery = opal_mce_check_early_recovery;
+	ppc_md_update(machine_check_exception, opal_machine_check);
+	ppc_md_update(mce_check_early_recovery, opal_mce_check_early_recovery);
 	if (opal_check_token(OPAL_HANDLE_HMI2))
-		ppc_md.hmi_exception_early = opal_hmi_exception_early2;
+		ppc_md_update(hmi_exception_early, opal_hmi_exception_early2);
 	else
-		ppc_md.hmi_exception_early = opal_hmi_exception_early;
-	ppc_md.handle_hmi_exception = opal_handle_hmi_exception;
+		ppc_md_update(hmi_exception_early, opal_hmi_exception_early);
+	ppc_md_update(handle_hmi_exception, opal_handle_hmi_exception);
 }
 
 static int __init pnv_probe(void)
diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index cbb67813cd5d..0611e68a7b78 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -428,7 +428,7 @@ static struct smp_ops_t pnv_smp_ops = {
 void __init pnv_smp_init(void)
 {
 	if (opal_check_token(OPAL_SIGNAL_SYSTEM_RESET)) {
-		ppc_md.system_reset_exception = pnv_system_reset_exception;
+		ppc_md_update(system_reset_exception, pnv_system_reset_exception);
 		pnv_smp_ops.cause_nmi_ipi = pnv_cause_nmi_ipi;
 	}
 	smp_ops = &pnv_smp_ops;
diff --git a/arch/powerpc/platforms/ps3/interrupt.c b/arch/powerpc/platforms/ps3/interrupt.c
index 49871427f599..8c3c65e89e39 100644
--- a/arch/powerpc/platforms/ps3/interrupt.c
+++ b/arch/powerpc/platforms/ps3/interrupt.c
@@ -766,7 +766,7 @@ void __init ps3_init_IRQ(void)
 				ps3_result(result));
 	}
 
-	ppc_md.get_irq = ps3_get_irq;
+	ppc_md_update(get_irq, ps3_get_irq);
 }
 
 void ps3_shutdown_IRQ(int cpu)
diff --git a/arch/powerpc/platforms/ps3/setup.c b/arch/powerpc/platforms/ps3/setup.c
index 3de9145c20bc..04c037ec8b79 100644
--- a/arch/powerpc/platforms/ps3/setup.c
+++ b/arch/powerpc/platforms/ps3/setup.c
@@ -240,7 +240,7 @@ static void __init ps3_setup_arch(void)
 	prealloc_ps3fb_videomemory();
 	prealloc_ps3flash_bounce_buffer();
 
-	ppc_md.power_save = ps3_power_save;
+	ppc_md_update(power_save, ps3_power_save);
 	ps3_os_area_init();
 
 	DBG(" <- %s:%d\n", __func__, __LINE__);
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index bc15200852b7..65efa26e0514 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -862,7 +862,7 @@ static int __init eeh_pseries_init(void)
 	eeh_add_flag(EEH_PROBE_MODE_DEVTREE | EEH_ENABLE_IO_FOR_LOG);
 
 	/* Set EEH machine dependent code */
-	ppc_md.pcibios_bus_add_device = pseries_pcibios_bus_add_device;
+	ppc_md_update(pcibios_bus_add_device, pseries_pcibios_bus_add_device);
 
 	if (is_kdump_kernel() || reset_devices) {
 		pr_info("Issue PHB reset ...\n");
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index d646c22e94ab..a889cd995369 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -995,8 +995,8 @@ static int __init pseries_cpu_hotplug_init(void)
 	unsigned int node;
 
 #ifdef CONFIG_ARCH_CPU_PROBE_RELEASE
-	ppc_md.cpu_probe = dlpar_cpu_probe;
-	ppc_md.cpu_release = dlpar_cpu_release;
+	ppc_md_update(cpu_probe, dlpar_cpu_probe);
+	ppc_md_update(cpu_release, dlpar_cpu_release);
 #endif /* CONFIG_ARCH_CPU_PROBE_RELEASE */
 
 	rtas_stop_self_token = rtas_token("stop-self");
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index 1b305e411862..0d0d57096a7e 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -695,8 +695,8 @@ static int rtas_msi_init(void)
 
 	pr_debug("rtas_msi: Registering RTAS MSI callbacks.\n");
 
-	WARN_ON(ppc_md.pci_irq_fixup);
-	ppc_md.pci_irq_fixup = rtas_msi_pci_irq_fixup;
+	WARN_ON(ppc_md_has(pci_irq_fixup));
+	ppc_md_update(pci_irq_fixup, rtas_msi_pci_irq_fixup);
 
 	return 0;
 }
diff --git a/arch/powerpc/platforms/pseries/nvram.c b/arch/powerpc/platforms/pseries/nvram.c
index 69db2eca367f..673a58274616 100644
--- a/arch/powerpc/platforms/pseries/nvram.c
+++ b/arch/powerpc/platforms/pseries/nvram.c
@@ -170,7 +170,7 @@ int nvram_clear_error_log(void)
 
 	tmp_index = rtas_log_partition.index;
 	
-	rc = ppc_md.nvram_write((char *)&clear_word, sizeof(int), &tmp_index);
+	rc = ppc_md_call(nvram_write)((char *)&clear_word, sizeof(int), &tmp_index);
 	if (rc <= 0) {
 		printk(KERN_ERR "nvram_clear_error_log: Failed nvram_write (%d)\n", rc);
 		return rc;
@@ -232,9 +232,9 @@ int __init pSeries_nvram_init(void)
 	printk(KERN_INFO "PPC64 nvram contains %d bytes\n", nvram_size);
 	of_node_put(nvram);
 
-	ppc_md.nvram_read	= pSeries_nvram_read;
-	ppc_md.nvram_write	= pSeries_nvram_write;
-	ppc_md.nvram_size	= pSeries_nvram_get_size;
+	ppc_md_update(nvram_read, pSeries_nvram_read);
+	ppc_md_update(nvram_write, pSeries_nvram_write);
+	ppc_md_update(nvram_size, pSeries_nvram_get_size);
 
 	return 0;
 }
diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
index 3b6800f774c2..fcdc7bbeb9c6 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -229,8 +229,8 @@ void __init pSeries_final_fixup(void)
 	eeh_show_enabled();
 
 #ifdef CONFIG_PCI_IOV
-	ppc_md.pcibios_sriov_enable = pseries_pcibios_sriov_enable;
-	ppc_md.pcibios_sriov_disable = pseries_pcibios_sriov_disable;
+	ppc_md_update(pcibios_sriov_enable, pseries_pcibios_sriov_enable);
+	ppc_md_update(pcibios_sriov_disable, pseries_pcibios_sriov_disable);
 #endif
 }
 
diff --git a/arch/powerpc/platforms/pseries/rng.c b/arch/powerpc/platforms/pseries/rng.c
index 6268545947b8..04874f763cf1 100644
--- a/arch/powerpc/platforms/pseries/rng.c
+++ b/arch/powerpc/platforms/pseries/rng.c
@@ -34,7 +34,7 @@ static __init int rng_init(void)
 
 	pr_info("Registering arch random hook.\n");
 
-	ppc_md.get_random_seed = pseries_get_random_long;
+	ppc_md_update(get_random_seed, pseries_get_random_long);
 
 	of_node_put(dn);
 	return 0;
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index f79126f16258..e14abc326a49 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -459,7 +459,7 @@ void pseries_little_endian_exceptions(void)
 		mdelay(get_longbusy_msecs(rc));
 	}
 	if (rc) {
-		ppc_md.progress("H_SET_MODE LE exception fail", 0);
+		ppc_md_call(progress)("H_SET_MODE LE exception fail", 0);
 		panic("Could not enable little endian exceptions");
 	}
 }
@@ -821,22 +821,19 @@ static void __init pSeries_setup_arch(void)
 			pv_spinlocks_init();
 		}
 
-		ppc_md.power_save = pseries_lpar_idle;
-		ppc_md.enable_pmcs = pseries_lpar_enable_pmcs;
+		ppc_md_update(power_save, pseries_lpar_idle);
+		ppc_md_update(enable_pmcs, pseries_lpar_enable_pmcs);
 #ifdef CONFIG_PCI_IOV
-		ppc_md.pcibios_fixup_resources =
-			pseries_pci_fixup_resources;
-		ppc_md.pcibios_fixup_sriov =
-			pseries_pci_fixup_iov_resources;
-		ppc_md.pcibios_iov_resource_alignment =
-			pseries_pci_iov_resource_alignment;
+		ppc_md_update(pcibios_fixup_resources, pseries_pci_fixup_resources);
+		ppc_md_update(pcibios_fixup_sriov, pseries_pci_fixup_iov_resources);
+		ppc_md_update(pcibios_iov_resource_alignment, pseries_pci_iov_resource_alignment);
 #endif
 	} else {
 		/* No special idle routine */
-		ppc_md.enable_pmcs = power4_enable_pmcs;
+		ppc_md_update(enable_pmcs, power4_enable_pmcs);
 	}
 
-	ppc_md.pcibios_root_bridge_prepare = pseries_root_bridge_prepare;
+	ppc_md_update(pcibios_root_bridge_prepare, pseries_root_bridge_prepare);
 
 	if (swiotlb_force == SWIOTLB_FORCE)
 		ppc_swiotlb_enable = 1;
@@ -852,11 +849,11 @@ static int __init pSeries_init_panel(void)
 {
 	/* Manually leave the kernel version on the panel. */
 #ifdef __BIG_ENDIAN__
-	ppc_md.progress("Linux ppc64\n", 0);
+	ppc_md_call(progress)("Linux ppc64\n", 0);
 #else
-	ppc_md.progress("Linux ppc64le\n", 0);
+	ppc_md_call(progress)("Linux ppc64le\n", 0);
 #endif
-	ppc_md.progress(init_utsname()->version, 0);
+	ppc_md_call(progress)(init_utsname()->version, 0);
 
 	return 0;
 }
@@ -991,12 +988,12 @@ static void __init pseries_init(void)
 		hvc_vio_init_early();
 #endif
 	if (firmware_has_feature(FW_FEATURE_XDABR))
-		ppc_md.set_dabr = pseries_set_xdabr;
+		ppc_md_update(set_dabr, pseries_set_xdabr);
 	else if (firmware_has_feature(FW_FEATURE_DABR))
-		ppc_md.set_dabr = pseries_set_dabr;
+		ppc_md_update(set_dabr, pseries_set_dabr);
 
 	if (firmware_has_feature(FW_FEATURE_SET_MODE))
-		ppc_md.set_dawr = pseries_set_dawr;
+		ppc_md_update(set_dawr, pseries_set_dawr);
 
 	pSeries_cmo_feature_init();
 	iommu_init_early_pSeries();
diff --git a/arch/powerpc/sysdev/dart_iommu.c b/arch/powerpc/sysdev/dart_iommu.c
index 1d33b7a5ea83..0447a5aa3764 100644
--- a/arch/powerpc/sysdev/dart_iommu.c
+++ b/arch/powerpc/sysdev/dart_iommu.c
@@ -433,7 +433,7 @@ static int __init iommu_init_late_dart(void)
 	if (!dart_tablebase)
 		return 0;
 
-	ppc_md.iommu_restore = iommu_dart_restore;
+	ppc_md_update(iommu_restore, iommu_dart_restore);
 
 	return 0;
 }
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index b8f76f3fd994..5e1ec461701c 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -396,7 +396,7 @@ static void setup_pci_atmu(struct pci_controller *hose)
 			 * install our own dma_set_mask handler to fixup dma_ops
 			 * and dma_offset
 			 */
-			ppc_md.dma_set_mask = fsl_pci_dma_set_mask;
+			ppc_md_update(dma_set_mask, fsl_pci_dma_set_mask);
 
 			pr_info("%pOF: Setup 64-bit PCI DMA window\n", hose->dn);
 		}
@@ -692,8 +692,8 @@ static int mpc83xx_pcie_exclude_device(struct pci_bus *bus, unsigned int devfn)
 			return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
-	if (ppc_md.pci_exclude_device) {
-		if (ppc_md.pci_exclude_device(hose, bus->number, devfn))
+	if (ppc_md_has(pci_exclude_device)) {
+		if (ppc_md_call(pci_exclude_device)(hose, bus->number, devfn))
 			return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
diff --git a/arch/powerpc/sysdev/indirect_pci.c b/arch/powerpc/sysdev/indirect_pci.c
index 09b36617425e..e1cb1a61e676 100644
--- a/arch/powerpc/sysdev/indirect_pci.c
+++ b/arch/powerpc/sysdev/indirect_pci.c
@@ -31,8 +31,8 @@ int __indirect_read_config(struct pci_controller *hose,
 			return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
-	if (ppc_md.pci_exclude_device)
-		if (ppc_md.pci_exclude_device(hose, bus_number, devfn))
+	if (ppc_md_has(pci_exclude_device))
+		if (ppc_md_call(pci_exclude_device)(hose, bus_number, devfn))
 			return PCIBIOS_DEVICE_NOT_FOUND;
 
 	if (hose->indirect_type & PPC_INDIRECT_TYPE_SET_CFG_TYPE)
@@ -97,8 +97,8 @@ int indirect_write_config(struct pci_bus *bus, unsigned int devfn,
 			return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
-	if (ppc_md.pci_exclude_device)
-		if (ppc_md.pci_exclude_device(hose, bus->number, devfn))
+	if (ppc_md_has(pci_exclude_device))
+		if (ppc_md_call(pci_exclude_device)(hose, bus->number, devfn))
 			return PCIBIOS_DEVICE_NOT_FOUND;
 
 	if (hose->indirect_type & PPC_INDIRECT_TYPE_SET_CFG_TYPE)
diff --git a/arch/powerpc/sysdev/mmio_nvram.c b/arch/powerpc/sysdev/mmio_nvram.c
index 628f9b759c84..f5130d7a7eb6 100644
--- a/arch/powerpc/sysdev/mmio_nvram.c
+++ b/arch/powerpc/sysdev/mmio_nvram.c
@@ -133,11 +133,11 @@ int __init mmio_nvram_init(void)
 	printk(KERN_INFO "mmio NVRAM, %luk at 0x%lx mapped to %p\n",
 	       mmio_nvram_len >> 10, nvram_addr, mmio_nvram_start);
 
-	ppc_md.nvram_read_val	= mmio_nvram_read_val;
-	ppc_md.nvram_write_val	= mmio_nvram_write_val;
-	ppc_md.nvram_read	= mmio_nvram_read;
-	ppc_md.nvram_write	= mmio_nvram_write;
-	ppc_md.nvram_size	= mmio_nvram_get_size;
+	ppc_md_update(nvram_read_val, mmio_nvram_read_val);
+	ppc_md_update(nvram_write_val, mmio_nvram_write_val);
+	ppc_md_update(nvram_read, mmio_nvram_read);
+	ppc_md_update(nvram_write, mmio_nvram_write);
+	ppc_md_update(nvram_size, mmio_nvram_get_size);
 
 out:
 	of_node_put(nvram_node);
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 68ff5c87294e..42162fe915bc 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1406,7 +1406,7 @@ struct mpic * __init mpic_alloc(struct device_node *node,
 	 * fsl_version will be zero if MPIC_FSL is not set.
 	 */
 	if (fsl_version < 0x400 && (flags & MPIC_ENABLE_COREINT))
-		ppc_md.get_irq = mpic_get_irq;
+		ppc_md_update(get_irq, mpic_get_irq);
 
 	/* Reset */
 
diff --git a/arch/powerpc/sysdev/tsi108_pci.c b/arch/powerpc/sysdev/tsi108_pci.c
index 042bb38fa5c2..d4cd7942b4a6 100644
--- a/arch/powerpc/sysdev/tsi108_pci.c
+++ b/arch/powerpc/sysdev/tsi108_pci.c
@@ -51,8 +51,8 @@ tsi108_direct_write_config(struct pci_bus *bus, unsigned int devfunc,
 	volatile unsigned char *cfg_addr;
 	struct pci_controller *hose = pci_bus_to_host(bus);
 
-	if (ppc_md.pci_exclude_device)
-		if (ppc_md.pci_exclude_device(hose, bus->number, devfunc))
+	if (ppc_md_has(pci_exclude_device))
+		if (ppc_md_call(pci_exclude_device)(hose, bus->number, devfunc))
 			return PCIBIOS_DEVICE_NOT_FOUND;
 
 	cfg_addr = (unsigned char *)(tsi_mk_config_addr(bus->number,
@@ -136,8 +136,8 @@ tsi108_direct_read_config(struct pci_bus *bus, unsigned int devfn, int offset,
 	struct pci_controller *hose = pci_bus_to_host(bus);
 	u32 temp;
 
-	if (ppc_md.pci_exclude_device)
-		if (ppc_md.pci_exclude_device(hose, bus->number, devfn))
+	if (ppc_md_has(pci_exclude_device))
+		if (ppc_md_call(pci_exclude_device)(hose, bus->number, devfn))
 			return PCIBIOS_DEVICE_NOT_FOUND;
 
 	cfg_addr = (unsigned char *)(tsi_mk_config_addr(bus->number,
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xics/xics-common.c
index 5c1a157a83b8..96b967ae39ce 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -520,7 +520,7 @@ void __init xics_init(void)
 	}
 
 	/* Copy get_irq callback over to ppc_md */
-	ppc_md.get_irq = icp_ops->get_irq;
+	ppc_md_update(get_irq, icp_ops->get_irq);
 
 	/* Patch up IPI chip EOI */
 	xics_ipi_chip.irq_eoi = icp_ops->eoi;
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index c732ce5a3e1a..a3e30d729ad7 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1647,7 +1647,7 @@ bool __init xive_core_init(struct device_node *np, const struct xive_ops *ops,
 	xive_ops = ops;
 	xive_irq_priority = max_prio;
 
-	ppc_md.get_irq = xive_get_irq;
+	ppc_md_update(get_irq, xive_get_irq);
 	__xive_enabled = true;
 
 	pr_devel("Initializing host..\n");
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index dd8241c009e5..9bb66f2a2828 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1239,9 +1239,9 @@ static void bootcmds(void)
 	cmd = inchar();
 	if (cmd == 'r') {
 		getstring(tmp, 64);
-		ppc_md.restart(tmp);
+		ppc_md_call(restart)(tmp);
 	} else if (cmd == 'h') {
-		ppc_md.halt();
+		ppc_md_call(halt)();
 	} else if (cmd == 'p') {
 		if (pm_power_off)
 			pm_power_off();
diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
index be0ca8d5b345..dff77e3819b4 100644
--- a/drivers/ata/pata_macio.c
+++ b/drivers/ata/pata_macio.c
@@ -752,19 +752,19 @@ static void pata_macio_reset_hw(struct pata_macio_priv *priv, int resume)
 		 * (timing related ?). Until I can put my hand on one of these
 		 * units, I keep the old way
 		 */
-		ppc_md.feature_call(PMAC_FTR_IDE_ENABLE, priv->node, 0, 1);
+		ppc_md_call(feature_call)(PMAC_FTR_IDE_ENABLE, priv->node, 0, 1);
 	} else {
 		int rc;
 
  		/* Reset and enable controller */
-		rc = ppc_md.feature_call(PMAC_FTR_IDE_RESET,
+		rc = ppc_md_call(feature_call)(PMAC_FTR_IDE_RESET,
 					 priv->node, priv->aapl_bus_id, 1);
-		ppc_md.feature_call(PMAC_FTR_IDE_ENABLE,
+		ppc_md_call(feature_call)(PMAC_FTR_IDE_ENABLE,
 				    priv->node, priv->aapl_bus_id, 1);
 		msleep(10);
 		/* Only bother waiting if there's a reset control */
 		if (rc == 0) {
-			ppc_md.feature_call(PMAC_FTR_IDE_RESET,
+			ppc_md_call(feature_call)(PMAC_FTR_IDE_RESET,
 					    priv->node, priv->aapl_bus_id, 0);
 			msleep(IDE_WAKEUP_DELAY_MS);
 		}
@@ -889,7 +889,7 @@ static int pata_macio_do_suspend(struct pata_macio_priv *priv, pm_message_t mesg
 	}
 
 	/* Disable the bus on older machines and the cell on kauai */
-	ppc_md.feature_call(PMAC_FTR_IDE_ENABLE, priv->node,
+	ppc_md_call(feature_call)(PMAC_FTR_IDE_ENABLE, priv->node,
 			    priv->aapl_bus_id, 0);
 
 	return 0;
diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
index e9f694b36871..d4cca9daf007 100644
--- a/drivers/char/nvram.c
+++ b/drivers/char/nvram.c
@@ -310,9 +310,9 @@ static long nvram_misc_ioctl(struct file *file, unsigned int cmd,
 		break;
 #ifdef CONFIG_PPC32
 	case IOC_NVRAM_SYNC:
-		if (ppc_md.nvram_sync != NULL) {
+		if (ppc_md_has(nvram_sync)) {
 			mutex_lock(&nvram_mutex);
-			ppc_md.nvram_sync();
+			ppc_md_call(nvram_sync)();
 			mutex_unlock(&nvram_mutex);
 		}
 		ret = 0;
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 4bdd4c45e7a7..b14ebc533bed 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -2346,8 +2346,8 @@ static int register_pmu_pm_ops(void)
 {
 	if (pmu_kind == PMU_OHARE_BASED)
 		powerbook_sleep_init_3400();
-	ppc_md.suspend_disable_irqs = pmac_suspend_disable_irqs;
-	ppc_md.suspend_enable_irqs = pmac_suspend_enable_irqs;
+	ppc_md_update(suspend_disable_irqs, pmac_suspend_disable_irqs);
+	ppc_md_update(suspend_enable_irqs, pmac_suspend_enable_irqs);
 	suspend_set_ops(&pmu_pm_ops);
 
 	return 0;
diff --git a/include/linux/nvram.h b/include/linux/nvram.h
index d29d9c93a927..31d41811ea3e 100644
--- a/include/linux/nvram.h
+++ b/include/linux/nvram.h
@@ -46,8 +46,8 @@ extern const struct nvram_ops arch_nvram_ops;
 static inline ssize_t nvram_get_size(void)
 {
 #ifdef CONFIG_PPC
-	if (ppc_md.nvram_size)
-		return ppc_md.nvram_size();
+	if (ppc_md_has(nvram_size))
+		return ppc_md_call(nvram_size)();
 #else
 	if (arch_nvram_ops.get_size)
 		return arch_nvram_ops.get_size();
@@ -58,8 +58,8 @@ static inline ssize_t nvram_get_size(void)
 static inline unsigned char nvram_read_byte(int addr)
 {
 #ifdef CONFIG_PPC
-	if (ppc_md.nvram_read_val)
-		return ppc_md.nvram_read_val(addr);
+	if (ppc_md_has(nvram_read_val))
+		return ppc_md_call(nvram_read_val)(addr);
 #else
 	if (arch_nvram_ops.read_byte)
 		return arch_nvram_ops.read_byte(addr);
@@ -70,8 +70,7 @@ static inline unsigned char nvram_read_byte(int addr)
 static inline void nvram_write_byte(unsigned char val, int addr)
 {
 #ifdef CONFIG_PPC
-	if (ppc_md.nvram_write_val)
-		ppc_md.nvram_write_val(addr, val);
+	ppc_md_call_cond(nvram_write_val)(addr, val);
 #else
 	if (arch_nvram_ops.write_byte)
 		arch_nvram_ops.write_byte(val, addr);
@@ -109,8 +108,8 @@ static inline ssize_t nvram_write_bytes(char *buf, size_t count, loff_t *ppos)
 static inline ssize_t nvram_read(char *buf, size_t count, loff_t *ppos)
 {
 #ifdef CONFIG_PPC
-	if (ppc_md.nvram_read)
-		return ppc_md.nvram_read(buf, count, ppos);
+	if (ppc_md_has(nvram_read))
+		return ppc_md_call(nvram_read)(buf, count, ppos);
 #else
 	if (arch_nvram_ops.read)
 		return arch_nvram_ops.read(buf, count, ppos);
@@ -121,8 +120,8 @@ static inline ssize_t nvram_read(char *buf, size_t count, loff_t *ppos)
 static inline ssize_t nvram_write(char *buf, size_t count, loff_t *ppos)
 {
 #ifdef CONFIG_PPC
-	if (ppc_md.nvram_write)
-		return ppc_md.nvram_write(buf, count, ppos);
+	if (ppc_md_has(nvram_write))
+		return ppc_md_call(nvram_write)(buf, count, ppos);
 #else
 	if (arch_nvram_ops.write)
 		return arch_nvram_ops.write(buf, count, ppos);
diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 84058bbf9d12..208fb5398839 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -792,8 +792,7 @@ snd_pmac_ctrl_intr(int irq, void *devid)
  */
 static void snd_pmac_sound_feature(struct snd_pmac *chip, int enable)
 {
-	if (ppc_md.feature_call)
-		ppc_md.feature_call(PMAC_FTR_SOUND_CHIP_ENABLE, chip->node, 0, enable);
+	ppc_md_call(feature_call)(PMAC_FTR_SOUND_CHIP_ENABLE, chip->node, 0, enable);
 }
 
 /*
-- 
2.25.0

