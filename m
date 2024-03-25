Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9314188A5BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:04:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ENHS7djK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ENHS7djK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3GS42KXZz3wMZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 02:04:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ENHS7djK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ENHS7djK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3GJ21QBqz3vXk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:57:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5tjcWip8Jh3x6TpRu3FCVwM3jxp/f+pF40FWxJhLLRM=;
	b=ENHS7djKbxTg5WsyNkRSR07+ufpXuz29QnlAmQbZgYdkjgPNo2CX0/ACjJiCHBXMJ4QaEY
	AHiEFZzxpEXb43Whv0CnSoCvMas3nmsJJzF1aJj3lU9glNlqe9W3q/SSmeud3KnDVbahN7
	037uLGvrA1jswWY9YFQhNVJllUP29gQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5tjcWip8Jh3x6TpRu3FCVwM3jxp/f+pF40FWxJhLLRM=;
	b=ENHS7djKbxTg5WsyNkRSR07+ufpXuz29QnlAmQbZgYdkjgPNo2CX0/ACjJiCHBXMJ4QaEY
	AHiEFZzxpEXb43Whv0CnSoCvMas3nmsJJzF1aJj3lU9glNlqe9W3q/SSmeud3KnDVbahN7
	037uLGvrA1jswWY9YFQhNVJllUP29gQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-184-pzvsJf6aPruLJH2f2paQ0g-1; Mon,
 25 Mar 2024 10:57:33 -0400
X-MC-Unique: pzvsJf6aPruLJH2f2paQ0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6BF53811F22;
	Mon, 25 Mar 2024 14:57:32 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C39653C20;
	Mon, 25 Mar 2024 14:57:29 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH v2 4/6] mm/mm_init.c: remove meaningless calculation of zone->managed_pages in free_area_init_core()
Date: Mon, 25 Mar 2024 22:56:44 +0800
Message-ID: <20240325145646.1044760-5-bhe@redhat.com>
In-Reply-To: <20240325145646.1044760-1-bhe@redhat.com>
References: <20240325145646.1044760-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: Baoquan He <bhe@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, in free_area_init_core(), when initialize zone's field, a
rough value is set to zone->managed_pages. That value is calculated by
(zone->present_pages - memmap_pages).

In the meantime, add the value to nr_all_pages and nr_kernel_pages which
represent all free pages of system (only low memory or including HIGHMEM
memory separately). Both of them are gonna be used in
alloc_large_system_hash().

However, the rough calculation and setting of zone->managed_pages is
meaningless because
  a) memmap pages are allocated on units of node in sparse_init() or
     alloc_node_mem_map(pgdat); The simple (zone->present_pages -
     memmap_pages) is too rough to make sense for zone;
  b) the set zone->managed_pages will be zeroed out and reset with
     acutal value in mem_init() via memblock_free_all(). Before the
     resetting, no buddy allocation request is issued.

Here, remove the meaningless and complicated calculation of
(zone->present_pages - memmap_pages), initialize zone->managed_pages as 0
which reflect its actual value because no any page is added into buddy
system right now. It will be reset in mem_init().

And also remove the assignment of nr_all_pages and nr_kernel_pages in
free_area_init_core(). Instead, call the newly added calc_nr_kernel_pages()
to count up all free but not reserved memory in memblock and assign to
nr_all_pages and nr_kernel_pages. The counting excludes memmap_pages,
and other kernel used data, which is more accurate than old way and
simpler, and can also cover the ppc required arch_reserved_kernel_pages()
case.

And also clean up the outdated code comment above free_area_init_core().
And free_area_init_core() is easy to understand now, no need to add
words to explain.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/mm_init.c | 46 +++++-----------------------------------------
 1 file changed, 5 insertions(+), 41 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index c57a7fc97a16..7f71e56e83f3 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1565,15 +1565,6 @@ void __ref free_area_init_core_hotplug(struct pglist_data *pgdat)
 }
 #endif
 
-/*
- * Set up the zone data structures:
- *   - mark all pages reserved
- *   - mark all memory queues empty
- *   - clear the memory bitmaps
- *
- * NOTE: pgdat should get zeroed by caller.
- * NOTE: this function is only called during early init.
- */
 static void __init free_area_init_core(struct pglist_data *pgdat)
 {
 	enum zone_type j;
@@ -1584,41 +1575,13 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
 
 	for (j = 0; j < MAX_NR_ZONES; j++) {
 		struct zone *zone = pgdat->node_zones + j;
-		unsigned long size, freesize, memmap_pages;
-
-		size = zone->spanned_pages;
-		freesize = zone->present_pages;
-
-		/*
-		 * Adjust freesize so that it accounts for how much memory
-		 * is used by this zone for memmap. This affects the watermark
-		 * and per-cpu initialisations
-		 */
-		memmap_pages = calc_memmap_size(size, freesize);
-		if (!is_highmem_idx(j)) {
-			if (freesize >= memmap_pages) {
-				freesize -= memmap_pages;
-				if (memmap_pages)
-					pr_debug("  %s zone: %lu pages used for memmap\n",
-						 zone_names[j], memmap_pages);
-			} else
-				pr_warn("  %s zone: %lu memmap pages exceeds freesize %lu\n",
-					zone_names[j], memmap_pages, freesize);
-		}
-
-		if (!is_highmem_idx(j))
-			nr_kernel_pages += freesize;
-		/* Charge for highmem memmap if there are enough kernel pages */
-		else if (nr_kernel_pages > memmap_pages * 2)
-			nr_kernel_pages -= memmap_pages;
-		nr_all_pages += freesize;
+		unsigned long size = zone->spanned_pages;
 
 		/*
-		 * Set an approximate value for lowmem here, it will be adjusted
-		 * when the bootmem allocator frees pages into the buddy system.
-		 * And all highmem pages will be managed by the buddy system.
+		 * Initialize zone->managed_pages as 0 , it will be reset
+		 * when memblock allocator frees pages into buddy system.
 		 */
-		zone_init_internals(zone, j, nid, freesize);
+		zone_init_internals(zone, j, nid, 0);
 
 		if (!size)
 			continue;
@@ -1915,6 +1878,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 		check_for_memory(pgdat);
 	}
 
+	calc_nr_kernel_pages();
 	memmap_init();
 
 	/* disable hash distribution for systems with a single node */
-- 
2.41.0

