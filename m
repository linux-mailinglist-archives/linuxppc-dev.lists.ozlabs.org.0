Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 747781096E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 00:23:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MNPW068pzDqd2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 10:23:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="U9A3VxB2"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MN7F2ZxnzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 10:10:48 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ddc5f770000>; Mon, 25 Nov 2019 15:10:47 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 25 Nov 2019 15:10:43 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 25 Nov 2019 15:10:43 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 23:10:43 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 25 Nov 2019 23:10:42 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ddc5f700004>; Mon, 25 Nov 2019 15:10:41 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 03/19] mm: Cleanup __put_devmap_managed_page() vs
 ->page_free()
Date: Mon, 25 Nov 2019 15:10:19 -0800
Message-ID: <20191125231035.1539120-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125231035.1539120-1-jhubbard@nvidia.com>
References: <20191125231035.1539120-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574723447; bh=EJqkD7sGkSGDaQsT1wW3i8i5ps2YtP/qJv7KgteSHaI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=U9A3VxB20O4bLtAIY3qa20q54q7A87VT99UHCON9lWz6CRlFc+i1LqkzSFEbwzhrq
 DtJZnLil2AgvBL7H5EuQj7pslL8k11TsYP4NoVu5PFPIE34fZMFQxKcTzxD/Nc7mL7
 eM6ZyGVVCh1lkeug5qq42HEW77T4JPPwP0QmG9IoxFmkydS7xGqZTIIqOs6CIAyfQ6
 4XbfftX6EeP6IOc+3mpkDB+3Pcvg46ONHhgijem6ppx3++ediSK5zL5ql6AqWvJWBj
 AhCIruvHZM6P30kfMbZNmo36Kn1AcBbEifqTosRAsyGmAd5ursj4G5KmSgfw8dQrQE
 hyi1IYgbgbmmg==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Dan Williams <dan.j.williams@intel.com>

After the removal of the device-public infrastructure there are only 2
->page_free() call backs in the kernel. One of those is a device-private
callback in the nouveau driver, the other is a generic wakeup needed in
the DAX case. In the hopes that all ->page_free() callbacks can be
migrated to common core kernel functionality, move the device-private
specific actions in __put_devmap_managed_page() under the
is_device_private_page() conditional, including the ->page_free()
callback. For the other page types just open-code the generic wakeup.

Yes, the wakeup is only needed in the MEMORY_DEVICE_FSDAX case, but it
does no harm in the MEMORY_DEVICE_DEVDAX and MEMORY_DEVICE_PCI_P2PDMA
case.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/nvdimm/pmem.c |  6 ----
 mm/memremap.c         | 80 ++++++++++++++++++++++++-------------------
 2 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index ad8e4df1282b..4eae441f86c9 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -337,13 +337,7 @@ static void pmem_release_disk(void *__pmem)
 	put_disk(pmem->disk);
 }
=20
-static void pmem_pagemap_page_free(struct page *page)
-{
-	wake_up_var(&page->_refcount);
-}
-
 static const struct dev_pagemap_ops fsdax_pagemap_ops =3D {
-	.page_free		=3D pmem_pagemap_page_free,
 	.kill			=3D pmem_pagemap_kill,
 	.cleanup		=3D pmem_pagemap_cleanup,
 };
diff --git a/mm/memremap.c b/mm/memremap.c
index 022e78e68ea0..e1678e575d9f 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -27,7 +27,8 @@ static void devmap_managed_enable_put(void)
=20
 static int devmap_managed_enable_get(struct dev_pagemap *pgmap)
 {
-	if (!pgmap->ops || !pgmap->ops->page_free) {
+	if (pgmap->type =3D=3D MEMORY_DEVICE_PRIVATE &&
+	    (!pgmap->ops || !pgmap->ops->page_free)) {
 		WARN(1, "Missing page_free method\n");
 		return -EINVAL;
 	}
@@ -444,44 +445,51 @@ void __put_devmap_managed_page(struct page *page)
 {
 	int count =3D page_ref_dec_return(page);
=20
-	/*
-	 * If refcount is 1 then page is freed and refcount is stable as nobody
-	 * holds a reference on the page.
-	 */
-	if (count =3D=3D 1) {
-		/* Clear Active bit in case of parallel mark_page_accessed */
-		__ClearPageActive(page);
-		__ClearPageWaiters(page);
+	/* still busy */
+	if (count > 1)
+		return;
=20
-		mem_cgroup_uncharge(page);
+	/* only triggered by the dev_pagemap shutdown path */
+	if (count =3D=3D 0) {
+		__put_page(page);
+		return;
+	}
=20
-		/*
-		 * When a device_private page is freed, the page->mapping field
-		 * may still contain a (stale) mapping value. For example, the
-		 * lower bits of page->mapping may still identify the page as
-		 * an anonymous page. Ultimately, this entire field is just
-		 * stale and wrong, and it will cause errors if not cleared.
-		 * One example is:
-		 *
-		 *  migrate_vma_pages()
-		 *    migrate_vma_insert_page()
-		 *      page_add_new_anon_rmap()
-		 *        __page_set_anon_rmap()
-		 *          ...checks page->mapping, via PageAnon(page) call,
-		 *            and incorrectly concludes that the page is an
-		 *            anonymous page. Therefore, it incorrectly,
-		 *            silently fails to set up the new anon rmap.
-		 *
-		 * For other types of ZONE_DEVICE pages, migration is either
-		 * handled differently or not done at all, so there is no need
-		 * to clear page->mapping.
-		 */
-		if (is_device_private_page(page))
-			page->mapping =3D NULL;
+	/* notify page idle for dax */
+	if (!is_device_private_page(page)) {
+		wake_up_var(&page->_refcount);
+		return;
+	}
=20
-		page->pgmap->ops->page_free(page);
-	} else if (!count)
-		__put_page(page);
+	/* Clear Active bit in case of parallel mark_page_accessed */
+	__ClearPageActive(page);
+	__ClearPageWaiters(page);
+
+	mem_cgroup_uncharge(page);
+
+	/*
+	 * When a device_private page is freed, the page->mapping field
+	 * may still contain a (stale) mapping value. For example, the
+	 * lower bits of page->mapping may still identify the page as an
+	 * anonymous page. Ultimately, this entire field is just stale
+	 * and wrong, and it will cause errors if not cleared.  One
+	 * example is:
+	 *
+	 *  migrate_vma_pages()
+	 *    migrate_vma_insert_page()
+	 *      page_add_new_anon_rmap()
+	 *        __page_set_anon_rmap()
+	 *          ...checks page->mapping, via PageAnon(page) call,
+	 *            and incorrectly concludes that the page is an
+	 *            anonymous page. Therefore, it incorrectly,
+	 *            silently fails to set up the new anon rmap.
+	 *
+	 * For other types of ZONE_DEVICE pages, migration is either
+	 * handled differently or not done at all, so there is no need
+	 * to clear page->mapping.
+	 */
+	page->mapping =3D NULL;
+	page->pgmap->ops->page_free(page);
 }
 EXPORT_SYMBOL(__put_devmap_managed_page);
 #endif /* CONFIG_DEV_PAGEMAP_OPS */
--=20
2.24.0

