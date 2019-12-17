Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6B3122C74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 14:02:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cdbd3nNRzDqX1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 00:02:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="C+C4z2Ky"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cd4N4JzfzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 23:39:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576586353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFyUkuPsqGsiw1cWJJlXr39io2FjbuA5eTJTxNYIdwY=;
 b=C+C4z2KyFdhyrDacbj9NkQZ03Ykot6DTe3vxYaOZDTIt1AOkpEIjEFJ9eZYuCUbpTva8KK
 pAsdAsnNOJaAJp1hCefwFG1fTWBTwNpDQCVCTmG10kKZNRd5p85Pk/2OXicValeYDWdARv
 nxy9B1nuDiaFwKE3n/uxBY2NgdZLISg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-b5utL5nIO3-6gvIu0j3fwA-1; Tue, 17 Dec 2019 07:39:09 -0500
X-MC-Unique: b5utL5nIO3-6gvIu0j3fwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6121A8017DF;
 Tue, 17 Dec 2019 12:39:07 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.36.118.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38AF51000325;
 Tue, 17 Dec 2019 12:39:04 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v1 3/3] powerpc/memtrace: Don't offline memory blocks via
 offline_pages()
Date: Tue, 17 Dec 2019 13:38:51 +0100
Message-Id: <20191217123851.8854-4-david@redhat.com>
In-Reply-To: <20191217123851.8854-1-david@redhat.com>
References: <20191217123851.8854-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Jens Axboe <axboe@kernel.dk>, Rashmica Gupta <rashmica.g@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

offline_pages() should not be called outside of the MM core. Especially,
having to manually fiddle with the memory block states is a sign that
this is not a good idea. To offline memory block devices cleanly,
device_offline() should be used. This is the only remaining caller of
offline_pages(), except the official device_offline() way.

E.g., when trying to allocate right now we trigger messages like
[   11.227817] page:c00c000000182000 refcount:1 mapcount:0 mapping:000000=
0000000000 index:0x0
[   11.228056] raw: 007ffff000000000 c000000001538860 c000000001538860 00=
00000000000000
[   11.228070] raw: 0000000000000000 0000000000000001 00000001ffffffff 00=
00000000000000
[   11.228097] page dumped because: unmovable page

and theoretically we might end up looping quite a long time trying to
offline memory, which would have to be canceled by the user manually
(CTRL-C).

Memtrace needs to identify+allocate multiple consecutive memory blocks.
It also has to remove the memory blocks to remove all page tables
(HW requirement).

Let's use alloc_contig_pages() to allocate memory that spans multiple
memory block devices. We can then set all pages PageOffline() to allow
these pages to get isolated. A temporary memory notifier can then make
offlining of these pages succeed by dropping its reference to the pages
on MEM_GOING_OFFLINE events(as documented in include/linux/page-flags.h
for PageOffline() pages). Error handling is a bit tricky.

Note1: ZONE_MOVABLE memory blocks won't be considered. Not sure if that
was ever really relevant. (unmovable data would end up on these memory
blocks for a tiny little time frame)

Note2: We don't have to care about online_page_callback_t, as we forbid
re-onlining from our memory notifier.

Note3: I was told this feature is never used along with DIMM-based memory
hotunplug - otherwise bad things will happen when a DIMM would try to
remove "alread-removed" memory (that is still in use).

Tested under QEMU with powernv emulation (kernel + initramfs).

$ mount -t debugfs none /sys/kernel/debug/
$ cat /sys/devices/system/memory/block_size_bytes
10000000
$ echo 0x20000000 > /sys/kernel/debug/powerpc/memtrace/enable
[   19.809790] Offlined Pages 4096
[   19.835842] Offlined Pages 4096
[   19.853136] memtrace: Allocated trace memory on node 0 at 0x0000000040=
000000

Unfortunately, QEMU does not support NUMA for powernv yet, so I cannot
test that.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Allison Randal <allison@lohutok.net>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Balbir Singh <bsingharora@gmail.com>
Cc: Rashmica Gupta <rashmica.g@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/Kconfig    |   1 +
 arch/powerpc/platforms/powernv/memtrace.c | 175 ++++++++++++++--------
 2 files changed, 112 insertions(+), 64 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platfo=
