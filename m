Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A1F295884
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 08:45:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGyYJ1llJzDql9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 17:45:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGyBq1MsCzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 17:29:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CGyBg00nxz9vBKq;
 Thu, 22 Oct 2020 08:29:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OEctDQ2GCC3Y; Thu, 22 Oct 2020 08:29:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CGyBf681Hz9vBKl;
 Thu, 22 Oct 2020 08:29:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C02DC8B805;
 Thu, 22 Oct 2020 08:29:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vSlVrgO5QCNW; Thu, 22 Oct 2020 08:29:31 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 880AC8B769;
 Thu, 22 Oct 2020 08:29:31 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6C915667EF; Thu, 22 Oct 2020 06:29:31 +0000 (UTC)
Message-Id: <786c82a89cdfdaabb32b72a44f7c312fa81d192b.1603348103.git.christophe.leroy@csgroup.eu>
In-Reply-To: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
References: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 06/20] powerpc/32s: Make Hash var static
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Oct 2020 06:29:31 +0000 (UTC)
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

Hash var is used only locally in mmu.c now.

No need to set it in head_32.S anymore.

Make it static and initialises it to the early hash table.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 5 -----
 arch/powerpc/mm/book3s32/mmu.c       | 2 +-
 arch/powerpc/mm/mmu_decl.h           | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 5eb9eedac920..620af1dda70c 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -155,9 +155,7 @@ __after_mmu_off:
 
 	bl	initial_bats
 	bl	load_segment_registers
-BEGIN_MMU_FTR_SECTION
 	bl	early_hash_table
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 #if defined(CONFIG_BOOTX_TEXT)
 	bl	setup_disp_bat
 #endif
@@ -931,9 +929,6 @@ early_hash_table:
 	lis	r6, early_hash - PAGE_OFFSET@h
 	ori	r6, r6, 3	/* 256kB table */
 	mtspr	SPRN_SDR1, r6
-	lis	r6, early_hash@h
-	lis	r3, Hash@ha
-	stw	r6, Hash@l(r3)
 	blr
 
 load_up_mmu:
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 6612d2a9a1ff..c0c0f2a50f86 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -33,7 +33,7 @@
 
 u8 __initdata early_hash[SZ_256K] __aligned(SZ_256K) = {0};
 
-struct hash_pte *Hash;
+static struct hash_pte *Hash = (struct hash_pte *)early_hash;
 static unsigned long Hash_size, Hash_mask;
 unsigned long _SDR1;
 static unsigned int hash_mb, hash_mb2;
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 1b6d39e9baed..900da3ae03db 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -101,7 +101,6 @@ extern int __map_without_bats;
 extern unsigned int rtas_data, rtas_size;
 
 struct hash_pte;
-extern struct hash_pte *Hash;
 extern u8 early_hash[];
 
 #endif /* CONFIG_PPC32 */
-- 
2.25.0

