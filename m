Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A2128AFB6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 10:12:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8rxY5Wq1zDqbq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 19:12:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8rmr3Yk1zDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 19:04:28 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C8rmh0Xlpz9typT;
 Mon, 12 Oct 2020 10:04:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ry--GPNevYkn; Mon, 12 Oct 2020 10:04:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C8rmg6mw4z9typR;
 Mon, 12 Oct 2020 10:04:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 12D5C8B783;
 Mon, 12 Oct 2020 10:04:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id daA5CPWgaEmW; Mon, 12 Oct 2020 10:04:25 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ACFCF8B787;
 Mon, 12 Oct 2020 10:04:24 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8E0F466441; Mon, 12 Oct 2020 08:04:24 +0000 (UTC)
Message-Id: <829ae1aed1d2fc6b5fc5818362e573dee5d6ecde.1602489852.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/mm: Desintegrate MMU_FTR_PPCAS_ARCH_V2
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 12 Oct 2020 08:04:24 +0000 (UTC)
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

MMU_FTR_PPCAS_ARCH_V2 is defined in cpu_table.h
as MMU_FTR_TLBIEL | MMU_FTR_16M_PAGE.

MMU_FTR_TLBIEL and MMU_FTR_16M_PAGE are defined in mmu.h

MMU_FTR_PPCAS_ARCH_V2 is used only in mmu.h and it is used only once.

Remove MMU_FTR_PPCAS_ARCH_V2 and use
directly MMU_FTR_TLBIEL | MMU_FTR_16M_PAGE

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/cputable.h | 2 --
 arch/powerpc/include/asm/mmu.h      | 3 +--
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index accdc1286f37..d88bcb79f16d 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -220,8 +220,6 @@ static inline void cpu_feature_keys_init(void) { }
 
 #define CPU_FTR_PPCAS_ARCH_V2	(CPU_FTR_NOEXECUTE)
 
-#define MMU_FTR_PPCAS_ARCH_V2 	(MMU_FTR_TLBIEL | MMU_FTR_16M_PAGE)
-
 /* We only set the altivec features if the kernel was compiled with altivec
  * support
  */
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 255a1837e9f7..b4367fd0b477 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -126,8 +126,7 @@
 #define MMU_FTR_RADIX_KUAP		ASM_CONST(0x80000000)
 
 /* MMU feature bit sets for various CPUs */
-#define MMU_FTRS_DEFAULT_HPTE_ARCH_V2	\
-	MMU_FTR_HPTE_TABLE | MMU_FTR_PPCAS_ARCH_V2
+#define MMU_FTRS_DEFAULT_HPTE_ARCH_V2	(MMU_FTR_HPTE_TABLE | MMU_FTR_TLBIEL | MMU_FTR_16M_PAGE)
 #define MMU_FTRS_POWER		MMU_FTRS_DEFAULT_HPTE_ARCH_V2
 #define MMU_FTRS_PPC970		MMU_FTRS_POWER | MMU_FTR_TLBIE_CROP_VA
 #define MMU_FTRS_POWER5		MMU_FTRS_POWER | MMU_FTR_LOCKLESS_TLBIE
-- 
2.25.0

