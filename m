Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77EB3DF94E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 03:38:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfZBM38plz3bhx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 11:38:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FFVr7yPR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FFVr7yPR; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfZ9v1MSLz2ysq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 11:37:36 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id j3so1241886plx.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Aug 2021 18:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiS1TsVKtk/MFCR5gO5dGb23ykh6CXfPOUHRaM3VCNI=;
 b=FFVr7yPR9fMfHlZ88acCJ868dy+/3QPm0uqrQgZuzPPB7zBjMGGEjEWPEm+zl49O1+
 VrreV3VSm5MquZm/AYxgRozcoRmT36wGyQooQoIsrf5OyQnPMses5CxnxKGOlirSjKYd
 X2TDLHi3AbtC0AQ1BWXh/TeQXRb8pbSyVwwqGtPQ4cczWn1ZFS8RpjzTUjJFfSBun9UB
 +Y5AFGqs88Au39KgtIlATHq19WJrUO1hcAKIT9UHF5EsiJTN5bxfdQ1TjH5NGvNXwNuO
 75CKQB9nwmt3Uw4nNKQmp1hEZuY5Ka9VAPAzk//eFzEDgsswzVvTmSpZeC5GUADldoey
 fbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiS1TsVKtk/MFCR5gO5dGb23ykh6CXfPOUHRaM3VCNI=;
 b=bKDjs9YO9TQGZDwjGtr0/sQANiZarJ4oEgmzRnRzN+Q2uxPXDDQktY9gnUSmsl9UXl
 CQG2kY5IFx6yMLttRb5Z6PYbkEyYteaLE7t/tK7VW1MW5KWSqdK5eIbnLd6bLe073Xak
 TSnIEPSSdSZYY9uc487qyCnYLkfohA0uH1M6ZWIQpe5nyN8riq4aWUe0DZjOYcZ+tnL+
 UD6PAKVtSqCCjCF7f8cqDpGw+zxiGTvbdOzbi7FN4FuOoLiXDqjflnA2741HBN2PoVp8
 KEP8h6CPs4jzoJWMvKYsS1sMN6q0VQmMjy0vpNbyjaAR58HgbMYCsFDxWJIjXUNG/spi
 TopA==
X-Gm-Message-State: AOAM532I4KNaV2azqQz10Zda3Ag6heSSbeiJ3vFq5a9tv2iRo4nWmohG
 1hSwiBCWcInTCRzb4FVfb7Z4s9uvllk=
X-Google-Smtp-Source: ABdhPJwN4Vvv9yf5jFHn2zkklxLwNNDOb3q5BI7j6PSJYBnmRzLA2cQdOKNe033610DFeCLhby+YvQ==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr7065929pjg.202.1628041053122; 
 Tue, 03 Aug 2021 18:37:33 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id t23sm469526pfe.8.2021.08.03.18.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 18:37:32 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Always inline radix_enabled() to fix build failure
