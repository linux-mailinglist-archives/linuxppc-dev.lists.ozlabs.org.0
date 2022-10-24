Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E163F609868
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 05:02:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MwfyT64t0z3cFn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 14:02:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a5TwLd3w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a5TwLd3w;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MwfxW3SPlz2xjr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 14:02:05 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id j12so7413291plj.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Oct 2022 20:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YoVpJtakoPpNwmMqTlg2ZqFlXvb8+6HR/bZB5/w8Eu4=;
        b=a5TwLd3wSYpWuPv3jLUZ3Yd7AvK+QjnuWlzkXYzA5Of4IN5q7zzlwr06xK6BukbhCc
         uxOvmr/032QfbNRDbA9FhM4LxOKcCf/BOVeg/5MLB1FXAB9wg+nRfO+WoSaqJ/A4B/1q
         3if/qa322RWmXMg3ZBDxjyvNcq4uzvXGCg5oo3VONC0/I87m7jze2NSbR+Qu60JH6RxI
         iD3grDM17dZ2RFf1yJobb8d4qUcvvlbQ2SQjzWclLdOL4HRHcgCL7wsTKGIWUN00IpXc
         /kHXslvh7OHctToOAmCGKKjFBDoaCFuW+fN8o2lyeb5UzNuBs0MZuQLrHNd3McqmjxhJ
         Yl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoVpJtakoPpNwmMqTlg2ZqFlXvb8+6HR/bZB5/w8Eu4=;
        b=b4md8BeaoF0Gvr6atNbg+FSEZPLc37a8/vmTrnK3fU5A1eUiQz1KI3XBlew10GdnQa
         ma76OCZ9dDFhX6/1GpwECLUWA6BsnvU6g/yjQseI/P5nu4jTdFrMwFYArBpkNNbd/RcK
         y+IGQruuP+5RRpi283sbc+m/alWJGSLGHHXI7kAERAim0Jgeqrgpg73zC/b1yt0POPq9
         ERWvE4WInVWgfQA9vHC+597bnB72Fj9GGvvvQhFqgv5szbXP6fqRzrfc874bIr01wdXe
         PXYVzl2sSDLagcMrT7Tt0doWDf01IF6M9jeqS4ByBFCnHINBGVKgSkdFV9A+HpgPOj/X
         gStg==
X-Gm-Message-State: ACrzQf2MSWippQbwDGwS/78iWSdJShbj3P0EhRElIsArua9y7b03trPf
	LIG3Rh/QGwiGvVTIaY/mOQMdSdqifq4=
X-Google-Smtp-Source: AMsMyM4CVv6Wn2tXhialzwOloWwZRnFTm9EqYOeCmLecr7MVeqxHT5x4yPYxohq88xMMWJvwhqe/jA==
X-Received: by 2002:a17:903:183:b0:184:8c1a:7a95 with SMTP id z3-20020a170903018300b001848c1a7a95mr31526909plg.137.1666580521646;
        Sun, 23 Oct 2022 20:02:01 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.150.62])
        by smtp.gmail.com with ESMTPSA id ij4-20020a170902ab4400b0017f8edd3d8asm18633872plb.177.2022.10.23.20.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 20:02:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/hash: add stress_hpt kernel boot option to increase hash faults
Date: Mon, 24 Oct 2022 13:01:50 +1000
Message-Id: <20221024030150.852517-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This option increases the number of hash misses by limiting the number
of kernel HPT entries, by keeping a per-CPU record of the last kernel
HPTEs installed, and removing that from the hash table on the next hash
insertion. A timer round-robins CPUs removing remaining kernel HPTEs and
clearing the TLB (in the case of bare metal) to increase and slightly
randomise kernel fault activity.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

I tried this a while ago and it had some lockup issues, I think I fixed
them. Deadlock if the same hpte group is used as the one to be cleared,
solved by deferring the removal in that case. Livelock if CPUs are
concurrently faulting in HPTEs and removing them, solved by limiting
HPTE remove iterations. And thrashing / practical livelock due to
insufficient TLB entries on pseries, solved by keeping the last 16
translations cached. Also added a periodic tlb flush timer to add a
bit more randomness to faults.

This catches the irq return bug that the stress_code_patching.sh
test was triggering.

Thanks,
Nick

 .../admin-guide/kernel-parameters.txt         |   5 +
 arch/powerpc/mm/book3s64/hash_4k.c            |   5 +
 arch/powerpc/mm/book3s64/hash_64k.c           |  10 ++
 arch/powerpc/mm/book3s64/hash_utils.c         | 129 +++++++++++++++++-
 arch/powerpc/mm/book3s64/internal.h           |  11 ++
 5 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a465d5242774..9f3d256529d0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1042,6 +1042,11 @@
 			them frequently to increase the rate of SLB faults
 			on kernel addresses.
 
