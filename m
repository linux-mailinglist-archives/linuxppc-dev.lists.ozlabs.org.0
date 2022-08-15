Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA941592E74
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 13:49:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5syG4mKvz3bl4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 21:49:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kmPbiklP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5sxf031yz2xrH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 21:48:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kmPbiklP;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M5sxc37mYz4xD2;
	Mon, 15 Aug 2022 21:48:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660564132;
	bh=qTJarDoozgVp2iDmIixf9KmrvtRO6NRdBowg0/AwG70=;
	h=From:To:Cc:Subject:Date:From;
	b=kmPbiklPu3X5qPFRx0hxQdR+lCm3gzQfFTnSoJrp3yNn1vJoJgHQ6/ovBdMJ4DQjb
	 VXjKNvvLYrHssjz42lkpq23kI5WdNOH4Ss2EKcGjTSuwLpY1QSe1VUDEFTrR4LtjA4
	 AYd+DJd5usuaWw/7Nvw5GfJIsWHeFC/lwATNrty+9fr51emYjInjGhtFD3GK4sEMaM
	 yPp4/AfQx2BmD0ubzT23o6ZLpUZEwBp5hp3eaAmLjpWUjWFBE1S9wbJYRRvG5YhhKW
	 Ug3EaOdtmdZ0mN/z/WIb66Cvbpi7Czm0XI055zNdrwH91fljmASvgt10IspAMFXhSm
	 SFyPVsRDbnm+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v3] powerpc/code-patching: Speed up page mapping/unmapping
Date: Mon, 15 Aug 2022 21:48:40 +1000
Message-Id: <20220815114840.1468656-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Since commit 591b4b268435 ("powerpc/code-patching: Pre-map patch area")
the patch area is premapped so intermediate page tables are already
allocated.

Use __set_pte_at() directly instead of the heavy map_kernel_page(),
at for unmapping just do a pte_clear() followed by a flush.

__set_pte_at() can be used directly without the filters in
set_pte_at() because we are mapping a normal page non executable.

Make sure gcc knows text_poke_area is page aligned in order to
optimise the flush.

This change reduces by 66% the time needed to activate ftrace on
an 8xx (588000 tb ticks instead of 1744000).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[mpe: Add ptesync needed on radix to avoid spurious fault]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/lib/code-patching.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 6edf0697a526..ad0cf3108dd0 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -94,17 +94,20 @@ void __init poking_init(void)
 	static_branch_enable(&poking_init_done);
 }
 
+static unsigned long get_patch_pfn(void *addr)
+{
+	if (IS_ENABLED(CONFIG_MODULES) && is_vmalloc_or_module_addr(addr))
+		return vmalloc_to_pfn(addr);
+	else
+		return __pa_symbol(addr) >> PAGE_SHIFT;
+}
+
 /*
  * This can be called for kernel text or a module.
  */
 static int map_patch_area(void *addr, unsigned long text_poke_addr)
 {
-	unsigned long pfn;
-
-	if (IS_ENABLED(CONFIG_MODULES) && is_vmalloc_or_module_addr(addr))
-		pfn = vmalloc_to_pfn(addr);
-	else
-		pfn = __pa_symbol(addr) >> PAGE_SHIFT;
+	unsigned long pfn = get_patch_pfn(addr);
 
 	return map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
 }
@@ -149,17 +152,22 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	int err;
 	u32 *patch_addr;
 	unsigned long text_poke_addr;
+	pte_t *pte;
+	unsigned long pfn = get_patch_pfn(addr);
 
-	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
+	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr & PAGE_MASK;
 	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
 
-	err = map_patch_area(addr, text_poke_addr);
-	if (err)
-		return err;
+	pte = virt_to_kpte(text_poke_addr);
+	__set_pte_at(&init_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
+	/* See ptesync comment in radix__set_pte_at() */
+	if (radix_enabled())
+		asm volatile("ptesync": : :"memory");
 
 	err = __patch_instruction(addr, instr, patch_addr);
 
-	unmap_patch_area(text_poke_addr);
+	pte_clear(&init_mm, text_poke_addr, pte);
+	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
 
 	return err;
 }
-- 
2.37.1

