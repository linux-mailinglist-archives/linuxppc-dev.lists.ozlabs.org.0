Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 639131C7933
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 20:17:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HPtz4XWWzDr7Z
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 04:16:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HMxG0w3SzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 02:48:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49HMx80Bk2z9v4kG;
 Wed,  6 May 2020 18:48:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id b9ALZa32zAYE; Wed,  6 May 2020 18:48:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49HMx76WdVz9v4kH;
 Wed,  6 May 2020 18:48:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BAF318B7C5;
 Wed,  6 May 2020 18:48:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vORc0usDt-Y3; Wed,  6 May 2020 18:48:45 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 74BB88B777;
 Wed,  6 May 2020 18:48:45 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 4092765911; Wed,  6 May 2020 16:48:45 +0000 (UTC)
Message-Id: <fc290394393bbac8810bee23befc88f76538f0a1.1588783498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1588783498.git.christophe.leroy@csgroup.eu>
References: <cover.1588783498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 39/45] powerpc/8xx: Map IMMR with a huge page
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  6 May 2020 16:48:45 +0000 (UTC)
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

Map the IMMR area with a single 512k huge page.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/8xx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 570ab2114a73..fb31a0c1c2a4 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -117,17 +117,13 @@ static bool immr_is_mapped __initdata;
 
 void __init mmu_mapin_immr(void)
 {
-	unsigned long p = PHYS_IMMR_BASE;
-	unsigned long v = VIRT_IMMR_BASE;
-	int offset;
-
 	if (immr_is_mapped)
 		return;
 
 	immr_is_mapped = true;
 
-	for (offset = 0; offset < IMMR_SIZE; offset += PAGE_SIZE)
-		map_kernel_page(v + offset, p + offset, PAGE_KERNEL_NCG);
+	__early_map_kernel_hugepage(VIRT_IMMR_BASE, PHYS_IMMR_BASE,
+				    PAGE_KERNEL_NCG, MMU_PAGE_512K, true);
 }
 
 unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
-- 
2.25.0

