Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642F27A046
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:34:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgTZ4278zDqRj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:34:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg4t1hJyzDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4j2sGQz9vCy7;
 Sun, 27 Sep 2020 11:16:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id icfunF-TvrNU; Sun, 27 Sep 2020 11:16:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4j230tz9vCxw;
 Sun, 27 Sep 2020 11:16:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D070B8B771;
 Sun, 27 Sep 2020 11:16:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fHGWl0RRgwYd; Sun, 27 Sep 2020 11:16:25 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6447B8B75B;
 Sun, 27 Sep 2020 11:16:25 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4A9DA65DE8; Sun, 27 Sep 2020 09:16:25 +0000 (UTC)
Message-Id: <4edfa548c3885a430b765335dc720105716e273f.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 08/30] powerpc/vdso: Use VDSO size in
 arch_setup_additional_pages()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:25 +0000 (UTC)
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

In arch_setup_additional_pages(), instead of using number of VDSO
pages and recalculate VDSO size, directly use the VDSO size.

As vdso_ready is set, vdso_pages can't be 0 so just remove the test.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index a24f6a583fac..448ecaa27ac5 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -126,7 +126,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
 	struct mm_struct *mm = current->mm;
 	struct page **vdso_pagelist;
-	unsigned long vdso_pages;
+	unsigned long vdso_size;
 	unsigned long vdso_base;
 	int rc;
 
@@ -135,11 +135,11 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 
 	if (is_32bit_task()) {
 		vdso_pagelist = vdso32_pagelist;
-		vdso_pages = vdso32_pages;
+		vdso_size = &vdso32_end - &vdso32_start;
 		vdso_base = VDSO32_MBASE;
 	} else {
 		vdso_pagelist = vdso64_pagelist;
-		vdso_pages = vdso64_pages;
+		vdso_size = &vdso64_end - &vdso64_start;
 		/*
 		 * On 64bit we don't have a preferred map address. This
 		 * allows get_unmapped_area to find an area near other mmaps
@@ -150,13 +150,8 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 
 	current->mm->context.vdso_base = 0;
 
-	/* vDSO has a problem and was disabled, just don't "enable" it for the
-	 * process
-	 */
-	if (vdso_pages == 0)
-		return 0;
 	/* Add a page to the vdso size for the data page */
-	vdso_pages ++;
+	vdso_size += PAGE_SIZE;
 
 	/*
 	 * pick a base address for the vDSO in process space. We try to put it
@@ -167,8 +162,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	if (mmap_write_lock_killable(mm))
 		return -EINTR;
 	vdso_base = get_unmapped_area(NULL, vdso_base,
-				      (vdso_pages << PAGE_SHIFT) +
-				      ((VDSO_ALIGNMENT - 1) & PAGE_MASK),
+				      vdso_size + ((VDSO_ALIGNMENT - 1) & PAGE_MASK),
 				      0, 0);
 	if (IS_ERR_VALUE(vdso_base)) {
 		rc = vdso_base;
@@ -195,7 +189,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	 * It's fine to use that for setting breakpoints in the vDSO code
 	 * pages though.
 	 */
-	rc = install_special_mapping(mm, vdso_base, vdso_pages << PAGE_SHIFT,
+	rc = install_special_mapping(mm, vdso_base, vdso_size,
 				     VM_READ|VM_EXEC|
 				     VM_MAYREAD|VM_MAYWRITE|VM_MAYEXEC,
 				     vdso_pagelist);
-- 
2.25.0

