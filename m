Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A213FC435
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 10:31:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzL4S1Z9nz3c6Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 18:31:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzL3m1j0Wz2ywY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 18:30:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GzL3j2c6Nz9sTX;
 Tue, 31 Aug 2021 10:30:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ha_H_sx_ILRv; Tue, 31 Aug 2021 10:30:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GzL3j1LPQz9sTk;
 Tue, 31 Aug 2021 10:30:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0ED768B7DE;
 Tue, 31 Aug 2021 10:30:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 44dcfM13DqZ2; Tue, 31 Aug 2021 10:30:24 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE1A58B7DD;
 Tue, 31 Aug 2021 10:30:24 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 974506BCA2; Tue, 31 Aug 2021 08:30:24 +0000 (UTC)
Message-Id: <24d4ca0ada683c9436a5f812a7aeb0a1362afa2b.1630398606.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/machdep: Remove stale functions from ppc_md structure
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 31 Aug 2021 08:30:24 +0000 (UTC)
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

ppc_md.iommu_save() is not set anymore by any platform after
commit c40785ad305b ("powerpc/dart: Use a cachable DART").
So iommu_save() has become a nop and can be removed.

ppc_md.show_percpuinfo() is not set anymore by any platform after
commit 4350147a816b ("[PATCH] ppc64: SMU based macs cpufreq support").

