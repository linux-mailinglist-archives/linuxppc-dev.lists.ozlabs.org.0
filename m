Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F881C2ABA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 10:26:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FJwW6C9QzDqsC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 18:26:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Kd2x8Kv1; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FJrw50TfzDqmf
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 May 2020 18:22:53 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id mq3so2315274pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 May 2020 01:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jxw/HZLBfYYY4hOdYVmvfP+Si7N10L1HrDwJQlAOgGU=;
 b=Kd2x8Kv16zhRFk3gw4HmqMsv8kIlcGDxoG5mZ7+HzBD1Sx+5wHSF6G/QY8lDL66nMm
 bi82kdRhetuh+vyoPWp4mwmC4VE+xu7ugzwd9Rw1Rz1XW6ESK5VfbWNy5iSabgoO3ECR
 cmW5xE4TAxObYyK++laWaLreLAn6LpyVdRj4tCEo+P1+yEdQWlRnM5OuKfIE2q3xYABZ
 SPttFHf9tTDGLmS8rIgfweyNyqkprU3uNIkeNHCmmyEvFItI2WBjD1XDuDqVTFCK7sYY
 BTgOuqUQfAVUvPxJcFnhxe64LsDXzCIhBlcvxw/VUg18cHLJ8eHr3phAo7Bxg6V7Bdcs
 KeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jxw/HZLBfYYY4hOdYVmvfP+Si7N10L1HrDwJQlAOgGU=;
 b=s5AhMXVjLRm3rt4uwwc2RomfRdxufXZfxVJo4L/ASC3qHBnHv8bKqibV/e4PGlGBN0
 ak06g67sUZ//ZHf4KE4/NucUWxKIL+gL3rEntF5oFeMjlABF4w65aPK9v36vhpV1iqMH
 Z2nmhXXY7/ELPuMKAjSa7nnSfaT1f1gQs+a9zu0l2VVJXSC5m5cHj1vTLVBfrjUKqvk5
 jB6f8QpSUvLnyJfBlBYxfa+rlQUvo7jufOMIxm2C3F89Xr3N0AOGMuGKVMOVBrRwdqyK
 9F9l8OqS+uJ2UUV8/2duh9M3hGeXUc1jXw/q7tpEPMLHBCZcant3lz/RzD1IdFg0oT10
 z0eQ==
X-Gm-Message-State: AGi0PuY4IgG8XRVuLlMRJGXT0BL798135cNFWCCJ+VwAiGrgBW1s71rO
 OIUHHjFMLMK2A9K8ZdeXK0Ygs6Fi
X-Google-Smtp-Source: APiQypLUMmwLgVa+dLJtQvZPb+eQpt3Wz20OQnXhGX+EI5dhE3WtCfZETep6qd+Z/PIa44axgIe1hg==
X-Received: by 2002:a17:90a:fe9:: with SMTP id
 96mr10489362pjz.13.1588494171300; 
 Sun, 03 May 2020 01:22:51 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id v94sm3876816pjb.39.2020.05.03.01.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 May 2020 01:22:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s/hash: add torture_hpt kernel boot option to
 increase hash faults
Date: Sun,  3 May 2020 18:22:36 +1000
Message-Id: <20200503082236.17991-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200503082236.17991-1-npiggin@gmail.com>
References: <20200503082236.17991-1-npiggin@gmail.com>
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
kernel HPT entries. This helps stress test difficult to hit paths in the
kernel.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  9 +++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h | 10 +++
 arch/powerpc/mm/book3s64/hash_4k.c            |  3 +
 arch/powerpc/mm/book3s64/hash_64k.c           |  8 +++
 arch/powerpc/mm/book3s64/hash_utils.c         | 66 ++++++++++++++++++-
 5 files changed, 95 insertions(+), 1 deletion(-)

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
index 9c487b5782ef..e9bdf825f897 100644
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
@@ -1901,6 +1922,49 @@ long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
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
+			if ((access & _PAGE_WRITE) && (access & _PAGE_READ))
+				atomic_add(0, (atomic_t *)(ea & ~0x3));
+			else if (access & _PAGE_READ)
+				*(volatile char *)ea;
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

