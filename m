Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB9336FC8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 16:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWw2l6x7Dz3c0d
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 00:38:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=W2yHmrJl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W2yHmrJl; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWw1s2gPqz3bpP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 00:37:21 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id o27so1977070qkj.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 07:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sbxM0d7iVP2AFAHnR5wZZv7UonG+3h5RRC/2YZAfwa4=;
 b=W2yHmrJlKhqzfDfSmZkFdYjO7Q/7VDJpMrkZ9dkSwloDYkRUUgzWLpaosA11jGrl8/
 EKIu8x9KNrhqigpOeWNNSyDsC/pQ7qdBBSHRcA8VN4N+zqpovc7B8sOeW+sP2nbN3B8K
 xTkt2U+tO3aLHjEN20dTP1tzDwWkj/2u381y3T2/yZZkCjnJb+jtdaSduzGhMv7ZS/cs
 mfrHzRamccNEiHMFHAoLj15223nRtWDhd/zRxqnSOijXdCsdRrWYBpSrUdqCTgDMew8t
 gAprsO152s38k4sKUZXHHxP3pqlk9cz79wyipVvMMYkSZWEHzbUqdS5TJvaWr943Otam
 OTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sbxM0d7iVP2AFAHnR5wZZv7UonG+3h5RRC/2YZAfwa4=;
 b=WqHydanN4X87x+eH6RN3OC9rdvb8zsxr1LMTwTa49PjiTPZUh0UDbPt0sbka2fo7vA
 cbxyfxte0N23/e9BOvaNgHhFpFw939/nSLIuyTO05Ln0NfdzfLCn927GiG/LjeRaPstU
 sprGH0waYw65zHVUfw2kCfhiCBL8t69q/lyJBa9a3cihx3b+d4ZLJzaulpkqqkGHp0x8
 W9ltaW6TUwje+DOydsS1sCEndRRFBZKHo6l8YrSZt6sg5tYlIZYthQFYtouRLAq1jzBK
 2McbhtKPCQSBWGq03grxrf+8994WCFlw9KL0gl20BJw4AP34vdINagE1muPdFe6XkWFN
 GxJw==
X-Gm-Message-State: AOAM532w31ZhZRWftGUSS1nwO8MZ4waqcXW3cy2f1m75A6/xSAV1lAKu
 kzof9unLaAwGXU4hKMvxnM8=
X-Google-Smtp-Source: ABdhPJyojzoDSFGiBlevl0kCCOc/+/Da+PIfH24WUxdcJM8zJY5iN9DVGHlJXjTAtjom3orRq1WWlA==
X-Received: by 2002:a37:9802:: with SMTP id a2mr5961659qke.473.1619793438928; 
 Fri, 30 Apr 2021 07:37:18 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1001])
 by smtp.gmail.com with ESMTPSA id 190sm1532560qki.115.2021.04.30.07.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 07:37:18 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Sandipan Das <sandipan@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Scott Cheloha <cheloha@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>
Subject: [PATCH v2 3/3] powerpc/mm/hash: Avoid multiple HPT resize-downs on
 memory hotunplug
Date: Fri, 30 Apr 2021 11:36:10 -0300
Message-Id: <20210430143607.135005-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430143607.135005-1-leobras.c@gmail.com>
References: <20210430143607.135005-1-leobras.c@gmail.com>
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
 arch/powerpc/include/asm/book3s/64/hash.h     |  2 +
 arch/powerpc/mm/book3s64/hash_utils.c         | 45 +++++++++++++++++--
 .../platforms/pseries/hotplug-memory.c        | 26 +++++++++++
 3 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index fad4af8b8543..6cd66e7e98c9 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -256,6 +256,8 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
 int hash__remove_section_mapping(unsigned long start, unsigned long end);
 
 void hash_batch_expand_prepare(unsigned long newsize);
