Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAC0351532
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 15:31:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB3xJ4ZWqz3c71
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 00:31:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB3wT51zFz2y0L
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 00:30:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FB3wN34YCz9twjX;
 Thu,  1 Apr 2021 15:30:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cLpGo-DjBjSy; Thu,  1 Apr 2021 15:30:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FB3wN078lz9twjT;
 Thu,  1 Apr 2021 15:30:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E43518B99F;
 Thu,  1 Apr 2021 15:30:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QCigWfZt688c; Thu,  1 Apr 2021 15:30:43 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 903438B991;
 Thu,  1 Apr 2021 15:30:43 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6DEBB67646; Thu,  1 Apr 2021 13:30:43 +0000 (UTC)
Message-Id: <a46dcdd39a9e80b012d86c294c4e5cd8d31665f3.1617283827.git.christophe.leroy@csgroup.eu>
In-Reply-To: <0c3d5cb8a4dfdf6ca1b8aeb385c01470d6628d55.1617283827.git.christophe.leroy@csgroup.eu>
References: <0c3d5cb8a4dfdf6ca1b8aeb385c01470d6628d55.1617283827.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 3/3] powerpc/32s: Define a MODULE area below kernel text all
 the time
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 jniethe5@gmail.com
Date: Thu,  1 Apr 2021 13:30:43 +0000 (UTC)
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

On book3s/32, the segment below kernel text is used for module
allocation when CONFIG_STRICT_KERNEL_RWX is defined.

In order to benefit from the powerpc specific module_alloc()
function which allocate modules with 32 Mbytes from
end of kernel text, use that segment below PAGE_OFFSET at all time.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                         | 2 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h | 2 --
 arch/powerpc/mm/book3s32/mmu.c               | 7 -------
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c1344c05226c..15a91202d5c3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1219,7 +1219,7 @@ config TASK_SIZE_BOOL
 config TASK_SIZE
 	hex "Size of user task space" if TASK_SIZE_BOOL
 	default "0x80000000" if PPC_8xx
-	default "0xb0000000" if PPC_BOOK3S_32 && STRICT_KERNEL_RWX
+	default "0xb0000000" if PPC_BOOK3S_32
 	default "0xc0000000"
 endmenu
 
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 415ae29fa73a..83c65845a1a9 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -194,10 +194,8 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
 #define VMALLOC_END	ioremap_bot
 #endif
 
-#ifdef CONFIG_STRICT_KERNEL_RWX
 #define MODULES_END	ALIGN_DOWN(PAGE_OFFSET, SZ_256M)
 #define MODULES_VADDR	(MODULES_END - SZ_256M)
-#endif
 
 #ifndef __ASSEMBLY__
 #include <linux/sched.h>
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index a0db398b5c26..159930351d9f 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -184,17 +184,10 @@ static bool is_module_segment(unsigned long addr)
 {
 	if (!IS_ENABLED(CONFIG_MODULES))
 		return false;
-#ifdef MODULES_VADDR
 	if (addr < ALIGN_DOWN(MODULES_VADDR, SZ_256M))
 		return false;
 	if (addr > ALIGN(MODULES_END, SZ_256M) - 1)
 		return false;
-#else
-	if (addr < ALIGN_DOWN(VMALLOC_START, SZ_256M))
-		return false;
-	if (addr > ALIGN(VMALLOC_END, SZ_256M) - 1)
-		return false;
-#endif
 	return true;
 }
 
-- 
2.25.0

