Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 144FC16F6C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 06:06:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S3fq2x5GzDqVr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 16:06:11 +1100 (AEDT)
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
 header.s=mail header.b=EZp2hEHO; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S3cc1WY3zDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 16:04:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48S3cT0cX2z9ty2Q;
 Wed, 26 Feb 2020 06:04:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EZp2hEHO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WvuH9LdbP1UZ; Wed, 26 Feb 2020 06:04:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48S3cS3kKTz9tyKl;
 Wed, 26 Feb 2020 06:04:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582693448; bh=qvGyrJUB2UgET9i5VAoLlLv2pl3urJV01OstLvVnLRM=;
 h=From:Subject:To:CC:In-Reply-To:Date:From;
 b=EZp2hEHO0pdBb20cc3MdgS1Mo6rQSCJIXFnmROVUmobfowpfOaE01gJm77QHGUZm3
 bgDroXooY+b+Hrp01223ZLuWVGSaVVG1x7H9eUsWFKICQ2MQbXE8g7AcdwqWjxZB15
 mdHPuLUtLtll5V6SO314uk9dOcHX9PmAZMDoSMGk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A2748B784;
 Wed, 26 Feb 2020 06:04:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VXbsOtQ5DCG4; Wed, 26 Feb 2020 06:04:09 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4BA1A8B776;
 Wed, 26 Feb 2020 06:04:08 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0A31D653EF; Wed, 26 Feb 2020 05:04:07 +0000 (UTC)
Message-Id: <92d936b83e47f6a65866ca2d39a0d5bfefba6279.1582693094.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH] Use IS_ENABLED() instead of #ifdefs
To: Jason Yan <yanaijie@huawei.com>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>,
 <oss@buserror.net>
In-Reply-To: <d3647cce-ece3-d302-f541-b02b1f2b5e9e@huawei.com>
Date: Wed, 26 Feb 2020 05:04:07 +0000 (UTC)
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

---
This works for me. Only had to leave the #ifdef around the map_mem_in_cams()
Also had to set linear_sz and ram for the alternative case, otherwise I get



arch/powerpc/mm/nohash/kaslr_booke.c: In function 'kaslr_early_init':
arch/powerpc/mm/nohash/kaslr_booke.c:355:33: error: 'linear_sz' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  regions.pa_end = memstart_addr + linear_sz;
                   ~~~~~~~~~~~~~~^~~~~~~~~~~
arch/powerpc/mm/nohash/kaslr_booke.c:315:21: note: 'linear_sz' was declared here
  unsigned long ram, linear_sz;
                     ^~~~~~~~~
arch/powerpc/mm/nohash/kaslr_booke.c:187:8: error: 'ram' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  ret = parse_crashkernel(boot_command_line, size, &crash_size,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     &crash_base);
     ~~~~~~~~~~~~
arch/powerpc/mm/nohash/kaslr_booke.c:315:16: note: 'ram' was declared here
  unsigned long ram, linear_sz;

