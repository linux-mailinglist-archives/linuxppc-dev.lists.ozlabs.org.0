Return-Path: <linuxppc-dev+bounces-17259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOO0HQswoGmLgAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:35:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997301A5246
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:35:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM8Wj1Q5Fz3bhq;
	Thu, 26 Feb 2026 22:34:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.183
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772105697;
	cv=none; b=HKYQJEPiwBKK7xvJzk5BduWl+aoksKaZToGH0bY3tiwnBuXMrxll65V7mgozbxUjxaH7gEBLvEKykVrXJ6o2dBF6EKwuWVSzVBsiMWGUyCEgBZSRkABXP7SjJhKg3uuMAQdR0PSULtx9pKjI+Du2id29MJ0HruVLMu5BsTKX04JwlnZXwXySz62zFmilvhkqKyHTLZ2QP+X3rh70qe/ey60lI4SSDtMpn2GT0o8Kk7jV903RwxgjfscuotVCSwOTv821gzXu2j/KzEXZ1mDEqdeO/wjJqaIzWGOluPqa7jGLkTZCNXXOG9OPfUJq2M6zurpuBLXMH4KrHDA13koAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772105697; c=relaxed/relaxed;
	bh=caCWzkT51kBA+1b/gVecuRpXYDomBajxDOrSXa3U1jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+OLnM/PGZXX8q+3yriHmpk2CRZNzLNPYJT8NaK2tp5pqSDgW6oTRPSjyzTo52Ha+7hP/uaqjDDWQO6GQpK6WEZiMNQzCT1woxVfiChICv0GUClVtIRXTEp3FOZTntgEuo/dolmP5zlkdENRuuFhAK4SbU7pfOngXzU2LgwRF19Dc+Dt4opKN/0USwn0wRga7MkmQgPnzYq/Oa06YL4XwpsqnLT4dCwY/fELON1SN6Ld3omOKElo+E8NQs49yXnNYQmwy3XLe8MP4aeyB9ufwgjGT4GIHrgmM63H//3rldNfMIxPMi0g0ynDa2d0kkKA/k223knDFvt++1LBze2InQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iwH65pKx; dkim-atps=neutral; spf=pass (client-ip=95.215.58.183; helo=out-183.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iwH65pKx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.183; helo=out-183.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM8Wh3N2Cz2yFc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:34:56 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772105677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=caCWzkT51kBA+1b/gVecuRpXYDomBajxDOrSXa3U1jc=;
	b=iwH65pKxu5LpRPMNZ/vYDs9XIVBcTv1gPT58U+Rxwn3FgEXyxD998b65LSZo9fPSJ031aw
	nazqs8ps6h716yU5RmiIIzP9wPotaYiK6YjK6+WTiQmE9LiXwan6xsQU7f7pDuYB3FqmkI
	VFDnikYUT2941qf0s6DCUaGOhTZ0k/M=
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	willy@infradead.org,
	linux-mm@kvack.org
Cc: fvdl@google.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	Liam.Howlett@oracle.com,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	linux-s390@vger.kernel.org,
	Usama Arif <usama.arif@linux.dev>
Subject: [RFC v2 16/21] mm: thp: add THP_SPLIT_PMD_FAILED counter
Date: Thu, 26 Feb 2026 03:23:45 -0800
Message-ID: <20260226113233.3987674-17-usama.arif@linux.dev>
In-Reply-To: <20260226113233.3987674-1-usama.arif@linux.dev>
References: <20260226113233.3987674-1-usama.arif@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17259-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:usama.arif@linux.dev,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,linux.dev:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 997301A5246
X-Rspamd-Action: no action

Add a vmstat counter to track PTE allocation failures during PMD split.
This enables monitoring of split failures due to memory pressure after
the lazy PTE page table allocation change.

The counter is incremented in three places:
- __split_huge_pmd(): Main entry point for splitting a PMD
- try_to_unmap_one(): When reclaim needs to split a PMD-mapped THP
- try_to_migrate_one(): When migration needs to split a PMD-mapped THP

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 include/linux/vm_event_item.h | 1 +
 mm/huge_memory.c              | 1 +
 mm/rmap.c                     | 3 +++
 mm/vmstat.c                   | 1 +
 4 files changed, 6 insertions(+)

diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 03fe95f5a0201..ce696cf7d6321 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -98,6 +98,7 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		THP_DEFERRED_SPLIT_PAGE,
 		THP_UNDERUSED_SPLIT_PAGE,
 		THP_SPLIT_PMD,
+		THP_SPLIT_PMD_FAILED,
 		THP_SCAN_EXCEED_NONE_PTE,
 		THP_SCAN_EXCEED_SWAP_PTE,
 		THP_SCAN_EXCEED_SHARED_PTE,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 55b14ba244b1b..fc0a5e91b4d40 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3347,6 +3347,7 @@ int __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
 	if (vma_is_anonymous(vma) && !arch_needs_pgtable_deposit()) {
 		pgtable = pte_alloc_one(vma->vm_mm);
 		if (!pgtable) {
+			count_vm_event(THP_SPLIT_PMD_FAILED);
 			mmu_notifier_invalidate_range_end(&range);
 			return -ENOMEM;
 		}
diff --git a/mm/rmap.c b/mm/rmap.c
index 2519d579bc1d8..2dae46fff08ae 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2067,8 +2067,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				pgtable_t pgtable = prealloc_pte;
 
 				prealloc_pte = NULL;
+
 				if (!arch_needs_pgtable_deposit() && !pgtable &&
 				    vma_is_anonymous(vma)) {
+					count_vm_event(THP_SPLIT_PMD_FAILED);
 					page_vma_mapped_walk_done(&pvmw);
 					ret = false;
 					break;
@@ -2471,6 +2473,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				prealloc_pte = NULL;
 				if (!arch_needs_pgtable_deposit() && !pgtable &&
 				    vma_is_anonymous(vma)) {
+					count_vm_event(THP_SPLIT_PMD_FAILED);
 					page_vma_mapped_walk_done(&pvmw);
 					ret = false;
 					break;
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 667474773dbc7..da276ef0072ed 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1408,6 +1408,7 @@ const char * const vmstat_text[] = {
 	[I(THP_DEFERRED_SPLIT_PAGE)]		= "thp_deferred_split_page",
 	[I(THP_UNDERUSED_SPLIT_PAGE)]		= "thp_underused_split_page",
 	[I(THP_SPLIT_PMD)]			= "thp_split_pmd",
+	[I(THP_SPLIT_PMD_FAILED)]		= "thp_split_pmd_failed",
 	[I(THP_SCAN_EXCEED_NONE_PTE)]		= "thp_scan_exceed_none_pte",
 	[I(THP_SCAN_EXCEED_SWAP_PTE)]		= "thp_scan_exceed_swap_pte",
 	[I(THP_SCAN_EXCEED_SHARED_PTE)]		= "thp_scan_exceed_share_pte",
-- 
2.47.3


