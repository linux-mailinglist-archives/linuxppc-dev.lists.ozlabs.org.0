Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DADB18CFCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 15:15:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kQlt06ykzDrfY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 01:15:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i86iYkR1; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kQ5q3HXLzDq9Z
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 00:45:50 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id i13so3262111pfe.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wF5nAqbPMGdvXhIxUwwvfuevw+qD4+cNhShPfbaoD84=;
 b=i86iYkR1c3Byi2cAe+afnoCNvPKDx6aTJAXLJY+CenNsaTqbNc8uEBXH2zLQMBnAyv
 uRDeZGBo85rrWX/yx3XJgOUliC09eRW8xqGqvWmI13qeUr67hJjV9eiUM6495JGtF3xb
 7Eoif0juWtx4Vp3aotg78I/h9r24VUtYFvmeQre86AFNS7SzOj1LHS2nh5luzp3VsGlH
 KipTDNrsqD6YM8FXDmJMYst+5nq1IP7fO0iuCzZuJXmbOyedbhsKMmJd8Yzt4I7NayMN
 stfw5ClIUWNXK15iTeVQUMiE3TvgpKKLimzRQja0KJMYrJAkTYx7wH4CJec9bIi6B5lB
 8Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wF5nAqbPMGdvXhIxUwwvfuevw+qD4+cNhShPfbaoD84=;
 b=I9lJ7NPrYIEhQr5eqGaupUH5bVrbbpq3ZsC2I7Q0Kw4ZokuEnJEVseaJn9D+IcDz3g
 JINtm0d6hz9SgPVQ5Kr9c2xOKLgFZfD8SuKKdPoVvTPkpCIEJmoGezF4gbYX9VVaLP5y
 EKWPh7PiX+u2ZBRYsB8mLOvVIfYnJCu2MXFStLENE6wBhF97dGBShtQIJ7B4IF1ToWJp
 yaqQgPenduQxo0oI8pL7RWqwu/gKuujvqx4jaVADzSraAcEW3VoSdTQ47Qc9FdNDRr5T
 pDPzC1B8QvsbRkSoS/PhF24GzELKGbUwSz/jBD9cW8q1lfwIt4Rrpedi3a1HQFaqhs8P
 FuJw==
X-Gm-Message-State: ANhLgQ2kPpo/dL7SwTF2Tr9B7kkoeK96kcnt6wDP3/gB+dl/G1Y/lHca
 OuYqFLU9hHB01i9ENJY28iaAmSld
X-Google-Smtp-Source: ADFU+vv2fcUcnbo6LP4dHSS/EdglU1GQZJ/gqoigxr0CugWD78kSIRX9IrhHLjqUEw8X2yjM4rIBIQ==
X-Received: by 2002:a62:1648:: with SMTP id 69mr10074292pfw.14.1584711943449; 
 Fri, 20 Mar 2020 06:45:43 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id l7sm5073031pfl.171.2020.03.20.06.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 06:45:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/hash: add torture_segments kernel boot option to
 increase SLB faults
Date: Fri, 20 Mar 2020 23:43:05 +1000
Message-Id: <20200320134305.1462395-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This option increases the number of SLB misses by limiting the number of
kernel SLB entries, and increased flushing of cached lookaside information.
This helps stress test difficult to hit paths in the kernel.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |   4 +
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   7 +
 arch/powerpc/mm/book3s64/hash_utils.c         |  13 ++
 arch/powerpc/mm/book3s64/slb.c                | 145 ++++++++++++------
 4 files changed, 124 insertions(+), 45 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index dbc22d684627..cd3ea9f0c6b1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -861,6 +861,10 @@
 			can be useful when debugging issues that require an SLB
 			miss to occur.
 
+	torture_segments [PPC]
+			Limits the number of SLB entries used, and flushes
+			them frequently to stress SLB faults.
+
 	disable=	[IPV6]
 			See Documentation/networking/ipv6.txt.
 
diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 3fa1b962dc27..de34bf94f38c 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -317,6 +317,13 @@ extern unsigned long tce_alloc_start, tce_alloc_end;
  */
 extern int mmu_ci_restrictions;
 
+extern bool torture_segments_enabled;
+DECLARE_STATIC_KEY_FALSE(torture_segments_key);
+static inline bool torture_segments(void)
+{
+	return static_branch_unlikely(&torture_segments_key);
+}
+
 /*
  * This computes the AVPN and B fields of the first dword of a HPTE,
  * for use when we want to match an existing PTE.  The bottom 7 bits
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 523d4d39d11e..1e5028e22aae 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -354,6 +354,7 @@ int htab_remove_mapping(unsigned long vstart, unsigned long vend,
 }
 
 static bool disable_1tb_segments = false;
+bool torture_segments_enabled __read_mostly = false;
 
 static int __init parse_disable_1tb_segments(char *p)
 {
@@ -362,6 +363,13 @@ static int __init parse_disable_1tb_segments(char *p)
 }
 early_param("disable_1tb_segments", parse_disable_1tb_segments);
 
+static int __init parse_torture_segments(char *p)
+{
+	torture_segments_enabled = true;
+	return 0;
+}
+early_param("torture_segments", parse_torture_segments);
+
 static int __init htab_dt_scan_seg_sizes(unsigned long node,
 					 const char *uname, int depth,
 					 void *data)
@@ -853,6 +861,8 @@ static void __init hash_init_partition_table(phys_addr_t hash_table,
 	pr_info("Partition table %p\n", partition_tb);
 }
 
+DEFINE_STATIC_KEY_FALSE(torture_segments_key);
+
 static void __init htab_initialize(void)
 {
 	unsigned long table;
@@ -869,6 +879,9 @@ static void __init htab_initialize(void)
 		printk(KERN_INFO "Using 1TB segments\n");
 	}
 
+	if (torture_segments_enabled)
+		static_branch_enable(&torture_segments_key);
+
 	/*
 	 * Calculate the required size of the htab.  We want the number of
 	 * PTEGs to equal one half the number of real pages.
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 716204aee3da..d5efce53c54f 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -68,7 +68,7 @@ static void assert_slb_presence(bool present, unsigned long ea)
 	 * slbfee. requires bit 24 (PPC bit 39) be clear in RB. Hardware
 	 * ignores all other bits from 0-27, so just clear them all.
 	 */
-	ea &= ~((1UL << 28) - 1);
+	ea &= ~((1UL << SID_SHIFT) - 1);
 	asm volatile(__PPC_SLBFEE_DOT(%0, %1) : "=r"(tmp) : "r"(ea) : "cr0");
 
 	WARN_ON(present == (tmp == 0));
@@ -153,14 +153,28 @@ void slb_flush_all_realmode(void)
 	asm volatile("slbmte %0,%0; slbia" : : "r" (0));
 }
 
