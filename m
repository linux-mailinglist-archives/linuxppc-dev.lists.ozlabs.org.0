Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8546201953
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 19:22:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pQc00kRSzDrRB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 03:22:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pMbZ34CJzDr2d
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 01:07:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49pMbP6FZrz9v09t;
 Fri, 19 Jun 2020 17:06:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id r47RiLH63nh6; Fri, 19 Jun 2020 17:06:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49pMbP5XS2z9v09j;
 Fri, 19 Jun 2020 17:06:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DA2588B868;
 Fri, 19 Jun 2020 17:06:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KAW_dSQhF3_R; Fri, 19 Jun 2020 17:06:59 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 645308B879;
 Fri, 19 Jun 2020 17:06:59 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3E4C365AF4; Fri, 19 Jun 2020 15:06:56 +0000 (UTC)
Message-Id: <de47e3d8dd3ef4c5f0a93c5ff19b5af52390cb9c.1592578278.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1592578278.git.christophe.leroy@csgroup.eu>
References: <cover.1592578278.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 5/8] powerpc: Use MODULES_VADDR if defined
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 19 Jun 2020 15:06:56 +0000 (UTC)
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

In order to allow allocation of modules outside of vmalloc space,
use MODULES_VADDR and MODULES_END when MODULES_VADDR is defined.

Redefine module_alloc() when MODULES_VADDR defined.
Unmap corresponding KASAN shadow memory.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/module.c          | 11 +++++++++++
 arch/powerpc/mm/kasan/kasan_init_32.c |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index df649acb5631..a211b0253cdb 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -86,3 +86,14 @@ int module_finalize(const Elf_Ehdr *hdr,
 
 	return 0;
 }
+
+#ifdef MODULES_VADDR
+void *module_alloc(unsigned long size)
+{
+	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
+
+	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, GFP_KERNEL,
+				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
+				    __builtin_return_address(0));
+}
+#endif
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 0760e1e754e4..f1bc267d42af 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -115,6 +115,12 @@ static void __init kasan_unmap_early_shadow_vmalloc(void)
 	unsigned long k_end = (unsigned long)kasan_mem_to_shadow((void *)VMALLOC_END);
 
 	kasan_update_early_region(k_start, k_end, __pte(0));
+
+#ifdef MODULES_VADDR
+	k_start = (unsigned long)kasan_mem_to_shadow((void *)MODULES_VADDR);
+	k_end = (unsigned long)kasan_mem_to_shadow((void *)MODULES_END);
+	kasan_update_early_region(k_start, k_end, __pte(0));
+#endif
 }
 
 static void __init kasan_mmu_init(void)
-- 
2.25.0

