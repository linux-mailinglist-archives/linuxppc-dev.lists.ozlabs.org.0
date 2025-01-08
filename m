Return-Path: <linuxppc-dev+bounces-4867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5699A064DD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 19:50:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSxn10sklz2xWZ;
	Thu,  9 Jan 2025 05:50:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736362213;
	cv=none; b=cqKaJBZu6c/TPZYVsVS8Dk6tS/v0L+itL3rr8VgoheRSTPdBjMsJKhFEAneWKZJGRxPlWH7rzrFcJOWQ8HPeKeDsAcJz3It0hWRVvUWSDAqlUHloszW0G1tuCZXpu7/C7gOEX8RwsO6Np6o/UrWp4P0UOguVBF3mjFMTTj1z1Fb+MbuSSsAoAttWXxtHOFei7ZtvxppLGBtdaWJfCnJ7x3xloiM1EcmbmC1GSrJuKsWzG3B6gwOHglT3GbHNvZTCn/AoKnCvSa7cwLDFlZa7mMNfuNkML+4liPwbTzs6LwYpuqja+wQW1uzziezrYz3j907LEqyfQ7ffP9BIeAb0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736362213; c=relaxed/relaxed;
	bh=pXxkbqk6X/WiRKMUk9hun81URjCf0nD1qo+HECzlVjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9zG9IMBtCBZOhklQjAS3LMUtfljHoHlmq216sEPljhOzx8AYQf2d4F0jT9EqTqECrEyAlNrptQD0OQ3sb/5YMGQRSWnbb6I2sQJ2xxkC75YawgAlNqTTd1lL/WEEdKHNb88C5iqimthHumU2j3xDC4R0GGmA/YzDc0FVBHjHuy3NModV5770GDSi5pRpzVvoRDFwnkleYjHFYzubJwM6+4FGBQVMfE2zvZ71Kwxp9ySefRYAAnG+A5jBm+SAAWnalxU1XvetMfKyzfzl6zi1rW4n96WDW0wKSOknA08bbCJDy5rRLdHo4AVUu2ICIVM+YH8qOSFqZu1+N5V8JrMHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSxmt4rcKz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 05:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YSxZ85Yfyz9sPd;
	Wed,  8 Jan 2025 19:40:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rVyIxD7aMmT; Wed,  8 Jan 2025 19:40:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YSxZ84hzyz9rvV;
	Wed,  8 Jan 2025 19:40:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8ADE58B783;
	Wed,  8 Jan 2025 19:40:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id eHaHAVFUYBnZ; Wed,  8 Jan 2025 19:40:48 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 15C5B8B768;
	Wed,  8 Jan 2025 19:40:48 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Arvind Sankar <nivedita@alum.mit.edu>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH] powerpc/32: Stop printing Kernel virtual memory layout
Date: Wed,  8 Jan 2025 19:40:38 +0100
Message-ID: <430bc8c1f2ff2eb9224b04450e22db472b0b9fa9.1736361630.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736361639; l=2229; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=PSo2/lOXLdAbBLFI9HqIkBg4P3ojWkalxsjwCFD8bMA=; b=5ajoRupaJ2Z0D41DN3Y6Nl2LVCuyWAxqlJ9pw7gIQsHcthgwNdLlAXe+QtNf5T3soHyGeyOFj zgo89m8jH8QCqchHvCOjI4+floJ72g3w4t64BMaduz5kjMeZSng0DpZ
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Printing of Kernel virtual memory layout was added for debug purpose
by commit f637a49e507c ("powerpc: Minor cleanups of kernel virt
address space definitions")

For security reasons, don't display the kernel's virtual memory layout.

Other architectures have removed it through following commits.

071929dbdd86 ("arm64: Stop printing the virtual memory layout")
1c31d4e96b8c ("ARM: 8820/1: mm: Stop printing the virtual memory layout")
31833332f798 ("m68k/mm: Stop printing the virtual memory layout")
fd8d0ca25631 ("parisc: Hide virtual kernel memory layout")
681ff0181bbf ("x86/mm/init/32: Stop printing the virtual memory layout")

Commit 681ff0181bbf ("x86/mm/init/32: Stop printing the virtual memory
layout") thought x86 was the last one, but in reality powerpc/32 still
had it.

So remove it now on powerpc/32 as well.

Cc: Arvind Sankar <nivedita@alum.mit.edu>
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/mem.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index c7708c8fad29..34806c858e54 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -319,28 +319,6 @@ void __init mem_init(void)
 	per_cpu(next_tlbcam_idx, smp_processor_id()) =
 		(mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) - 1;
 #endif
-
-#ifdef CONFIG_PPC32
-	pr_info("Kernel virtual memory layout:\n");
-#ifdef CONFIG_KASAN
-	pr_info("  * 0x%08lx..0x%08lx  : kasan shadow mem\n",
-		KASAN_SHADOW_START, KASAN_SHADOW_END);
-#endif
-	pr_info("  * 0x%08lx..0x%08lx  : fixmap\n", FIXADDR_START, FIXADDR_TOP);
-#ifdef CONFIG_HIGHMEM
-	pr_info("  * 0x%08lx..0x%08lx  : highmem PTEs\n",
-		PKMAP_BASE, PKMAP_ADDR(LAST_PKMAP));
-#endif /* CONFIG_HIGHMEM */
-	if (ioremap_bot != IOREMAP_TOP)
-		pr_info("  * 0x%08lx..0x%08lx  : early ioremap\n",
-			ioremap_bot, IOREMAP_TOP);
-	pr_info("  * 0x%08lx..0x%08lx  : vmalloc & ioremap\n",
-		VMALLOC_START, VMALLOC_END);
-#ifdef MODULES_VADDR
-	pr_info("  * 0x%08lx..0x%08lx  : modules\n",
-		MODULES_VADDR, MODULES_END);
-#endif
-#endif /* CONFIG_PPC32 */
 }
 
 void free_initmem(void)
-- 
2.47.0