rms/powernv/Kconfig
index 938803eab0ad..571a0fa9f055 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -29,6 +29,7 @@ config OPAL_PRD
 config PPC_MEMTRACE
 	bool "Enable removal of RAM from kernel mappings for tracing"
 	depends on PPC_POWERNV && MEMORY_HOTREMOVE
+	select CONTIG_ALLOC
 	help
 	  Enabling this option allows for the removal of memory (RAM)
 	  from the kernel mappings to be used for hardware tracing.
diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/pla=
tforms/powernv/memtrace.c
index 2d2a0a2acd60..fe1e8f3926a1 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -76,83 +76,130 @@ static int memtrace_free_node(int nid, unsigned long=
 start, unsigned long size)
 	return ret;
 }
=20
-static int check_memblock_online(struct memory_block *mem, void *arg)
-{
-	if (mem->state !=3D MEM_ONLINE)
-		return -1;
-
-	return 0;
-}
-
-static int change_memblock_state(struct memory_block *mem, void *arg)
-{
-	unsigned long state =3D (unsigned long)arg;
-
-	mem->state =3D state;
-
-	return 0;
-}
+struct memtrace_alloc_info {
+	struct notifier_block memory_notifier;
+	unsigned long base_pfn;
+	unsigned long nr_pages;
+};
=20
-/* called with device_hotplug_lock held */
-static bool memtrace_offline_pages(u32 nid, u64 start_pfn, u64 nr_pages)
+static int memtrace_memory_notifier_cb(struct notifier_block *nb,
+				       unsigned long action, void *arg)
 {
-	const unsigned long start =3D PFN_PHYS(start_pfn);
-	const unsigned long size =3D PFN_PHYS(nr_pages);
-
-	if (walk_memory_blocks(start, size, NULL, check_memblock_online))
-		return false;
-
-	walk_memory_blocks(start, size, (void *)MEM_GOING_OFFLINE,
-			   change_memblock_state);
-
-	if (offline_pages(start_pfn, nr_pages)) {
-		walk_memory_blocks(start, size, (void *)MEM_ONLINE,
-				   change_memblock_state);
-		return false;
+	struct memtrace_alloc_info *info =3D container_of(nb,
+						     struct memtrace_alloc_info,
+						     memory_notifier);
+	unsigned long pfn, start_pfn, end_pfn;
+	const struct memory_notify *mhp =3D arg;
+	static bool going_offline;
+
+	/* Ignore ranges that don't overlap. */
+	if (mhp->start_pfn + mhp->nr_pages <=3D info->base_pfn ||
+	    info->base_pfn + info->nr_pages <=3D mhp->start_pfn)
+		return NOTIFY_OK;
+
+	start_pfn =3D max_t(unsigned long, info->base_pfn, mhp->start_pfn);
+	end_pfn =3D min_t(unsigned long, info->base_pfn + info->nr_pages,
+			mhp->start_pfn + mhp->nr_pages);
+
+	/*
+	 * Drop our reference to the allocated (PageOffline()) pages, but
+	 * reaquire them in case offlining fails. We might get called for
+	 * MEM_CANCEL_OFFLINE but not for MEM_GOING_OFFLINE in case another
+	 * notifier aborted offlining.
+	 */
+	switch (action) {
+	case MEM_GOING_OFFLINE:
+		for (pfn =3D start_pfn; pfn < end_pfn; pfn++)
+			page_ref_dec(pfn_to_page(pfn));
+		going_offline =3D true;
+		break;
+	case MEM_CANCEL_OFFLINE:
+		if (going_offline)
+			for (pfn =3D start_pfn; pfn < end_pfn; pfn++)
+				page_ref_inc(pfn_to_page(pfn));
+		going_offline =3D false;
+		break;
+	case MEM_GOING_ONLINE:
+		/*
+		 * While our notifier is active, user space could
+		 * offline+re-online this memory. Disallow any such activity.
+		 */
+		return notifier_to_errno(-EBUSY);
 	}
-
-	walk_memory_blocks(start, size, (void *)MEM_OFFLINE,
-			   change_memblock_state);
-
-
-	return true;
+	return NOTIFY_OK;
 }
=20
 static u64 memtrace_alloc_node(u32 nid, u64 size)
 {
-	u64 start_pfn, end_pfn, nr_pages, pfn;
-	u64 base_pfn;
-	u64 bytes =3D memory_block_size_bytes();
+	const unsigned long memory_block_bytes =3D memory_block_size_bytes();
+	const unsigned long nr_pages =3D size >> PAGE_SHIFT;
+	struct memtrace_alloc_info info =3D {
+		.memory_notifier =3D {
+			.notifier_call =3D memtrace_memory_notifier_cb,
+		},
+	};
+	unsigned long base_pfn, to_remove_pfn, pfn;
+	struct page *page;
+	int ret;
=20
 	if (!node_spanned_pages(nid))
 		return 0;
=20
-	start_pfn =3D node_start_pfn(nid);
-	end_pfn =3D node_end_pfn(nid);
-	nr_pages =3D size >> PAGE_SHIFT;
-
-	/* Trace memory needs to be aligned to the size */
-	end_pfn =3D round_down(end_pfn - nr_pages, nr_pages);
-
-	lock_device_hotplug();
-	for (base_pfn =3D end_pfn; base_pfn > start_pfn; base_pfn -=3D nr_pages=
) {
-		if (memtrace_offline_pages(nid, base_pfn, nr_pages) =3D=3D true) {
-			/*
-			 * Remove memory in memory block size chunks so that
-			 * iomem resources are always split to the same size and
-			 * we never try to remove memory that spans two iomem
-			 * resources.
-			 */
-			end_pfn =3D base_pfn + nr_pages;
-			for (pfn =3D base_pfn; pfn < end_pfn; pfn +=3D bytes>> PAGE_SHIFT) {
-				__remove_memory(nid, pfn << PAGE_SHIFT, bytes);
-			}
-			unlock_device_hotplug();
-			return base_pfn << PAGE_SHIFT;
-		}
+	/*
+	 * Try to allocate memory (that might span multiple memory blocks)
+	 * on the requested node. Trace memory needs to be aligned to the size,
+	 * which is guaranteed by alloc_contig_pages().
+	 */
+	page =3D alloc_contig_pages(nr_pages, __GFP_THISNODE, nid, NULL);
+	if (!page)
+		return 0;
+	to_remove_pfn =3D base_pfn =3D page_to_pfn(page);
+	info.base_pfn =3D base_pfn;
+	info.nr_pages =3D nr_pages;
+
+	/* PageOffline() allows to isolate the memory when offlining. */
+	for (pfn =3D base_pfn; pfn < base_pfn + nr_pages; pfn++)
+		__SetPageOffline(pfn_to_page(pfn));
+
+	/* A temporary memory notifier allows to offline the isolated memory. *=
/
+	ret =3D register_memory_notifier(&info.memory_notifier);
+	if (ret)
+		goto out_free_pages;
+
+	/*
+	 * Try to offline and remove all involved memory blocks. This will
+	 * only fail in the unlikely event that another memory notifier NACKs
+	 * the offlining request - no memory has to be migrated.
+	 *
+	 * Remove memory in memory block size chunks so that iomem resources
+	 * are always split to the same size and we never try to remove memory
+	 * that spans two iomem resources.
+	 */
+	for (; to_remove_pfn < base_pfn + nr_pages;
+	     to_remove_pfn +=3D PHYS_PFN(memory_block_bytes)) {
+		ret =3D offline_and_remove_memory(nid, PFN_PHYS(to_remove_pfn),
+						memory_block_bytes);
+		if (ret)
+			goto out_readd_memory;
 	}
-	unlock_device_hotplug();
=20
+	unregister_memory_notifier(&info.memory_notifier);
+	return PFN_PHYS(base_pfn);
+out_readd_memory:
+	/* Unregister before adding+onlining (notifer blocks onlining). */
+	unregister_memory_notifier(&info.memory_notifier);
+	if (to_remove_pfn !=3D base_pfn) {
+		ret =3D memtrace_free_node(nid, PFN_PHYS(base_pfn),
+					 PFN_PHYS(to_remove_pfn - base_pfn));
+		if (ret)
+			/* Even more unlikely, log and ignore. */
+			pr_err("Failed to add trace memory to node %d\n", nid);
+	}
+out_free_pages:
+	/* Only free memory that was not temporarily offlined+removed. */
+	for (pfn =3D to_remove_pfn; pfn < base_pfn + nr_pages; pfn++)
+		__ClearPageOffline(pfn_to_page(pfn));
+	free_contig_range(to_remove_pfn, nr_pages - (to_remove_pfn - base_pfn))=
;
 	return 0;
 }
=20
--=20
2.23.0