---
 arch/powerpc/mm/mmu_decl.h           |  2 +-
 arch/powerpc/mm/nohash/kaslr_booke.c | 97 +++++++++++++++-------------
 2 files changed, 52 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index b869ea893301..3700e7c04e51 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -139,9 +139,9 @@ extern unsigned long calc_cam_sz(unsigned long ram, unsigned long virt,
 extern void adjust_total_lowmem(void);
 extern int switch_to_as1(void);
 extern void restore_to_as0(int esel, int offset, void *dt_ptr, int bootcpu);
+#endif
 void create_kaslr_tlb_entry(int entry, unsigned long virt, phys_addr_t phys);
 extern int is_second_reloc;
-#endif
 
 void reloc_kernel_entry(void *fdt, long addr);
 extern void loadcam_entry(unsigned int index);
diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index c6f5c1db1394..bf69cece9b8c 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -267,35 +267,37 @@ static unsigned long __init kaslr_legal_offset(void *dt_ptr, unsigned long rando
 	unsigned long start;
 	unsigned long offset;
 
-#ifdef CONFIG_PPC32
-	/*
-	 * Decide which 64M we want to start
-	 * Only use the low 8 bits of the random seed
-	 */
-	unsigned long index = random & 0xFF;
-	index %= regions.linear_sz / SZ_64M;
-
-	/* Decide offset inside 64M */
-	offset = random % (SZ_64M - regions.kernel_size);
-	offset = round_down(offset, SZ_16K);
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		unsigned long index;
+
+		/*
+		 * Decide which 64M we want to start
+		 * Only use the low 8 bits of the random seed
+		 */
+		index = random & 0xFF;
+		index %= regions.linear_sz / SZ_64M;
+
+		/* Decide offset inside 64M */
+		offset = random % (SZ_64M - regions.kernel_size);
+		offset = round_down(offset, SZ_16K);
+
+		while ((long)index >= 0) {
+			offset = memstart_addr + index * SZ_64M + offset;
+			start = memstart_addr + index * SZ_64M;
+			koffset = get_usable_address(dt_ptr, start, offset);
+			if (koffset)
+				break;
+			index--;
+		}
+	} else {
+		/* Decide kernel offset inside 1G */
+		offset = random % (SZ_1G - regions.kernel_size);
+		offset = round_down(offset, SZ_64K);
 
-	while ((long)index >= 0) {
-		offset = memstart_addr + index * SZ_64M + offset;
-		start = memstart_addr + index * SZ_64M;
+		start = memstart_addr;
+		offset = memstart_addr + offset;
 		koffset = get_usable_address(dt_ptr, start, offset);
-		if (koffset)
-			break;
-		index--;
 	}
-#else
-	/* Decide kernel offset inside 1G */
-	offset = random % (SZ_1G - regions.kernel_size);
-	offset = round_down(offset, SZ_64K);
-
-	start = memstart_addr;
-	offset = memstart_addr + offset;
-	koffset = get_usable_address(dt_ptr, start, offset);
-#endif
 
 	if (koffset != 0)
 		koffset -= memstart_addr;
@@ -342,6 +344,8 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
 	/* If the linear size is smaller than 64M, do not randmize */
 	if (linear_sz < SZ_64M)
 		return 0;
+#else
+	linear_sz = ram = size;
 #endif
 
 	/* check for a reserved-memory node and record its cell sizes */
@@ -373,17 +377,19 @@ notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
 {
 	unsigned long offset;
 	unsigned long kernel_sz;
+	unsigned int *__kaslr_offset;
+	unsigned int *__run_at_load;
 
-#ifdef CONFIG_PPC64
-	unsigned int *__kaslr_offset = (unsigned int *)(KERNELBASE + 0x58);
-	unsigned int *__run_at_load = (unsigned int *)(KERNELBASE + 0x5c);
+	if (IS_ENABLED(CONFIG_PPC64)) {
+		__kaslr_offset = (unsigned int *)(KERNELBASE + 0x58);
+		__run_at_load = (unsigned int *)(KERNELBASE + 0x5c);
 
-	if (*__run_at_load == 1)
-		return;
+		if (*__run_at_load == 1)
+			return;
 
-	/* Setup flat device-tree pointer */
-	initial_boot_params = dt_ptr;
-#endif
+		/* Setup flat device-tree pointer */
+		initial_boot_params = dt_ptr;
+	}
 
 	kernel_sz = (unsigned long)_end - (unsigned long)_stext;
 
@@ -394,20 +400,19 @@ notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
 	kernstart_virt_addr += offset;
 	kernstart_addr += offset;
 
-#ifdef CONFIG_PPC32
-	is_second_reloc = 1;
-
-	if (offset >= SZ_64M) {
-		unsigned long tlb_virt = round_down(kernstart_virt_addr, SZ_64M);
-		phys_addr_t tlb_phys = round_down(kernstart_addr, SZ_64M);
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		is_second_reloc = 1;
+		if (offset >= SZ_64M) {
+			unsigned long tlb_virt = round_down(kernstart_virt_addr, SZ_64M);
+			phys_addr_t tlb_phys = round_down(kernstart_addr, SZ_64M);
 
-		/* Create kernel map to relocate in */
-		create_kaslr_tlb_entry(1, tlb_virt, tlb_phys);
+			/* Create kernel map to relocate in */
+			create_kaslr_tlb_entry(1, tlb_virt, tlb_phys);
+		}
+	} else {
+		*__kaslr_offset = kernstart_virt_addr - KERNELBASE;
+		*__run_at_load = 1;
 	}
-#else
-	*__kaslr_offset = kernstart_virt_addr - KERNELBASE;
-	*__run_at_load = 1;
-#endif
 
 	/* Copy the kernel to it's new location and run */
 	memcpy((void *)kernstart_virt_addr, (void *)_stext, kernel_sz);
-- 
2.25.0