+static __always_inline void __slb_flush_and_restore_bolted(u32 ih)
+{
+	struct slb_shadow *p = get_slb_shadow();
+	unsigned long ksp_esid_data, ksp_vsid_data;
+
+	ksp_esid_data = be64_to_cpu(p->save_area[KSTACK_INDEX].esid);
+	ksp_vsid_data = be64_to_cpu(p->save_area[KSTACK_INDEX].vsid);
+
+	asm volatile(PPC_SLBIA(%0)"	\n"
+		     "slbmte	%1, %2	\n"
+		     :: "i" (ih),
+		        "r" (ksp_vsid_data),
+			"r" (ksp_esid_data)
+		     : "memory");
+}
+
 /*
  * This flushes non-bolted entries, it can be run in virtual mode. Must
  * be called with interrupts disabled.
  */
 void slb_flush_and_restore_bolted(void)
 {
-	struct slb_shadow *p = get_slb_shadow();
-
 	BUILD_BUG_ON(SLB_NUM_BOLTED != 2);
 
 	WARN_ON(!irqs_disabled());
@@ -171,13 +185,10 @@ void slb_flush_and_restore_bolted(void)
 	 */
 	hard_irq_disable();
 
-	asm volatile("isync\n"
-		     "slbia\n"
-		     "slbmte  %0, %1\n"
-		     "isync\n"
-		     :: "r" (be64_to_cpu(p->save_area[KSTACK_INDEX].vsid)),
-			"r" (be64_to_cpu(p->save_area[KSTACK_INDEX].esid))
-		     : "memory");
+	isync();
+	__slb_flush_and_restore_bolted(0);
+	isync();
+
 	assert_slb_presence(true, get_paca()->kstack);
 
 	get_paca()->slb_cache_ptr = 0;
@@ -400,6 +411,30 @@ void preload_new_slb_context(unsigned long start, unsigned long sp)
 	local_irq_enable();
 }
 
+static void slb_cache_slbie_kernel(unsigned int index)
+{
+	unsigned long slbie_data = get_paca()->slb_cache[index];
+	unsigned long ksp = get_paca()->kstack;
+
+	slbie_data <<= SID_SHIFT;
+	slbie_data |= 0xc000000000000000ULL;
+	if ((ksp & slb_esid_mask(mmu_kernel_ssize)) == slbie_data)
+		return;
+	slbie_data |= mmu_kernel_ssize << SLBIE_SSIZE_SHIFT;
+
+	asm volatile("slbie %0" : : "r" (slbie_data));
+}
+
+static void slb_cache_slbie(unsigned int index)
+{
+	unsigned long slbie_data = get_paca()->slb_cache[index];
+
+	slbie_data <<= SID_SHIFT;
+	slbie_data |= user_segment_size(slbie_data) << SLBIE_SSIZE_SHIFT;
+	slbie_data |= SLBIE_C; /* user slbs have C=1 */
+
+	asm volatile("slbie %0" : : "r" (slbie_data));
+}
 
 /* Flush all user entries from the segment table of the current processor. */
 void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
@@ -414,8 +449,14 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 	 * which would update the slb_cache/slb_cache_ptr fields in the PACA.
 	 */
 	hard_irq_disable();
