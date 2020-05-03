Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EC61C2AB8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 10:24:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FJtb5gsDzDqvP
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 18:24:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KYmAc26Y; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FJrw4qZ7zDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 May 2020 18:22:53 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id a31so2276692pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 May 2020 01:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXFDCVrc9DfM2kQZxlFOq/wXtcUPHUpW0vURx0m7aMY=;
 b=KYmAc26YoAPq1uPpRCC0C/sRRd+uo250RCT5TYJ9Edb7//phyQWGrYTUak70HkLP/Q
 T4KBGdFcqacOeunmji88AMcuCn7zTGnEYdi58g7fpt8MWauuY2nBERZUZ/6m5h+2rlun
 m1/r8S3zU647wHzIHa2jAKwPne0qB/24mMo/hzOr5ItNsbMaUcQR5kX2qGyOqt711BAv
 uEU8csXciyJREtI/is5YGH3TWjqiBRApCWEERipoJQA5z8OGIlmWF2xGypj1DDCvMXRs
 nvhMhMKL+0/IEV2/5+c8UVHjzz1jWasl3DgtpSGKRt5LSzj5sbugPiAKoEH0zZeYnk3g
 0xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXFDCVrc9DfM2kQZxlFOq/wXtcUPHUpW0vURx0m7aMY=;
 b=oVEA/NFe0pVpRZgmW5f+eN/KNZDSsmGT0cTkd8EjyGH1sEEzv1OPsn1vrZnrb0Y1aW
 n7sgOZp1ZIaRLu1ZOtq/PpqfRQuqliE/UkhAPMh8UUmu8cXgavens11QeOcVVwnA/EhB
 bOVaDeNsa2eJecNvfkfKg6QeNX6dBdq02UloFMDn3jKiqwjkezFxsDHGdQeAqnJRq2Bo
 0yjJd7IMhXEHQ3Ap2DN3LbGyrPq6jgt7D1xebot7SLAbGzgGh3NDkA28FsrYEGC5XOAL
 zls7Dp9jn20bGU2QQ/Nih5Kdd+56ITzBOgLZvhkxMxuJrEGYh0wHqxh61Vj6QhO2uE4K
 bFbQ==
X-Gm-Message-State: AGi0PuZiGKKpSj/CuMo98EVgi2sB6emz0oYL3eGnUXtxJJnt4gq4inBO
 fMYlXRIS5eCmeMfiG3UpgTqfWp7v
X-Google-Smtp-Source: APiQypIZ45JByvScjwXi55Zl0InOlcDOifi75lxpVLkbKjwXp6pv+EPDp9XCBqmW0JRwA080B+ETAA==
X-Received: by 2002:a17:90a:cc9:: with SMTP id 9mr10426344pjt.16.1588494168974; 
 Sun, 03 May 2020 01:22:48 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id v94sm3876816pjb.39.2020.05.03.01.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 May 2020 01:22:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s/hash: add torture_slb kernel boot option to
 increase SLB faults
Date: Sun,  3 May 2020 18:22:35 +1000
Message-Id: <20200503082236.17991-1-npiggin@gmail.com>
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
 .../admin-guide/kernel-parameters.txt         |   5 +
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   7 +
 arch/powerpc/mm/book3s64/hash_utils.c         |  13 ++
 arch/powerpc/mm/book3s64/slb.c                | 145 ++++++++++++------
 4 files changed, 125 insertions(+), 45 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f2a93c8679e8..5a34b7dd9ebe 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -871,6 +871,11 @@
 			can be useful when debugging issues that require an SLB
 			miss to occur.
 
+	torture_slb	[PPC]
+			Limits the number of kernel SLB entries, and flushes
+			them frequently to increase the rate of SLB faults
+			on kernel addresses.
+
 	disable=	[IPV6]
 			See Documentation/networking/ipv6.txt.
 
diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 3fa1b962dc27..758de1e0f676 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -317,6 +317,13 @@ extern unsigned long tce_alloc_start, tce_alloc_end;
  */
 extern int mmu_ci_restrictions;
 
+extern bool torture_slb_enabled;
+DECLARE_STATIC_KEY_FALSE(torture_slb_key);
+static inline bool torture_slb(void)
+{
+	return static_branch_unlikely(&torture_slb_key);
+}
+
 /*
  * This computes the AVPN and B fields of the first dword of a HPTE,
  * for use when we want to match an existing PTE.  The bottom 7 bits
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 8ed2411c3f39..9c487b5782ef 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -354,6 +354,7 @@ int htab_remove_mapping(unsigned long vstart, unsigned long vend,
 }
 
 static bool disable_1tb_segments = false;
+bool torture_slb_enabled __read_mostly = false;
 
 static int __init parse_disable_1tb_segments(char *p)
 {
@@ -362,6 +363,13 @@ static int __init parse_disable_1tb_segments(char *p)
 }
 early_param("disable_1tb_segments", parse_disable_1tb_segments);
 
+static int __init parse_torture_slb(char *p)
+{
+	torture_slb_enabled = true;
+	return 0;
+}
+early_param("torture_slb", parse_torture_slb);
+
 static int __init htab_dt_scan_seg_sizes(unsigned long node,
 					 const char *uname, int depth,
 					 void *data)
@@ -854,6 +862,8 @@ static void __init hash_init_partition_table(phys_addr_t hash_table,
 	pr_info("Partition table %p\n", partition_tb);
 }
 
+DEFINE_STATIC_KEY_FALSE(torture_slb_key);
+
 static void __init htab_initialize(void)
 {
 	unsigned long table;
@@ -870,6 +880,9 @@ static void __init htab_initialize(void)
 		printk(KERN_INFO "Using 1TB segments\n");
 	}
 
+	if (torture_slb_enabled)
+		static_branch_enable(&torture_slb_key);
+
 	/*
 	 * Calculate the required size of the htab.  We want the number of
 	 * PTEGs to equal one half the number of real pages.
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 716204aee3da..37e9f6c096e3 100644
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
+			"r" (ksp_vsid_data),
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
+	if (torture_slb()) {
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
+			 * entries, though the SLB entries themselves are
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
 
+	if (torture_slb())
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
+	if (torture_slb()) {
+		int slb_cache_index = local_paca->slb_cache_ptr;
+
+		/*
+		 * torture_slb() does not use slb cache, repurpose as a
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

