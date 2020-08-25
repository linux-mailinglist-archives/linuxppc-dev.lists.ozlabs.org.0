Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D8251A7E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 16:08:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbW6T4LYQzDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 00:08:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbVpW6Xc1zDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 23:54:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BbVpQ6dvgz9txlg;
 Tue, 25 Aug 2020 15:54:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sP8__vNSoBId; Tue, 25 Aug 2020 15:54:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BbVpQ5rkPz9txlY;
 Tue, 25 Aug 2020 15:54:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C71E8B826;
 Tue, 25 Aug 2020 15:54:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4n1fW0mk10NJ; Tue, 25 Aug 2020 15:54:08 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 74B618B825;
 Tue, 25 Aug 2020 15:54:03 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 53C5165D3C; Tue, 25 Aug 2020 13:54:03 +0000 (UTC)
Message-Id: <7c6e35df8180650e6d1147476e8b5d9fa8643edb.1598363608.git.christophe.leroy@csgroup.eu>
In-Reply-To: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
References: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 5/9] powerpc/vdso: move to _install_special_mapping() and
 remove arch_vma_name()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 25 Aug 2020 13:54:03 +0000 (UTC)
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

From commit 2fea7f6c98f5 ("arm64: vdso: move to
_install_special_mapping and remove arch_vma_name").

Use the new _install_special_mapping() API added by
commit a62c34bd2a8a ("x86, mm: Improve _install_special_mapping
and fix x86 vdso naming") which obsolete install_special_mapping().

And remove arch_vma_name() as the name is handled by the new API.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 59 +++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index bbb69832fd46..4ccfc0dc96b5 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -47,7 +47,6 @@
 
 static unsigned int vdso32_pages;
 static void *vdso32_kbase;
-static struct page **vdso32_pagelist;
 unsigned long vdso32_sigtramp;
 unsigned long vdso32_rt_sigtramp;
 
@@ -56,7 +55,6 @@ extern char vdso32_start, vdso32_end;
 extern char vdso64_start, vdso64_end;
 static void *vdso64_kbase = &vdso64_start;
 static unsigned int vdso64_pages;
-static struct page **vdso64_pagelist;
 #ifdef CONFIG_PPC64
 unsigned long vdso64_rt_sigtramp;
 #endif /* CONFIG_PPC64 */
@@ -117,6 +115,14 @@ struct lib64_elfinfo
 };
 
 
+static struct vm_special_mapping vdso32_spec __ro_after_init = {
+	.name = "[vdso]",
+};
+
+static struct vm_special_mapping vdso64_spec __ro_after_init = {
+	.name = "[vdso]",
+};
+
 /*
  * This is called from binfmt_elf, we create the special vma for the
  * vDSO and insert it into the mm struct tree
@@ -124,7 +130,8 @@ struct lib64_elfinfo
 int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
 	struct mm_struct *mm = current->mm;
-	struct page **vdso_pagelist;
+	struct vm_special_mapping *vdso_spec;
+	struct vm_area_struct *vma;
 	unsigned long vdso_pages;
 	unsigned long vdso_base;
 	int rc;
@@ -133,11 +140,11 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		return 0;
 
 	if (is_32bit_task()) {
-		vdso_pagelist = vdso32_pagelist;
+		vdso_spec = &vdso32_spec;
 		vdso_pages = vdso32_pages;
 		vdso_base = VDSO32_MBASE;
 	} else {
-		vdso_pagelist = vdso64_pagelist;
+		vdso_spec = &vdso64_spec;
 		vdso_pages = vdso64_pages;
 		/*
 		 * On 64bit we don't have a preferred map address. This
@@ -194,12 +201,12 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	 * It's fine to use that for setting breakpoints in the vDSO code
 	 * pages though.
 	 */
-	rc = install_special_mapping(mm, vdso_base, vdso_pages << PAGE_SHIFT,
-				     VM_READ|VM_EXEC|
-				     VM_MAYREAD|VM_MAYWRITE|VM_MAYEXEC,
-				     vdso_pagelist);
-	if (rc) {
+	vma = _install_special_mapping(mm, vdso_base, vdso_pages << PAGE_SHIFT,
+				       VM_READ | VM_EXEC | VM_MAYREAD |
+				       VM_MAYWRITE | VM_MAYEXEC, vdso_spec);
+	if (IS_ERR(vma)) {
 		current->mm->context.vdso_base = 0;
+		rc = PTR_ERR(vma);
 		goto fail_mmapsem;
 	}
 
@@ -211,15 +218,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	return rc;
 }
 
-const char *arch_vma_name(struct vm_area_struct *vma)
-{
-	if (vma->vm_mm && vma->vm_start == vma->vm_mm->context.vdso_base)
-		return "[vdso]";
-	return NULL;
-}
-
-
-
 #ifdef CONFIG_VDSO32
 static void * __init find_section32(Elf32_Ehdr *ehdr, const char *secname,
 				  unsigned long *size)
@@ -685,6 +683,7 @@ early_initcall(vdso_getcpu_init);
 static int __init vdso_init(void)
 {
 	int i;
+	struct page **pagelist;
 
 #ifdef CONFIG_PPC64
 	/*
@@ -740,27 +739,29 @@ static int __init vdso_init(void)
 
 	if (IS_ENABLED(CONFIG_VDSO32)) {
 		/* Make sure pages are in the correct state */
-		vdso32_pagelist = kcalloc(vdso32_pages + 1, sizeof(struct page *),
-					  GFP_KERNEL);
-		if (!vdso32_pagelist)
+		pagelist = kcalloc(vdso32_pages + 1, sizeof(struct page *), GFP_KERNEL);
+		if (!pagelist)
 			goto alloc_failed;
 
 		for (i = 0; i < vdso32_pages; i++)
-			vdso32_pagelist[i] = virt_to_page(vdso32_kbase + i * PAGE_SIZE);
+			pagelist[i] = virt_to_page(vdso32_kbase + i * PAGE_SIZE);
+
+		pagelist[i++] = virt_to_page(vdso_data);
 
-		vdso32_pagelist[i] = virt_to_page(vdso_data);
+		vdso32_spec.pages = pagelist;
 	}
 
 	if (IS_ENABLED(CONFIG_PPC64)) {
-		vdso64_pagelist = kcalloc(vdso64_pages + 1, sizeof(struct page *),
-					  GFP_KERNEL);
-		if (!vdso64_pagelist)
+		pagelist = kcalloc(vdso64_pages + 1, sizeof(struct page *), GFP_KERNEL);
+		if (!pagelist)
 			goto alloc_failed;
 
 		for (i = 0; i < vdso64_pages; i++)
-			vdso64_pagelist[i] = virt_to_page(vdso64_kbase + i * PAGE_SIZE);
+			pagelist[i] = virt_to_page(vdso64_kbase + i * PAGE_SIZE);
+
+		pagelist[i++] = virt_to_page(vdso_data);
 
-		vdso64_pagelist[i] = virt_to_page(vdso_data);
+		vdso64_spec.pages = pagelist;
 	}
 
 	smp_wmb();
-- 
2.25.0

