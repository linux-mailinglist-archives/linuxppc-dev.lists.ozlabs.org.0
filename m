Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10949251A49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 15:56:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbVsc4rQHzDqVv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 23:56:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbVpW6JVGzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 23:54:09 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BbVpN0mStz9txlZ;
 Tue, 25 Aug 2020 15:54:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7XPdRsKX9l1c; Tue, 25 Aug 2020 15:54:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BbVpM73nzz9txlY;
 Tue, 25 Aug 2020 15:54:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 714D48B822;
 Tue, 25 Aug 2020 15:54:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HxYGHEkwjCuH; Tue, 25 Aug 2020 15:54:02 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 92E388B812;
 Tue, 25 Aug 2020 15:53:59 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2D50F65D3C; Tue, 25 Aug 2020 13:53:59 +0000 (UTC)
Message-Id: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 1/9] powerpc/vdso: Remove BUG_ON() in vdso_init()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 25 Aug 2020 13:53:59 +0000 (UTC)
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

If we are not able to allocate memory for the pagelists, bail out.

There is no reason to crash the machine, just have vdso init fail.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
This series is based on top of the series switching to C VDSO implementation,
but in fact only the last patch depends on that series and is not vital as
it is just afterwork cleanup.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 23208a051af5..88a4a02ed4c4 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -747,20 +747,16 @@ static int __init vdso_init(void)
 	 * Initialize the vDSO images in memory, that is do necessary
 	 * fixups of vDSO symbols, locate trampolines, etc...
 	 */
-	if (vdso_setup()) {
-		printk(KERN_ERR "vDSO setup failure, not enabled !\n");
-		vdso32_pages = 0;
-#ifdef CONFIG_PPC64
-		vdso64_pages = 0;
-#endif
-		return 0;
-	}
+	if (vdso_setup())
+		goto setup_failed;
 
 #ifdef CONFIG_VDSO32
 	/* Make sure pages are in the correct state */
 	vdso32_pagelist = kcalloc(vdso32_pages + 2, sizeof(struct page *),
 				  GFP_KERNEL);
-	BUG_ON(vdso32_pagelist == NULL);
+	if (!vdso32_pagelist)
+		goto alloc_failed;
+
 	for (i = 0; i < vdso32_pages; i++) {
 		struct page *pg = virt_to_page(vdso32_kbase + i*PAGE_SIZE);
 		get_page(pg);
@@ -773,7 +769,9 @@ static int __init vdso_init(void)
 #ifdef CONFIG_PPC64
 	vdso64_pagelist = kcalloc(vdso64_pages + 2, sizeof(struct page *),
 				  GFP_KERNEL);
-	BUG_ON(vdso64_pagelist == NULL);
+	if (!vdso64_pagelist)
+		goto alloc_failed;
+
 	for (i = 0; i < vdso64_pages; i++) {
 		struct page *pg = virt_to_page(vdso64_kbase + i*PAGE_SIZE);
 		get_page(pg);
@@ -789,5 +787,14 @@ static int __init vdso_init(void)
 	vdso_ready = 1;
 
 	return 0;
+
+setup_failed:
+	pr_err("vDSO setup failure, not enabled !\n");
+alloc_failed:
+	vdso32_pages = 0;
+#ifdef CONFIG_PPC64
+	vdso64_pages = 0;
+#endif
+	return 0;
 }
 arch_initcall(vdso_init);
-- 
2.25.0