Last users of ppc_md.rtc_read_val() and ppc_md.rtc_write_val() were
removed by commit 0f03a43b8f0f ("[POWERPC] Remove todc code from
ARCH=powerpc")

Last user of kgdb_map_scc() was removed by commit 17ce452f7ea3 ("kgdb,
powerpc: arch specific powerpc kgdb support").

ppc.machine_kexec_prepare() has not been used since
commit 8ee3e0d69623 ("powerpc: Remove the main legacy iSerie platform
code"). This allows the removal of machine_kexec_prepare() and the
rename of default_machine_kexec_prepare() into machine_kexec_prepare()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/iommu.h   |  6 ------
 arch/powerpc/include/asm/machdep.h | 13 -------------
 arch/powerpc/kernel/setup-common.c |  3 ---
 arch/powerpc/kernel/swsusp_64.c    |  5 -----
 arch/powerpc/kernel/swsusp_asm64.S |  1 -
 arch/powerpc/kexec/core.c          | 13 -------------
 arch/powerpc/kexec/core_32.c       |  2 +-
 arch/powerpc/kexec/core_64.c       |  2 +-
 8 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index bf3b84128525..c361212ac160 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -280,12 +280,6 @@ extern void iommu_init_early_dart(struct pci_controller_ops *controller_ops);
 extern void iommu_init_early_pasemi(void);
 
 #if defined(CONFIG_PPC64) && defined(CONFIG_PM)
-static inline void iommu_save(void)
-{
-	if (ppc_md.iommu_save)
-		ppc_md.iommu_save();
-}
-
 static inline void iommu_restore(void)
 {
 	if (ppc_md.iommu_restore)
diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 764f2732a821..a68311077d32 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -29,7 +29,6 @@ struct machdep_calls {
 	char		*name;
 #ifdef CONFIG_PPC64
 #ifdef CONFIG_PM
-	void		(*iommu_save)(void);
 	void		(*iommu_restore)(void);
 #endif
 #ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
@@ -43,7 +42,6 @@ struct machdep_calls {
 	void		(*setup_arch)(void); /* Optional, may be NULL */
 	/* Optional, may be NULL. */
 	void		(*show_cpuinfo)(struct seq_file *m);
-	void		(*show_percpuinfo)(struct seq_file *m, int i);
 	/* Returns the current operating frequency of "cpu" in Hz */
 	unsigned long  	(*get_proc_freq)(unsigned int cpu);
 
@@ -74,8 +72,6 @@ struct machdep_calls {
 	int		(*set_rtc_time)(struct rtc_time *);
 	void		(*get_rtc_time)(struct rtc_time *);
 	time64_t	(*get_boot_time)(void);
-	unsigned char 	(*rtc_read_val)(int addr);
-	void		(*rtc_write_val)(int addr, unsigned char val);
 
 	void		(*calibrate_decr)(void);
 
@@ -141,8 +137,6 @@ struct machdep_calls {
 	   May be NULL. */
 	void		(*init)(void);
 
-	void		(*kgdb_map_scc)(void);
-
 	/*
 	 * optional PCI "hooks"
 	 */
@@ -187,13 +181,6 @@ struct machdep_calls {
 #ifdef CONFIG_KEXEC_CORE
 	void (*kexec_cpu_down)(int crash_shutdown, int secondary);
 
-	/* Called to do what every setup is needed on image and the
-	 * reboot code buffer. Returns 0 on success.
-	 * Provide your own (maybe dummy) implementation if your platform
-	 * claims to support kexec.
-	 */
-	int (*machine_kexec_prepare)(struct kimage *image);
-
 	/* Called to perform the _real_ kexec.
 	 * Do NOT allocate memory or fail here. We are past the point of
 	 * no return.
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index b1e43b69a559..0b7894eed58d 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -278,9 +278,6 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "clock\t\t: %lu.%06luMHz\n",
 			   proc_freq / 1000000, proc_freq % 1000000);
 
-	if (ppc_md.show_percpuinfo != NULL)
-		ppc_md.show_percpuinfo(m, cpu_id);
-
 	/* If we are a Freescale core do a simple check so
 	 * we dont have to keep adding cases in the future */
 	if (PVR_VER(pvr) & 0x8000) {
diff --git a/arch/powerpc/kernel/swsusp_64.c b/arch/powerpc/kernel/swsusp_64.c
index aeea97ad85cf..16ee3baaf09a 100644
--- a/arch/powerpc/kernel/swsusp_64.c
+++ b/arch/powerpc/kernel/swsusp_64.c
@@ -17,8 +17,3 @@ void do_after_copyback(void)
 	touch_softlockup_watchdog();
 	mb();
 }
-
-void _iommu_save(void)
-{
-	iommu_save();
-}
diff --git a/arch/powerpc/kernel/swsusp_asm64.S b/arch/powerpc/kernel/swsusp_asm64.S
index 6d3189830dd3..96bb20715aa9 100644
--- a/arch/powerpc/kernel/swsusp_asm64.S
+++ b/arch/powerpc/kernel/swsusp_asm64.S
@@ -128,7 +128,6 @@ END_FW_FTR_SECTION_IFCLR(FW_FEATURE_LPAR)
 	 * stack pointer on the stack like a real stackframe */
 	addi	r1,r1,-128
 
-	bl _iommu_save
 	bl swsusp_save
 
 	/* restore LR */
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 48525e8b5730..a2242017e55f 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -48,19 +48,6 @@ void machine_crash_shutdown(struct pt_regs *regs)
 	default_machine_crash_shutdown(regs);
 }
 
-/*
- * Do what every setup is needed on image and the
- * reboot code buffer to allow us to avoid allocations
- * later.
- */
-int machine_kexec_prepare(struct kimage *image)
-{
-	if (ppc_md.machine_kexec_prepare)
-		return ppc_md.machine_kexec_prepare(image);
-	else
-		return default_machine_kexec_prepare(image);
-}
-
 void machine_kexec_cleanup(struct kimage *image)
 {
 }
diff --git a/arch/powerpc/kexec/core_32.c b/arch/powerpc/kexec/core_32.c
index bf9f1f906d64..b50aed48d09d 100644
--- a/arch/powerpc/kexec/core_32.c
+++ b/arch/powerpc/kexec/core_32.c
@@ -63,7 +63,7 @@ void default_machine_kexec(struct kimage *image)
 	(*rnk)(page_list, reboot_code_buffer_phys, image->start);
 }
 
-int default_machine_kexec_prepare(struct kimage *image)
+int machine_kexec_prepare(struct kimage *image)
 {
 	return 0;
 }
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 89c069d664a5..66678518b938 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -32,7 +32,7 @@
 #include <asm/svm.h>
 #include <asm/ultravisor.h>
 
-int default_machine_kexec_prepare(struct kimage *image)
+int machine_kexec_prepare(struct kimage *image)
 {
 	int i;
 	unsigned long begin, end;	/* limits of segment */
-- 
2.25.0