-	asm volatile("isync" : : : "memory");
-	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+	isync();
+	if (torture_segments()) {
+		__slb_flush_and_restore_bolted(0);
+		isync();
+		get_paca()->slb_cache_ptr = 0;
+		get_paca()->slb_kern_bitmap = (1U << SLB_NUM_BOLTED) - 1;
+
+	} else if (cpu_has_feature(CPU_FTR_ARCH_300)) {
 		/*
 		 * SLBIA IH=3 invalidates all Class=1 SLBEs and their
 		 * associated lookaside structures, which matches what
@@ -423,47 +464,36 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 		 * cache.
 		 */
 		asm volatile(PPC_SLBIA(3));
+
 	} else {
 		unsigned long offset = get_paca()->slb_cache_ptr;
 
 		if (!mmu_has_feature(MMU_FTR_NO_SLBIE_B) &&
 		    offset <= SLB_CACHE_ENTRIES) {
-			unsigned long slbie_data = 0;
-
-			for (i = 0; i < offset; i++) {
-				unsigned long ea;
-
-				ea = (unsigned long)
-					get_paca()->slb_cache[i] << SID_SHIFT;
-				/*
-				 * Could assert_slb_presence(true) here, but
-				 * hypervisor or machine check could have come
-				 * in and removed the entry at this point.
-				 */
-
-				slbie_data = ea;
-				slbie_data |= user_segment_size(slbie_data)
-						<< SLBIE_SSIZE_SHIFT;
-				slbie_data |= SLBIE_C; /* user slbs have C=1 */
-				asm volatile("slbie %0" : : "r" (slbie_data));
-			}
+			/*
+			 * Could assert_slb_presence(true) here, but
+			 * hypervisor or machine check could have come
+			 * in and removed the entry at this point.
+			 */
+
+			for (i = 0; i < offset; i++)
+				slb_cache_slbie(i);
 
 			/* Workaround POWER5 < DD2.1 issue */
 			if (!cpu_has_feature(CPU_FTR_ARCH_207S) && offset == 1)
-				asm volatile("slbie %0" : : "r" (slbie_data));
+				slb_cache_slbie(0);
 
 		} else {
-			struct slb_shadow *p = get_slb_shadow();
-			unsigned long ksp_esid_data =
-				be64_to_cpu(p->save_area[KSTACK_INDEX].esid);
-			unsigned long ksp_vsid_data =
-				be64_to_cpu(p->save_area[KSTACK_INDEX].vsid);
-
-			asm volatile(PPC_SLBIA(1) "\n"
-				     "slbmte	%0,%1\n"
-				     "isync"
-				     :: "r"(ksp_vsid_data),
-					"r"(ksp_esid_data));
+			/*
+			 * SLBIA IH=1 on ISA v2.05 and newer will preserve
+			 * lookaside information created with Class=0 (kernel)
+			 * entires, though the SLB entries themselves are
+			 * still invalidated.
+			 *
+			 * Older processors will ignore this optimisation.
+			 */
+			__slb_flush_and_restore_bolted(1);
+			isync();
 
 			get_paca()->slb_kern_bitmap = (1U << SLB_NUM_BOLTED) - 1;
 		}
@@ -503,7 +533,7 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 	 * address accesses by the kernel (user mode won't happen until
 	 * rfid, which is safe).
 	 */
-	asm volatile("isync" : : : "memory");
+	isync();
 }
 
 void slb_set_size(u16 size)
@@ -571,6 +601,9 @@ static void slb_cache_update(unsigned long esid_data)
 	if (cpu_has_feature(CPU_FTR_ARCH_300))
 		return; /* ISAv3.0B and later does not use slb_cache */
 
+	if (torture_segments())
+		return;
+
 	/*
 	 * Now update slb cache entries
 	 */
@@ -580,7 +613,7 @@ static void slb_cache_update(unsigned long esid_data)
 		 * We have space in slb cache for optimized switch_slb().
 		 * Top 36 bits from esid_data as per ISA
 		 */
-		local_paca->slb_cache[slb_cache_index++] = esid_data >> 28;
+		local_paca->slb_cache[slb_cache_index++] = esid_data >> SID_SHIFT;
 		local_paca->slb_cache_ptr++;
 	} else {
 		/*
@@ -671,6 +704,28 @@ static long slb_insert_entry(unsigned long ea, unsigned long context,
 	 * accesses user memory before it returns to userspace with rfid.
 	 */
 	assert_slb_presence(false, ea);
+	if (torture_segments()) {
+		int slb_cache_index = local_paca->slb_cache_ptr;
+
+		/*
+		 * torture_segments() does not use slb cache, repurpose as a
+		 * cache of inserted (non-bolted) kernel SLB entries. All
+		 * non-bolted kernel entries are flushed on any user fault,
+		 * or if there are already 3 non-boled kernel entries.
+		 */
+		BUILD_BUG_ON(SLB_CACHE_ENTRIES < 3);
+		if (!kernel || slb_cache_index == 3) {
+			int i;
+
+			for (i = 0; i < slb_cache_index; i++)
+				slb_cache_slbie_kernel(i);
+			slb_cache_index = 0;
+		}
+
+		if (kernel)
+			local_paca->slb_cache[slb_cache_index++] = esid_data >> SID_SHIFT;
+		local_paca->slb_cache_ptr = slb_cache_index;
+	}
 	asm volatile("slbmte %0, %1" : : "r" (vsid_data), "r" (esid_data));
 
 	barrier();
-- 
2.23.0

