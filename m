Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF009186C4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 14:39:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gy89184nzDqPN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 00:39:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=Us9I/hEi; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwlB09CRzDqLL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:06 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwl06kRlz9v02l;
 Mon, 16 Mar 2020 13:35:56 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Us9I/hEi; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WY7DCd4dv6qS; Mon, 16 Mar 2020 13:35:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwl05hSRz9v02g;
 Mon, 16 Mar 2020 13:35:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362156; bh=tsG5tjCntKOJbZ6UipwLnv4ptK9ICt4FKsJU4O5EBMY=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Us9I/hEiZT4/EmSmoA49PBTKUAJYKnyVUceiIpOE92w82jyz8DarsR923MndB4Rin
 3DZHTuzFyQb7GAqNQPlY+nhCRX4bbfoxfHf/5ZsqhZ9Yg+csCYRVYftlf5gAnW69Yo
 QQXt1+bi1io2S5PsG0N40B5cegBf2K9dv5Ubkj/0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AE06B8B7CB;
 Mon, 16 Mar 2020 13:36:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QO-e-1su5sdr; Mon, 16 Mar 2020 13:36:01 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F0AB8B7D0;
 Mon, 16 Mar 2020 13:36:01 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7408065595; Mon, 16 Mar 2020 12:36:01 +0000 (UTC)
Message-Id: <d4bd46fe0103f8a8cb7e5affb2a7fcc3185be24e.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 16/46] powerpc/mm: Allocate static page tables for fixmap
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:36:01 +0000 (UTC)
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

Allocate static page tables for the fixmap area. This allows
setting mappings through page tables before memblock is ready.
That's needed to use early_ioremap() early and to use standard
page mappings with fixmap.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/fixmap.h |  4 ++++
 arch/powerpc/kernel/setup_32.c    |  2 +-
 arch/powerpc/mm/pgtable_32.c      | 16 ++++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
index 2ef155a3c821..ccbe2e83c950 100644
--- a/arch/powerpc/include/asm/fixmap.h
+++ b/arch/powerpc/include/asm/fixmap.h
@@ -86,6 +86,10 @@ enum fixed_addresses {
 #define __FIXADDR_SIZE	(__end_of_fixed_addresses << PAGE_SHIFT)
 #define FIXADDR_START		(FIXADDR_TOP - __FIXADDR_SIZE)
 
+#define FIXMAP_ALIGNED_SIZE	(ALIGN(FIXADDR_TOP, PGDIR_SIZE) - \
+				 ALIGN_DOWN(FIXADDR_START, PGDIR_SIZE))
+#define FIXMAP_PTE_SIZE	(FIXMAP_ALIGNED_SIZE / PGDIR_SIZE * PTE_TABLE_SIZE)
+
 #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NCG
 #define FIXMAP_PAGE_IO	PAGE_KERNEL_NCG
 
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 5b49b26eb154..3f1e1c0b328a 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -81,7 +81,7 @@ notrace void __init machine_init(u64 dt_ptr)
 	/* Configure static keys first, now that we're relocated. */
 	setup_feature_keys();
 
-	early_ioremap_setup();
+	early_ioremap_init();
 
 	/* Enable early debugging if any specified (see udbg.h) */
 	udbg_early_init();
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index f62de06e3d07..9934659cb871 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -29,11 +29,27 @@
 #include <asm/fixmap.h>
 #include <asm/setup.h>
 #include <asm/sections.h>
+#include <asm/early_ioremap.h>
 
 #include <mm/mmu_decl.h>
 
 extern char etext[], _stext[], _sinittext[], _einittext[];
 
+static u8 early_fixmap_pagetable[FIXMAP_PTE_SIZE] __page_aligned_data;
+
+notrace void __init early_ioremap_init(void)
+{
+	unsigned long addr = ALIGN_DOWN(FIXADDR_START, PGDIR_SIZE);
+	pte_t *ptep = (pte_t *)early_fixmap_pagetable;
+	pmd_t *pmdp = pmd_ptr_k(addr);
+
+	for (; (s32)(FIXADDR_TOP - addr) > 0;
+	     addr += PGDIR_SIZE, ptep += PTRS_PER_PTE, pmdp++)
+		pmd_populate_kernel(&init_mm, pmdp, ptep);
+
+	early_ioremap_setup();
+}
+
 static void __init *early_alloc_pgtable(unsigned long size)
 {
 	void *ptr = memblock_alloc(size, size);
-- 
2.25.0

