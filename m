Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 252FD27A040
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:30:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgNR3pk8zDqQf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:29:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg4t3rjXzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4k23b8z9vCy8;
 Sun, 27 Sep 2020 11:16:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id raaRS9gIkYFd; Sun, 27 Sep 2020 11:16:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4k1Jj1z9vCxw;
 Sun, 27 Sep 2020 11:16:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B8C7D8B771;
 Sun, 27 Sep 2020 11:16:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t4GK7Ov7iwQa; Sun, 27 Sep 2020 11:16:26 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6BEF98B75B;
 Sun, 27 Sep 2020 11:16:26 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 529F565DE8; Sun, 27 Sep 2020 09:16:26 +0000 (UTC)
Message-Id: <603c1d039d3f928ee95e547fcd2219fcf4c3b514.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 09/30] powerpc/vdso: Simplify arch_setup_additional_pages()
 exit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:26 +0000 (UTC)
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

To simplify arch_setup_additional_pages() exit, rename
it __arch_setup_additional_pages() and create a caller
arch_setup_additional_pages() which does the locking.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 40 ++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 448ecaa27ac5..a976c5e4a7ac 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -122,7 +122,7 @@ struct lib64_elfinfo
  * This is called from binfmt_elf, we create the special vma for the
  * vDSO and insert it into the mm struct tree
  */
-int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
+static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
 	struct mm_struct *mm = current->mm;
 	struct page **vdso_pagelist;
@@ -130,9 +130,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	unsigned long vdso_base;
 	int rc;
 
-	if (!vdso_ready)
-		return 0;
-
 	if (is_32bit_task()) {
 		vdso_pagelist = vdso32_pagelist;
 		vdso_size = &vdso32_end - &vdso32_start;
@@ -148,8 +145,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		vdso_base = 0;
 	}
 
-	current->mm->context.vdso_base = 0;
-
 	/* Add a page to the vdso size for the data page */
 	vdso_size += PAGE_SIZE;
 
@@ -159,15 +154,11 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	 * and end up putting it elsewhere.
 	 * Add enough to the size so that the result can be aligned.
 	 */
-	if (mmap_write_lock_killable(mm))
-		return -EINTR;
 	vdso_base = get_unmapped_area(NULL, vdso_base,
 				      vdso_size + ((VDSO_ALIGNMENT - 1) & PAGE_MASK),
 				      0, 0);
-	if (IS_ERR_VALUE(vdso_base)) {
-		rc = vdso_base;
-		goto fail_mmapsem;
-	}
+	if (IS_ERR_VALUE(vdso_base))
+		return vdso_base;
 
 	/* Add required alignment. */
 	vdso_base = ALIGN(vdso_base, VDSO_ALIGNMENT);
@@ -193,15 +184,26 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 				     VM_READ|VM_EXEC|
 				     VM_MAYREAD|VM_MAYWRITE|VM_MAYEXEC,
 				     vdso_pagelist);
-	if (rc) {
-		current->mm->context.vdso_base = 0;
-		goto fail_mmapsem;
-	}
+	return rc;
+}
 
-	mmap_write_unlock(mm);
-	return 0;
+int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
+{
+	struct mm_struct *mm = current->mm;
+	int rc;
+
+	mm->context.vdso_base = 0;
+
+	if (!vdso_ready)
+		return 0;
+
+	if (mmap_write_lock_killable(mm))
+		return -EINTR;
+
+	rc = __arch_setup_additional_pages(bprm, uses_interp);
+	if (rc)
+		mm->context.vdso_base = 0;
 
- fail_mmapsem:
 	mmap_write_unlock(mm);
 	return rc;
 }
-- 
2.25.0

