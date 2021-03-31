Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5123502BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:51:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Tm05ldlz3f9m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:51:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Tk849mRz3c8N
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:49:52 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F9Tk464Vkz9txdc;
 Wed, 31 Mar 2021 16:49:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id waR77RpQirp7; Wed, 31 Mar 2021 16:49:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F9Tk45HkYz9v328;
 Wed, 31 Mar 2021 16:49:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DB02C8B82A;
 Wed, 31 Mar 2021 16:49:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Bey8wLQ02lei; Wed, 31 Mar 2021 16:49:49 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 833A88B828;
 Wed, 31 Mar 2021 16:49:49 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5676D67647; Wed, 31 Mar 2021 14:49:49 +0000 (UTC)
Message-Id: <1a15495f80ec19a87b16cf874dbf7c3fa5ec40fe.1617202094.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617202094.git.christophe.leroy@csgroup.eu>
References: <cover.1617202094.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 4/4] powerpc/vdso: Add support for time namespaces
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 31 Mar 2021 14:49:49 +0000 (UTC)
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

This patch adds the necessary glue to provide time namespaces.

Things are mainly copied from ARM64.

__arch_get_timens_vdso_data() calculates timens vdso data position
based on the vdso data position, knowing it is the next page in vvar.
This avoids having to redo the mflr/bcl/mflr/mtlr dance to locate
the page relative to running code position.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                         |   3 +-
 arch/powerpc/include/asm/vdso/gettimeofday.h |  10 ++
 arch/powerpc/include/asm/vdso_datapage.h     |   2 -
 arch/powerpc/kernel/vdso.c                   | 116 ++++++++++++++++---
 arch/powerpc/kernel/vdso32/vdso32.lds.S      |   2 +-
 arch/powerpc/kernel/vdso64/vdso64.lds.S      |   2 +-
 6 files changed, 114 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c1344c05226c..71daff5f15d5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -172,6 +172,7 @@ config PPC
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
 	select GENERIC_EARLY_IOREMAP
+	select GENERIC_GETTIMEOFDAY
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_PCI_IOMAP		if PCI
@@ -179,7 +180,7 @@ config PPC
 	select GENERIC_STRNCPY_FROM_USER
 	select GENERIC_STRNLEN_USER
 	select GENERIC_TIME_VSYSCALL
-	select GENERIC_GETTIMEOFDAY
+	select GENERIC_VDSO_TIME_NS
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
 	select HAVE_ARCH_JUMP_LABEL
diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index d453e725c79f..e448df1dd071 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_POWERPC_VDSO_GETTIMEOFDAY_H
 #define _ASM_POWERPC_VDSO_GETTIMEOFDAY_H
 
+#include <asm/page.h>
+
 #ifdef __ASSEMBLY__
 
 #include <asm/ppc_asm.h>
@@ -153,6 +155,14 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 
 const struct vdso_data *__arch_get_vdso_data(void);
 