+void hash_batch_shrink_begin(void);
+void hash_batch_shrink_end(void);
 
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 3fa395b3fe57..73ecd0f61acd 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -795,6 +795,9 @@ static unsigned long __init htab_get_table_size(void)
 }
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+
+static DEFINE_MUTEX(hpt_resize_down_lock);
+
 static int resize_hpt_for_hotplug(unsigned long new_mem_size, bool shrinking)
 {
 	unsigned target_hpt_shift;
@@ -805,7 +808,7 @@ static int resize_hpt_for_hotplug(unsigned long new_mem_size, bool shrinking)
 	target_hpt_shift = htab_shift_for_mem_size(new_mem_size);
 
 	if (shrinking) {
-
+		int ret;
 		/*
 		 * To avoid lots of HPT resizes if memory size is fluctuating
 		 * across a boundary, we deliberately have some hysterisis
@@ -818,10 +821,20 @@ static int resize_hpt_for_hotplug(unsigned long new_mem_size, bool shrinking)
 		if (target_hpt_shift >= ppc64_pft_size - 1)
 			return 0;
 
-	} else if (target_hpt_shift <= ppc64_pft_size) {
-		return 0;
+		/* When batch removing entries, only resizes HPT at the end. */
+
+		if (!mutex_trylock(&hpt_resize_down_lock))
+			return 0;
+
+		ret = mmu_hash_ops.resize_hpt(target_hpt_shift);
+
+		mutex_unlock(&hpt_resize_down_lock);
+		return ret;
 	}
 
+	if (target_hpt_shift <= ppc64_pft_size)
+		return 0;
+
 	return mmu_hash_ops.resize_hpt(target_hpt_shift);
 }
 
@@ -879,6 +892,32 @@ void hash_batch_expand_prepare(unsigned long newsize)
 			break;
 	}
 }
+
+void hash_batch_shrink_begin(void)
+{
+	/* Disable HPT resize-down during hot-unplug */
+	mutex_lock(&hpt_resize_down_lock);
+}
+
+void hash_batch_shrink_end(void)
+{
+	const u64 starting_size = ppc64_pft_size;
+	unsigned long newsize;
+
+	newsize = memblock_phys_mem_size();
+	/* Resize to smallest SHIFT possible */
+	while (resize_hpt_for_hotplug(newsize, true) == -ENOSPC) {
+		newsize *= 2;
+		pr_warn("Hash collision while resizing HPT\n");
+
+		/* Do not try to resize to the starting size, or bigger value */
+		if (htab_shift_for_mem_size(newsize) >= starting_size)
+			break;
+	}
+
+	/* Re-enables HPT resize-down after hot-unplug */
+	mutex_unlock(&hpt_resize_down_lock);
+}
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 static void __init hash_init_partition_table(phys_addr_t hash_table,
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 48b2cfe4ce69..44bc50d72353 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -426,6 +426,9 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 		return -EINVAL;
 	}
 
+	if (!radix_enabled())
+		hash_batch_shrink_begin();
+
 	for_each_drmem_lmb(lmb) {
 		rc = dlpar_remove_lmb(lmb);
 		if (rc)
@@ -471,6 +474,9 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 		rc = 0;
 	}
 
+	if (!radix_enabled())
+		hash_batch_shrink_end();
+
 	return rc;
 }
 
@@ -533,6 +539,9 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 	if (lmbs_available < lmbs_to_remove)
 		return -EINVAL;
 
+	if (!radix_enabled())
+		hash_batch_shrink_begin();
+
 	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
 		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
 			continue;
@@ -573,6 +582,9 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 		}
 	}
 
+	if (!radix_enabled())
+		hash_batch_shrink_end();
+
 	return rc;
 }
 
@@ -703,6 +715,9 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 	if (lmbs_added != lmbs_to_add) {
 		pr_err("Memory hot-add failed, removing any added LMBs\n");
 
+		if (!radix_enabled())
+			hash_batch_shrink_begin();
+
 		for_each_drmem_lmb(lmb) {
 			if (!drmem_lmb_reserved(lmb))
 				continue;
@@ -716,6 +731,10 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 
 			drmem_remove_lmb_reservation(lmb);
 		}
+
+		if (!radix_enabled())
+			hash_batch_shrink_end();
+
 		rc = -EINVAL;
 	} else {
 		for_each_drmem_lmb(lmb) {
@@ -817,6 +836,9 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 	if (rc) {
 		pr_err("Memory indexed-count-add failed, removing any added LMBs\n");
 
+		if (!radix_enabled())
+			hash_batch_shrink_begin();
+
 		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
 			if (!drmem_lmb_reserved(lmb))
 				continue;
@@ -830,6 +852,10 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 
 			drmem_remove_lmb_reservation(lmb);
 		}
+
+		if (!radix_enabled())
+			hash_batch_shrink_end();
+
 		rc = -EINVAL;
 	} else {
 		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-- 
2.30.2

