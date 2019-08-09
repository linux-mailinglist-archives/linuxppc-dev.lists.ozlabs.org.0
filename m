Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E741087DB4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 17:05:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464pTK2zfNzDqQb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 01:05:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="YOcgMf1h"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464pJl3C8zzDrBY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 00:58:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 464pJc491Gz9v9Lt;
 Fri,  9 Aug 2019 16:58:08 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=YOcgMf1h; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dMzvzm16RGoj; Fri,  9 Aug 2019 16:58:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 464pJc31Fpz9v0kX;
 Fri,  9 Aug 2019 16:58:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565362688; bh=uS1jNVpwmb5N8K9IEZ09SgUJwJejQ+76qRLy/TeTloI=;
 h=From:Subject:To:Cc:Date:From;
 b=YOcgMf1hWlFa/BcWuVvq1yzvwOZERfZqSDbY66qElZatRg3+BJzW3XySTByWHH/q1
 mKWeUnwTxeMc/NULiYvnw0CVnj2Xf43QCPDDR0sr4hWbijy8xMh3cdwqBirbZGwAeb
 Atla0ezhLqy1PV8uKbidykWa2a5eDKhPuqihB2rg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E8298B8C0;
 Fri,  9 Aug 2019 16:58:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t_O8RwnRf-6V; Fri,  9 Aug 2019 16:58:10 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F06E48B8BB;
 Fri,  9 Aug 2019 16:58:09 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BE65A69641; Fri,  9 Aug 2019 14:58:09 +0000 (UTC)
Message-Id: <c97284f912128cbc3f2fe09d68e90e65fb3e6026.1565361876.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/kasan: fix parallele loading of modules.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Erhard F. <erhard_f@mailbox.org>
Date: Fri,  9 Aug 2019 14:58:09 +0000 (UTC)
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

Parallele loading of modules may lead to bad setup of shadow
page table entries.

First, lets align modules so that two modules never share the same
shadow page.

Second, ensure that two modules cannot allocate two page tables for
the same PMD entry at the same time. This is done by using
init_mm.page_table_lock in the same way as __pte_alloc_kernel()

Fixes: 2edb16efc899 ("powerpc/32: Add KASAN support")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/kasan/kasan_init_32.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 99eac3fab83c..802387b231ad 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -5,6 +5,7 @@
 #include <linux/kasan.h>
 #include <linux/printk.h>
 #include <linux/memblock.h>
+#include <linux/moduleloader.h>
 #include <linux/sched/task.h>
 #include <linux/vmalloc.h>
 #include <asm/pgalloc.h>
@@ -46,7 +47,19 @@ static int __ref kasan_init_shadow_page_tables(unsigned long k_start, unsigned l
 			kasan_populate_pte(new, PAGE_READONLY);
 		else
 			kasan_populate_pte(new, PAGE_KERNEL_RO);
-		pmd_populate_kernel(&init_mm, pmd, new);
+
+		smp_wmb(); /* See comment in __pte_alloc */
+
+		spin_lock(&init_mm.page_table_lock);
+			/* Has another populated it ? */
+		if (likely((void *)pmd_page_vaddr(*pmd) == kasan_early_shadow_pte)) {
+			pmd_populate_kernel(&init_mm, pmd, new);
+			new = NULL;
+		}
+		spin_unlock(&init_mm.page_table_lock);
+
+		if (new && slab_is_available())
+			pte_free_kernel(&init_mm, new);
 	}
 	return 0;
 }
@@ -137,7 +150,11 @@ void __init kasan_init(void)
 #ifdef CONFIG_MODULES
 void *module_alloc(unsigned long size)
 {
-	void *base = vmalloc_exec(size);
+	void *base;
+
+	base = __vmalloc_node_range(size, MODULE_ALIGN, VMALLOC_START, VMALLOC_END,
+				    GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
+				    NUMA_NO_NODE, __builtin_return_address(0));
 
 	if (!base)
 		return NULL;
-- 
2.13.3

