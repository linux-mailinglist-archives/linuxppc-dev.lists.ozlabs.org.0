Return-Path: <linuxppc-dev+bounces-17263-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBziDCkwoGmLgAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17263-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:36:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874F21A5297
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:36:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM8XF6rCDz3cX3;
	Thu, 26 Feb 2026 22:35:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b6"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772105725;
	cv=none; b=WE0zyN0if1wjlxR0iZXohSLTFYSUgDtIOaqJORx4tAoq8q4Q9eytSj84yi6Ze3mb4frG4a1/Wjbe5kqSBiZ2VTVDIq/vLpePEeNj3PJgQzVerpACR0yAUlkJHeKyInFsii2w6JjmSwTYmSVaWWTWDIJA9wNEZsf7TlwMdjxQrEzLgdwvBUTnN3qGBc1ssSf0V5c8r/cNn2uh7xe9jKY3J06HxGfR0YvU48oi8VoMhJSEfIocOZpYVHFtyQ1w+RXwpaXH3O7yZMBbqWai6szCDXuJWPWQOm0eUiXYTNYoCNXPwMFXugP9IH+QK9Eyes9WQ4oyzfA535lS7Yh8XRPJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772105725; c=relaxed/relaxed;
	bh=90K3/Ap/gcMw9j71y2Oyck7qwp5+WMwh/4brt0FtyC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=guoe2/+n75hazZhvIZPpe2KMYwNHBy72A9lO4tttCFzfN61T+x0AMlAtX7P85p+tkph4clEn2/csPvd1YG0gDGLUigzzjj/VKPzR/l7LoGBKDNZ79DIUKt7UYpdNCxsSqJJ7LjvRNZ73Wc7jc3REERlyViIcSEgxsvNLqhi6yL7PAtNytnuqAcxzhlvLknaMC3BYxokOOJqwckbdrQZ1KYmPSSIUSSFcfOeYN3QLl/OrdlB3mh4/PC+YG6se3N0FssSSKiaRzTKvWDcA4h+NTl0uLmJ51O4L2Lb5OpVFIfxLGmiWwTNnFv/G5AWWEd0gJArpjLKuhM1eqRRosUzs5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vDnDtqlu; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b6; helo=out-182.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vDnDtqlu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b6; helo=out-182.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM8XF0YS7z3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:35:25 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772105706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90K3/Ap/gcMw9j71y2Oyck7qwp5+WMwh/4brt0FtyC0=;
	b=vDnDtqlus/KJ8Kb996zZEjIj0Q0OZrP9GY6JYe5v0jo/jHj6Hhvq7Y6+kbJrhcBUFwKCR+
	ptXaefkfhEcHKSCBne13vyEB9khUI5H2IRECqYMjzQXrM98xkEITpmyhzIlR8rRiLVUScp
	6fbItK2kptHjFBl0pkeiWG9RptvrStU=
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
Subject: [RFC v2 20/21] selftests/mm: add partial_mremap test for move_page_tables
Date: Thu, 26 Feb 2026 03:23:49 -0800
Message-ID: <20260226113233.3987674-21-usama.arif@linux.dev>
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
	TAGGED_FROM(0.00)[bounces-17263-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,linux.dev:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 874F21A5297
X-Rspamd-Action: no action

Add test for partial mremap on THP which exercises move_page_tables().
This verifies that partial mremap correctly splits the PMD, moves
only the requested page, and preserves data integrity in both the
moved region and the original mapping.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 .../testing/selftests/mm/thp_pmd_split_test.c | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tools/testing/selftests/mm/thp_pmd_split_test.c b/tools/testing/selftests/mm/thp_pmd_split_test.c
index 3c9f05457efec..1f29296759a5b 100644
--- a/tools/testing/selftests/mm/thp_pmd_split_test.c
+++ b/tools/testing/selftests/mm/thp_pmd_split_test.c
@@ -203,4 +203,54 @@ TEST_F(thp_pmd_split, partial_mlock)
 		self->split_pmd_failed_before);
 }
 
+/*
+ * Partial mremap (move_page_tables)
+ *
+ * Tests that partial mremap of a THP correctly splits the PMD and
+ * moves only the requested portion. This exercises move_page_tables()
+ * which now handles split failures.
+ */
+TEST_F(thp_pmd_split, partial_mremap)
+{
+	void *new_addr;
+	unsigned long *ptr = (unsigned long *)self->aligned;
+	unsigned long *new_ptr;
+	unsigned long pattern = 0xABCDUL;
+	int ret;
+
+	ret = allocate_thp(self->aligned, self->pmdsize);
+	if (ret)
+		SKIP(return, "Failed to allocate THP");
+
+	/* Write pattern to the page we'll move */
+	ptr[self->pagesize / sizeof(unsigned long)] = pattern;
+
+	/* Also write to first and last page to verify they stay intact */
+	ptr[0] = 0x1234UL;
+	ptr[(self->pmdsize - self->pagesize) / sizeof(unsigned long)] = 0x4567UL;
+
+	/* Partial mremap - move one base page from the THP */
+	new_addr = mremap((char *)self->aligned + self->pagesize, self->pagesize,
+			  self->pagesize, MREMAP_MAYMOVE);
+	if (new_addr == MAP_FAILED) {
+		if (errno == ENOMEM)
+			SKIP(return, "mremap failed with ENOMEM");
+		ASSERT_NE(new_addr, MAP_FAILED);
+	}
+
+	/* Verify data was moved correctly */
+	new_ptr = (unsigned long *)new_addr;
+	ASSERT_EQ(new_ptr[0], pattern);
+
+	/* Verify surrounding data is intact */
+	ASSERT_EQ(ptr[0], 0x1234UL);
+	ASSERT_EQ(ptr[(self->pmdsize - self->pagesize) / sizeof(unsigned long)], 0x4567UL);
+
+	/* Cleanup the moved page */
+	munmap(new_addr, self->pagesize);
+
+	log_and_check_pmd_split(_metadata, self->split_pmd_before,
+		self->split_pmd_failed_before);
+}
+
 TEST_HARNESS_MAIN
-- 
2.47.3


