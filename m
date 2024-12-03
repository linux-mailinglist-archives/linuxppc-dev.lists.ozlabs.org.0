Return-Path: <linuxppc-dev+bounces-3700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB499E15F9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 09:38:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Yw05XL1z302W;
	Tue,  3 Dec 2024 19:38:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733215120;
	cv=none; b=nDD9Udouq4WMffcW9/gWqLMT/Pg6JIMm/wm0Mm309w85kwhrtamGhxkXwO9v7Gb+nWXHlx3MYDQuSSBFZABxqtwOQsn/ZVcIrZHRsbnjvOBZdu+ilVTd1hq8rRtkPpwy6EpBS6g0cBmwCCEBtfiaaIgBzfkb02A5ngV9IH++nDohzDIx4heNR03vnDXMubzXtgFKfbBOh14KhSo7/ZHa9cS3429j5IkjdmD8OnF/0+J1kCUP1T0berolaajbbsxgw8ARELu0gdFGvYstdyRupmB9Lv7h1A6kMldlHux77TkF8tCxo4so1dGZqDOXKf3no09AdlIjm6MTqq13dFsdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733215120; c=relaxed/relaxed;
	bh=xX/Q3/3Rp0ILyMXyKGOcZrJDDur/TZdwfSuBal5fAnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZDU4ZclXdU6a5X8QybiSoD+JMysW6mZ5/fkwuUxzP8Uk4UgmSjiJzD4O2cDFkrC0Z+mxozfap0UCMvlXsfGHfl0diB0/Oxb4Eju7zqxsxxQ+u3v/0OGhQq8jNmfzPMvhPqnQrvj8uqYn6fPxmoV83Fq9z9fq7SCVXIOvBpf8c349nNXvHWMexpRqcf4CDXShgUhTpwQDS9kTBWTW4IWfolDp6WZXp9rJ1QwdjWbtrclCxf1dBqS09ZjVhijdXAoz5qrpd+8jVGpDFVtDtKnEx4HXnKDz2OT3tBhlekvC4xwNATht1QCyC4YYV9S/mOgqEg4d7arWlLAhG5xF8Bing==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VI88z8cq; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VI88z8cq; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VI88z8cq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VI88z8cq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Yvz6j0lz302c
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 19:38:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733215117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xX/Q3/3Rp0ILyMXyKGOcZrJDDur/TZdwfSuBal5fAnM=;
	b=VI88z8cqcxbM5SrsNZ9WFmwTuNfE0vfs3p3ElxphWWZUQUhxy7hCCbPJqVB+AaYK2/DMaY
	aFqfGl5ghKb7gqf5HKcex4M+TMDZspyVntkhRPmGG+9jdxGc76MkqDp0DdGMHurESO2xGy
	LNV+AK1898Pe/kZ3MO9DI2GRJUlBcNE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733215117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xX/Q3/3Rp0ILyMXyKGOcZrJDDur/TZdwfSuBal5fAnM=;
	b=VI88z8cqcxbM5SrsNZ9WFmwTuNfE0vfs3p3ElxphWWZUQUhxy7hCCbPJqVB+AaYK2/DMaY
	aFqfGl5ghKb7gqf5HKcex4M+TMDZspyVntkhRPmGG+9jdxGc76MkqDp0DdGMHurESO2xGy
	LNV+AK1898Pe/kZ3MO9DI2GRJUlBcNE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-519-KIBg8WfaPjq4ggDyQfJJqQ-1; Tue,
 03 Dec 2024 03:38:35 -0500
X-MC-Unique: KIBg8WfaPjq4ggDyQfJJqQ-1
X-Mimecast-MFC-AGG-ID: KIBg8WfaPjq4ggDyQfJJqQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B9DE1956058;
	Tue,  3 Dec 2024 08:38:34 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.22.88.109])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D4C0930001A0;
	Tue,  3 Dec 2024 08:38:29 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v2 6/6] powernv/memtrace: use __GFP_ZERO with alloc_contig_pages()
Date: Tue,  3 Dec 2024 09:37:56 +0100
Message-ID: <20241203083756.112975-7-david@redhat.com>
In-Reply-To: <20241203083756.112975-1-david@redhat.com>
References: <20241203083756.112975-1-david@redhat.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

alloc_contig_pages()->alloc_contig_range() now supports __GFP_ZERO,
so let's use that instead to resolve our TODO.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/memtrace.c | 31 +++++------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 877720c64515..4ac9808e55a4 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -88,26 +88,6 @@ static void flush_dcache_range_chunked(unsigned long start, unsigned long stop,
 	}
 }
 
-static void memtrace_clear_range(unsigned long start_pfn,
-				 unsigned long nr_pages)
-{
-	unsigned long pfn;
-
-	/* As HIGHMEM does not apply, use clear_page() directly. */
-	for (pfn = start_pfn; pfn < start_pfn + nr_pages; pfn++) {
-		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
-			cond_resched();
-		clear_page(__va(PFN_PHYS(pfn)));
-	}
-	/*
-	 * Before we go ahead and use this range as cache inhibited range
-	 * flush the cache.
-	 */
-	flush_dcache_range_chunked((unsigned long)pfn_to_kaddr(start_pfn),
-				   (unsigned long)pfn_to_kaddr(start_pfn + nr_pages),
-				   FLUSH_CHUNK_SIZE);
-}
-
 static u64 memtrace_alloc_node(u32 nid, u64 size)
 {
 	const unsigned long nr_pages = PHYS_PFN(size);
@@ -119,17 +99,18 @@ static u64 memtrace_alloc_node(u32 nid, u64 size)
 	 * by alloc_contig_pages().
 	 */
 	page = alloc_contig_pages(nr_pages, GFP_KERNEL | __GFP_THISNODE |
-				  __GFP_NOWARN, nid, NULL);
+				  __GFP_NOWARN | __GFP_ZERO, nid, NULL);
 	if (!page)
 		return 0;
 	start_pfn = page_to_pfn(page);
 
 	/*
-	 * Clear the range while we still have a linear mapping.
-	 *
-	 * TODO: use __GFP_ZERO with alloc_contig_pages() once supported.
+	 * Before we go ahead and use this range as cache inhibited range
+	 * flush the cache.
 	 */
-	memtrace_clear_range(start_pfn, nr_pages);
+	flush_dcache_range_chunked((unsigned long)pfn_to_kaddr(start_pfn),
+				   (unsigned long)pfn_to_kaddr(start_pfn + nr_pages),
+				   FLUSH_CHUNK_SIZE);
 
 	/*
 	 * Set pages PageOffline(), to indicate that nobody (e.g., hibernation,
-- 
2.47.1


