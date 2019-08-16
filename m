Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 766878F99E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 06:11:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468qcz24zczDrK0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 14:11:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eRgALBhz"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468qY46SbqzDrDQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 14:07:52 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id w2so2443903pfi.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 21:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HPGSgmCjaz73FCjQCM8Yv9lrdaTh/R5iHubdMTyR3ls=;
 b=eRgALBhzF3vX0GqhpQb+AriwRl+Eo/ER6qM+TDKkR4WCUsoyEMqFQzDKfQa9J5APYo
 hjqdd+L6YvnCyAEvl6FbTOxSi+9d+jKgmDp0zJwfKnmRWQKNdf8b61KGj6RG72O8rRnz
 p0tKmMX2VXv0GTMR7W9NjGg6ao8LI9u5NgbWdIsGEQfC45zc5KK9dZ8RgAupH2BLVR3l
 gsHl7wCuc3EZAIJs+vIgIkeFGExsMWhIWxZ0EO1p3HXGSChawyYUXat4F5Q1gV/xcgjA
 eMynlZ0D7hprOmxm1TfGesS2L1/0cStBeebBe5WsjrOseiCMuUbdJ5DghQ4lhjUIKLQ+
 VLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HPGSgmCjaz73FCjQCM8Yv9lrdaTh/R5iHubdMTyR3ls=;
 b=JmcDT1q2jo1K6LVJWV965a5S0b4kIswaeg5+1p+iVAQZhw74k4AqRYC3UFEBSxrIBB
 o/Zh6IIvBeXSr3nbZpc+Trb4qZ/oF3sYW8QVKANGTth3vT7ylGLelPPAQN2iSxy+oa2o
 j/M9REJNEt3Dg6ZBMB/iFjz37imSLilgdyTHG2llu8N2yMgVUHl6GVE9SZSJn1P9Y1Rd
 Iu55wJ2h9vxgMgfFvUwENlZFXy8OQqgtbhprlyLfk/JIFDGAKE0Mpz5wF5ptX7hjDkBx
 F72fgLEtXrrGKhT9Zyarm0ShwKM83mpWrhiESbRA/TP+E+uMMaDr5RfB8+jTw/CWdlYu
 eiTw==
X-Gm-Message-State: APjAAAUiYJPc4QgyY381W5hZniLTfCMFgJn24MgZdNxlSyEKdZ5enDWH
 E0HfiwsJ4pfhyLD5NhPqiVNUFoJX
X-Google-Smtp-Source: APXvYqxz3Q6zxdaPRvA08gnAixal0S5skOxckB4InOTtl2pmPsHJLf/H5zvuxCse5AFXAi966Q/E8g==
X-Received: by 2002:aa7:98da:: with SMTP id e26mr8827006pfm.34.1565928470722; 
 Thu, 15 Aug 2019 21:07:50 -0700 (PDT)
Received: from bobo.local0.net (61-68-63-22.tpgi.com.au. [61.68.63.22])
 by smtp.gmail.com with ESMTPSA id j187sm4994850pfg.178.2019.08.15.21.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 21:07:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/64s: Remove mmu_partition_table_set
Date: Fri, 16 Aug 2019 14:07:31 +1000
Message-Id: <20190816040733.5737-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190816040733.5737-1-npiggin@gmail.com>
References: <20190816040733.5737-1-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This was an awkward interface that didn't quite suit bare metal boot,
because the host page table base is stored into the partition table at
a different place than the process table base, and the TLB flushing is
unnecessary at boot with the MMU off, provided all CPUs invalidate
all their translation structures before turning their MMU on.

So inline this into kvmhv_set_ptbl_entry, where it pairs up nicely
with the nested case.

