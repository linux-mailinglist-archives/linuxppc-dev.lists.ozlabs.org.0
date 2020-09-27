Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD3127A043
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:33:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgRz3NlmzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:33:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg4t1Y0fzDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4h1gfnz9vCy6;
 Sun, 27 Sep 2020 11:16:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id X08TwnoChMdK; Sun, 27 Sep 2020 11:16:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4h0pRYz9vCxw;
 Sun, 27 Sep 2020 11:16:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A670D8B771;
 Sun, 27 Sep 2020 11:16:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oZdgDuJ3N8Pv; Sun, 27 Sep 2020 11:16:24 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EB248B75B;
 Sun, 27 Sep 2020 11:16:24 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4311365DE8; Sun, 27 Sep 2020 09:16:24 +0000 (UTC)
Message-Id: <f9333432e329b1fcbbbf846cb1cd4a1c4127a60b.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 07/30] powerpc/vdso: Remove unnecessary ifdefs in
 vdso_pagelist initialization
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:24 +0000 (UTC)
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

No need of all those #ifdefs around the pagelist initialisation,
use IS_ENABLED(), GCC will kick out unused static variables.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index d129d7ee006d..a24f6a583fac 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -53,15 +53,12 @@ static struct page **vdso32_pagelist;
 unsigned long vdso32_sigtramp;
 unsigned long vdso32_rt_sigtramp;
 
-#ifdef CONFIG_VDSO32
 extern char vdso32_start, vdso32_end;
-#endif
-
-#ifdef CONFIG_PPC64
 extern char vdso64_start, vdso64_end;
 static void *vdso64_kbase = &vdso64_start;
 static unsigned int vdso64_pages;
 static struct page **vdso64_pagelist;
+#ifdef CONFIG_PPC64
 unsigned long vdso64_rt_sigtramp;
 #endif /* CONFIG_PPC64 */
 
@@ -136,7 +133,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	if (!vdso_ready)
 		return 0;
 
-#ifdef CONFIG_PPC64
 	if (is_32bit_task()) {
 		vdso_pagelist = vdso32_pagelist;
 		vdso_pages = vdso32_pages;
@@ -151,11 +147,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		 */
 		vdso_base = 0;
 	}
-#else
-	vdso_pagelist = vdso32_pagelist;
-	vdso_pages = vdso32_pages;
-	vdso_base = VDSO32_MBASE;
-#endif
 
 	current->mm->context.vdso_base = 0;
 
@@ -614,9 +605,7 @@ static __init int vdso_setup(void)
 	struct lib64_elfinfo	v64;
 
 	v32.hdr = vdso32_kbase;
-#ifdef CONFIG_PPC64
 	v64.hdr = vdso64_kbase;
-#endif
 	if (vdso_do_find_sections(&v32, &v64))
 		return -1;
 
@@ -722,16 +711,14 @@ static int __init vdso_init(void)
 	vdso_data->icache_block_size = ppc64_caches.l1i.block_size;
 	vdso_data->dcache_log_block_size = ppc64_caches.l1d.log_block_size;
 	vdso_data->icache_log_block_size = ppc64_caches.l1i.log_block_size;
+#endif /* CONFIG_PPC64 */
 
 	/*
 	 * Calculate the size of the 64 bits vDSO
 	 */
 	vdso64_pages = (&vdso64_end - &vdso64_start) >> PAGE_SHIFT;
 	DBG("vdso64_kbase: %p, 0x%x pages\n", vdso64_kbase, vdso64_pages);
-#endif /* CONFIG_PPC64 */
-
 
-#ifdef CONFIG_VDSO32
 	vdso32_kbase = &vdso32_start;
 
 	/*
@@ -739,8 +726,6 @@ static int __init vdso_init(void)
 	 */
 	vdso32_pages = (&vdso32_end - &vdso32_start) >> PAGE_SHIFT;
 	DBG("vdso32_kbase: %p, 0x%x pages\n", vdso32_kbase, vdso32_pages);
-#endif
-
 
 	vdso_setup_syscall_map();
 
@@ -751,19 +736,15 @@ static int __init vdso_init(void)
 	if (vdso_setup()) {
 		printk(KERN_ERR "vDSO setup failure, not enabled !\n");
 		vdso32_pages = 0;
-#ifdef CONFIG_PPC64
 		vdso64_pages = 0;
-#endif
 		return 0;
 	}
 
-#ifdef CONFIG_VDSO32
-	vdso32_pagelist = vdso_setup_pages(&vdso32_start, &vdso32_end);
-#endif
+	if (IS_ENABLED(CONFIG_VDSO32))
+		vdso32_pagelist = vdso_setup_pages(&vdso32_start, &vdso32_end);
 
-#ifdef CONFIG_PPC64
-	vdso64_pagelist = vdso_setup_pages(&vdso64_start, &vdso64_end);
-#endif /* CONFIG_PPC64 */
+	if (IS_ENABLED(CONFIG_PPC64))
+		vdso64_pagelist = vdso_setup_pages(&vdso64_start, &vdso64_end);
 
 	smp_wmb();
 	vdso_ready = 1;
-- 
2.25.0