+	stress_hpt	[PPC]
+			Limits the number of kernel HPT entries in the hash
+			page table to increase the rate of hash page table
+			faults on kernel addresses.
+
 	disable=	[IPV6]
 			See Documentation/networking/ipv6.rst.
 
diff --git a/arch/powerpc/mm/book3s64/hash_4k.c b/arch/powerpc/mm/book3s64/hash_4k.c
index 7de1a8a0c62a..02acbfd05b46 100644
--- a/arch/powerpc/mm/book3s64/hash_4k.c
+++ b/arch/powerpc/mm/book3s64/hash_4k.c
@@ -16,6 +16,8 @@
 #include <asm/machdep.h>
 #include <asm/mmu.h>
 
+#include "internal.h"
+
 int __hash_page_4K(unsigned long ea, unsigned long access, unsigned long vsid,
 		   pte_t *ptep, unsigned long trap, unsigned long flags,
 		   int ssize, int subpg_prot)
@@ -118,6 +120,9 @@ int __hash_page_4K(unsigned long ea, unsigned long access, unsigned long vsid,
 		}
 		new_pte = (new_pte & ~_PAGE_HPTEFLAGS) | H_PAGE_HASHPTE;
 		new_pte |= pte_set_hidx(ptep, rpte, 0, slot, PTRS_PER_PTE);
+
+		if (stress_hpt())
+			hpt_do_stress(ea, hpte_group);
 	}
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
 	return 0;
diff --git a/arch/powerpc/mm/book3s64/hash_64k.c b/arch/powerpc/mm/book3s64/hash_64k.c
index 998c6817ed47..954af420f358 100644
--- a/arch/powerpc/mm/book3s64/hash_64k.c
+++ b/arch/powerpc/mm/book3s64/hash_64k.c
@@ -16,6 +16,8 @@
 #include <asm/machdep.h>
 #include <asm/mmu.h>
 
+#include "internal.h"
+
 /*
  * Return true, if the entry has a slot value which
  * the software considers as invalid.
@@ -216,6 +218,9 @@ int __hash_page_4K(unsigned long ea, unsigned long access, unsigned long vsid,
 	new_pte |= pte_set_hidx(ptep, rpte, subpg_index, slot, PTRS_PER_PTE);
 	new_pte |= H_PAGE_HASHPTE;
 
+	if (stress_hpt())
+		hpt_do_stress(ea, hpte_group);
+
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
 	return 0;
 }
@@ -327,7 +332,12 @@ int __hash_page_64K(unsigned long ea, unsigned long access,
 
 		new_pte = (new_pte & ~_PAGE_HPTEFLAGS) | H_PAGE_HASHPTE;
 		new_pte |= pte_set_hidx(ptep, rpte, 0, slot, PTRS_PER_PTE);
+
+		if (stress_hpt())
+			hpt_do_stress(ea, hpte_group);
 	}
+
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
+
 	return 0;
 }
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index df008edf7be0..8440e524e57b 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -471,7 +471,7 @@ int htab_remove_mapping(unsigned long vstart, unsigned long vend,
 	return ret;
 }
 
-static bool disable_1tb_segments = false;
+static bool disable_1tb_segments __ro_after_init;
 
 static int __init parse_disable_1tb_segments(char *p)
 {
@@ -480,6 +480,40 @@ static int __init parse_disable_1tb_segments(char *p)
 }
 early_param("disable_1tb_segments", parse_disable_1tb_segments);
 
+bool stress_hpt_enabled __initdata;
+
+static int __init parse_stress_hpt(char *p)
+{
+	stress_hpt_enabled = true;
+	return 0;
+}
+early_param("stress_hpt", parse_stress_hpt);
+
+__ro_after_init DEFINE_STATIC_KEY_FALSE(stress_hpt_key);
+
+/*
+ * per-CPU array allocated if we enable stress_hpt.
+ */
+#define STRESS_MAX_GROUPS 16
+struct stress_hpt_struct {
+	unsigned long last_group[STRESS_MAX_GROUPS];
+};
+
+static inline int stress_nr_groups(void)
+{
+	/*
+	 * LPAR H_REMOVE flushes TLB, so need some number > 1 of entries
+	 * to allow practical forward progress. Bare metal returns 1, which
+	 * seems to help uncover more bugs.
+	 */
+	if (firmware_has_feature(FW_FEATURE_LPAR))
+		return STRESS_MAX_GROUPS;
+	else
+		return 1;
+}
+
+static struct stress_hpt_struct *stress_hpt_struct;
+
 static int __init htab_dt_scan_seg_sizes(unsigned long node,
 					 const char *uname, int depth,
 					 void *data)
@@ -976,6 +1010,23 @@ static void __init hash_init_partition_table(phys_addr_t hash_table,
 	pr_info("Partition table %p\n", partition_tb);
 }
 
