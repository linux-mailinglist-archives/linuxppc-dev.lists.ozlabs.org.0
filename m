Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6DC1CDDDB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 16:55:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LPB45tFgzDqND
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 00:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LLZs38fdzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 22:58:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mJq7SoMI; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49LLZp1lywz9sSF; Mon, 11 May 2020 22:58:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49LLZn6PBQz9sSJ; Mon, 11 May 2020 22:58:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589201889;
 bh=onKL8cALefiBCt15XItLRFYEMdvcd94jsfG2LAn9pRI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mJq7SoMIIaxYG65xHB2ek7JtA7ad1tjcuFNpFKm06ok24AChEDctbBp9XsE/oAq3v
 CcZSC049DSzAASE3Jb+fPx/UAKsk0irGe443peDozIWJ10eQzz7MkkY2beSSnWgxqh
 ckop31KlpBv7N8JteyrX0jHwMV0FUYnVe/prpsFYlMjmfl23EBBm5o0JXA8kSooMXV
 JemMgAd8mr9kd0Evg06PgDSFBLXkkchxeYYaWTDGwSQ/ef0oCgM32WQ+m5yO0ZNrEZ
 /t5XgOrj30PozBJUssAD0dssJn4/s2kyySJl/H1wX+skJJaY+V3llBajVE7OVEAPsA
 SEEsPIFFXXicQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v4 2/2] powerpc/64s/hash: Add stress_hpt kernel boot option to
 increase hash faults
Date: Mon, 11 May 2020 22:58:25 +1000
Message-Id: <20200511125825.3081305-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200511125825.3081305-1-mpe@ellerman.id.au>
References: <20200511125825.3081305-1-mpe@ellerman.id.au>
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

This option increases the number of hash misses by limiting the number
of kernel HPT entries, by accessing the address immediately after
installing the PTE, then removing it again (except in the case of CI
entries that must not be accessed, these are removed on the next hash
fault).

This helps stress test difficult to hit paths in the kernel.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[mpe: Relocate the code into arch/powerpc/mm, s/torture/stress/]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../admin-guide/kernel-parameters.txt         |  9 ++++
 arch/powerpc/mm/book3s64/hash_4k.c            |  6 +++
 arch/powerpc/mm/book3s64/hash_64k.c           | 11 ++++
 arch/powerpc/mm/book3s64/hash_utils.c         | 54 +++++++++++++++++++
 arch/powerpc/mm/book3s64/internal.h           | 10 ++++
 5 files changed, 90 insertions(+)

v4: mpe: Relocate the code into arch/powerpc/mm, s/torture/stress/

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 26ef1d74e642..c446a176f9c5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -876,6 +876,15 @@
 			them frequently to increase the rate of SLB faults
 			on kernel addresses.
 
+	stress_hpt	[PPC]
+			Limits the number of kernel HPT entries in the hash
+			page table to increase the rate of hash page table
+			faults on kernel addresses.
+
+			This may hang when run on processors / emulators which
+			do not have a TLB, or flush it more often than
+			required, QEMU seems to have problems.
+
 	disable=	[IPV6]
 			See Documentation/networking/ipv6.txt.
 
diff --git a/arch/powerpc/mm/book3s64/hash_4k.c b/arch/powerpc/mm/book3s64/hash_4k.c
index 22e787123cdf..ff65b3028745 100644
--- a/arch/powerpc/mm/book3s64/hash_4k.c
+++ b/arch/powerpc/mm/book3s64/hash_4k.c
@@ -16,6 +16,9 @@
 #include <asm/machdep.h>
 #include <asm/mmu.h>
 
+#include "internal.h"
+
+
 int __hash_page_4K(unsigned long ea, unsigned long access, unsigned long vsid,
 		   pte_t *ptep, unsigned long trap, unsigned long flags,
 		   int ssize, int subpg_prot)
@@ -118,6 +121,9 @@ int __hash_page_4K(unsigned long ea, unsigned long access, unsigned long vsid,
 		}
 		new_pte = (new_pte & ~_PAGE_HPTEFLAGS) | H_PAGE_HASHPTE;
 		new_pte |= pte_set_hidx(ptep, rpte, 0, slot, PTRS_PER_PTE);
+
+		if (stress_hpt())
+			hpt_do_stress(ea, access, rflags, hpte_group);
 	}
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
 	return 0;
diff --git a/arch/powerpc/mm/book3s64/hash_64k.c b/arch/powerpc/mm/book3s64/hash_64k.c
index 7084ce2951e6..11d21ec4e14d 100644
--- a/arch/powerpc/mm/book3s64/hash_64k.c
+++ b/arch/powerpc/mm/book3s64/hash_64k.c
@@ -16,6 +16,9 @@
 #include <asm/machdep.h>
 #include <asm/mmu.h>
 
