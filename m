Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEDB3FFF10
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 13:23:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1Flp6yD0z3dmW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 21:23:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1FgF2FZHz2yNp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 21:19:21 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H1Ffb1wfRz9sV7;
 Fri,  3 Sep 2021 13:18:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OG7ugcE3Chqo; Fri,  3 Sep 2021 13:18:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H1Ffb0sGDz9sT4;
 Fri,  3 Sep 2021 13:18:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 08F958B8E5;
 Fri,  3 Sep 2021 13:18:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SKT2YUcCj6FZ; Fri,  3 Sep 2021 13:18:46 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BECC08B764;
 Fri,  3 Sep 2021 13:18:46 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 72A6B63D74; Fri,  3 Sep 2021 11:18:46 +0000 (UTC)
Message-Id: <607973ee856b5b144ca7e0506fcd8efbbc14868a.1630667613.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1630667612.git.christophe.leroy@csgroup.eu>
References: <cover.1630667612.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 11/11] powerpc/machdep: Convert ppc_md to static calls
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  3 Sep 2021 11:18:46 +0000 (UTC)
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

Static calls are global structures declared with DECLARE_STATIC_CALL()
and defined with DEFINE_STATIC_CALL().

All fonction prototypes are moved out of struct machdep_calls into
struct machdep_calls_ops. That new struct won't be instanciated, it
is only used as a support for carriing fonction prototypes and use
them to declare/define associated static calls.

In order to limit test copies which are error prone, define a macro
called PPC_MD_CALL, which either declare the call or defines it
based on the definition of GENERATING_PPC_MD_STATIC_CALLS_DEFINITIONS
that will be defined in and only in kernel/setup-common.c as a
replacement of ppc_md instance.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/machdep.h | 101 +++++++++++++++++++++++++++--
 arch/powerpc/kernel/setup-common.c |   2 +
 2 files changed, 98 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index ed5a1b5be7b5..3898c7a770b8 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -7,6 +7,7 @@
 #include <linux/init.h>
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
+#include <linux/static_call.h>
 
 #include <asm/setup.h>
 
