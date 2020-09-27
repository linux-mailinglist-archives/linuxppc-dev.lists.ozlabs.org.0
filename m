Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0027A049
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:36:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgWN1zG6zDqZC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:36:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg4v2LNDzDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4l2Xhvz9vCxx;
 Sun, 27 Sep 2020 11:16:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id R4_S3vUDPNp0; Sun, 27 Sep 2020 11:16:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4l1NTMz9vCxw;
 Sun, 27 Sep 2020 11:16:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BBA3C8B771;
 Sun, 27 Sep 2020 11:16:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UdOeQkFTZf6D; Sun, 27 Sep 2020 11:16:27 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F0018B75B;
 Sun, 27 Sep 2020 11:16:27 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 60B8065DE8; Sun, 27 Sep 2020 09:16:27 +0000 (UTC)
Message-Id: <e7e5dfe0f93234e31051f2a610b4b07f50b0082f.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 10/30] powerpc/vdso: Move to _install_special_mapping() and
 remove arch_vma_name()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:27 +0000 (UTC)
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

Copied from commit 2fea7f6c98f5 ("arm64: vdso: move to
_install_special_mapping and remove arch_vma_name").

Use the new _install_special_mapping() API added by
commit a62c34bd2a8a ("x86, mm: Improve _install_special_mapping
and fix x86 vdso naming") which obsolete install_special_mapping().

And remove arch_vma_name() as the name is handled by the new API.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 45 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index a976c5e4a7ac..9b2c91a963a6 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -49,7 +49,6 @@
 
 static unsigned int vdso32_pages;
 static void *vdso32_kbase;
-static struct page **vdso32_pagelist;
 unsigned long vdso32_sigtramp;
 unsigned long vdso32_rt_sigtramp;
 
@@ -57,7 +56,6 @@ extern char vdso32_start, vdso32_end;
 extern char vdso64_start, vdso64_end;
 static void *vdso64_kbase = &vdso64_start;
 static unsigned int vdso64_pages;
-static struct page **vdso64_pagelist;
 #ifdef CONFIG_PPC64
 unsigned long vdso64_rt_sigtramp;
 #endif /* CONFIG_PPC64 */
@@ -118,6 +116,14 @@ struct lib64_elfinfo
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
@@ -125,17 +131,17 @@ struct lib64_elfinfo
 static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
 	struct mm_struct *mm = current->mm;
-	struct page **vdso_pagelist;
+	struct vm_special_mapping *vdso_spec;
+	struct vm_area_struct *vma;
 	unsigned long vdso_size;
 	unsigned long vdso_base;
-	int rc;
 
 	if (is_32bit_task()) {
-		vdso_pagelist = vdso32_pagelist;
+		vdso_spec = &vdso32_spec;
 		vdso_size = &vdso32_end - &vdso32_start;
 		vdso_base = VDSO32_MBASE;
 	} else {
-		vdso_pagelist = vdso64_pagelist;
+		vdso_spec = &vdso64_spec;
 		vdso_size = &vdso64_end - &vdso64_start;
 		/*
 		 * On 64bit we don't have a preferred map address. This
@@ -166,7 +172,7 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	/*
 	 * Put vDSO base into mm struct. We need to do this before calling
 	 * install_special_mapping or the perf counter mmap tracking code
-	 * will fail to recognise it as a vDSO (since arch_vma_name fails).
+	 * will fail to recognise it as a vDSO.
 	 */
 	current->mm->context.vdso_base = vdso_base;
 
@@ -180,11 +186,13 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	 * It's fine to use that for setting breakpoints in the vDSO code
 	 * pages though.
 	 */
-	rc = install_special_mapping(mm, vdso_base, vdso_size,
-				     VM_READ|VM_EXEC|
-				     VM_MAYREAD|VM_MAYWRITE|VM_MAYEXEC,
-				     vdso_pagelist);
-	return rc;
+	vma = _install_special_mapping(mm, vdso_base, vdso_size,
+				       VM_READ | VM_EXEC | VM_MAYREAD |
+				       VM_MAYWRITE | VM_MAYEXEC, vdso_spec);
+	if (IS_ERR(vma))
+		return PTR_ERR(vma);
+
+	return 0;
 }
 
 int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
@@ -208,15 +216,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
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
@@ -737,10 +736,10 @@ static int __init vdso_init(void)
 	}
 
 	if (IS_ENABLED(CONFIG_VDSO32))
-		vdso32_pagelist = vdso_setup_pages(&vdso32_start, &vdso32_end);
+		vdso32_spec.pages = vdso_setup_pages(&vdso32_start, &vdso32_end);
 
 	if (IS_ENABLED(CONFIG_PPC64))
-		vdso64_pagelist = vdso_setup_pages(&vdso64_start, &vdso64_end);
+		vdso64_spec.pages = vdso_setup_pages(&vdso64_start, &vdso64_end);
 
 	smp_wmb();
 	vdso_ready = 1;
-- 
2.25.0

