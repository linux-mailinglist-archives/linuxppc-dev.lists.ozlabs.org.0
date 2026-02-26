Return-Path: <linuxppc-dev+bounces-17248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E1RA7cvoGkrgAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:34:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6057A1A5184
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:34:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM8VT4dPMz3c9b;
	Thu, 26 Feb 2026 22:33:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772105633;
	cv=none; b=EYl8/P/95LkqtSZorNCkTNgpkE3HeSCPgIoL4qoLDeCpWUgHUcLH+4Z2b3YgN7ROJdoWJW54+763ziWLx45pSZLt6DDlsHHrF/yRxqfMFaJZr4ZqHlF8bDh8cqnUlj0kfr5LNDCRz86W9JgJYzPkw0sCEaaSRzCVgRRUK6DjCCFCF7OPZEvTqXm/Q5ospJBinyMDZWASYWsjdawEhL3JOHRZGbARRlhs2duj1RfX0CvyM7jLvymURkUYby+0O5LWqqSoq9gLjhi5GNuqlpSuLZfmCeAwVI4oHN9s24Wa/vUsgM0uq5IvYi+yO4W1gPg/+Jdq/tiPAsXXZRkFSZbBGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772105633; c=relaxed/relaxed;
	bh=HcjsQV50nDatk8NFhsm3n/z/wAZY5b80YB+EzBptEz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7Uw068uNec8CDBrnIV/QJWXagxaqESKDvEZIj5BxjTvd0q7bLTbmAM9DzwDhFF12qq4u7h6ft1aCi6wBjNwX7h44EuWb4/cF9Omn5iam9Cs+d2xvFyGawye4RQYdNyaBo1i0myKcEwkQ5EeHFIDxQeuUm3cdEdSjti3TDpD3EBMVL26zRI8HaybGkGuigqh9URjxDYTbuFf2WBijXgfulWtjNRWdkXcYTxyxI+/wjN9BpxPKUQbM7x0DTlmB+1JaDGiAjlAtM/228X322EVtuVQUlo/7Z2KXG4yOBIYcXTLSq52t4wliawas8TxSZAGOmF1ZYO+1AQV/TQDuSb8xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hUNYtyZh; dkim-atps=neutral; spf=pass (client-ip=95.215.58.189; helo=out-189.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hUNYtyZh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.189; helo=out-189.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM8VS6qxJz2yLG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:33:52 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772105610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HcjsQV50nDatk8NFhsm3n/z/wAZY5b80YB+EzBptEz0=;
	b=hUNYtyZhaqlksnd9AfSZRt096lmVApHmXGQuSN2BpnlEr3x8YHG94GOzMTUoa/3r7gWEkq
	45emp28Vxqc7n2wBQVg1LWyfVHtjlcaJ4w3bF7QR+JjA9SJu1LjAHrKEC+xPZYvhAhbt9r
	GhTu0cvDNKxZfXQZTdIFSvNtBxE363I=
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
Subject: [RFC v2 05/21] mm: thp: handle split failure in zap_pmd_range()
Date: Thu, 26 Feb 2026 03:23:34 -0800
Message-ID: <20260226113233.3987674-6-usama.arif@linux.dev>
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
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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
	TAGGED_FROM(0.00)[bounces-17248-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.dev:mid,linux.dev:dkim,linux.dev:email]
X-Rspamd-Queue-Id: 6057A1A5184
X-Rspamd-Action: no action

zap_pmd_range() splits a huge PMD when the zap range doesn't cover the
full PMD (partial unmap).  If the split fails, the PMD stays huge.
Falling through to zap_pte_range() would dereference the huge PMD entry
as a PTE page table pointer.

Skip the range covered by the PMD on split failure instead.

The skip is safe across all call paths into zap_pmd_range():

- exit_mmap() and OOM reaper: the zap range covers entire VMAs, so
  every PMD is fully covered (next - addr == HPAGE_PMD_SIZE).  The
  zap_huge_pmd() branch handles these without splitting.  The split
  failure path is unreachable.

- munmap / mmap overlay: vma_adjust_trans_huge() (called from
  __split_vma) splits any PMD straddling the VMA boundary before the
  VMA is split.  If that PMD split fails, __split_vma() returns
  -ENOMEM and the munmap is aborted before reaching zap_pmd_range().
  The split failure path is unreachable.

- MADV_DONTNEED: advisory hint, the kernel is allowed to ignore it.
  The pages remain valid and accessible.  A subsequent access returns
  existing data without faulting.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/memory.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 9385842c35034..7ba1221c63792 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1983,9 +1983,18 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
 	do {
 		next = pmd_addr_end(addr, end);
 		if (pmd_is_huge(*pmd)) {
-			if (next - addr != HPAGE_PMD_SIZE)
-				__split_huge_pmd(vma, pmd, addr, false);
-			else if (zap_huge_pmd(tlb, vma, pmd, addr)) {
+			if (next - addr != HPAGE_PMD_SIZE) {
+				/*
+				 * If split fails, the PMD stays huge.
+				 * Skip the range to avoid falling through
+				 * to zap_pte_range, which would treat the
+				 * huge PMD entry as a page table pointer.
+				 */
+				if (__split_huge_pmd(vma, pmd, addr, false)) {
+					addr = next;
+					continue;
+				}
+			} else if (zap_huge_pmd(tlb, vma, pmd, addr)) {
 				addr = next;
 				continue;
 			}
-- 
2.47.3