@@ -22,6 +23,10 @@ struct pci_host_bridge;
 
 struct machdep_calls {
 	char		*name;
+	int		(*probe)(void);
+};
+
+struct machdep_ops {
 #ifdef CONFIG_PPC64
 #ifdef CONFIG_PM
 	void		(*iommu_restore)(void);
@@ -33,7 +38,6 @@ struct machdep_calls {
 
 	void		(*dma_set_mask)(struct device *dev, u64 dma_mask);
 
-	int		(*probe)(void);
 	void		(*setup_arch)(void); /* Optional, may be NULL */
 	/* Optional, may be NULL. */
 	void		(*show_cpuinfo)(struct seq_file *m);
@@ -203,10 +207,97 @@ struct machdep_calls {
 #endif
 };
 
-#define ppc_md_call(func)		ppc_md.func
-#define ppc_md_has(func)		(ppc_md.func)
-#define ppc_md_call_cond(func)		if (ppc_md_has(func)) ppc_md_call(func)
-#define ppc_md_update(func, f)		ppc_md.func = f
+#define ppc_md_call(func)		static_call(ppc_md_##func)
+#define ppc_md_has(func)		static_call_query(ppc_md_##func)
+#define ppc_md_call_cond(func)		static_call_cond(ppc_md_##func)
+#define ppc_md_update(func, f)		static_call_update(ppc_md_##func, f)
+
+#ifdef GENERATING_PPC_MD_STATIC_CALLS_DEFINITIONS
+#define PPC_MD_CALL(f)	DEFINE_STATIC_CALL_NULL(ppc_md_##f, (*((struct machdep_ops *)NULL)->f))
+#else
+#define PPC_MD_CALL(f)	DECLARE_STATIC_CALL(ppc_md_##f, (*((struct machdep_ops *)NULL)->f))
+#endif
+
+#ifdef CONFIG_PPC64
+#ifdef CONFIG_PM
+PPC_MD_CALL(iommu_restore);
+#endif
+#ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
+PPC_MD_CALL(memory_block_size);
+#endif
+#endif /* CONFIG_PPC64 */
+PPC_MD_CALL(dma_set_mask);
+PPC_MD_CALL(setup_arch);
+PPC_MD_CALL(show_cpuinfo);
+PPC_MD_CALL(get_proc_freq);
+PPC_MD_CALL(init_IRQ);
+PPC_MD_CALL(get_irq);
+PPC_MD_CALL(pcibios_fixup);
+PPC_MD_CALL(pci_irq_fixup);
+PPC_MD_CALL(pcibios_root_bridge_prepare);
+PPC_MD_CALL(discover_phbs);
+PPC_MD_CALL(pci_setup_phb);
+PPC_MD_CALL(restart);
+PPC_MD_CALL(halt);
+PPC_MD_CALL(panic);
+PPC_MD_CALL(time_init);
+PPC_MD_CALL(set_rtc_time);
+PPC_MD_CALL(get_rtc_time);
+PPC_MD_CALL(get_boot_time);
+PPC_MD_CALL(calibrate_decr);
+PPC_MD_CALL(progress);
+PPC_MD_CALL(log_error);
+PPC_MD_CALL(nvram_read_val);
+PPC_MD_CALL(nvram_write_val);
+PPC_MD_CALL(nvram_write);
+PPC_MD_CALL(nvram_read);
+PPC_MD_CALL(nvram_size);
+PPC_MD_CALL(nvram_sync);
+PPC_MD_CALL(system_reset_exception);
+PPC_MD_CALL(machine_check_exception);
+PPC_MD_CALL(handle_hmi_exception);
+PPC_MD_CALL(hmi_exception_early);
+PPC_MD_CALL(machine_check_early);
+PPC_MD_CALL(mce_check_early_recovery);
+PPC_MD_CALL(feature_call);
+PPC_MD_CALL(pci_get_legacy_ide_irq);
+PPC_MD_CALL(phys_mem_access_prot);
+PPC_MD_CALL(power_save);
+PPC_MD_CALL(enable_pmcs);
+PPC_MD_CALL(set_dabr);
+PPC_MD_CALL(set_dawr);
+#ifdef CONFIG_PPC32
+PPC_MD_CALL(init);
+PPC_MD_CALL(pcibios_after_init);
+#endif
+PPC_MD_CALL(pci_exclude_device);
+PPC_MD_CALL(pcibios_fixup_resources);
+PPC_MD_CALL(pcibios_fixup_bus);
+PPC_MD_CALL(pcibios_fixup_phb);
+PPC_MD_CALL(pcibios_bus_add_device);
+PPC_MD_CALL(pcibios_default_alignment);
+#ifdef CONFIG_PCI_IOV
+PPC_MD_CALL(pcibios_fixup_sriov);
+PPC_MD_CALL(pcibios_iov_resource_alignment);
+PPC_MD_CALL(pcibios_sriov_enable);
+PPC_MD_CALL(pcibios_sriov_disable);
+#endif
+PPC_MD_CALL(machine_shutdown);
+#ifdef CONFIG_KEXEC_CORE
+PPC_MD_CALL(kexec_cpu_down);
+PPC_MD_CALL(machine_kexec);
+#endif
+#ifdef CONFIG_SUSPEND
+PPC_MD_CALL(suspend_disable_irqs);
+PPC_MD_CALL(suspend_enable_irqs);
+#endif
+#ifdef CONFIG_ARCH_CPU_PROBE_RELEASE
+PPC_MD_CALL(cpu_probe);
+PPC_MD_CALL(cpu_release);
+#endif
+#ifdef CONFIG_ARCH_RANDOM
+PPC_MD_CALL(get_random_seed);
+#endif
 
 extern void e500_idle(void);
 extern void power4_idle(void);
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 9e2e1c4c6c62..e9acb1186cf5 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -8,6 +8,8 @@
 
 #undef DEBUG
 
+#define GENERATING_PPC_MD_STATIC_CALLS_DEFINITIONS
+
 #include <linux/export.h>
 #include <linux/panic_notifier.h>
 #include <linux/string.h>
-- 
2.25.0

