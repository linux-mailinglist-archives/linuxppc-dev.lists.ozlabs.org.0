Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A4F33869E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 08:33:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxcxV08Ntz3dYD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 18:33:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iT8PQhvR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iT8PQhvR; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxcvj4lWwz3ckh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 18:32:01 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id a14so3832269qvj.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 23:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZEtUz4cca1c3Fl5qiQDKoYLrz6ESJJtyWLesvPnKSDE=;
 b=iT8PQhvRWLgLdesAqQvoHlBII0zpfG7wK5D8JyGWBsR97w6xqBm/UAzMn5xG1iMjI/
 5Vu4/MYUXNSWwAkdMg/Q/z7QQab5OA9O9muH+h0chtyy50D7of89f6HQWIw8gWuRDeT6
 QTn4AAmHC4QRptq0vBm3Bu75CKASbkVd2AOq/Of0r9pSh1K8B2Gldie69c7Ytg3ZY7Ga
 xeAbWwdv5fomFwldof6Wkkws9QFF55xIc3kRAZtuImbRSY926SqbCQUm5joE4sAO4M6G
 6HIBiYDMToAf8cfn1bd+frD5JPPlGz53RMlS1wz6izNkergvG0xOtdCckZYMOyQvXlRY
 wJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZEtUz4cca1c3Fl5qiQDKoYLrz6ESJJtyWLesvPnKSDE=;
 b=PLEhz7xcH6mahVadQ7E1avByZLDc2AxSrdKiA1SPGwgcrU32sCmhhijMHb39mpIHaM
 1e4KFBRPk5L7ZvHdqc3mtpETvXt+iS4wgPxXZs/g0XfZRCXm1PyA88KMQK8ls2vPxXm1
 6LJbKRt/s1RrUKvIMmqLS27a/vVByGgVIc7e6YfrjMPCE2eTzdo9bravX8p3JNmGeqR1
 weu+Jh8MMRO3s+s9woY/a5qbZyjDP3N2B8QE6kzd1g6YJTlRKF+DFgmcKm/3XKVofihX
 TvXIK61AZAhdePjdABl8cVinkF77zmpAg8ps00xVsQyf2Oy+1eC12SFhEkc3t7rJ8iMm
 3gQA==
X-Gm-Message-State: AOAM533Gd2/gmQVWxNMhT2ux5s9A3hPIGOVThO7wdSf9uMZlrY88WTn9
 3mYeGFOoHo+dZELvbdwQTsk=
X-Google-Smtp-Source: ABdhPJwOJIMYFb2EtlgeCslrjHbdt3ioBTdrKL23cPfV68Ct+F6Lsz0Fql+YfcBk8Z7oPBByHoO9aQ==
X-Received: by 2002:a0c:9cc2:: with SMTP id j2mr7724455qvf.2.1615534318818;
 Thu, 11 Mar 2021 23:31:58 -0800 (PST)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 (177-131-89-8.dynamic.desktop.com.br. [177.131.89.8])
 by smtp.gmail.com with ESMTPSA id t6sm3434026qti.2.2021.03.11.23.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 23:31:58 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leonardo Bras <leobras.c@gmail.com>, Sandipan Das <sandipan@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, Mike Rapoport <rppt@kernel.org>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 Scott Cheloha <cheloha@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 3/3] powerpc/mm/hash: Avoid multiple HPT resize-downs on
 memory hotunplug
Date: Fri, 12 Mar 2021 04:29:41 -0300
Message-Id: <20210312072940.598696-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312072940.598696-1-leobras.c@gmail.com>
References: <20210312072940.598696-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During memory hotunplug, after each LMB is removed, the HPT may be
resized-down if it would map a max of 4 times the current amount of memory.
(2 shifts, due to introduced histeresis)

It usually is not an issue, but it can take a lot of time if HPT
resizing-down fails. This happens  because resize-down failures
usually repeat at each LMB removal, until there are no more bolted entries
conflict, which can take a while to happen.

This can be solved by doing a single HPT resize at the end of memory
hotunplug, after all requested entries are removed.

To make this happen, it's necessary to temporarily disable all HPT
resize-downs before hotunplug, re-enable them after hotunplug ends,
and then resize-down HPT to the current memory size.

As an example, hotunplugging 256GB from a 385GB guest took 621s without
this patch, and 100s after applied.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/hash.h     |  2 ++
 arch/powerpc/include/asm/sparsemem.h          |  2 ++
 arch/powerpc/mm/book3s64/hash_utils.c         | 28 +++++++++++++++++++
 arch/powerpc/mm/book3s64/pgtable.c            | 12 ++++++++
 .../platforms/pseries/hotplug-memory.c        | 16 +++++++++++
 5 files changed, 60 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index 843b0a178590..f92697c107f7 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -256,6 +256,8 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
 int hash__remove_section_mapping(unsigned long start, unsigned long end);
 
 void hash_memory_batch_expand_prepare(unsigned long newsize);
