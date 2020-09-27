Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B0427A042
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:31:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgQP0CcXzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:31:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg4t3ZcvzDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4g1pNPz9vCy5;
 Sun, 27 Sep 2020 11:16:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cW0T214Ihn47; Sun, 27 Sep 2020 11:16:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4g11lJz9vCxw;
 Sun, 27 Sep 2020 11:16:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8AEC98B771;
 Sun, 27 Sep 2020 11:16:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5ulJbAddd6PD; Sun, 27 Sep 2020 11:16:23 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 564298B75B;
 Sun, 27 Sep 2020 11:16:23 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3C0C265DE8; Sun, 27 Sep 2020 09:16:23 +0000 (UTC)
Message-Id: <269ffb54c37fc1d46128f77d7a39f88ef4a9957d.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 06/30] powerpc/vdso: Refactor 32 bits and 64 bits pages
 setup
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:23 +0000 (UTC)
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

The setup of VDSO pages is identical for 32 bits VDSO and
64 bits VDSO.

Refactor that setup.

And use &vdsoXX_start which is synonym of vdsoXX_kbase.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 39 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index d2c08f5de587..d129d7ee006d 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -678,10 +678,26 @@ int vdso_getcpu_init(void)
 early_initcall(vdso_getcpu_init);
 #endif
 
-static int __init vdso_init(void)
+static struct page ** __init vdso_setup_pages(void *start, void *end)
 {
 	int i;
+	struct page **pagelist;
+	int pages = (end - start) >> PAGE_SHIFT;
+
+	pagelist = kcalloc(pages + 1, sizeof(struct page *), GFP_KERNEL);
+	if (!pagelist)
+		panic("%s: Cannot allocate page list for VDSO", __func__);
+
+	for (i = 0; i < pages; i++)
+		pagelist[i] = virt_to_page(start + i * PAGE_SIZE);
+
+	pagelist[i] = virt_to_page(vdso_data);
+
+	return pagelist;
+}
 
+static int __init vdso_init(void)
+{
 #ifdef CONFIG_PPC64
 	/*
 	 * Fill up the "systemcfg" stuff for backward compatibility
@@ -742,28 +758,11 @@ static int __init vdso_init(void)
 	}
 
 #ifdef CONFIG_VDSO32
-	/* Make sure pages are in the correct state */
-	vdso32_pagelist = kcalloc(vdso32_pages + 1, sizeof(struct page *),
-				  GFP_KERNEL);
-	BUG_ON(vdso32_pagelist == NULL);
-	for (i = 0; i < vdso32_pages; i++) {
-		struct page *pg = virt_to_page(vdso32_kbase + i*PAGE_SIZE);
-
-		vdso32_pagelist[i] = pg;
-	}
-	vdso32_pagelist[i++] = virt_to_page(vdso_data);
+	vdso32_pagelist = vdso_setup_pages(&vdso32_start, &vdso32_end);
 #endif
 
 #ifdef CONFIG_PPC64
-	vdso64_pagelist = kcalloc(vdso64_pages + 1, sizeof(struct page *),
-				  GFP_KERNEL);
-	BUG_ON(vdso64_pagelist == NULL);
-	for (i = 0; i < vdso64_pages; i++) {
-		struct page *pg = virt_to_page(vdso64_kbase + i*PAGE_SIZE);
-
-		vdso64_pagelist[i] = pg;
-	}
-	vdso64_pagelist[i++] = virt_to_page(vdso_data);
+	vdso64_pagelist = vdso_setup_pages(&vdso64_start, &vdso64_end);
 #endif /* CONFIG_PPC64 */
 
 	smp_wmb();
-- 
2.25.0

