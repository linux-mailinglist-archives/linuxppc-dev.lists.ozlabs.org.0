Return-Path: <linuxppc-dev+bounces-17255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEN5IOwvoGmLgAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:35:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 990FB1A51FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:35:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM8W60zw0z30T8;
	Thu, 26 Feb 2026 22:34:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.186
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772105666;
	cv=none; b=Eu2tdNE2r13MK8cEWdIRBsJEI9wQynm6tmOArilDDA56P3hhjC4eErXZCm1cehWFPRTjXxsk4MTwifzA/DRVYISEqW1zjPCtqDD333yfeQ1gO8pv9eiaCtO9l07wTO7h9ldixEyWOw1UGfqKxNzZp7o0Vb/GVDLp32WiWVjyCj8Jdmrjj5WPOj5kwke2ef1Y/xpUrk5APmIFRgcslI3wI8ERhsb22Lt0WUxZ2dNLaEIOTwx5RiN5Mn2KD+Uakl4JmSvMqt2scXyZNIAItqvPV+02ISGe5KsiHD9gSmuXiAjtR3jrvucg/bdaoA83AqeBq/lW6kiB8sVWM/pWbNe+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772105666; c=relaxed/relaxed;
	bh=c14WgMu6/15qhuICdOLPBmddgsK8PG21SZ4l5q+gLlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKqI9Q5X8e+fZ6UiiC/DqjrUElEKQZxcuguFzQpsd4ia2trgmrH4Po/CpZdGtlrM54C7lwynTG7NT7re+Uh56NnmwJU+Pj5m5w12PFO3RrXafRQ/8BVELeR2/XMNPa0RCeyWQK8w73Z/9a9wkXzHwrs/G16Q1GUdMUPwZCaDQqmyxMlLZPYsCnZcmYUhcy4ibRF8+nbOwERvOJiNFnY2IQ8soAEa0P99TjPoSppPUrB/a/xxQ7vPyEe0nCtBBrcVplmNVE3BwRC+QGqzQKZkm/ZCJc1+OqyRKf3ZLzUZIm+3X7CfYGsDAAKnaFnMTQlXtU2EBTn0Udyu5q3wCg3bHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IWSKImJr; dkim-atps=neutral; spf=pass (client-ip=91.218.175.186; helo=out-186.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IWSKImJr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.186; helo=out-186.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM8W533xNz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:34:25 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772105646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c14WgMu6/15qhuICdOLPBmddgsK8PG21SZ4l5q+gLlo=;
	b=IWSKImJr/lhTtq+7dWWCDBff/3vlsDJfZ5E4/kWREeiGjoKal7G4aXUV6deMVpg27q/Yop
	OTsn9HimEI/nuXkSIAWQ1bqJnFpUQRDmLiv4z/EhIzmdzFMMJB1Z54wZ7psaJRXtZ10qtQ
	reVy6qgPIMnhvu7EHAlifyWC4llEGMo=
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
Subject: [RFC v2 12/21] mm: thp: handle split failure in device migration
Date: Thu, 26 Feb 2026 03:23:41 -0800
Message-ID: <20260226113233.3987674-13-usama.arif@linux.dev>
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
	TAGGED_FROM(0.00)[bounces-17255-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 990FB1A51FE
X-Rspamd-Action: no action

Device memory migration has two call sites that split huge PMDs:

migrate_vma_split_unmapped_folio():
  Called from migrate_vma_pages() when migrating a PMD-mapped THP to a
  destination that doesn't support compound pages.  It splits the PMD
  then splits the folio via folio_split_unmapped().

  If the PMD split fails, folio_split_unmapped() would operate on an
  unsplit folio with inconsistent page table state.  Propagate -ENOMEM
  to skip this page's migration. This is safe as folio_split_unmapped
  failure would be propagated in a similar way.

migrate_vma_insert_page():
  Called from migrate_vma_pages() when inserting a page into a VMA
  during migration back from device memory.  If a huge zero PMD exists
  at the target address, it must be split before PTE insertion.

  If the split fails, the subsequent pte_alloc() and set_pte_at() would
  operate on a PMD slot still occupied by the huge zero entry.  Use
  goto abort, consistent with other allocation failures in this function.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/migrate_device.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 78c7acf024615..bc53e06fd9735 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -909,7 +909,13 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
 	int ret = 0;
 
 	folio_get(folio);
-	split_huge_pmd_address(migrate->vma, addr, true);
+	/*
+	 * If PMD split fails, folio_split_unmapped would operate on an
+	 * unsplit folio with inconsistent page table state.
+	 */
+	ret = split_huge_pmd_address(migrate->vma, addr, true);
+	if (ret)
+		return ret;
 	ret = folio_split_unmapped(folio, 0);
 	if (ret)
 		return ret;
@@ -1005,7 +1011,13 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 		if (pmd_trans_huge(*pmdp)) {
 			if (!is_huge_zero_pmd(*pmdp))
 				goto abort;
-			split_huge_pmd(vma, pmdp, addr);
+			/*
+			 * If split fails, the huge zero PMD remains and
+			 * pte_alloc/PTE insertion that follows would be
+			 * incorrect.
+			 */
+			if (split_huge_pmd(vma, pmdp, addr))
+				goto abort;
 		} else if (pmd_leaf(*pmdp))
 			goto abort;
 	}
-- 
2.47.3


