Return-Path: <linuxppc-dev+bounces-17250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD2BHMYvoGkrgAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:34:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64D1A51A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:34:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM8Vh4L2Vz2yrW;
	Thu, 26 Feb 2026 22:34:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772105644;
	cv=none; b=SoU4s1/VqnUfBM8uzoQQ+Lwjwu8olPpq35SZaOHZWVbA0XMX4RpnRfFBiTtv1f0jVjJLstObtkVQgPz810nIEH0ZfagNL3J4iTIGbYB/t2/q01TkQaj5vx2qO9DEsJ5KQHzu0IPB0z18TQJFZwgcuNDSKyvCM5KvuR0gv3q6yOl9HBEVuxSKhSfoCOn8VJMEKmeWQAQIy4wo41FstSuH9B8NOzITrB1qBPTyfQXCcapuuEjOxKT5a/bzCur/DHknFckCDolwQT2iPCbWHnkY8QWyrxZ0ptCOlOrtHiZg8ePAHIXzz35VzgWM6I8aAUvm5TiZMN2mOcr3Mm+8weVx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772105644; c=relaxed/relaxed;
	bh=HW5NR2wuAB2pCKpIclCqiHUIfVFdsbldp3G0DhmGrt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y8uLC9NBG10jr45Y9f6+eS9utg6na3mTa+h6g8GckNg8YivGYIQqYReIzxFxXPUFmVuHkZUrmMNH2MZ1BNTmGChrLkyqQC8dgvIv9QsJk+qWW8YfBxHyeuwLHDJksArE4gz94xEokDN5mG/56ym4ZH53Yp6oO6Xhjh70yM2EV+MLdqfaq/0apRFFneETx1snksrM7bU89L0kc/j2Ra2CARTSj/7IjL9p2H1mk/skTIOFFOcY06CvltFO8px2OGKQExEDxwIQXy/Ob+USOHOj9m2O54382ndXcUNkDLbgmgWIrHOgoPtPf8IItcGHp01IBEvRBwM/BtSRouEpIoKQdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RzdiMKp1; dkim-atps=neutral; spf=pass (client-ip=95.215.58.179; helo=out-179.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RzdiMKp1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.179; helo=out-179.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM8Vg5f1cz2yqs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:34:03 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772105620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HW5NR2wuAB2pCKpIclCqiHUIfVFdsbldp3G0DhmGrt0=;
	b=RzdiMKp1lP+byHUz7l0eKCj1eX9Ut37lQaDPNj8KBcBVLlesiFHpqHK5Ah8iyhlMOrVaW8
	bKBZ75Ay6+l6RYyt5Y/uNJyEGcxJ4zFpSZ6y9Ko1EHA6ZJ6Q6nV1TPDvRsz7Z/op/nwRKq
	NXqpxWMbKJY4XmDlR6gubAl3bFel52M=
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
Subject: [RFC v2 07/21] mm: thp: retry on split failure in change_pmd_range()
Date: Thu, 26 Feb 2026 03:23:36 -0800
Message-ID: <20260226113233.3987674-8-usama.arif@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17250-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 7B64D1A51A9
X-Rspamd-Action: no action

change_pmd_range() splits a huge PMD when mprotect() targets a sub-PMD
range or when VMA flags require per-PTE protection bits that can't be
represented at PMD granularity.

If pte_alloc_one() fails inside __split_huge_pmd(), the huge PMD remains
intact. Without this change, change_pte_range() would return -EAGAIN
because pte_offset_map_lock() returns NULL for a huge PMD, sending the
code back to the 'again' label to retry the split—without ever calling
cond_resched().

Now that __split_huge_pmd() returns an error code, handle it explicitly:
yield the CPU with cond_resched() and retry via goto again, giving other
tasks a chance to free memory.

Trying to return an error all the way to change_protection_range would
not work as it would leave a memory range with new protections, and
others unchanged, with no easy way to roll back the already modified
entries (and previous splits). __split_huge_pmd only requires an
order-0 allocation and is extremely unlikely to fail.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/mprotect.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 9681f055b9fca..599d80a7d6969 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -477,7 +477,16 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
 		if (pmd_is_huge(_pmd)) {
 			if ((next - addr != HPAGE_PMD_SIZE) ||
 			    pgtable_split_needed(vma, cp_flags)) {
-				__split_huge_pmd(vma, pmd, addr, false);
+				ret = __split_huge_pmd(vma, pmd, addr, false);
+				if (ret) {
+					/*
+					 * Yield and retry. Other tasks
+					 * may free memory while we
+					 * reschedule.
+					 */
+					cond_resched();
+					goto again;
+				}
 				/*
 				 * For file-backed, the pmd could have been
 				 * cleared; make sure pmd populated if
-- 
2.47.3


