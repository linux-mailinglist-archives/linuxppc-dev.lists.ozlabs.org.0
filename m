Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E521C3548
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 11:10:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FxsQ1jXkzDqdW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 19:10:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Nyw6GhHW; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FxnY6NbXzDqWK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 19:07:13 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id r14so5241337pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Zuqrh/i/Jo72l8qVLh1x2F/7+P6XOOf0CDNKU/ZebU=;
 b=Nyw6GhHWhe3qiDDgJEqqbNKdTQDCPZl5EXQhZcLaZpSSxaZeM/hHJBJ7xqm0DDFUZB
 VRCoke712MD/sm5XlqDyjkhs5b5n+ZpJGLtGV+swyhfoR5d5veoYftLePFgHq7M8ys42
 vsphECU5UX3FaM7lWA3UFJwA1FwcuOFEgqN8x81WSv2FeA8JS+DzbY7Kqg0hGJ83oL8g
 GWKbCEDVat8LBaeXAFNq2YvUZHQdCiHzQBXTGTyNYWcyt6pdHJVbz9s7s+sriIHVPZIF
 Axqtni0C39k+WrOvB5oW8F6+M+8ka8lr90v40kR4tof3xD84mzner3Hmr5EDkruOA6dH
 P2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Zuqrh/i/Jo72l8qVLh1x2F/7+P6XOOf0CDNKU/ZebU=;
 b=kZ8FoFuB1eLqn54Zo7zmv9Io9zAinLALh2t5v5JjxhwDi+T3zB1xyYAt2EHKRJsi75
 G9f0O365xwBB3iQRoe7GtqVLvdfKDWHZfJl09iwaBG+RpvgX2/FL1LOGwah2qg5/oTzi
 HnrzzEaYn0OkxYTQyNDLeF99A3hw1I0c8i+AIz0BcEu0nK+phnMvDhSY6SN9Tz4OHuQt
 oD1dZIOiur9GyNJcoSY4UpofLnQE8RjqE9CsNZf2g4jdBZHCAtNe7e5mvxMPZOQT44FQ
 RN9sHNMKfN6hO1TGFQNh/co4Ohg4aILtzkvuiZ1oQh/aWXjNTy+UUevH9J8dKyAwbrrb
 JCEA==
X-Gm-Message-State: AGi0PuazppUTrTZY0gVB5O38PHgNY6UK01qisQJ7pf+penMt75n+e/Th
 6hS5XfdVyRSh1xLUM6xXvEQDTWB+
X-Google-Smtp-Source: APiQypI1aDRj5Dk0ejBOivt1HevHja7Nbis0r1nGO0OwYCRMtOP/Sxk/PGw+ZliD3qbCX5YB5on+9Q==
X-Received: by 2002:a63:3d43:: with SMTP id k64mr15559787pga.150.1588583230469; 
 Mon, 04 May 2020 02:07:10 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-199-65.tpgi.com.au.
 [193.116.199.65])
 by smtp.gmail.com with ESMTPSA id w11sm6285915pjy.11.2020.05.04.02.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 02:07:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/64s/hash: add torture_hpt kernel boot option
 to increase hash faults
Date: Mon,  4 May 2020 19:06:58 +1000
Message-Id: <20200504090658.44996-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200504090658.44996-1-npiggin@gmail.com>
References: <20200504090658.44996-1-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This option increases the number of hash misses by limiting the number of
kernel HPT entries, by accessing the address immediately after installing
the PTE, then removing it again (except in the case of CI entries that
must not be accessed, these are removed on the next hash fault).

This helps stress test difficult to hit paths in the kernel.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v2:
- Add a bit more to the changelog.
- Add some kuap stuff for when Aneesh's kaup for hash patches are
  merged.

 .../admin-guide/kernel-parameters.txt         |  9 +++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h | 10 +++
 arch/powerpc/mm/book3s64/hash_4k.c            |  3 +
 arch/powerpc/mm/book3s64/hash_64k.c           |  8 ++
 arch/powerpc/mm/book3s64/hash_utils.c         | 76 ++++++++++++++++++-
 5 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5a34b7dd9ebe..1ec6a32a717a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -876,6 +876,15 @@
 			them frequently to increase the rate of SLB faults
 			on kernel addresses.
 
+	torture_hpt	[PPC]
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
 
diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 758de1e0f676..539e3d91eac4 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -324,6 +324,16 @@ static inline bool torture_slb(void)
 	return static_branch_unlikely(&torture_slb_key);
 }
 
