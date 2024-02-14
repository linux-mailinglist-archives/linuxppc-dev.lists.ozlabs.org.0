Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D75855457
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 21:51:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=er1KdVDD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C7sTOd0A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZr2m3k6Dz3vrn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 07:51:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=er1KdVDD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C7sTOd0A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZqvn6HxCz3vX9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 07:45:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707943522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pRS8kYaXs4+JoUa7KvLCUnXcrqNWL6ZvqI66J3j2gDY=;
	b=er1KdVDDSz7xQAFEHcwJm6DWl9aiGIxTHXGaDzrPQyjgUVS39A8ix1UgYR60JHcBOsMUMX
	ohxKay9lw0kGgYZLWVD165lzO2qqa8ieIpjDPjSHLqHmaUbl/D0aBFXVVOlfPnDWgDoi+T
	NEgc4azVxbtuOT6byB1+I/b33Yb6dqk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707943523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pRS8kYaXs4+JoUa7KvLCUnXcrqNWL6ZvqI66J3j2gDY=;
	b=C7sTOd0AAltuL91GX3JE4gHANjZjf16OKvvlqXhnf/reqcAt6AhGu7NcH96krPA360KbI4
	dibbLpeBLdLiKwZrWK6Bg8T77CpKjZmvPzPA6OX66WzYEX+5vlcWTVQaEUo0JwFTLtnK+7
	JtjQEVcp+ED+cuKf9H/GRZ//Bg3PqOQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-lVXRetU-PDCixQSdYcx5pA-1; Wed, 14 Feb 2024 15:45:18 -0500
X-MC-Unique: lVXRetU-PDCixQSdYcx5pA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 503D9101A52A;
	Wed, 14 Feb 2024 20:45:17 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.174])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8ECBC1C05E0F;
	Wed, 14 Feb 2024 20:45:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/10] mm/mmu_gather: improve cond_resched() handling with large folios and expensive page freeing
Date: Wed, 14 Feb 2024 21:44:34 +0100
Message-ID: <20240214204435.167852-10-david@redhat.com>
In-Reply-To: <20240214204435.167852-1-david@redhat.com>
References: <20240214204435.167852-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, Yin Fengwei <fengwei.yin@intel.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In tlb_batch_pages_flush(), we can end up freeing up to 512 pages or
now up to 256 folio fragments that span more than one page, before we
conditionally reschedule.

It's a pain that we have to handle cond_resched() in
tlb_batch_pages_flush() manually and cannot simply handle it in
release_pages() -- release_pages() can be called from atomic context.
Well, in a perfect world we wouldn't have to make our code more
complicated at all.

With page poisoning and init_on_free, we might now run into soft lockups
when we free a lot of rather large folio fragments, because page freeing
time then depends on the actual memory size we are freeing instead of on
the number of folios that are involved.

In the absolute (unlikely) worst case, on arm64 with 64k we will be able
to free up to 256 folio fragments that each span 512 MiB: zeroing out 128
GiB does sound like it might take a while. But instead of ignoring this
unlikely case, let's just handle it.

So, let's teach tlb_batch_pages_flush() that there are some
configurations where page freeing is horribly slow, and let's reschedule
more frequently -- similarly like we did for now before we had large folio
fragments in there. Avoid yet another loop over all encoded pages in the
common case by handling that separately.

Note that with page poisoning/zeroing, we might now end up freeing only a
single folio fragment at a time that might exceed the old 512 pages limit:
but if we cannot even free a single MAX_ORDER page on a system without
running into soft lockups, something else is already completely bogus.
Freeing a PMD-mapped THP would similarly cause trouble.

In theory, we might even free 511 order-0 pages + a single MAX_ORDER page,
effectively having to zero out 8703 pages on arm64 with 64k, translating to
~544 MiB of memory: however, if 512 MiB doesn't result in soft lockups,
544 MiB is unlikely to result in soft lockups, so we won't care about
that for the time being.

In the future, we might want to detect if handling cond_resched() is
required at all, and just not do any of that with full preemption enabled.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/mmu_gather.c | 58 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index d175c0f1e2c8..99b3e9408aa0 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -91,18 +91,21 @@ void tlb_flush_rmaps(struct mmu_gather *tlb, struct vm_area_struct *vma)
 }
 #endif
 
-static void tlb_batch_pages_flush(struct mmu_gather *tlb)
-{
-	struct mmu_gather_batch *batch;
+/*
+ * We might end up freeing a lot of pages. Reschedule on a regular
+ * basis to avoid soft lockups in configurations without full
+ * preemption enabled. The magic number of 512 folios seems to work.
+ */
+#define MAX_NR_FOLIOS_PER_FREE		512
 
-	for (batch = &tlb->local; batch && batch->nr; batch = batch->next) {
-		struct encoded_page **pages = batch->encoded_pages;
+static void __tlb_batch_free_encoded_pages(struct mmu_gather_batch *batch)
+{
+	struct encoded_page **pages = batch->encoded_pages;
+	unsigned int nr, nr_pages;
 
-		while (batch->nr) {
-			/*
-			 * limit free batch count when PAGE_SIZE > 4K
-			 */
-			unsigned int nr = min(512U, batch->nr);
+	while (batch->nr) {
+		if (!page_poisoning_enabled_static() && !want_init_on_free()) {
+			nr = min(MAX_NR_FOLIOS_PER_FREE, batch->nr);
 
 			/*
 			 * Make sure we cover page + nr_pages, and don't leave
@@ -111,14 +114,39 @@ static void tlb_batch_pages_flush(struct mmu_gather *tlb)
 			if (unlikely(encoded_page_flags(pages[nr - 1]) &
 				     ENCODED_PAGE_BIT_NR_PAGES_NEXT))
 				nr++;
+		} else {
+			/*
+			 * With page poisoning and init_on_free, the time it
+			 * takes to free memory grows proportionally with the
+			 * actual memory size. Therefore, limit based on the
+			 * actual memory size and not the number of involved
+			 * folios.
+			 */
+			for (nr = 0, nr_pages = 0;
+			     nr < batch->nr && nr_pages < MAX_NR_FOLIOS_PER_FREE;
+			     nr++) {
+				if (unlikely(encoded_page_flags(pages[nr]) &
+					     ENCODED_PAGE_BIT_NR_PAGES_NEXT))
+					nr_pages += encoded_nr_pages(pages[++nr]);
+				else
+					nr_pages++;
+			}
+		}
 
-			free_pages_and_swap_cache(pages, nr);
-			pages += nr;
-			batch->nr -= nr;
+		free_pages_and_swap_cache(pages, nr);
+		pages += nr;
+		batch->nr -= nr;
 
-			cond_resched();
-		}
+		cond_resched();
 	}
+}
+
+static void tlb_batch_pages_flush(struct mmu_gather *tlb)
+{
+	struct mmu_gather_batch *batch;
+
+	for (batch = &tlb->local; batch && batch->nr; batch = batch->next)
+		__tlb_batch_free_encoded_pages(batch);
 	tlb->active = &tlb->local;
 }
 
-- 
2.43.0