+#include "internal.h"
+
+
 /*
  * Return true, if the entry has a slot value which
  * the software considers as invalid.
@@ -216,6 +219,9 @@ int __hash_page_4K(unsigned long ea, unsigned long access, unsigned long vsid,
 	new_pte |= pte_set_hidx(ptep, rpte, subpg_index, slot, PTRS_PER_PTE);
 	new_pte |= H_PAGE_HASHPTE;
 
+	if (stress_hpt())
+		hpt_do_stress(ea, access, rflags, hpte_group);
+
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
 	return 0;
 }
@@ -327,7 +333,12 @@ int __hash_page_64K(unsigned long ea, unsigned long access,
 
 		new_pte = (new_pte & ~_PAGE_HPTEFLAGS) | H_PAGE_HASHPTE;
 		new_pte |= pte_set_hidx(ptep, rpte, 0, slot, PTRS_PER_PTE);
+
+		if (stress_hpt())
+			hpt_do_stress(ea, access, rflags, hpte_group);
 	}
+
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
+
 	return 0;
 }
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 622c6e8e9fa6..f048d23338de 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -857,6 +857,20 @@ static void __init hash_init_partition_table(phys_addr_t hash_table,
 	pr_info("Partition table %p\n", partition_tb);
 }
 
+__ro_after_init DEFINE_STATIC_KEY_FALSE(stress_hpt_key);
+
+static bool stress_hpt_enabled __initdata;
+
+/* per-CPU array allocated if we enable stress_hpt. */
+static unsigned long *stress_hpt_last_group __ro_after_init;
+
+static int __init parse_stress_hpt(char *p)
+{
+	stress_hpt_enabled = true;
+	return 0;
+}
+early_param("stress_hpt", parse_stress_hpt);
+
 static void __init htab_initialize(void)
 {
 	unsigned long table;
@@ -876,6 +890,15 @@ static void __init htab_initialize(void)
 	if (stress_slb_enabled)
 		static_branch_enable(&stress_slb_key);
 
+	if (stress_hpt_enabled) {
+		unsigned long *tmp;
+		static_branch_enable(&stress_hpt_key);
+		tmp = memblock_alloc(sizeof(unsigned long) * NR_CPUS,
+				     sizeof(unsigned long));
+		memset(tmp, 0xff, sizeof(unsigned long) * NR_CPUS);
+		stress_hpt_last_group = tmp;
+	}
+
 	/*
 	 * Calculate the required size of the htab.  We want the number of
 	 * PTEGs to equal one half the number of real pages.
@@ -1860,6 +1883,37 @@ long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
 	return slot;
 }
 
+void hpt_do_stress(unsigned long ea, unsigned long access,
+		   unsigned long rflags, unsigned long hpte_group)
+{
+	unsigned long last_group;
+	int cpu = raw_smp_processor_id();
+
+	last_group = stress_hpt_last_group[cpu];
+	if (last_group != -1UL) {
+		while (mmu_hash_ops.hpte_remove(last_group) != -1)
+			;
+		stress_hpt_last_group[cpu] = -1UL;
+	}
+
+	if (ea >= PAGE_OFFSET) {
+		/*
+		 * We would really like to prefetch here to get the TLB loaded,
+		 * then remove the PTE before returning to userspace, to
+		 * increase the hash fault rate.
+		 *
+		 * Unfortunately QEMU TCG does not model the TLB in a way that
+		 * makes this possible, and systemsim (mambo) emulator does not
+		 * bring in TLBs with prefetches (although loads/stores do
+		 * work for non-CI PTEs).
+		 *
+		 * So remember this PTE and clear it on the next hash fault.
+		 */
+		stress_hpt_last_group[cpu] = hpte_group;
+	}
+}
+
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 {
diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
index 7eda0d30d765..de824375b555 100644
--- a/arch/powerpc/mm/book3s64/internal.h
+++ b/arch/powerpc/mm/book3s64/internal.h
@@ -13,4 +13,14 @@ static inline bool stress_slb(void)
 	return static_branch_unlikely(&stress_slb_key);
 }
 
+DECLARE_STATIC_KEY_FALSE(stress_hpt_key);
+
+static inline bool stress_hpt(void)
+{
+	return static_branch_unlikely(&stress_hpt_key);
+}
+
+void hpt_do_stress(unsigned long ea, unsigned long access,
+		   unsigned long rflags, unsigned long hpte_group);
+
 #endif /* ARCH_POWERPC_MM_BOOK3S64_INTERNAL_H */
-- 
2.25.1

