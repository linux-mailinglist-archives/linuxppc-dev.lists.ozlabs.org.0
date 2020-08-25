Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18897251A50
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 15:59:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbVwC4wjTzDqPN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 23:59:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbVpW6L2dzDqNX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 23:54:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BbVpQ6gSHz9txlh;
 Tue, 25 Aug 2020 15:54:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZFV0vU3mTpAd; Tue, 25 Aug 2020 15:54:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BbVpQ5rr9z9txlf;
 Tue, 25 Aug 2020 15:54:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4CAD38B827;
 Tue, 25 Aug 2020 15:54:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QsCZbnIpDs1q; Tue, 25 Aug 2020 15:54:08 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FA078B81F;
 Tue, 25 Aug 2020 15:54:01 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 38C9C65D3E; Tue, 25 Aug 2020 13:54:01 +0000 (UTC)
Message-Id: <7a2db17f2ffe902620554b9fde0349b4cf0dc051.1598363608.git.christophe.leroy@csgroup.eu>
In-Reply-To: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
References: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/9] powerpc/vdso: Remove NULL termination element in
 vdso_pagelist
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 25 Aug 2020 13:54:01 +0000 (UTC)
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

No need of a NULL last element in pagelists, install_special_mapping()
knows how long the list is.

Remove that element.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 3bc4d5b1980b..daef14a284a3 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -752,7 +752,7 @@ static int __init vdso_init(void)
 
 #ifdef CONFIG_VDSO32
 	/* Make sure pages are in the correct state */
-	vdso32_pagelist = kcalloc(vdso32_pages + 2, sizeof(struct page *),
+	vdso32_pagelist = kcalloc(vdso32_pages + 1, sizeof(struct page *),
 				  GFP_KERNEL);
 	if (!vdso32_pagelist)
 		goto alloc_failed;
@@ -760,12 +760,11 @@ static int __init vdso_init(void)
 	for (i = 0; i < vdso32_pages; i++)
 		vdso32_pagelist[i] = virt_to_page(vdso32_kbase + i * PAGE_SIZE);
 
-	vdso32_pagelist[i++] = virt_to_page(vdso_data);
-	vdso32_pagelist[i] = NULL;
+	vdso32_pagelist[i] = virt_to_page(vdso_data);
 #endif
 
 #ifdef CONFIG_PPC64
-	vdso64_pagelist = kcalloc(vdso64_pages + 2, sizeof(struct page *),
+	vdso64_pagelist = kcalloc(vdso64_pages + 1, sizeof(struct page *),
 				  GFP_KERNEL);
 	if (!vdso64_pagelist)
 		goto alloc_failed;
@@ -773,8 +772,7 @@ static int __init vdso_init(void)
 	for (i = 0; i < vdso64_pages; i++)
 		vdso64_pagelist[i] = virt_to_page(vdso64_kbase + i * PAGE_SIZE);
 
-	vdso64_pagelist[i++] = virt_to_page(vdso_data);
-	vdso64_pagelist[i] = NULL;
+	vdso64_pagelist[i] = virt_to_page(vdso_data);
 #endif /* CONFIG_PPC64 */
 
 	smp_wmb();
-- 
2.25.0

