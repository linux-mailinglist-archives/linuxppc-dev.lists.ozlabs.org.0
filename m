Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1B7C3809
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 16:50:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jMcy1N7zzDqK5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 00:50:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jMQ548r3zDqRP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 00:40:45 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A07773082E42;
 Tue,  1 Oct 2019 14:40:43 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-54.ams2.redhat.com [10.36.116.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 782385D9E5;
 Tue,  1 Oct 2019 14:40:32 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/10] mm/memunmap: Use the correct start and end pfn when
 removing pages from zone
Date: Tue,  1 Oct 2019 16:40:02 +0200
Message-Id: <20191001144011.3801-2-david@redhat.com>
In-Reply-To: <20191001144011.3801-1-david@redhat.com>
References: <20191001144011.3801-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 01 Oct 2019 14:40:44 +0000 (UTC)
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, linux-sh@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Pankaj Gupta <pagupta@redhat.com>, David Hildenbrand <david@redhat.com>,
 linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

With altmap, all the resource pfns are not initialized. While initializing
pfn, altmap reserve space is skipped. Hence when removing pfn from zone
skip pfns that were never initialized.

Update memunmap_pages to calculate start and end pfn based on altmap
values. This fixes a kernel crash that is observed when destroying
a namespace.

[   81.356173] kernel BUG at include/linux/mm.h:1107!
cpu 0x1: Vector: 700 (Program Check) at [c000000274087890]
    pc: c0000000004b9728: memunmap_pages+0x238/0x340
    lr: c0000000004b9724: memunmap_pages+0x234/0x340
...
    pid   = 3669, comm = ndctl
kernel BUG at include/linux/mm.h:1107!
[c000000274087ba0] c0000000009e3500 devm_action_release+0x30/0x50
[c000000274087bc0] c0000000009e4758 release_nodes+0x268/0x2d0
[c000000274087c30] c0000000009dd144 device_release_driver_internal+0x174/0x240
[c000000274087c70] c0000000009d9dfc unbind_store+0x13c/0x190
[c000000274087cb0] c0000000009d8a24 drv_attr_store+0x44/0x60
[c000000274087cd0] c0000000005a7470 sysfs_kf_write+0x70/0xa0
[c000000274087d10] c0000000005a5cac kernfs_fop_write+0x1ac/0x290
[c000000274087d60] c0000000004be45c __vfs_write+0x3c/0x70
[c000000274087d80] c0000000004c26e4 vfs_write+0xe4/0x200
[c000000274087dd0] c0000000004c2a6c ksys_write+0x7c/0x140
[c000000274087e20] c00000000000bbd0 system_call+0x5c/0x68

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Logan Gunthorpe <logang@deltatee.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Pankaj Gupta <pagupta@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
[ move all pfn-realted declarations into a single line ]
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memremap.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/mm/memremap.c b/mm/memremap.c
index 557e53c6fb46..026788b2ac69 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -123,7 +123,7 @@ static void dev_pagemap_cleanup(struct dev_pagemap *pgmap)
 void memunmap_pages(struct dev_pagemap *pgmap)
 {
 	struct resource *res = &pgmap->res;
-	unsigned long pfn;
+	unsigned long pfn, nr_pages, start_pfn, end_pfn;
 	int nid;
 
 	dev_pagemap_kill(pgmap);
@@ -131,14 +131,17 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 		put_page(pfn_to_page(pfn));
 	dev_pagemap_cleanup(pgmap);
 
+	start_pfn = pfn_first(pgmap);
+	end_pfn = pfn_end(pgmap);
+	nr_pages = end_pfn - start_pfn;
+
 	/* pages are dead and unused, undo the arch mapping */
-	nid = page_to_nid(pfn_to_page(PHYS_PFN(res->start)));
+	nid = page_to_nid(pfn_to_page(start_pfn));
 
 	mem_hotplug_begin();
 	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
-		pfn = PHYS_PFN(res->start);
-		__remove_pages(page_zone(pfn_to_page(pfn)), pfn,
-				 PHYS_PFN(resource_size(res)), NULL);
+		__remove_pages(page_zone(pfn_to_page(start_pfn)), start_pfn,
+			       nr_pages, NULL);
 	} else {
 		arch_remove_memory(nid, res->start, resource_size(res),
 				pgmap_altmap(pgmap));
-- 
2.21.0

