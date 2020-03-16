Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE72186C03
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 14:28:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gxw36WYYzDqDP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 00:28:51 +1100 (AEDT)
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
 header.s=mail header.b=a5K8dZM0; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwl53tPGzDqLX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwkn2WC4z9tygR;
 Mon, 16 Mar 2020 13:35:45 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=a5K8dZM0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id b-sdWkBrRdNk; Mon, 16 Mar 2020 13:35:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwkn1TCfz9tyg5;
 Mon, 16 Mar 2020 13:35:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362145; bh=zz3LY4LnIULNvU2REeo9vroSmYzMKaaLGdN2qxLIwuw=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=a5K8dZM0rtPQrBXIENhJKCrGi9u581IUm5g2QO1QBHYk8nD3uEBcPHfiZy2ohQ8ho
 gI48qROSO33VlFay08xja22eTWgUzjFkhsK2mk603o9Wzm2TFwo/GLR+61BuJaqhFo
 fKc4fEIGdwFJav/ulZig4Rl/2idpNJ3FmdxRfTlw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 303AA8B7D0;
 Mon, 16 Mar 2020 13:35:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8eLsKBpz6-mm; Mon, 16 Mar 2020 13:35:50 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1796B8B7CB;
 Mon, 16 Mar 2020 13:35:50 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 108EA65595; Mon, 16 Mar 2020 12:35:50 +0000 (UTC)
Message-Id: <28206484284c1bc83b661de438eba04c6e75a1bc.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 05/46] powerpc/kasan: Remove unnecessary page table locking
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:35:50 +0000 (UTC)
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

Commit 45ff3c559585 ("powerpc/kasan: Fix parallel loading of
modules.") added spinlocks to manage parallele module loading.

Since then commit 47febbeeec44 ("powerpc/32: Force KASAN_VMALLOC for
modules") converted the module loading to KASAN_VMALLOC.

The spinlocking has then become unneeded and can be removed to
simplify kasan_init_shadow_page_tables()

Also remove inclusion of linux/moduleloader.h and linux/vmalloc.h
which are not needed anymore since the removal of modules management.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/kasan/kasan_init_32.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index c41e700153da..c9d053078c37 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -5,9 +5,7 @@
 #include <linux/kasan.h>
 #include <linux/printk.h>
 #include <linux/memblock.h>
-#include <linux/moduleloader.h>
 #include <linux/sched/task.h>
-#include <linux/vmalloc.h>
 #include <asm/pgalloc.h>
 #include <asm/code-patching.h>
 #include <mm/mmu_decl.h>
@@ -34,31 +32,22 @@ static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned
 {
 	pmd_t *pmd;
 	unsigned long k_cur, k_next;
-	pte_t *new = NULL;
 
 	pmd = pmd_ptr_k(k_start);
 
 	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd++) {
+		pte_t *new;
+
 		k_next = pgd_addr_end(k_cur, k_end);
 		if ((void *)pmd_page_vaddr(*pmd) != kasan_early_shadow_pte)
 			continue;
 
-		if (!new)
-			new = memblock_alloc(PTE_FRAG_SIZE, PTE_FRAG_SIZE);
+		new = memblock_alloc(PTE_FRAG_SIZE, PTE_FRAG_SIZE);
 
 		if (!new)
 			return -ENOMEM;
 		kasan_populate_pte(new, PAGE_KERNEL);
-
-		smp_wmb(); /* See comment in __pte_alloc */
-
-		spin_lock(&init_mm.page_table_lock);
-			/* Has another populated it ? */
-		if (likely((void *)pmd_page_vaddr(*pmd) == kasan_early_shadow_pte)) {
-			pmd_populate_kernel(&init_mm, pmd, new);
-			new = NULL;
-		}
-		spin_unlock(&init_mm.page_table_lock);
+		pmd_populate_kernel(&init_mm, pmd, new);
 	}
 	return 0;
 }
-- 
2.25.0

