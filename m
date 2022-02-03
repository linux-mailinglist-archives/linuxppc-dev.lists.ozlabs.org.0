Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 322554A8DE4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 21:34:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqVkp6DjLz3cNv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 07:34:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U+XNiew2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U+XNiew2; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqVk86w58z30LP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 07:33:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8F709B835AE;
 Thu,  3 Feb 2022 20:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7481C340E8;
 Thu,  3 Feb 2022 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643920412;
 bh=9SYEMbtA7pXPrneI3BrYTIUPJZ3VOf9fuzVoZuj+E0Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U+XNiew2dzYvSIjD1nIEnIwX97y7S0+7dbM0gZepuPlOSqlCD8SkgbWVaMeJYxdaw
 tSfJ6Y+zftLFkMqANZqAOGcqVp3kPRontMuzVlkS5d4M0y+1M5oidZxwrx+EIcOZkr
 jBuGFVnwFMrSsB7aO+zQa7VPKGSHQgplyEB56xjJhcK3vwL7SUv3if6JN6+dmWEfR3
 iGDG/OOAtSlRXPOyHwrAxWm1ecVvLsFUkGAWmEUNuk/sTWuiJiSOiTUHhoNAhJkZ7O
 wVmkVM5KJrCj/A1FsTnsYuQsTSrcGT/Acl6TjP4s2KJ/cq0HaTDbJVTDmUWwQQqQoe
 C7FZ/x/t4EcWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 22/41] powerpc/fixmap: Fix VM debug warning on
 unmap
Date: Thu,  3 Feb 2022 15:32:26 -0500
Message-Id: <20220203203245.3007-22-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203203245.3007-1-sashal@kernel.org>
References: <20220203203245.3007-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, sfr@canb.auug.org.au,
 anshuman.khandual@arm.com, aneesh.kumar@linux.ibm.com,
 palmerdabbelt@google.com, npiggin@gmail.com, geert@linux-m68k.org,
 guoren@kernel.org, joel@jms.id.au, Maxime Bizon <mbizon@freebox.fr>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit aec982603aa8cc0a21143681feb5f60ecc69d718 ]

Unmapping a fixmap entry is done by calling __set_fixmap()
with FIXMAP_PAGE_CLEAR as flags.

Today, powerpc __set_fixmap() calls map_kernel_page().

map_kernel_page() is not happy when called a second time
for the same page.

	WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/pgtable.c:194 set_pte_at+0xc/0x1e8
	CPU: 0 PID: 1 Comm: swapper Not tainted 5.16.0-rc3-s3k-dev-01993-g350ff07feb7d-dirty #682
	NIP:  c0017cd4 LR: c00187f0 CTR: 00000010
	REGS: e1011d50 TRAP: 0700   Not tainted  (5.16.0-rc3-s3k-dev-01993-g350ff07feb7d-dirty)
	MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 42000208  XER: 00000000

	GPR00: c0165fec e1011e10 c14c0000 c0ee2550 ff800000 c0f3d000 00000000 c001686c
	GPR08: 00001000 b00045a9 00000001 c0f58460 c0f50000 00000000 c0007e10 00000000
	GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
	GPR24: 00000000 00000000 c0ee2550 00000000 c0f57000 00000ff8 00000000 ff800000
	NIP [c0017cd4] set_pte_at+0xc/0x1e8
	LR [c00187f0] map_kernel_page+0x9c/0x100
	Call Trace:
	[e1011e10] [c0736c68] vsnprintf+0x358/0x6c8 (unreliable)
	[e1011e30] [c0165fec] __set_fixmap+0x30/0x44
	[e1011e40] [c0c13bdc] early_iounmap+0x11c/0x170
	[e1011e70] [c0c06cb0] ioremap_legacy_serial_console+0x88/0xc0
	[e1011e90] [c0c03634] do_one_initcall+0x80/0x178
	[e1011ef0] [c0c0385c] kernel_init_freeable+0xb4/0x250
	[e1011f20] [c0007e34] kernel_init+0x24/0x140
	[e1011f30] [c0016268] ret_from_kernel_thread+0x5c/0x64
	Instruction dump:
	7fe3fb78 48019689 80010014 7c630034 83e1000c 5463d97e 7c0803a6 38210010
	4e800020 81250000 712a0001 41820008 <0fe00000> 9421ffe0 93e1001c 48000030

Implement unmap_kernel_page() which clears an existing pte.

Reported-by: Maxime Bizon <mbizon@freebox.fr>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Maxime Bizon <mbizon@freebox.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/b0b752f6f6ecc60653e873f385c6f0dce4e9ab6a.1638789098.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h | 2 ++
 arch/powerpc/include/asm/fixmap.h            | 6 ++++--
 arch/powerpc/include/asm/nohash/32/pgtable.h | 1 +
 arch/powerpc/include/asm/nohash/64/pgtable.h | 1 +
 arch/powerpc/mm/pgtable.c                    | 9 +++++++++
 6 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 609c80f671943..f8b94f78403f1 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -178,6 +178,7 @@ static inline bool pte_user(pte_t pte)
 #ifndef __ASSEMBLY__
 
 int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
+void unmap_kernel_page(unsigned long va);
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 5d34a8646f081..6866d860d4f30 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1082,6 +1082,8 @@ static inline int map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t p
 	return hash__map_kernel_page(ea, pa, prot);
 }
 
+void unmap_kernel_page(unsigned long va);
+
 static inline int __meminit vmemmap_create_mapping(unsigned long start,
 						   unsigned long page_size,
 						   unsigned long phys)
diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
index 947b5b9c44241..a832aeafe5601 100644
--- a/arch/powerpc/include/asm/fixmap.h
+++ b/arch/powerpc/include/asm/fixmap.h
@@ -111,8 +111,10 @@ static inline void __set_fixmap(enum fixed_addresses idx,
 		BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
 	else if (WARN_ON(idx >= __end_of_fixed_addresses))
 		return;
-
-	map_kernel_page(__fix_to_virt(idx), phys, flags);
+	if (pgprot_val(flags))
+		map_kernel_page(__fix_to_virt(idx), phys, flags);
+	else
+		unmap_kernel_page(__fix_to_virt(idx));
 }
 
 #define __early_set_fixmap	__set_fixmap
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index d6ba821a56ced..63ea4693ccea6 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -64,6 +64,7 @@ extern int icache_44x_need_flush;
 #ifndef __ASSEMBLY__
 
 int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
+void unmap_kernel_page(unsigned long va);
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 9d2905a474103..2225991c69b55 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -308,6 +308,7 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 #define __swp_entry_to_pte(x)		__pte((x).val)
 
 int map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot);
+void unmap_kernel_page(unsigned long va);
 extern int __meminit vmemmap_create_mapping(unsigned long start,
 					    unsigned long page_size,
 					    unsigned long phys);
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index cd16b407f47e1..9a93c1a5aa1d1 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -203,6 +203,15 @@ void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 	__set_pte_at(mm, addr, ptep, pte, 0);
 }
 
+void unmap_kernel_page(unsigned long va)
+{
+	pmd_t *pmdp = pmd_off_k(va);
+	pte_t *ptep = pte_offset_kernel(pmdp, va);
+
+	pte_clear(&init_mm, va, ptep);
+	flush_tlb_kernel_range(va, va + PAGE_SIZE);
+}
+
 /*
  * This is called when relaxing access to a PTE. It's also called in the page
  * fault path when we don't hit any of the major fault cases, ie, a minor
-- 
2.34.1

