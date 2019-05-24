Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3756290BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 08:06:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459G9F2FPrzDqdq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 16:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="f+X+SrLA"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459G7Q1jMhzDqck
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 16:05:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 459G7L03RnzB09ZF;
 Fri, 24 May 2019 08:05:18 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=f+X+SrLA; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id f7uJQh1rUrn5; Fri, 24 May 2019 08:05:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 459G7K5kJ7zB09ZD;
 Fri, 24 May 2019 08:05:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558677917; bh=UDbhPInoRZ11n1EDsJaZvijySZH5TsRju++Hii5RRqM=;
 h=From:In-Reply-To:Subject:To:Cc:Date:From;
 b=f+X+SrLAXqAHWTrmqUnU5zVxYu/ra50Al5ZVsS9seK7KvlKsJO+wp5tFyEmudRrZk
 iy9pLRkwj0UCsdP/6KP8otMy3W9rg5t05Zq+0R8Ik3K1cLcuPlnhS8ZqZA0K6+aWIQ
 /uHV3uRNpAHChYqVLkHVU91LFxvu79tqw9yqVYXI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AAA318B790;
 Fri, 24 May 2019 08:05:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EurX6mTew14t; Fri, 24 May 2019 08:05:18 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 915708B76F;
 Fri, 24 May 2019 08:05:18 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 53A6966293; Fri, 24 May 2019 06:05:18 +0000 (UTC)
Message-Id: <8164abbe117d8353bb88132d7cfa8bc26a60ca66.1558677767.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
In-Reply-To: <20190522211724.GC456@darkstar.musicnaut.iki.fi>
Subject: [RFC PATCH v2] powerpc: fix kexec failure on book3s/32
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Date: Fri, 24 May 2019 06:05:18 +0000 (UTC)
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

Fixes: 63b2bc619565 ("powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/machine_kexec_32.c | 8 ++++++++
 arch/powerpc/mm/book3s32/mmu.c         | 7 +++++--
 arch/powerpc/mm/mmu_decl.h             | 2 ++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/machine_kexec_32.c b/arch/powerpc/kernel/machine_kexec_32.c
index affe5dcce7f4..83e61a8f8468 100644
--- a/arch/powerpc/kernel/machine_kexec_32.c
+++ b/arch/powerpc/kernel/machine_kexec_32.c
@@ -15,6 +15,7 @@
 #include <asm/cacheflush.h>
 #include <asm/hw_irq.h>
 #include <asm/io.h>
+#include <mm/mmu_decl.h>
 
 typedef void (*relocate_new_kernel_t)(
 				unsigned long indirection_page,
@@ -35,6 +36,8 @@ void default_machine_kexec(struct kimage *image)
 	unsigned long page_list;
 	unsigned long reboot_code_buffer, reboot_code_buffer_phys;
 	relocate_new_kernel_t rnk;
+	unsigned long bat_size = 128 << 10;
+	unsigned long bat_mask = ~(bat_size - 1);
 
 	/* Interrupts aren't acceptable while we reboot */
 	local_irq_disable();
@@ -54,6 +57,11 @@ void default_machine_kexec(struct kimage *image)
 	memcpy((void *)reboot_code_buffer, relocate_new_kernel,
 						relocate_new_kernel_size);
 
+	printk(KERN_INFO "Reboot code buffer at %lx\n", reboot_code_buffer);
+	mtsrin(mfsrin(reboot_code_buffer) & ~SR_NX, reboot_code_buffer);
+	setibat(7, reboot_code_buffer & bat_mask, reboot_code_buffer_phys & bat_mask,
+		bat_size, PAGE_KERNEL_TEXT);
+
 	flush_icache_range(reboot_code_buffer,
 				reboot_code_buffer + KEXEC_CONTROL_PAGE_SIZE);
 	printk(KERN_INFO "Bye!\n");
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index fc073cb2c517..7124700edb0f 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -124,8 +124,8 @@ static unsigned int block_size(unsigned long base, unsigned long top)
  * of 2 between 128k and 256M.
  * Only for 603+ ...
  */
-static void setibat(int index, unsigned long virt, phys_addr_t phys,
-		    unsigned int size, pgprot_t prot)
+void setibat(int index, unsigned long virt, phys_addr_t phys,
+	     unsigned int size, pgprot_t prot)
 {
 	unsigned int bl = (size >> 17) - 1;
 	int wimgxpp;
@@ -197,6 +197,9 @@ void mmu_mark_initmem_nx(void)
 	if (cpu_has_feature(CPU_FTR_601))
 		return;
 
+	if (IS_ENABLED(CONFIG_KEXEC))
+		nb--;
+
 	for (i = 0; i < nb - 1 && base < top && top - base > (128 << 10);) {
 		size = block_size(base, top);
 		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 7bac0aa2026a..478584d50cf2 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -103,6 +103,8 @@ void print_system_hash_info(void);
 extern void mapin_ram(void);
 extern void setbat(int index, unsigned long virt, phys_addr_t phys,
 		   unsigned int size, pgprot_t prot);
+void setibat(int index, unsigned long virt, phys_addr_t phys,
+	     unsigned int size, pgprot_t prot);
 
 extern int __map_without_bats;
 extern unsigned int rtas_data, rtas_size;
-- 
2.13.3

