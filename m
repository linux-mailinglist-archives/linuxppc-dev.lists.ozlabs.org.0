Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF7E251A97
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 16:16:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbWJM1KWxzDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 00:16:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbVpc1KxJzDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 23:54:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BbVpR3488z9txlm;
 Tue, 25 Aug 2020 15:54:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8t6-i_9o2a-h; Tue, 25 Aug 2020 15:54:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BbVpR1XFCz9txlf;
 Tue, 25 Aug 2020 15:54:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A29C98B81F;
 Tue, 25 Aug 2020 15:54:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CS6-jSBj_0QG; Tue, 25 Aug 2020 15:54:08 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8DB138B812;
 Tue, 25 Aug 2020 15:54:04 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5A47F65D40; Tue, 25 Aug 2020 13:54:04 +0000 (UTC)
Message-Id: <09497ca1607b62029e46b321bac0732864503323.1598363608.git.christophe.leroy@csgroup.eu>
In-Reply-To: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
References: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 6/9] powerpc/vdso: Provide vdso_remap()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 25 Aug 2020 13:54:04 +0000 (UTC)
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

Provide vdso_remap() through _install_special_mapping() and
drop arch_remap().

This adds a test of the size and returns -EINVAL if the size
is not correct.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/mm-arch-hooks.h | 25 ---------------------
 arch/powerpc/kernel/vdso.c               | 28 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 25 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/mm-arch-hooks.h

diff --git a/arch/powerpc/include/asm/mm-arch-hooks.h b/arch/powerpc/include/asm/mm-arch-hooks.h
deleted file mode 100644
index dce274be824a..000000000000
--- a/arch/powerpc/include/asm/mm-arch-hooks.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Architecture specific mm hooks
- *
- * Copyright (C) 2015, IBM Corporation
- * Author: Laurent Dufour <ldufour@linux.vnet.ibm.com>
- */
-
-#ifndef _ASM_POWERPC_MM_ARCH_HOOKS_H
-#define _ASM_POWERPC_MM_ARCH_HOOKS_H
-
-static inline void arch_remap(struct mm_struct *mm,
-			      unsigned long old_start, unsigned long old_end,
-			      unsigned long new_start, unsigned long new_end)
-{
-	/*
-	 * mremap() doesn't allow moving multiple vmas so we can limit the
-	 * check to old_start == vdso_base.
-	 */
-	if (old_start == mm->context.vdso_base)
-		mm->context.vdso_base = new_start;
-}
-#define arch_remap arch_remap
-
-#endif /* _ASM_POWERPC_MM_ARCH_HOOKS_H */
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 4ccfc0dc96b5..b9270923452e 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -114,13 +114,41 @@ struct lib64_elfinfo
 	unsigned long	text;
 };
 
+static int vdso_mremap(unsigned long vdso_pages,
+		       const struct vm_special_mapping *sm,
+		       struct vm_area_struct *new_vma)
+{
+	unsigned long new_size = new_vma->vm_end - new_vma->vm_start;
+	unsigned long vdso_size = (vdso_pages + 1) << PAGE_SHIFT;
+
+	if (new_size != vdso_size)
+		return -EINVAL;
+
+	current->mm->context.vdso_base = (unsigned long)new_vma->vm_start;
+
+	return 0;
+}
+
+static int vdso32_mremap(const struct vm_special_mapping *sm,
+			 struct vm_area_struct *new_vma)
+{
+	return vdso_mremap(vdso32_pages, sm, new_vma);
+}
+
+static int vdso64_mremap(const struct vm_special_mapping *sm,
+			 struct vm_area_struct *new_vma)
+{
+	return vdso_mremap(vdso64_pages, sm, new_vma);
+}
 
 static struct vm_special_mapping vdso32_spec __ro_after_init = {
 	.name = "[vdso]",
+	.mremap = vdso32_mremap,
 };
 
 static struct vm_special_mapping vdso64_spec __ro_after_init = {
 	.name = "[vdso]",
+	.mremap = vdso64_mremap,
 };
 
 /*
-- 
2.25.0

