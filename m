Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577A338697
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 08:33:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxcx11knHz3cTv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 18:33:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NG77WAYg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NG77WAYg; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxcvc1Lpgz3d3C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 18:31:56 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id 130so23352492qkh.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 23:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z052sO/4NGB1LzTDqZ+gt7AUquJ7y9J7Drl1gXLThHU=;
 b=NG77WAYgsJT+VsleEY/Rphw3eS5xA0aCgIwZs1LZXaL5bN0l9hl1v8uAnYZuiKiaUK
 U4XnUtnxPm1lWURbJgD+Ksy+EJDQpuKVzGvMjBO2aLU5/bxG6Lh7cp06N85MIH1o3Apg
 aSGmvLfztbMxSZ5OX43sfVN28p1wz/nJBVvsv9YSDgpEoY/R/tZ3pqdpuWGvJ5EAdX6R
 RgXluxL5ZBQ8m5Peq3zvP0b3UwF9fNAKM4EDEjosSlLIdaBeOJtL9VHeZ9GfhyNNZtuE
 YDNV/SKTr2/MvU2p8XdEumcjABrSzYlAMC9VDBa5tDIxAya57cogGAHQV/bpZtnaqdfK
 Ugqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z052sO/4NGB1LzTDqZ+gt7AUquJ7y9J7Drl1gXLThHU=;
 b=E8IBRW+q9CXnvwzHxlzkTE7kxhgrH5Fe5MX9Gp9mxLLMajfKjL1AY8Z86TU2M1Kbh3
 tc41wOuEXTIZv0tCRlX78XWwY3CuR2D+9kkUJQuyrDOOkzaYfU7jxPbVXjq/tN+tT4+6
 z5fEG26mNzagjF8BddytFQlrj+2hAMQJxE6n7jqZyaJE9FRWRGxXaD6Wvb7AkRdR2RAP
 fYaqaPGLa/0/JreBh/s1qq01J7/D/XKyAePul2yNXFPYzogzNIu0izirC2eTqcps7P1J
 8DDMVgNcope1ZPGdmRtGSzpzwZea8YkZ3eJpLtLxcaS2lQsA60qx8Ut2NEkFwOn/iswL
 RfwQ==
X-Gm-Message-State: AOAM530CKwKbMmu+1R2m/uS7XBRG5TPyqSBnhSyXWuAF+hNlAMXzUlx0
 LMjnJ7IXoUL+IN7z6u+yP7c=
X-Google-Smtp-Source: ABdhPJyfSXCBtJL+8rrzAmK7RWJPFCVC4RYg2LBf6U8/N6ZSe055Myz7T7HEnkfqwjwo7XNHWtkL/g==
X-Received: by 2002:a37:2756:: with SMTP id n83mr11259204qkn.70.1615534313731; 
 Thu, 11 Mar 2021 23:31:53 -0800 (PST)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 (177-131-89-8.dynamic.desktop.com.br. [177.131.89.8])
 by smtp.gmail.com with ESMTPSA id t6sm3434026qti.2.2021.03.11.23.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 23:31:53 -0800 (PST)
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
Subject: [PATCH 2/3] powerpc/mm/hash: Avoid multiple HPT resize-ups on memory
 hotplug
Date: Fri, 12 Mar 2021 04:29:40 -0300
Message-Id: <20210312072940.598696-3-leobras.c@gmail.com>
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

Every time a memory hotplug happens, and the memory limit crosses a 2^n
value, it may be necessary to perform HPT resizing-up, which can take
some time (over 100ms in my tests).

It usually is not an issue, but it can take some time if a lot of memory
is added to a guest with little starting memory:
Adding 256G to a 2GB guest, for example will require 8 HPT resizes.

Perform an HPT resize before memory hotplug, updating HPT to its
final size (considering a successful hotplug), taking the number of
HPT resizes to at most one per memory hotplug action.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/hash.h       |  2 ++
 arch/powerpc/include/asm/sparsemem.h            |  2 ++
 arch/powerpc/mm/book3s64/hash_utils.c           | 14 ++++++++++++++
 arch/powerpc/mm/book3s64/pgtable.c              |  6 ++++++
 arch/powerpc/platforms/pseries/hotplug-memory.c |  6 ++++++
 5 files changed, 30 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index d959b0195ad9..843b0a178590 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -255,6 +255,8 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
 				 int nid, pgprot_t prot);
 int hash__remove_section_mapping(unsigned long start, unsigned long end);
 
+void hash_memory_batch_expand_prepare(unsigned long newsize);
+
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_HASH_H */
diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/asm/sparsemem.h
index d072866842e4..16b5f5300c84 100644
--- a/arch/powerpc/include/asm/sparsemem.h
+++ b/arch/powerpc/include/asm/sparsemem.h
@@ -17,6 +17,8 @@ extern int remove_section_mapping(unsigned long start, unsigned long end);
 extern int memory_add_physaddr_to_nid(u64 start);
 #define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
 
+void memory_batch_expand_prepare(unsigned long newsize);
+
 #ifdef CONFIG_NUMA
 extern int hot_add_scn_to_nid(unsigned long scn_addr);
 #else
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index cfb3ec164f56..1f6aa0bf27e7 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -858,6 +858,20 @@ int hash__remove_section_mapping(unsigned long start, unsigned long end)
 
 	return rc;
 }
+
+void hash_memory_batch_expand_prepare(unsigned long newsize)
+{
+	/*
+	 * Resizing-up HPT should never fail, but there are some cases system starts with higher
+	 * SHIFT than required, and we go through the funny case of resizing HPT down while
+	 * adding memory
+	 */
+
+	while (resize_hpt_for_hotplug(newsize, false) == -ENOSPC) {
+		newsize *= 2;
+		pr_warn("Hash collision while resizing HPT\n");
+	}
+}
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 static void __init hash_init_partition_table(phys_addr_t hash_table,
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 5b3a3bae21aa..f1cd8af0f67f 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -193,6 +193,12 @@ int __meminit remove_section_mapping(unsigned long start, unsigned long end)
 
 	return hash__remove_section_mapping(start, end);
 }
+
+void memory_batch_expand_prepare(unsigned long newsize)
+{
+	if (!radix_enabled())
+		hash_memory_batch_expand_prepare(newsize);
+}
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 void __init mmu_partition_table_init(void)
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 8377f1f7c78e..353c71249214 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -671,6 +671,8 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 	if (lmbs_available < lmbs_to_add)
 		return -EINVAL;
 
+	memory_batch_expand_prepare(memblock_phys_mem_size() + lmbs_to_add * drmem_lmb_size());
+
 	for_each_drmem_lmb(lmb) {
 		if (lmb->flags & DRCONF_MEM_ASSIGNED)
 			continue;
@@ -734,6 +736,8 @@ static int dlpar_memory_add_by_index(u32 drc_index)
 
 	pr_info("Attempting to hot-add LMB, drc index %x\n", drc_index);
 
+	memory_batch_expand_prepare(memblock_phys_mem_size() +
+				     drmem_info->n_lmbs * drmem_lmb_size());
 	lmb_found = 0;
 	for_each_drmem_lmb(lmb) {
 		if (lmb->drc_index == drc_index) {
@@ -788,6 +792,8 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 	if (lmbs_available < lmbs_to_add)
 		return -EINVAL;
 
+	memory_batch_expand_prepare(memblock_phys_mem_size() + lmbs_to_add * drmem_lmb_size());
+
 	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
 		if (lmb->flags & DRCONF_MEM_ASSIGNED)
 			continue;
-- 
2.29.2