+void hash_memory_batch_shrink_begin(void);
+void hash_memory_batch_shrink_end(void);
 
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/asm/sparsemem.h
index 16b5f5300c84..a7a8a0d070fc 100644
--- a/arch/powerpc/include/asm/sparsemem.h
+++ b/arch/powerpc/include/asm/sparsemem.h
@@ -18,6 +18,8 @@ extern int memory_add_physaddr_to_nid(u64 start);
 #define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
 
 void memory_batch_expand_prepare(unsigned long newsize);
+void memory_batch_shrink_begin(void);
+void memory_batch_shrink_end(void);
 
 #ifdef CONFIG_NUMA
 extern int hot_add_scn_to_nid(unsigned long scn_addr);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 1f6aa0bf27e7..e16f207de8e4 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -794,6 +794,9 @@ static unsigned long __init htab_get_table_size(void)
 }
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+
+atomic_t hpt_resize_disable = ATOMIC_INIT(0);
+
 static int resize_hpt_for_hotplug(unsigned long new_mem_size, bool shrinking)
 {
 	unsigned target_hpt_shift;
@@ -805,6 +808,10 @@ static int resize_hpt_for_hotplug(unsigned long new_mem_size, bool shrinking)
 
 	if (shrinking) {
 
+		/* When batch removing entries, only resizes HPT at the end. */
+		if (atomic_read_acquire(&hpt_resize_disable))
+			return 0;
+
 		/*
 		 * To avoid lots of HPT resizes if memory size is fluctuating
 		 * across a boundary, we deliberately have some hysterisis
@@ -872,6 +879,27 @@ void hash_memory_batch_expand_prepare(unsigned long newsize)
 		pr_warn("Hash collision while resizing HPT\n");
 	}
 }
+
+void hash_memory_batch_shrink_begin(void)
+{
+	/* Disable HPT resize-down during hot-unplug */
+	atomic_set_release(&hpt_resize_disable, 1);
+}
+
+void hash_memory_batch_shrink_end(void)
+{
+	unsigned long newsize;
+
+	/* Re-enables HPT resize-down after hot-unplug */
+	atomic_set_release(&hpt_resize_disable, 0);
+
+	newsize = memblock_phys_mem_size();
+	/* Resize to smallest SHIFT possible */
+	while (resize_hpt_for_hotplug(newsize, true) == -ENOSPC) {
+		newsize *= 2;
+		pr_warn("Hash collision while resizing HPT\n");
+	}
+}
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 static void __init hash_init_partition_table(phys_addr_t hash_table,
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index f1cd8af0f67f..e01681e22e00 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -199,6 +199,18 @@ void memory_batch_expand_prepare(unsigned long newsize)
 	if (!radix_enabled())
 		hash_memory_batch_expand_prepare(newsize);
 }
+
+void memory_batch_shrink_begin(void)
+{
+	if (!radix_enabled())
+		hash_memory_batch_shrink_begin();
+}
+
+void memory_batch_shrink_end(void)
+{
+	if (!radix_enabled())
+		hash_memory_batch_shrink_end();
+}
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 void __init mmu_partition_table_init(void)
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 353c71249214..9182fb5b5c01 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -425,6 +425,8 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 		return -EINVAL;
 	}
 
+	memory_batch_shrink_begin();
+
 	for_each_drmem_lmb(lmb) {
 		rc = dlpar_remove_lmb(lmb);
 		if (rc)
@@ -470,6 +472,8 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 		rc = 0;
 	}
 
+	memory_batch_shrink_end();
+
 	return rc;
 }
 
@@ -481,6 +485,8 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
 
 	pr_debug("Attempting to hot-remove LMB, drc index %x\n", drc_index);
 
+	memory_batch_shrink_begin();
+
 	lmb_found = 0;
 	for_each_drmem_lmb(lmb) {
 		if (lmb->drc_index == drc_index) {
@@ -502,6 +508,8 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
 	else
 		pr_debug("Memory at %llx was hot-removed\n", lmb->base_addr);
 
+	memory_batch_shrink_end();
+
 	return rc;
 }
 
@@ -532,6 +540,8 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 	if (lmbs_available < lmbs_to_remove)
 		return -EINVAL;
 
+	memory_batch_shrink_begin();
+
 	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
 		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
 			continue;
@@ -572,6 +582,8 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 		}
 	}
 
+	memory_batch_shrink_end();
+
 	return rc;
 }
 
@@ -700,6 +712,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 	if (lmbs_added != lmbs_to_add) {
 		pr_err("Memory hot-add failed, removing any added LMBs\n");
 
+		memory_batch_shrink_begin();
 		for_each_drmem_lmb(lmb) {
 			if (!drmem_lmb_reserved(lmb))
 				continue;
@@ -713,6 +726,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 
 			drmem_remove_lmb_reservation(lmb);
 		}
+		memory_batch_shrink_end();
 		rc = -EINVAL;
 	} else {
 		for_each_drmem_lmb(lmb) {
@@ -814,6 +828,7 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 	if (rc) {
 		pr_err("Memory indexed-count-add failed, removing any added LMBs\n");
 
+		memory_batch_shrink_begin();
 		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
 			if (!drmem_lmb_reserved(lmb))
 				continue;
@@ -827,6 +842,7 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 
 			drmem_remove_lmb_reservation(lmb);
 		}
+		memory_batch_shrink_end();
 		rc = -EINVAL;
 	} else {
 		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-- 
2.29.2