Date: Wed,  4 Aug 2021 11:37:24 +1000
Message-Id: <20210804013724.514468-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>, erhard_f@mailbox.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the same as commit acdad8fb4a15 ("powerpc: Force inlining of
mmu_has_feature to fix build failure") but for radix_enabled().  The
config in the linked bugzilla causes the following build failure:

LD      .tmp_vmlinux.kallsyms1
powerpc64-linux-ld: arch/powerpc/mm/pgtable.o: in function `.__ptep_set_access_flags':
pgtable.c:(.text+0x17c): undefined reference to `.radix__ptep_set_access_flags'
powerpc64-linux-ld: arch/powerpc/mm/pageattr.o: in function `.change_page_attr':
pageattr.c:(.text+0xc0): undefined reference to `.radix__flush_tlb_kernel_range'
powerpc64-linux-ld: arch/powerpc/mm/pageattr.o: in function `.set_page_attr':
pageattr.c:(.text+0x228): undefined reference to `.radix__flush_tlb_kernel_range'
powerpc64-linux-ld: arch/powerpc/mm/book3s64/mmu_context.o:(.toc+0x0): undefined reference to `mmu_pid_bits'
powerpc64-linux-ld: arch/powerpc/mm/book3s64/mmu_context.o:(.toc+0x8): undefined reference to `mmu_base_pid'
powerpc64-linux-ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.pmd_hugepage_update':
pgtable.c:(.text+0x98): undefined reference to `.radix__pmd_hugepage_update'
powerpc64-linux-ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.do_serialize':
pgtable.c:(.text+0xdc): undefined reference to `.exit_lazy_flush_tlb'
powerpc64-linux-ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.pmdp_set_access_flags':
pgtable.c:(.text+0x258): undefined reference to `.radix__ptep_set_access_flags'
powerpc64-linux-ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.pmdp_invalidate':
pgtable.c:(.text+0x4a8): undefined reference to `.radix__flush_pmd_tlb_range'
powerpc64-linux-ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.pmdp_huge_get_and_clear_full':
pgtable.c:(.text+0x510): undefined reference to `.radix__pmdp_huge_get_and_clear'
powerpc64-linux-ld: pgtable.c:(.text+0x550): undefined reference to `.radix__flush_pmd_tlb_range'
powerpc64-linux-ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.mmu_cleanup_all':
pgtable.c:(.text+0x674): undefined reference to `.radix__mmu_cleanup_all'
powerpc64-linux-ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.ptep_modify_prot_commit':
pgtable.c:(.text+0xdf8): undefined reference to `.radix__ptep_modify_prot_commit'
powerpc64-linux-ld: arch/powerpc/lib/code-patching.o: in function `.patch_instruction':
code-patching.c:(.text+0x318): undefined reference to `.radix__map_kernel_page'
powerpc64-linux-ld: code-patching.c:(.text+0x498): undefined reference to `.radix__flush_tlb_kernel_range'
powerpc64-linux-ld: kernel/fork.o: in function `.dup_mm':
fork.c:(.text+0x2138): undefined reference to `.radix__flush_tlb_mm'
powerpc64-linux-ld: mm/memory.o: in function `.unmap_page_range':
memory.c:(.text+0x305c): undefined reference to `.radix__tlb_flush'
powerpc64-linux-ld: mm/memory.o: in function `.do_wp_page':
memory.c:(.text+0x36cc): undefined reference to `.radix__flush_tlb_page'
powerpc64-linux-ld: mm/memory.o: in function `.do_set_pmd':
memory.c:(.text+0x42f8): undefined reference to `.radix__pgtable_trans_huge_deposit'
powerpc64-linux-ld: mm/memory.o: in function `.__handle_mm_fault':
memory.c:(.text+0x6af8): undefined reference to `.radix__flush_tlb_page'
powerpc64-linux-ld: mm/mprotect.o: in function `.change_protection':
mprotect.c:(.text+0x274): undefined reference to `.radix__flush_tlb_range'
powerpc64-linux-ld: mm/mremap.o: in function `.flush_tlb_range':
mremap.c:(.text+0x500): undefined reference to `.radix__flush_tlb_range'
powerpc64-linux-ld: mm/pgtable-generic.o: in function `.ptep_clear_flush':
pgtable-generic.c:(.text+0xb0): undefined reference to `.radix__flush_tlb_page'
powerpc64-linux-ld: mm/pgtable-generic.o: in function `.pmdp_huge_clear_flush':
pgtable-generic.c:(.text+0x160): undefined reference to `.radix__pmdp_huge_get_and_clear'
powerpc64-linux-ld: pgtable-generic.c:(.text+0x198): undefined reference to `.radix__flush_pmd_tlb_range'
powerpc64-linux-ld: mm/rmap.o: in function `.try_to_unmap_one':
rmap.c:(.text+0x1d60): undefined reference to `.radix__flush_tlb_range'
powerpc64-linux-ld: mm/rmap.o: in function `.try_to_migrate_one':
rmap.c:(.text+0x222c): undefined reference to `.radix__flush_tlb_range'
powerpc64-linux-ld: mm/vmalloc.o: in function `.flush_tlb_kernel_range':
vmalloc.c:(.text+0x5a8): undefined reference to `.radix__flush_tlb_kernel_range'
powerpc64-linux-ld: mm/hugetlb.o: in function `.hugetlb_cow':
hugetlb.c:(.text+0x53b0): undefined reference to `.radix__flush_hugetlb_page'
powerpc64-linux-ld: mm/hugetlb.o: in function `.hugetlb_change_protection':
hugetlb.c:(.text+0x6558): undefined reference to `.radix__flush_hugetlb_tlb_range'
powerpc64-linux-ld: mm/hugetlb.o: in function `.hugetlb_unshare_all_pmds':
hugetlb.c:(.text+0x70f0): undefined reference to `.radix__flush_hugetlb_tlb_range'
powerpc64-linux-ld: mm/huge_memory.o: in function `.pgtable_trans_huge_deposit':
huge_memory.c:(.text+0x6b0): undefined reference to `.radix__pgtable_trans_huge_deposit'
powerpc64-linux-ld: mm/huge_memory.o: in function `.pgtable_trans_huge_withdraw':
huge_memory.c:(.text+0x6f8): undefined reference to `.radix__pgtable_trans_huge_withdraw'
powerpc64-linux-ld: mm/huge_memory.o: in function `.pmd_hugepage_update.isra.0':
huge_memory.c:(.text+0xa28): undefined reference to `.radix__pmd_hugepage_update'
powerpc64-linux-ld: mm/huge_memory.o: in function `.do_huge_pmd_numa_page':
huge_memory.c:(.text+0x2184): undefined reference to `.radix__flush_tlb_range'
powerpc64-linux-ld: mm/huge_memory.o: in function `.move_huge_pmd':
huge_memory.c:(.text+0x270c): undefined reference to `.radix__pmdp_huge_get_and_clear'
powerpc64-linux-ld: huge_memory.c:(.text+0x27a8): undefined reference to `.radix__flush_tlb_range'
powerpc64-linux-ld: mm/khugepaged.o: in function `.pmdp_collapse_flush':
khugepaged.c:(.text+0x19c8): undefined reference to `.radix__pmdp_collapse_flush'
powerpc64-linux-ld: mm/khugepaged.o: in function `.khugepaged':
khugepaged.c:(.text+0x4eec): undefined reference to `.radix__pgtable_trans_huge_deposit'
powerpc64-linux-ld: fs/proc/task_mmu.o: in function `.clear_refs_write':
task_mmu.c:(.text+0x2340): undefined reference to `.radix__flush_tlb_mm'

This is due to radix_enabled() not being inlined. See extract from building with -Winline:

In file included from arch/powerpc/include/asm/lppaca.h:46,
                 from arch/powerpc/include/asm/paca.h:17,
                 from arch/powerpc/include/asm/current.h:13,
                 from include/linux/thread_info.h:23,
                 from include/asm-generic/preempt.h:5,
                 from ./arch/powerpc/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:78,
                 from include/linux/spinlock.h:51,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:6,
                 from arch/powerpc/mm/pgtable.c:21:
arch/powerpc/include/asm/book3s/64/pgtable.h: In function '__ptep_set_access_flags':
arch/powerpc/include/asm/mmu.h:327:20: error: inlining failed in call to 'radix_enabled': call is unlikely and code size would grow [-Werror=inline]

The code relies on constant folding of MMU_FTRS_POSSIBLE at buildtime
and elimination of non possible parts of code at compile time. For this
to work radix_enabled() must be inlined so make it __always_inline.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=213803
Reported-by: Erhard F. <erhard_f@mailbox.org>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/mmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 27016b98ecb2..8abe8e42e045 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -324,7 +324,7 @@ static inline void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 }
 #endif /* !CONFIG_DEBUG_VM */
 
-static inline bool radix_enabled(void)
+static __always_inline bool radix_enabled(void)
 {
 	return mmu_has_feature(MMU_FTR_TYPE_RADIX);
 }
-- 
2.25.1