+extern bool torture_hpt_enabled;
+DECLARE_STATIC_KEY_FALSE(torture_hpt_key);
+static inline bool torture_hpt(void)
+{
+	return static_branch_unlikely(&torture_hpt_key);
+}
+
+void hpt_do_torture(unsigned long ea, unsigned long access,
+		    unsigned long rflags, unsigned long hpte_group);
+
 /*
  * This computes the AVPN and B fields of the first dword of a HPTE,
  * for use when we want to match an existing PTE.  The bottom 7 bits
diff --git a/arch/powerpc/mm/book3s64/hash_4k.c b/arch/powerpc/mm/book3s64/hash_4k.c
index 22e787123cdf..54e4ff8c558d 100644
--- a/arch/powerpc/mm/book3s64/hash_4k.c
+++ b/arch/powerpc/mm/book3s64/hash_4k.c
@@ -118,6 +118,9 @@ int __hash_page_4K(unsigned long ea, unsigned long access, unsigned long vsid,
 		}
 		new_pte = (new_pte & ~_PAGE_HPTEFLAGS) | H_PAGE_HASHPTE;
 		new_pte |= pte_set_hidx(ptep, rpte, 0, slot, PTRS_PER_PTE);
+
+		if (torture_hpt())
+			hpt_do_torture(ea, access, rflags, hpte_group);
 	}
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
 	return 0;
diff --git a/arch/powerpc/mm/book3s64/hash_64k.c b/arch/powerpc/mm/book3s64/hash_64k.c
index 7084ce2951e6..19ea0fc145a9 100644
--- a/arch/powerpc/mm/book3s64/hash_64k.c
+++ b/arch/powerpc/mm/book3s64/hash_64k.c
@@ -216,6 +216,9 @@ int __hash_page_4K(unsigned long ea, unsigned long access, unsigned long vsid,
 	new_pte |= pte_set_hidx(ptep, rpte, subpg_index, slot, PTRS_PER_PTE);
 	new_pte |= H_PAGE_HASHPTE;
 
+	if (torture_hpt())
+		hpt_do_torture(ea, access, rflags, hpte_group);
+
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
 	return 0;
 }
@@ -327,7 +330,12 @@ int __hash_page_64K(unsigned long ea, unsigned long access,
 
 		new_pte = (new_pte & ~_PAGE_HPTEFLAGS) | H_PAGE_HASHPTE;
 		new_pte |= pte_set_hidx(ptep, rpte, 0, slot, PTRS_PER_PTE);
+
+		if (torture_hpt())
+			hpt_do_torture(ea, access, rflags, hpte_group);
 	}
+
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
+
 	return 0;
 }
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 9c487b5782ef..845da1e8ca4f 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -353,8 +353,12 @@ int htab_remove_mapping(unsigned long vstart, unsigned long vend,
 	return ret;
 }
 
-static bool disable_1tb_segments = false;
+static bool disable_1tb_segments __read_mostly = false;
 bool torture_slb_enabled __read_mostly = false;
+bool torture_hpt_enabled __read_mostly = false;
+
+/* per-CPU array allocated if we enable torture_hpt. */
+static unsigned long *torture_hpt_last_group;
 
 static int __init parse_disable_1tb_segments(char *p)
 {
@@ -370,6 +374,13 @@ static int __init parse_torture_slb(char *p)
 }
 early_param("torture_slb", parse_torture_slb);
 
+static int __init parse_torture_hpt(char *p)
+{
+	torture_hpt_enabled = true;
+	return 0;
+}
+early_param("torture_hpt", parse_torture_hpt);
+
 static int __init htab_dt_scan_seg_sizes(unsigned long node,
 					 const char *uname, int depth,
 					 void *data)
@@ -863,6 +874,7 @@ static void __init hash_init_partition_table(phys_addr_t hash_table,
 }
 
 DEFINE_STATIC_KEY_FALSE(torture_slb_key);
+DEFINE_STATIC_KEY_FALSE(torture_hpt_key);
 
 static void __init htab_initialize(void)
 {
@@ -882,6 +894,15 @@ static void __init htab_initialize(void)
 
 	if (torture_slb_enabled)
 		static_branch_enable(&torture_slb_key);
+	if (torture_hpt_enabled) {
+		unsigned long tmp;
+		static_branch_enable(&torture_hpt_key);
+		tmp = memblock_phys_alloc_range(sizeof(unsigned long) * NR_CPUS,
+						  0,
+						  0, MEMBLOCK_ALLOC_ANYWHERE);
+		memset((void *)tmp, 0xff, sizeof(unsigned long) * NR_CPUS);
+		torture_hpt_last_group = __va(tmp);
+	}
 
 	/*
 	 * Calculate the required size of the htab.  We want the number of
@@ -1901,6 +1922,59 @@ long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
 	return slot;
 }
 
+void hpt_do_torture(unsigned long ea, unsigned long access,
+		    unsigned long rflags, unsigned long hpte_group)
+{
+	unsigned long last_group;
+	int cpu = raw_smp_processor_id();
+
+	last_group = torture_hpt_last_group[cpu];
+	if (last_group != -1UL) {
+		while (mmu_hash_ops.hpte_remove(last_group) != -1)
+			;
+		torture_hpt_last_group[cpu] = -1UL;
+	}
+
+#define QEMU_WORKAROUND	0
+
+	if (ea >= PAGE_OFFSET) {
+		if (!QEMU_WORKAROUND && (access & (_PAGE_READ|_PAGE_WRITE)) &&
+		    !(rflags & (HPTE_R_I|HPTE_R_G))) {
+			/* prefetch / prefetchw does not seem to set up a TLB
+			 * entry with the powerpc systemsim (mambo) emulator,
+			 * though it works with real hardware. An alternative
+			 * approach that would work more reliably on quirky
+			 * emulators like QEMU may be to remember the last
+			 * insertion and remove that, rather than removing the
+			 * current insertion. Then no prefetch is required.
+			 */
+			if ((access & _PAGE_WRITE) && (access & _PAGE_READ)) {
+				void __user *mem = (void *)(ea & ~0x3);
+
+				allow_read_write_user(mem, mem, sizeof(atomic_t));
+				atomic_add(0, (atomic_t *)mem);
+				prevent_read_write_user(mem, mem, sizeof(atomic_t));
+
+			} else if (access & _PAGE_READ) {
+				void __user *mem = (void *)ea;
+
+				allow_read_from_user(mem, 1);
+				(void)*(volatile char *)mem;
+				prevent_read_from_user(mem, 1);
+			}
+
+			mb();
+
+			while (mmu_hash_ops.hpte_remove(hpte_group) != -1)
+				;
+		} else {
+			/* Can't prefetch cache-inhibited so clear next time. */
+			torture_hpt_last_group[cpu] = hpte_group;
+		}
+	}
+}
+
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 {
-- 
2.23.0

