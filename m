Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDB51CD4D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 11:24:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LFr83s8dzDqV1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 19:24:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SCag5JLZ; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LFm83dZkzDqBN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 19:20:56 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y25so4486682pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 02:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0O6nS79ZetXte6dmpLWMv73YjxgnMINHb7mhuGJRYNc=;
 b=SCag5JLZAIBwEaigqUlALzeEuCjCe50aDu2K1SqGEnNWSH5QvBr7iiqTfpkLZy0t91
 GkHb2hwYrKZ2C1L2ubPz+7CFRFSNSa47yPuKCO5GotNeW5zSYckmp4lEal165uykhsKK
 fjr0r9OygOSmsoqcn1GIkQIQWPtGRoen4bhlxfeZxxPddiNHtCIwyl8atAIvz32h/yGg
 jflIjAOYRnJ9GOKlYUta5uaJbggwqfXozlVu80nXCDgqAjre2Snm+t5cvJWOgHtoSvK+
 nBKZcW0WbmddAxQWnF7Iuh14WP+7sbvRCXBrdF9vOXYXwhWM/UHHr7DQ9KFCmJCQQ+eH
 6rfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0O6nS79ZetXte6dmpLWMv73YjxgnMINHb7mhuGJRYNc=;
 b=s03azR8HifiEc0cejeFOVZIKWeWUra8HTvdQHfNrUCTvrg3L+zqW6Yisre+SYf96gU
 on9vwz0QRWHZYuZmYPqBNHWStG1VOTqgvzXn3ILSbHIfijcCowQMEJxVsFg/XI1p3kpu
 jAvmz71hPraEcSVWoKqmojd0NswEraKQDCFxKTq9L7KPlwZ0sWg2S083NRAnmpm9sGTh
 3eikTTSfNn/LRdtX2yHHbh5YcMiKvuqUuD4y4fDuR6qW6RU/j7ltFIIsqJYCmqEQkB2/
 SbhWgqt6o/0JDrK31ac34jq5ij9T+MBsOeVxfx6eiImjzO+/VOq1xJU/vn/q8qFYpNFM
 GnaQ==
X-Gm-Message-State: AGi0Puav/1cIiUyjN1L+pcT1/57t2etluN/GGgjAEmDxyoqkJaqx8tra
 aHGHjEkgzC/6O0JOdEWAmDezgABz
X-Google-Smtp-Source: APiQypJvq9NUY7g0F8Xf710fDnw0NJbGH1Euia1BI6/SqyYLxjSObG3r47AG+K82iVmbqH9Zj+h2RQ==
X-Received: by 2002:a63:575f:: with SMTP id h31mr12328354pgm.200.1589188853372; 
 Mon, 11 May 2020 02:20:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id p66sm8497541pfb.65.2020.05.11.02.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:20:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/2] powerpc/64s/hash: add torture_hpt kernel boot option
 to increase hash faults
Date: Mon, 11 May 2020 19:20:40 +1000
Message-Id: <20200511092040.1339667-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200511092040.1339667-1-npiggin@gmail.com>
References: <20200511092040.1339667-1-npiggin@gmail.com>
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

This option increases the number of hash misses by limiting the number of
kernel HPT entries, by accessing the address immediately after installing
the PTE, then removing it again (except in the case of CI entries that
must not be accessed, these are removed on the next hash fault).

This helps stress test difficult to hit paths in the kernel.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v3:
- Remove the dead code that didn't work on QEMU, and comment it instead.

 .../admin-guide/kernel-parameters.txt         |  9 ++++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h | 11 ++++
 arch/powerpc/mm/book3s64/hash_4k.c            |  3 ++
 arch/powerpc/mm/book3s64/hash_64k.c           |  8 +++
 arch/powerpc/mm/book3s64/hash_utils.c         | 54 ++++++++++++++++++-
 5 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8dd4260746dc..f51ed836954f 100644
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
index 758de1e0f676..3d50ab629bde 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -8,6 +8,7 @@
  *   PPC64 rework.
  */
 
+#include <linux/jump_label.h>
 #include <asm/page.h>
 #include <asm/bug.h>
 #include <asm/asm-const.h>
@@ -324,6 +325,16 @@ static inline bool torture_slb(void)
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
index 9c487b5782ef..ffe364269b8a 100644
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
@@ -1901,6 +1922,37 @@ long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
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
+		torture_hpt_last_group[cpu] = hpte_group;
+	}
+}
+
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 {
-- 
2.23.0

