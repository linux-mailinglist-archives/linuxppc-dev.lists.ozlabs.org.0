Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AF7363FDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 12:47:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP3S73nLwz2y0K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 20:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP3Rp4Ybtz2xYb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 20:47:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FP3RZ1t4YzB09b3;
 Mon, 19 Apr 2021 12:47:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9QVuXNyI7_rG; Mon, 19 Apr 2021 12:47:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FP3RZ0mYfzB09Zy;
 Mon, 19 Apr 2021 12:47:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EF5F18B7BB;
 Mon, 19 Apr 2021 12:47:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZHZ7-PNlqPXU; Mon, 19 Apr 2021 12:47:26 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C10348B7B4;
 Mon, 19 Apr 2021 12:47:26 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B9BAC679FC; Mon, 19 Apr 2021 10:47:26 +0000 (UTC)
Message-Id: <c433e358190fb5d47650463ea1ab755fc7b73e6e.1618828806.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1618828806.git.christophe.leroy@csgroup.eu>
References: <cover.1618828806.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/4] powerpc/mm: Leave a gap between early allocated IO
 areas
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org, dja@axtens.net
Date: Mon, 19 Apr 2021 10:47:26 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Oliver O'Halloran <oohall@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vmalloc system leaves a gap between allocated areas. It helps catching
overflows.

Do the same for IO areas which are allocated with early_ioremap_range()
until slab_is_available().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/ioremap_32.c | 4 ++--
 arch/powerpc/mm/ioremap_64.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/ioremap_32.c b/arch/powerpc/mm/ioremap_32.c
index 743e11384dea..9d13143b8be4 100644
--- a/arch/powerpc/mm/ioremap_32.c
+++ b/arch/powerpc/mm/ioremap_32.c
@@ -70,10 +70,10 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 	 */
 	pr_warn("ioremap() called early from %pS. Use early_ioremap() instead\n", caller);
 
-	err = early_ioremap_range(ioremap_bot - size, p, size, prot);
+	err = early_ioremap_range(ioremap_bot - size - PAGE_SIZE, p, size, prot);
 	if (err)
 		return NULL;
-	ioremap_bot -= size;
+	ioremap_bot -= size + PAGE_SIZE;
 
 	return (void __iomem *)ioremap_bot + offset;
 }
diff --git a/arch/powerpc/mm/ioremap_64.c b/arch/powerpc/mm/ioremap_64.c
index ba5cbb0d66bd..3acece00b33e 100644
--- a/arch/powerpc/mm/ioremap_64.c
+++ b/arch/powerpc/mm/ioremap_64.c
@@ -38,7 +38,7 @@ void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
 		return NULL;
 
 	ret = (void __iomem *)ioremap_bot + offset;
-	ioremap_bot += size;
+	ioremap_bot += size + PAGE_SIZE;
 
 	return ret;
 }
-- 
2.25.0

