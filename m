Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B122EB359
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 16:04:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473pWH6174zF4R5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 02:04:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="PNF7Aerq"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473nmn0nPbzF5nL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 01:30:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572532246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jKkHu++ImAx8/m4CowH5MZ45UwkvuomyvncwbIC2QYo=;
 b=PNF7AerqrnBzS79IGeDdT03RMjj0YY7c5KYNY+MdxTiat1UIjluFUVlRW4QquUq9OcBZ2Z
 WtYk8dXMYVMe3l6pBzfAa6HfiCGltmc7sJhR+h5KoV4WHaMJARj1oTDoBoeRKJ6WtYH/IU
 +ALYmRIaVCWSffEDqixQrC+6FLJLyyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-iGFXq75lP1SxH1LHzm1BYw-1; Thu, 31 Oct 2019 10:30:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E39DE2EDC;
 Thu, 31 Oct 2019 14:30:41 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 251625D6D6;
 Thu, 31 Oct 2019 14:30:38 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/12] mm: remove the memory isolate notifier
Date: Thu, 31 Oct 2019 15:29:32 +0100
Message-Id: <20191031142933.10779-12-david@redhat.com>
In-Reply-To: <20191031142933.10779-1-david@redhat.com>
References: <20191031142933.10779-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: iGFXq75lP1SxH1LHzm1BYw-1
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
Cc: Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Hildenbrand <david@redhat.com>, Pingfan Liu <kernelfans@gmail.com>,
 linux-mm@kvack.org, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Luckily, we have no users left, so we can get rid of it.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Qian Cai <cai@lca.pw>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c  | 19 -------------------
 include/linux/memory.h | 27 ---------------------------
 mm/page_isolation.c    | 27 ++-------------------------
 3 files changed, 2 insertions(+), 71 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index a757d9ed88a7..03c18c97c2bf 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -73,20 +73,6 @@ void unregister_memory_notifier(struct notifier_block *n=
b)
 }
 EXPORT_SYMBOL(unregister_memory_notifier);
=20
-static ATOMIC_NOTIFIER_HEAD(memory_isolate_chain);
-
-int register_memory_isolate_notifier(struct notifier_block *nb)
-{
-=09return atomic_notifier_chain_register(&memory_isolate_chain, nb);
-}
-EXPORT_SYMBOL(register_memory_isolate_notifier);
-
-void unregister_memory_isolate_notifier(struct notifier_block *nb)
-{
-=09atomic_notifier_chain_unregister(&memory_isolate_chain, nb);
-}
-EXPORT_SYMBOL(unregister_memory_isolate_notifier);
-
 static void memory_block_release(struct device *dev)
 {
 =09struct memory_block *mem =3D to_memory_block(dev);
@@ -178,11 +164,6 @@ int memory_notify(unsigned long val, void *v)
 =09return blocking_notifier_call_chain(&memory_chain, val, v);
 }
=20
-int memory_isolate_notify(unsigned long val, void *v)
-{
-=09return atomic_notifier_call_chain(&memory_isolate_chain, val, v);
-}
-
 /*
  * The probe routines leave the pages uninitialized, just as the bootmem c=
ode
  * does. Make sure we do not access them, but instead use only information=
 from
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 0ebb105eb261..d3fde2d0d94b 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -55,19 +55,6 @@ struct memory_notify {
 =09int status_change_nid;
 };
=20
-/*
- * During pageblock isolation, count the number of pages within the
- * range [start_pfn, start_pfn + nr_pages) which are owned by code
- * in the notifier chain.
- */
-#define MEM_ISOLATE_COUNT=09(1<<0)
-
-struct memory_isolate_notify {
-=09unsigned long start_pfn;=09/* Start of range to check */
-=09unsigned int nr_pages;=09=09/* # pages in range to check */
-=09unsigned int pages_found;=09/* # pages owned found by callbacks */
-};
-
 struct notifier_block;
 struct mem_section;
=20
@@ -94,27 +81,13 @@ static inline int memory_notify(unsigned long val, void=
 *v)
 {
 =09return 0;
 }
-static inline int register_memory_isolate_notifier(struct notifier_block *=
nb)
-{
-=09return 0;
-}
-static inline void unregister_memory_isolate_notifier(struct notifier_bloc=
k *nb)
-{
-}
-static inline int memory_isolate_notify(unsigned long val, void *v)
-{
-=09return 0;
-}
 #else
 extern int register_memory_notifier(struct notifier_block *nb);
 extern void unregister_memory_notifier(struct notifier_block *nb);
-extern int register_memory_isolate_notifier(struct notifier_block *nb);
-extern void unregister_memory_isolate_notifier(struct notifier_block *nb);
 int create_memory_block_devices(unsigned long start, unsigned long size);
 void remove_memory_block_devices(unsigned long start, unsigned long size);
 extern void memory_dev_init(void);
 extern int memory_notify(unsigned long val, void *v);
-extern int memory_isolate_notify(unsigned long val, void *v);
 extern struct memory_block *find_memory_block(struct mem_section *);
 typedef int (*walk_memory_blocks_func_t)(struct memory_block *, void *);
 extern int walk_memory_blocks(unsigned long start, unsigned long size,
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 04ee1663cdbe..20d87d18c7cc 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -18,9 +18,7 @@
 static int set_migratetype_isolate(struct page *page, int migratetype, int=
 isol_flags)
 {
 =09struct zone *zone;
-=09unsigned long flags, pfn;
-=09struct memory_isolate_notify arg;
-=09int notifier_ret;
+=09unsigned long flags;
 =09int ret =3D -EBUSY;
=20
 =09zone =3D page_zone(page);
@@ -35,32 +33,11 @@ static int set_migratetype_isolate(struct page *page, i=
nt migratetype, int isol_
 =09if (is_migrate_isolate_page(page))
 =09=09goto out;
=20
-=09pfn =3D page_to_pfn(page);
-=09arg.start_pfn =3D pfn;
-=09arg.nr_pages =3D pageblock_nr_pages;
-=09arg.pages_found =3D 0;
-
-=09/*
-=09 * It may be possible to isolate a pageblock even if the
-=09 * migratetype is not MIGRATE_MOVABLE. The memory isolation
-=09 * notifier chain is used by balloon drivers to return the
-=09 * number of pages in a range that are held by the balloon
-=09 * driver to shrink memory. If all the pages are accounted for
-=09 * by balloons, are free, or on the LRU, isolation can continue.
-=09 * Later, for example, when memory hotplug notifier runs, these
-=09 * pages reported as "can be isolated" should be isolated(freed)
-=09 * by the balloon driver through the memory notifier chain.
-=09 */
-=09notifier_ret =3D memory_isolate_notify(MEM_ISOLATE_COUNT, &arg);
-=09notifier_ret =3D notifier_to_errno(notifier_ret);
-=09if (notifier_ret)
-=09=09goto out;
 =09/*
 =09 * FIXME: Now, memory hotplug doesn't call shrink_slab() by itself.
 =09 * We just check MOVABLE pages.
 =09 */
-=09if (!has_unmovable_pages(zone, page, arg.pages_found, migratetype,
-=09=09=09=09 isol_flags))
+=09if (!has_unmovable_pages(zone, page, 0, migratetype, isol_flags))
 =09=09ret =3D 0;
=20
 =09/*
--=20
2.21.0