Bare metal modifies the partition table directly, and the TLBIEs are
dropped because in HVMODE, all CPUs invalidate their translation
structures before enabling their MMU.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/mmu.h           |  2 --
 arch/powerpc/kvm/book3s_hv.c             |  4 +--
 arch/powerpc/kvm/book3s_hv_nested.c      | 35 +++++++++++++++++++-----
 arch/powerpc/mm/book3s64/hash_utils.c    |  4 ++-
 arch/powerpc/mm/book3s64/mmu_context.c   |  4 +--
 arch/powerpc/mm/book3s64/pgtable.c       | 30 --------------------
 arch/powerpc/mm/book3s64/radix_pgtable.c | 11 +++-----
 arch/powerpc/mm/pgtable_64.c             |  5 ++--
 8 files changed, 42 insertions(+), 53 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index ba94ce8c22d7..b973a708e8b4 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -256,8 +256,6 @@ extern void radix__mmu_cleanup_all(void);
 
 /* Functions for creating and updating partition table on POWER9 */
 extern void mmu_partition_table_init(void);
-extern void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
-					  unsigned long dw1);
 #endif /* CONFIG_PPC64 */
 
 struct mm_struct;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index cde3f5a4b3e4..6ec2e4fe86d3 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4786,8 +4786,8 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 	 * Since we don't flush the TLB when tearing down a VM,
 	 * and this lpid might have previously been used,
 	 * make sure we flush on each core before running the new VM.
-	 * On POWER9, the tlbie in mmu_partition_table_set_entry()
-	 * does this flush for us.
+	 * On POWER9, the flush setting the partition table entry
+	 * in kvmhv_set_ptbl_entry takes care of this.
 	 */
 	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		cpumask_setall(&kvm->arch.need_tlb_flush);
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 735e0ac6f5b2..76f37dd8a327 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -411,14 +411,35 @@ static void kvmhv_flush_lpid(unsigned int lpid)
 void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1)
 {
 	if (!kvmhv_on_pseries()) {
-		mmu_partition_table_set_entry(lpid, dw0, dw1);
-		return;
-	}
+		unsigned long old = be64_to_cpu(partition_tb[lpid].patb0);
+
+		partition_tb[lpid].patb0 = cpu_to_be64(dw0);
+		partition_tb[lpid].patb1 = cpu_to_be64(dw1);
+
+		/*
+		 * Global flush of TLBs and partition table caches for this
+		 * lpid. The type of flush (hash or radix) depends on what the
+		 * previous use of this partition ID was, not the new use.
+		 */
+		asm volatile("ptesync" : : : "memory");
+		if (old & PATB_HR) {
+			asm volatile(PPC_TLBIE_5(%0,%1,2,0,1) : :
+				     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
+			asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
+				     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
+		} else {
+			asm volatile(PPC_TLBIE_5(%0,%1,2,0,0) : :
+				     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
+		}
+		/* do we need fixup here ?*/
+		asm volatile("eieio; tlbsync; ptesync" : : : "memory");
 
-	pseries_partition_tb[lpid].patb0 = cpu_to_be64(dw0);
-	pseries_partition_tb[lpid].patb1 = cpu_to_be64(dw1);
-	/* L0 will do the necessary barriers */
-	kvmhv_flush_lpid(lpid);
+	} else {
+		pseries_partition_tb[lpid].patb0 = cpu_to_be64(dw0);
+		pseries_partition_tb[lpid].patb1 = cpu_to_be64(dw1);
+		/* L0 will do the necessary barriers */
+		kvmhv_flush_lpid(lpid);
+	}
 }
 
 static void kvmhv_set_nested_ptbl(struct kvm_nested_guest *gp)
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index b8ad14bb1170..e19bc3a5d9a5 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -823,7 +823,9 @@ static void __init hash_init_partition_table(phys_addr_t hash_table,
 	 * For now, UPRT is 0 and we have no segment table.
 	 */
 	htab_size =  __ilog2(htab_size) - 18;
-	mmu_partition_table_set_entry(0, hash_table | htab_size, 0);
+	partition_tb[0].patb0 = cpu_to_be64(hash_table | htab_size);
+	partition_tb[0].patb1 = 0;
+
 	pr_info("Partition table %p\n", partition_tb);
 }
 
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 2d0cb5ba9a47..7344bea5d243 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -276,8 +276,8 @@ void arch_exit_mmap(struct mm_struct *mm)
 		 * and 0 is invalid. So this will do.
 		 *
 		 * This runs before the "fullmm" tlb flush in exit_mmap,
-		 * which does a RIC=2 tlbie to clear the process table
-		 * entry. See the "fullmm" comments in tlb-radix.c.
+		 * which does a RIC=2 tlb invalidate to clear the process
+		 * table entry. See the "fullmm" comments in tlb-radix.c.
 		 *
 		 * No barrier required here after the store because
 		 * this process will do the invalidate, which starts with
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 7d0e0d0d22c4..bbedd7f7ab3f 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -209,36 +209,6 @@ void __init mmu_partition_table_init(void)
 	powernv_set_nmmu_ptcr(ptcr);
 }
 
