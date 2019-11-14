Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A15FC7D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 14:37:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DMwB1bQHzDqj4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 00:36:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="A1AXm7TQ"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DMXH1NKHzF7x2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 00:19:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573737579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVZa0sxBAr5GLog3z93mUnxYYBt4TLTYdErwxGV0hQ4=;
 b=A1AXm7TQUD31s7NKfNk8Rluf69/yceYhvoJIdvWdmxfHfk7wW/lBBmjHFIzpun1UHMH+sD
 Ew8VfXEuwQnC/45wTmKXEljviNzDS7U//Pamc9xgSRP+sC94OQaO9dmTqpIAxf+oz2x+MO
 2mA9o9DI9gDWpiP1P6EfW4eK6Ch51+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-K6qcfvHpPJ6VbumW4OQ1Zw-1; Thu, 14 Nov 2019 08:19:34 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43B238033CF;
 Thu, 14 Nov 2019 13:19:31 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-13.ams2.redhat.com [10.36.117.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0484A10013D9;
 Thu, 14 Nov 2019 13:19:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mm: remove "count" parameter from has_unmovable_pages()
Date: Thu, 14 Nov 2019 14:19:11 +0100
Message-Id: <20191114131911.11783-3-david@redhat.com>
In-Reply-To: <20191114131911.11783-1-david@redhat.com>
References: <20191114131911.11783-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: K6qcfvHpPJ6VbumW4OQ1Zw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Hocko <mhocko@suse.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 David Hildenbrand <david@redhat.com>, Mel Gorman <mgorman@techsingularity.net>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Pingfan Liu <kernelfans@gmail.com>, linux-mm@kvack.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Qian Cai <cai@lca.pw>,
 Wei Yang <richardw.yang@linux.intel.com>, Arun KS <arunks@codeaurora.org>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the memory isolate notifier is gone, the parameter is always 0.
Drop it and cleanup has_unmovable_pages().

Cc: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Qian Cai <cai@lca.pw>
Cc: Pingfan Liu <kernelfans@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Arun KS <arunks@codeaurora.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-isolation.h |  4 ++--
 mm/memory_hotplug.c            |  2 +-
 mm/page_alloc.c                | 21 +++++++--------------
 mm/page_isolation.c            |  2 +-
 4 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.=
h
index 6861df759fad..148e65a9c606 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -33,8 +33,8 @@ static inline bool is_migrate_isolate(int migratetype)
 #define MEMORY_OFFLINE=090x1
 #define REPORT_FAILURE=090x2
=20
-bool has_unmovable_pages(struct zone *zone, struct page *page, int count,
-=09=09=09 int migratetype, int flags);
+bool has_unmovable_pages(struct zone *zone, struct page *page, int migrate=
type,
+=09=09=09 int flags);
 void set_pageblock_migratetype(struct page *page, int migratetype);
 int move_freepages_block(struct zone *zone, struct page *page,
 =09=09=09=09int migratetype, int *num_movable);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 3b5cee4d3f4e..f06d33748607 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1158,7 +1158,7 @@ static bool is_pageblock_removable_nolock(unsigned lo=
ng pfn)
 =09if (!zone_spans_pfn(zone, pfn))
 =09=09return false;
=20
-=09return !has_unmovable_pages(zone, page, 0, MIGRATE_MOVABLE,
+=09return !has_unmovable_pages(zone, page, MIGRATE_MOVABLE,
 =09=09=09=09    MEMORY_OFFLINE);
 }
=20
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index f5ecbacb0e04..e4d8f3a1a6b6 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8270,17 +8270,15 @@ void *__init alloc_large_system_hash(const char *ta=
blename,
=20
 /*
  * This function checks whether pageblock includes unmovable pages or not.
- * If @count is not zero, it is okay to include less @count unmovable page=
s
  *
  * PageLRU check without isolation or lru_lock could race so that
  * MIGRATE_MOVABLE block might include unmovable pages. And __PageMovable
  * check without lock_page also may miss some movable non-lru pages at
  * race condition. So you can't expect this function should be exact.
  */
-bool has_unmovable_pages(struct zone *zone, struct page *page, int count,
-=09=09=09 int migratetype, int flags)
+bool has_unmovable_pages(struct zone *zone, struct page *page, int migrate=
type,
+=09=09=09 int flags)
 {
-=09unsigned long found;
 =09unsigned long iter =3D 0;
 =09unsigned long pfn =3D page_to_pfn(page);
 =09const char *reason =3D "unmovable page";
@@ -8306,13 +8304,11 @@ bool has_unmovable_pages(struct zone *zone, struct =
page *page, int count,
 =09=09goto unmovable;
 =09}
=20
-=09for (found =3D 0; iter < pageblock_nr_pages; iter++) {
-=09=09unsigned long check =3D pfn + iter;
-
-=09=09if (!pfn_valid_within(check))
+=09for (; iter < pageblock_nr_pages; iter++) {
+=09=09if (!pfn_valid_within(pfn + iter))
 =09=09=09continue;
=20
-=09=09page =3D pfn_to_page(check);
+=09=09page =3D pfn_to_page(pfn + iter);
=20
 =09=09if (PageReserved(page))
 =09=09=09goto unmovable;
@@ -8361,11 +8357,9 @@ bool has_unmovable_pages(struct zone *zone, struct p=
age *page, int count,
 =09=09if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
 =09=09=09continue;
=20
-=09=09if (__PageMovable(page))
+=09=09if (__PageMovable(page) || PageLRU(page))
 =09=09=09continue;
=20
-=09=09if (!PageLRU(page))
-=09=09=09found++;
 =09=09/*
 =09=09 * If there are RECLAIMABLE pages, we need to check
 =09=09 * it.  But now, memory offline itself doesn't call
@@ -8379,8 +8373,7 @@ bool has_unmovable_pages(struct zone *zone, struct pa=
ge *page, int count,
 =09=09 * is set to both of a memory hole page and a _used_ kernel
 =09=09 * page at boot.
 =09=09 */
-=09=09if (found > count)
-=09=09=09goto unmovable;
+=09=09goto unmovable;
 =09}
 =09return false;
 unmovable:
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 21af88b718aa..1f8b9dfecbe8 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -37,7 +37,7 @@ static int set_migratetype_isolate(struct page *page, int=
 migratetype, int isol_
 =09 * FIXME: Now, memory hotplug doesn't call shrink_slab() by itself.
 =09 * We just check MOVABLE pages.
 =09 */
-=09if (!has_unmovable_pages(zone, page, 0, migratetype, isol_flags)) {
+=09if (!has_unmovable_pages(zone, page, migratetype, isol_flags)) {
 =09=09unsigned long nr_pages;
 =09=09int mt =3D get_pageblock_migratetype(page);
=20
--=20
2.21.0