+void hpt_clear_stress(void);
+static struct timer_list stress_hpt_timer;
+void stress_hpt_timer_fn(struct timer_list *timer)
+{
+	int next_cpu;
+
+	hpt_clear_stress();
+	if (!firmware_has_feature(FW_FEATURE_LPAR))
+		tlbiel_all();
+
+	next_cpu = cpumask_next(raw_smp_processor_id(), cpu_online_mask);
+	if (next_cpu >= nr_cpu_ids)
+		next_cpu = cpumask_first(cpu_online_mask);
+	stress_hpt_timer.expires = jiffies + msecs_to_jiffies(10);
+	add_timer_on(&stress_hpt_timer, next_cpu);
+}
+
 static void __init htab_initialize(void)
 {
 	unsigned long table;
@@ -994,6 +1045,19 @@ static void __init htab_initialize(void)
 
 	if (stress_slb_enabled)
 		static_branch_enable(&stress_slb_key);
+	if (stress_hpt_enabled) {
+		unsigned long tmp;
+		static_branch_enable(&stress_hpt_key);
+		tmp = memblock_phys_alloc_range(sizeof(struct stress_hpt_struct) * NR_CPUS,
+						  0,
+						  0, MEMBLOCK_ALLOC_ANYWHERE);
+		memset((void *)tmp, 0xff, sizeof(struct stress_hpt_struct) * NR_CPUS);
+		stress_hpt_struct = __va(tmp);
+
+	        timer_setup(&stress_hpt_timer, stress_hpt_timer_fn, 0);
+		stress_hpt_timer.expires = jiffies + msecs_to_jiffies(10);
+		add_timer(&stress_hpt_timer);
+	}
 
 	/*
 	 * Calculate the required size of the htab.  We want the number of
@@ -1980,6 +2044,69 @@ long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
 	return slot;
 }
 
+void hpt_clear_stress(void)
+{
+	int cpu = raw_smp_processor_id();
+	int g;
+
+	for (g = 0; g < stress_nr_groups(); g++) {
+		unsigned long last_group;
+		last_group = stress_hpt_struct[cpu].last_group[g];
+
+		if (last_group != -1UL) {
+			int i;
+			for (i = 0; i < HPTES_PER_GROUP; i++) {
+				if (mmu_hash_ops.hpte_remove(last_group) == -1)
+					break;
+			}
+			stress_hpt_struct[cpu].last_group[g] = -1;
+		}
+	}
+}
+
+void hpt_do_stress(unsigned long ea, unsigned long hpte_group)
+{
+	unsigned long last_group;
+	int cpu = raw_smp_processor_id();
+
+	last_group = stress_hpt_struct[cpu].last_group[stress_nr_groups()-1];
+	if (hpte_group == last_group)
+		return;
+
+	if (last_group != -1UL) {
+		int i;
+		/*
+		 * Concurrent CPUs might be inserting into this group, so
+		 * give up after a number of iterations, to prevent a live
+		 * lock.
+		 */
+		for (i = 0; i < HPTES_PER_GROUP; i++) {
+			if (mmu_hash_ops.hpte_remove(last_group) == -1)
+				break;
+		}
+		stress_hpt_struct[cpu].last_group[stress_nr_groups() - 1] = -1;
+	}
+
+	if (ea >= PAGE_OFFSET) {
+		/*
+		 * We would really like to prefetch to get the TLB loaded, then
+		 * remove the PTE before returning from fault interrupt, to
+		 * increase the hash fault rate.
+		 *
+		 * Unfortunately QEMU TCG does not model the TLB in a way that
+		 * makes this possible, and systemsim (mambo) emulator does not
+		 * bring in TLBs with prefetches (although loads/stores do
+		 * work for non-CI PTEs).
+		 *
+		 * So remember this PTE and clear it on the next hash fault.
+		 */
+		memmove(&stress_hpt_struct[cpu].last_group[1],
+			&stress_hpt_struct[cpu].last_group[0],
+			(stress_nr_groups() - 1) * sizeof(unsigned long));
+		stress_hpt_struct[cpu].last_group[0] = hpte_group;
+	}
+}
+
 #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 static DEFINE_SPINLOCK(linear_map_hash_lock);
 
diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
index 5045048ce244..a57a25f06a21 100644
--- a/arch/powerpc/mm/book3s64/internal.h
+++ b/arch/powerpc/mm/book3s64/internal.h
@@ -13,6 +13,17 @@ static inline bool stress_slb(void)
 	return static_branch_unlikely(&stress_slb_key);
 }
 
+extern bool stress_hpt_enabled;
+
+DECLARE_STATIC_KEY_FALSE(stress_hpt_key);
+
+static inline bool stress_hpt(void)
+{
+	return static_branch_unlikely(&stress_hpt_key);
+}
+
+void hpt_do_stress(unsigned long ea, unsigned long hpte_group);
+
 void slb_setup_new_exec(void);
 
 void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush);
-- 
2.37.2

