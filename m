Return-Path: <linuxppc-dev+bounces-17243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFpCGZUvoGkrgAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:33:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AE31A513F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:33:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM8V70LlMz2yFm;
	Thu, 26 Feb 2026 22:33:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.186
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772105614;
	cv=none; b=hTda5a0Kk4SJ/PKSmesfDlh9M72NnPNiBFiCb0vsm6BfngxchJZV188aiqj3VmUiiAM88wmh8wYDHz6qXEkE+llGdDXPTzoeXOUSIsPkbm0UrLAs2yfnM50acdSw09IPV2R2kz53SsjpKQb42YBOfaONGpj5e6/SXDSVkWxLQel3SdElTexE6rp7Sr2UC2gDPDsotJj7d8lalIxK/BcLKN0wRsNKDQvfT8qatofIPeosmcGZeZv6yJGoXELunJrotCMDBtXCT0nmp0WsbBIp8tr4Y2UK0UTOzjCNWUPGcQt5GWBBfA358nHO3E7WVd8f11nuVRdHThEbn16K2I66Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772105614; c=relaxed/relaxed;
	bh=rMeF9FuOGiVcaeEE8TLIVYSd2ZWdyqQJ2YusxNRO8Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BHJ8F1m0MdynPmDCR/snR4RK/vdeexHBs0UqAsShNP73LnkeoYt3hKDpMlxrOTNewtcpYAIxWYTlRPCe/85D8u8+Sq9FwoO2y2qA6ubgnTYaq4DbTWhbJweGBVdzM3BePVoyK9XReoxrN3BMdkjCz8gIsQgX8cn1TH1j/4uGG/pAPOWmuW8rAw+X1QUdPE5jHwO7h11BRbE4kAuPKxN1PZM00Nkmtd3WS7SYj1M4LsKI7b/csSO2XVzhvmNxeAqQebOZ5FF1410CWRdU24mw3ousbZcoHFc5iP2UprIHrMOlOZNpMuk9qQLsfIy1Om48BjhBKKwRxWUZzqC8vNJybQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BFSudpBQ; dkim-atps=neutral; spf=pass (client-ip=91.218.175.186; helo=out-186.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BFSudpBQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.186; helo=out-186.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM8V34tjhz2yFc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:33:31 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772105586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMeF9FuOGiVcaeEE8TLIVYSd2ZWdyqQJ2YusxNRO8Vw=;
	b=BFSudpBQsSSTYRqfYn30RDkrmyvD8a82qVH1sYA5NyNZ7scTnnsWMO+aILfSxqwHerqizH
	saC0LYcAFWnkoLmEVnGKpnBUc4oq6xsaL9QCJjM/OgvgRBSPnqALRaNrYVJuxt2Tse2yM9
	17DCCv6gSxumhU6zBvHKgBtRtW9lMQc=
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
Subject: [RFC v2 01/21] mm: thp: make split_huge_pmd functions return int for error propagation
Date: Thu, 26 Feb 2026 03:23:30 -0800
Message-ID: <20260226113233.3987674-2-usama.arif@linux.dev>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17243-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:usama.arif@linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,linux.dev:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 59AE31A513F
X-Rspamd-Action: no action

Currently split cannot fail, but future patches will add lazy PTE page
table allocation. With lazy PTE page table allocation at THP split time
__split_huge_pmd() calls pte_alloc_one() which can fail if order-0
allocation cannot be satisfied.
Split functions currently return void, so callers have no way to detect
this failure.  The PMD would remain huge, but callers assumed the split
succeeded and proceeded to operate on that basis — interpreting a huge PMD
entry as a page table pointer could result in a kernel bug.

Change __split_huge_pmd(), split_huge_pmd(), split_huge_pmd_if_needed()
and split_huge_pmd_address() to return 0 on success (-ENOMEM on
allocation failure in later patch).  Convert the split_huge_pmd macro
to a static inline function that propagates the return value. The return
values will be handled by the callers in future commits.

The CONFIG_TRANSPARENT_HUGEPAGE=n stubs are changed to return 0.

No behaviour change is expected with this patch.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 include/linux/huge_mm.h | 34 ++++++++++++++++++----------------
 mm/huge_memory.c        | 16 ++++++++++------
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index a4d9f964dfdea..e4cbf5afdbe7e 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -419,7 +419,7 @@ void deferred_split_folio(struct folio *folio, bool partially_mapped);
 void reparent_deferred_split_queue(struct mem_cgroup *memcg);
 #endif
 
-void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
+int __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long address, bool freeze);
 
 /**
@@ -448,15 +448,15 @@ static inline bool pmd_is_huge(pmd_t pmd)
 	return false;
 }
 
-#define split_huge_pmd(__vma, __pmd, __address)				\
-	do {								\
-		pmd_t *____pmd = (__pmd);				\
-		if (pmd_is_huge(*____pmd))				\
-			__split_huge_pmd(__vma, __pmd, __address,	\
-					 false);			\
-	}  while (0)
+static inline int split_huge_pmd(struct vm_area_struct *vma,
+					     pmd_t *pmd, unsigned long address)
+{
+	if (pmd_is_huge(*pmd))
+		return __split_huge_pmd(vma, pmd, address, false);
+	return 0;
+}
 
-void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
+int split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
 		bool freeze);
 
 void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
@@ -651,13 +651,15 @@ static inline int try_folio_split_to_order(struct folio *folio,
 
 static inline void deferred_split_folio(struct folio *folio, bool partially_mapped) {}
 static inline void reparent_deferred_split_queue(struct mem_cgroup *memcg) {}
-#define split_huge_pmd(__vma, __pmd, __address)	\
-	do { } while (0)
-
-static inline void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze) {}
-static inline void split_huge_pmd_address(struct vm_area_struct *vma,
-		unsigned long address, bool freeze) {}
+static inline int split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
+				unsigned long address)
+{
+	return 0;
+}
+static inline int __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
+		unsigned long address, bool freeze) { return 0; }
+static inline int split_huge_pmd_address(struct vm_area_struct *vma,
+		unsigned long address, bool freeze) { return 0; }
 static inline void split_huge_pmd_locked(struct vm_area_struct *vma,
 					 unsigned long address, pmd_t *pmd,
 					 bool freeze) {}
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 8003d3a498220..125ff36f475de 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3273,7 +3273,7 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
 }
 
-void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
+int __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long address, bool freeze)
 {
 	spinlock_t *ptl;
@@ -3287,20 +3287,22 @@ void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
 	split_huge_pmd_locked(vma, range.start, pmd, freeze);
 	spin_unlock(ptl);
 	mmu_notifier_invalidate_range_end(&range);
+
+	return 0;
 }
 
-void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
+int split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
 		bool freeze)
 {
 	pmd_t *pmd = mm_find_pmd(vma->vm_mm, address);
 
 	if (!pmd)
-		return;
+		return 0;
 
-	__split_huge_pmd(vma, pmd, address, freeze);
+	return __split_huge_pmd(vma, pmd, address, freeze);
 }
 
-static inline void split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned long address)
+static inline int split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned long address)
 {
 	/*
 	 * If the new address isn't hpage aligned and it could previously
@@ -3309,7 +3311,9 @@ static inline void split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned
 	if (!IS_ALIGNED(address, HPAGE_PMD_SIZE) &&
 	    range_in_vma(vma, ALIGN_DOWN(address, HPAGE_PMD_SIZE),
 			 ALIGN(address, HPAGE_PMD_SIZE)))
-		split_huge_pmd_address(vma, address, false);
+		return split_huge_pmd_address(vma, address, false);
+
+	return 0;
 }
 
 void vma_adjust_trans_huge(struct vm_area_struct *vma,
-- 
2.47.3