-void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
-				   unsigned long dw1)
-{
-	unsigned long old = be64_to_cpu(partition_tb[lpid].patb0);
-
-	partition_tb[lpid].patb0 = cpu_to_be64(dw0);
-	partition_tb[lpid].patb1 = cpu_to_be64(dw1);
-
-	/*
-	 * Global flush of TLBs and partition table caches for this lpid.
-	 * The type of flush (hash or radix) depends on what the previous
-	 * use of this partition ID was, not the new use.
-	 */
-	asm volatile("ptesync" : : : "memory");
-	if (old & PATB_HR) {
-		asm volatile(PPC_TLBIE_5(%0,%1,2,0,1) : :
-			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
-		asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
-			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
-		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 1);
-	} else {
-		asm volatile(PPC_TLBIE_5(%0,%1,2,0,0) : :
-			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
-		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
-	}
-	/* do we need fixup here ?*/
-	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
-}
-EXPORT_SYMBOL_GPL(mmu_partition_table_set_entry);
-
 static pmd_t *get_pmd_from_cache(struct mm_struct *mm)
 {
 	void *pmd_frag, *ret;
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b4ca9e95e678..d60cfa05447a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -36,12 +36,7 @@ unsigned int mmu_base_pid;
 static int native_register_process_table(unsigned long base, unsigned long pg_sz,
 					 unsigned long table_size)
 {
-	unsigned long patb0, patb1;
-
-	patb0 = be64_to_cpu(partition_tb[0].patb0);
-	patb1 = base | table_size | PATB_GR;
-
-	mmu_partition_table_set_entry(0, patb0, patb1);
+	partition_tb[0].patb1 = cpu_to_be64(base | table_size | PATB_GR);
 
 	return 0;
 }
@@ -417,7 +412,9 @@ static void __init radix_init_partition_table(void)
 	mmu_partition_table_init();
 	rts_field = radix__get_tree_size();
 	dw0 = rts_field | __pa(init_mm.pgd) | RADIX_PGD_INDEX_SIZE | PATB_HR;
-	mmu_partition_table_set_entry(0, dw0, 0);
+
+	partition_tb[0].patb0 = cpu_to_be64(dw0);
+	partition_tb[0].patb1 = 0;
 
 	pr_info("Initializing Radix MMU\n");
 	pr_info("Partition table %p\n", partition_tb);
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 9ad59b733984..5bd008e6eb41 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -54,8 +54,9 @@
 /*
  * partition table and process table for ISA 3.0
  */
-struct prtb_entry *process_tb;
-struct patb_entry *partition_tb;
+struct prtb_entry *process_tb __read_mostly;
+struct patb_entry *partition_tb __read_mostly;
+EXPORT_SYMBOL_GPL(partition_tb); /* KVM only */
 /*
  * page table size
  */
-- 
2.22.0