+#ifdef CONFIG_TIME_NS
+static __always_inline
+const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
+{
+	return (void *)vd + PAGE_SIZE;
+}
+#endif
+
 static inline bool vdso_clocksource_ok(const struct vdso_data *vd)
 {
 	return true;
diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index 3f958ecf2beb..a585c8e538ff 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -107,9 +107,7 @@ extern struct vdso_arch_data *vdso_data;
 	bcl	20, 31, .+4
 999:
 	mflr	\ptr
-#if CONFIG_PPC_PAGE_SHIFT > 14
 	addis	\ptr, \ptr, (_vdso_datapage - 999b)@ha
-#endif
 	addi	\ptr, \ptr, (_vdso_datapage - 999b)@l
 .endm
 
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index b14907209822..717f2c9a7573 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -18,6 +18,7 @@
 #include <linux/security.h>
 #include <linux/memblock.h>
 #include <linux/syscalls.h>
+#include <linux/time_namespace.h>
 #include <vdso/datapage.h>
 
 #include <asm/syscall.h>
@@ -50,6 +51,12 @@ static union {
 } vdso_data_store __page_aligned_data;
 struct vdso_arch_data *vdso_data = &vdso_data_store.data;
 
+enum vvar_pages {
+	VVAR_DATA_PAGE_OFFSET,
+	VVAR_TIMENS_PAGE_OFFSET,
+	VVAR_NR_PAGES,
+};
+
 static int vdso_mremap(const struct vm_special_mapping *sm, struct vm_area_struct *new_vma,
 		       unsigned long text_size)
 {
@@ -73,8 +80,12 @@ static int vdso64_mremap(const struct vm_special_mapping *sm, struct vm_area_str
 	return vdso_mremap(sm, new_vma, &vdso64_end - &vdso64_start);
 }
 
+static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
+			     struct vm_area_struct *vma, struct vm_fault *vmf);
+
 static struct vm_special_mapping vvar_spec __ro_after_init = {
 	.name = "[vvar]",
+	.fault = vvar_fault,
 };
 
 static struct vm_special_mapping vdso32_spec __ro_after_init = {
@@ -87,6 +98,94 @@ static struct vm_special_mapping vdso64_spec __ro_after_init = {
 	.mremap = vdso64_mremap,
 };
 
+#ifdef CONFIG_TIME_NS
+struct vdso_data *arch_get_vdso_data(void *vvar_page)
+{
+	return ((struct vdso_arch_data *)vvar_page)->data;
+}
+
+/*
+ * The vvar mapping contains data for a specific time namespace, so when a task
+ * changes namespace we must unmap its vvar data for the old namespace.
+ * Subsequent faults will map in data for the new namespace.
+ *
+ * For more details see timens_setup_vdso_data().
+ */
+int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
+{
+	struct mm_struct *mm = task->mm;
+	struct vm_area_struct *vma;
+
+	mmap_read_lock(mm);
+
+	for (vma = mm->mmap; vma; vma = vma->vm_next) {
+		unsigned long size = vma->vm_end - vma->vm_start;
+
+		if (vma_is_special_mapping(vma, &vvar_spec))
+			zap_page_range(vma, vma->vm_start, size);
+	}
+
+	mmap_read_unlock(mm);
+	return 0;
+}
+
+static struct page *find_timens_vvar_page(struct vm_area_struct *vma)
+{
+	if (likely(vma->vm_mm == current->mm))
+		return current->nsproxy->time_ns->vvar_page;
+
+	/*
+	 * VM_PFNMAP | VM_IO protect .fault() handler from being called
+	 * through interfaces like /proc/$pid/mem or
+	 * process_vm_{readv,writev}() as long as there's no .access()
+	 * in special_mapping_vmops.
+	 * For more details check_vma_flags() and __access_remote_vm()
+	 */
+	WARN(1, "vvar_page accessed remotely");
+
+	return NULL;
+}
+#else
+static struct page *find_timens_vvar_page(struct vm_area_struct *vma)
+{
+	return NULL;
+}
+#endif
+
+static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
+			     struct vm_area_struct *vma, struct vm_fault *vmf)
+{
+	struct page *timens_page = find_timens_vvar_page(vma);
+	unsigned long pfn;
+
+	switch (vmf->pgoff) {
+	case VVAR_DATA_PAGE_OFFSET:
+		if (timens_page)
+			pfn = page_to_pfn(timens_page);
+		else
+			pfn = virt_to_pfn(vdso_data);
+		break;
+#ifdef CONFIG_TIME_NS
+	case VVAR_TIMENS_PAGE_OFFSET:
+		/*
+		 * If a task belongs to a time namespace then a namespace
+		 * specific VVAR is mapped with the VVAR_DATA_PAGE_OFFSET and
+		 * the real VVAR page is mapped with the VVAR_TIMENS_PAGE_OFFSET
+		 * offset.
+		 * See also the comment near timens_setup_vdso_data().
+		 */
+		if (!timens_page)
+			return VM_FAULT_SIGBUS;
+		pfn = virt_to_pfn(vdso_data);
+		break;
+#endif /* CONFIG_TIME_NS */
+	default:
+		return VM_FAULT_SIGBUS;
+	}
+
+	return vmf_insert_pfn(vma, vmf->address, pfn);
+}
+
 /*
  * This is called from binfmt_elf, we create the special vma for the
  * vDSO and insert it into the mm struct tree
@@ -95,7 +194,7 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 {
 	unsigned long vdso_size, vdso_base, mappings_size;
 	struct vm_special_mapping *vdso_spec;
-	unsigned long vvar_size = PAGE_SIZE;
+	unsigned long vvar_size = VVAR_NR_PAGES * PAGE_SIZE;
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 
@@ -266,19 +365,6 @@ static struct page ** __init vdso_setup_pages(void *start, void *end)
 	return pagelist;
 }
 
-static struct page ** __init vvar_setup_pages(void)
-{
-	struct page **pagelist;
-
-	/* .pages is NULL-terminated */
-	pagelist = kcalloc(2, sizeof(struct page *), GFP_KERNEL);
-	if (!pagelist)
-		panic("%s: Cannot allocate page list for VVAR", __func__);
-
-	pagelist[0] = virt_to_page(vdso_data);
-	return pagelist;
-}
-
 static int __init vdso_init(void)
 {
 #ifdef CONFIG_PPC64
@@ -317,8 +403,6 @@ static int __init vdso_init(void)
 	if (IS_ENABLED(CONFIG_PPC64))
 		vdso64_spec.pages = vdso_setup_pages(&vdso64_start, &vdso64_end);
 
-	vvar_spec.pages = vvar_setup_pages();
-
 	smp_wmb();
 
 	return 0;
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index a4b806b0d618..58e0099f70f4 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -17,7 +17,7 @@ ENTRY(_start)
 
 SECTIONS
 {
-	PROVIDE(_vdso_datapage = . - PAGE_SIZE);
+	PROVIDE(_vdso_datapage = . - 2 * PAGE_SIZE);
 	. = SIZEOF_HEADERS;
 
 	.hash          	: { *(.hash) }			:text
diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/vdso64/vdso64.lds.S
index 2f3c359cacd3..0288cad428b0 100644
--- a/arch/powerpc/kernel/vdso64/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso64/vdso64.lds.S
@@ -17,7 +17,7 @@ ENTRY(_start)
 
 SECTIONS
 {
-	PROVIDE(_vdso_datapage = . - PAGE_SIZE);
+	PROVIDE(_vdso_datapage = . - 2 * PAGE_SIZE);
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
-- 
2.25.0

