Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E514088C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 11:59:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zdPP4mlPzDqpB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 21:59:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=M1Oh/bIj; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zdMc2pMwzDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 21:58:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579258696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pfb7ZqQ08slR2j6b3nkPpigirqDHm9QWjl/R0SsgtyU=;
 b=M1Oh/bIjH1exRu4qFdu1Olk8/8F4Un5bylx4YXTM83PqU/QvHI082Nwk/ubMVVBy/RNujO
 +PPg76vrBm9iglK5uL9TKcUkn2h2sb+ejx5rRD52fJzKn4Rrj+p+/p6h7ddTZXqi//pVLP
 bX8LXn1l+t/wCwACghMqqKiJvL6zq3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-Y1B2syKMNCWezWBqhccdsA-1; Fri, 17 Jan 2020 05:58:12 -0500
X-MC-Unique: Y1B2syKMNCWezWBqhccdsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB8D118C43E5;
 Fri, 17 Jan 2020 10:58:08 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-116-244.ams2.redhat.com [10.36.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7254845D2;
 Fri, 17 Jan 2020 10:57:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
Date: Fri, 17 Jan 2020 11:57:59 +0100
Message-Id: <20200117105759.27905-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Michal Hocko <mhocko@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leonardo@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Allison Randal <allison@lohutok.net>, lantianyu1986@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's refactor that code. We want to check if we can offline memory
blocks. Add a new function is_mem_section_offlineable() for that and
make it call is_mem_section_offlineable() for each contained section.
Within is_mem_section_offlineable(), add some more sanity checks and
directly bail out if the section contains holes or if it spans multiple
zones.

The old code was inherently racy with concurrent offlining/memory
unplug. Let's avoid that and grab the device_hotplug_lock. Luckily
we are already holding it when calling from powerpc code.

Note1: If somebody wants to export this function for use in driver code, =
we
need a variant that takes the device_hotplug_lock()

Note2: If we could have a zombie device (not clear yet), the present
section checks would properly bail out early.

Note3: I'd prefer the mem_hotplug_lock in read, but as we are about to
change the locking on the removal path (IOW, don't hold it when removing
memory block devices), I do not want to go down that path.

Note4: For now we would have returned "removable" although we would
block offlining due to memory holes, multiple zones, or missing
sections.

Tested with DIMMs on x86-64. Compile-tested on Power.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Leonardo Bras <leonardo@linux.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Allison Randal <allison@lohutok.net>
Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: lantianyu1986@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 .../platforms/pseries/hotplug-memory.c        | 24 ++-----
 drivers/base/memory.c                         | 37 ++++++----
 include/linux/memory.h                        |  1 +
 include/linux/memory_hotplug.h                |  5 +-
 mm/memory_hotplug.c                           | 68 +++++++++----------
 5 files changed, 67 insertions(+), 68 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
index c126b94d1943..8d80159465e4 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -337,34 +337,24 @@ static int pseries_remove_mem_node(struct device_no=
de *np)
=20
 static bool lmb_is_removable(struct drmem_lmb *lmb)
 {
-	int i, scns_per_block;
-	bool rc =3D true;
-	unsigned long pfn, block_sz;
-	u64 phys_addr;
+	struct memory_block *mem;
+	bool rc =3D false;
=20
 	if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
 		return false;
=20
-	block_sz =3D memory_block_size_bytes();
-	scns_per_block =3D block_sz / MIN_MEMORY_BLOCK_SIZE;
-	phys_addr =3D lmb->base_addr;
-
 #ifdef CONFIG_FA_DUMP
 	/*
 	 * Don't hot-remove memory that falls in fadump boot memory area
 	 * and memory that is reserved for capturing old kernel memory.
 	 */
-	if (is_fadump_memory_area(phys_addr, block_sz))
+	if (is_fadump_memory_area(lmb->base_addr,  memory_block_size_bytes()))
 		return false;
 #endif
-
-	for (i =3D 0; i < scns_per_block; i++) {
-		pfn =3D PFN_DOWN(phys_addr);
-		if (!pfn_present(pfn))
-			continue;
-
-		rc =3D rc && is_mem_section_removable(pfn, PAGES_PER_SECTION);
-		phys_addr +=3D MIN_MEMORY_BLOCK_SIZE;
+	mem =3D lmb_to_memblock(lmb);
+	if (mem) {
+		rc =3D is_memory_block_offlineable(mem);
+		put_device(&mem->dev);
 	}
=20
 	return rc;
diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index c6d288fad493..f744250c34d0 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -104,6 +104,25 @@ static ssize_t phys_index_show(struct device *dev,
 	return sprintf(buf, "%08lx\n", phys_index);
 }
=20
+/*
+ * Test if a memory block is likely to be offlineable. Returns true if
+ * the block is already offline.
+ *
+ * Called under device_hotplug_lock.
+ */
+bool is_memory_block_offlineable(struct memory_block *mem)
+{
+	int i;
+
+	if (mem->state !=3D MEM_ONLINE)
+		return true;
+
+	for (i =3D 0; i < sections_per_block; i++)
+		if (!is_mem_section_offlineable(mem->start_section_nr + i))
+			return false;
+	return true;
+}
+
 /*
  * Show whether the memory block is likely to be offlineable (or is alre=
ady
  * offline). Once offline, the memory block could be removed. The return
@@ -114,20 +133,14 @@ static ssize_t removable_show(struct device *dev, s=
truct device_attribute *attr,
 			      char *buf)
 {
 	struct memory_block *mem =3D to_memory_block(dev);
-	unsigned long pfn;
-	int ret =3D 1, i;
-
-	if (mem->state !=3D MEM_ONLINE)
-		goto out;
+	int ret;
=20
-	for (i =3D 0; i < sections_per_block; i++) {
-		if (!present_section_nr(mem->start_section_nr + i))
-			continue;
-		pfn =3D section_nr_to_pfn(mem->start_section_nr + i);
-		ret &=3D is_mem_section_removable(pfn, PAGES_PER_SECTION);
-	}
+	ret =3D lock_device_hotplug_sysfs();
+	if (ret)
+		return ret;
+	ret =3D is_memory_block_offlineable(mem);
+	unlock_device_hotplug();
=20
-out:
 	return sprintf(buf, "%d\n", ret);
 }
=20
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 0b8d791b6669..faf03eb64ecc 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -91,6 +91,7 @@ typedef int (*walk_memory_blocks_func_t)(struct memory_=
block *, void *);
 extern int walk_memory_blocks(unsigned long start, unsigned long size,
 			      void *arg, walk_memory_blocks_func_t func);
 extern int for_each_memory_block(void *arg, walk_memory_blocks_func_t fu=
nc);
+extern bool is_memory_block_offlineable(struct memory_block *mem);
 #define CONFIG_MEM_BLOCK_SIZE	(PAGES_PER_SECTION<<PAGE_SHIFT)
 #endif /* CONFIG_MEMORY_HOTPLUG_SPARSE */
=20
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplu=
g.h
index f4d59155f3d4..8d087772f748 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -306,15 +306,14 @@ static inline void pgdat_resize_init(struct pglist_=
data *pgdat) {}
=20
 #ifdef CONFIG_MEMORY_HOTREMOVE
=20
-extern bool is_mem_section_removable(unsigned long pfn, unsigned long nr=
_pages);
+extern bool is_mem_section_offlineable(unsigned long nr);
 extern void try_offline_node(int nid);
 extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages=
);
 extern int remove_memory(int nid, u64 start, u64 size);
 extern void __remove_memory(int nid, u64 start, u64 size);
=20
 #else
-static inline bool is_mem_section_removable(unsigned long pfn,
-					unsigned long nr_pages)
+static inline bool is_mem_section_offlineable(unsigned long nr)
 {
 	return false;
 }
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 7a6de9b0dcab..a6d14d2b7f0c 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1128,46 +1128,51 @@ static unsigned long next_active_pageblock(unsign=
ed long pfn)
 	return pfn + pageblock_nr_pages;
 }
=20
-static bool is_pageblock_removable_nolock(unsigned long pfn)
+static int count_system_ram_pages_cb(unsigned long start_pfn,
+				     unsigned long nr_pages, void *data)
 {
-	struct page *page =3D pfn_to_page(pfn);
+	unsigned long *nr_system_ram_pages =3D data;
+
+	*nr_system_ram_pages +=3D nr_pages;
+	return 0;
+}
+
+/*
+ * Check if a section is likely to be offlineable.
+ *
+ * Called with device_hotplug_lock.
+ */
+bool is_mem_section_offlineable(unsigned long nr)
+{
+	const unsigned long start_pfn =3D section_nr_to_pfn(nr);
+	const unsigned long end_pfn =3D start_pfn + PAGES_PER_SECTION;
+	unsigned long pfn, nr_pages =3D 0;
 	struct zone *zone;
=20
-	/*
-	 * We have to be careful here because we are iterating over memory
-	 * sections which are not zone aware so we might end up outside of
-	 * the zone but still within the section.
-	 * We have to take care about the node as well. If the node is offline
-	 * its NODE_DATA will be NULL - see page_zone.
-	 */
-	if (!node_online(page_to_nid(page)))
+	if (!present_section_nr(nr))
 		return false;
-
-	zone =3D page_zone(page);
-	pfn =3D page_to_pfn(page);
-	if (!zone_spans_pfn(zone, pfn))
+	if (!online_section_nr(nr))
 		return false;
=20
-	return !has_unmovable_pages(zone, page, MIGRATE_MOVABLE,
-				    MEMORY_OFFLINE);
-}
-
-/* Checks if this range of memory is likely to be hot-removable. */
-bool is_mem_section_removable(unsigned long start_pfn, unsigned long nr_=
pages)
-{
-	unsigned long end_pfn, pfn;
+	/* we don't allow to offline sections with holes */
+	walk_system_ram_range(start_pfn, PAGES_PER_SECTION, &nr_pages,
+			      count_system_ram_pages_cb);
+	if (nr_pages !=3D PAGES_PER_SECTION)
+		return false;
=20
-	end_pfn =3D min(start_pfn + nr_pages,
-			zone_end_pfn(page_zone(pfn_to_page(start_pfn))));
+	/* we don't allow to offline sections with mixed zones/nodes */
+	zone =3D test_pages_in_a_zone(start_pfn, end_pfn);
+	if (!zone)
+		return false;
=20
-	/* Check the starting page of each pageblock within the range */
+	/* check each pageblock if it contains unmovable pages */
 	for (pfn =3D start_pfn; pfn < end_pfn; pfn =3D next_active_pageblock(pf=
n)) {
-		if (!is_pageblock_removable_nolock(pfn))
+		if (has_unmovable_pages(zone, pfn_to_page(pfn), MIGRATE_MOVABLE,
+					MEMORY_OFFLINE))
 			return false;
 		cond_resched();
 	}
=20
-	/* All pageblocks in the memory block are likely to be hot-removable */
 	return true;
 }
=20
@@ -1436,15 +1441,6 @@ static void node_states_clear_node(int node, struc=
t memory_notify *arg)
 		node_clear_state(node, N_MEMORY);
 }
=20
-static int count_system_ram_pages_cb(unsigned long start_pfn,
-				     unsigned long nr_pages, void *data)
-{
-	unsigned long *nr_system_ram_pages =3D data;
-
-	*nr_system_ram_pages +=3D nr_pages;
-	return 0;
-}
-
 static int __ref __offline_pages(unsigned long start_pfn,
 		  unsigned long end_pfn)
 {
--=20
2.24.1

