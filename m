Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6687E104CAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 08:34:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JWXq23zbzDq69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 18:34:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="SbUQWB4H"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JW575nkZzDqsG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 18:14:03 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd639390000>; Wed, 20 Nov 2019 23:14:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 20 Nov 2019 23:13:58 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 20 Nov 2019 23:13:58 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 07:13:57 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 21 Nov 2019 07:13:57 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd639350005>; Wed, 20 Nov 2019 23:13:57 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 24/24] mm,
 tree-wide: rename put_user_page*() to unpin_user_page*()
Date: Wed, 20 Nov 2019 23:13:54 -0800
Message-ID: <20191121071354.456618-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121071354.456618-1-jhubbard@nvidia.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574320441; bh=JuszxZi+ydw4gHGCPcQJyQLM1fEBAIwayXEIKXFk0NE=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=SbUQWB4HVX+SvRZCvuezLgjDV4EBGIYtTowE21urk2g4Ajlebskycyq+OT1I8Cs6g
 3bxiejTnZosBK0SLLDwXwW8kZ3kSXsZRfAAgGBysZ0DBIKzxRBG4BfTcOiZ/yTHXu0
 npDUcMp6TpFoy/HAj8yaljA8cTQ75tcaNWMr+H5AQIrI07t5xP1LxNRtD8PcEJMkTM
 fxqAhjccXeL3i53zDtgUce43W2IcDXFQVgZjHfGkJud9ye3QX3tdQicsdn3LRyk/vu
 Fi+gpcl3O2dMpcvQLgObQFX4m+9r5TgNXn894MDGRdpqyLvuQJs5V75sbGKWZcdl24
 MGARCgDaAXP5w==
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
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
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

In order to provide a clearer, more symmetric API for pinning
and unpinning DMA pages. This way, pin_user_pages*() calls
match up with unpin_user_pages*() calls, and the API is a lot
closer to being self-explanatory.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/core-api/pin_user_pages.rst   |  2 +-
 arch/powerpc/mm/book3s64/iommu_api.c        |  6 +--
 drivers/gpu/drm/via/via_dmablit.c           |  4 +-
 drivers/infiniband/core/umem.c              |  2 +-
 drivers/infiniband/hw/hfi1/user_pages.c     |  2 +-
 drivers/infiniband/hw/mthca/mthca_memfree.c |  6 +--
 drivers/infiniband/hw/qib/qib_user_pages.c  |  2 +-
 drivers/infiniband/hw/qib/qib_user_sdma.c   |  6 +--
 drivers/infiniband/hw/usnic/usnic_uiom.c    |  2 +-
 drivers/infiniband/sw/siw/siw_mem.c         |  2 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c   |  4 +-
 drivers/platform/goldfish/goldfish_pipe.c   |  4 +-
 drivers/vfio/vfio_iommu_type1.c             |  2 +-
 fs/io_uring.c                               |  4 +-
 include/linux/mm.h                          | 30 +++++++-------
 include/linux/mmzone.h                      |  2 +-
 mm/gup.c                                    | 46 ++++++++++-----------
 mm/gup_benchmark.c                          |  2 +-
 mm/process_vm_access.c                      |  4 +-
 net/xdp/xdp_umem.c                          |  2 +-
 20 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/core=
-api/pin_user_pages.rst
index baa288a44a77..6d93ef203561 100644
--- a/Documentation/core-api/pin_user_pages.rst
+++ b/Documentation/core-api/pin_user_pages.rst
@@ -220,7 +220,7 @@ since the system was booted, via two new /proc/vmstat e=
ntries: ::
     /proc/vmstat/nr_foll_pin_requested
=20
 Those are both going to show zero, unless CONFIG_DEBUG_VM is set. This is
-because there is a noticeable performance drop in put_user_page(), when th=
ey
+because there is a noticeable performance drop in unpin_user_page(), when =
they
 are activated.
=20
 References
diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s6=
4/iommu_api.c
index 196383e8e5a9..dd7aa5a4f33c 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -168,7 +168,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, uns=
igned long ua,
=20
 free_exit:
 	/* free the references taken */
-	put_user_pages(mem->hpages, pinned);
+	unpin_user_pages(mem->hpages, pinned);
=20
 	vfree(mem->hpas);
 	kfree(mem);
@@ -211,8 +211,8 @@ static void mm_iommu_unpin(struct mm_iommu_table_group_=
mem_t *mem)
 		if (!page)
 			continue;
=20
-		put_user_pages_dirty_lock(&mem->hpages[i], 1,
-					  MM_IOMMU_TABLE_GROUP_PAGE_DIRTY);
+		unpin_user_pages_dirty_lock(&mem->hpages[i], 1,
+					    MM_IOMMU_TABLE_GROUP_PAGE_DIRTY);
=20
 		mem->hpas[i] =3D 0;
 	}
diff --git a/drivers/gpu/drm/via/via_dmablit.c b/drivers/gpu/drm/via/via_dm=
ablit.c
index 37c5e572993a..719d036c9384 100644
--- a/drivers/gpu/drm/via/via_dmablit.c
+++ b/drivers/gpu/drm/via/via_dmablit.c
@@ -188,8 +188,8 @@ via_free_sg_info(struct pci_dev *pdev, drm_via_sg_info_=
t *vsg)
 		kfree(vsg->desc_pages);
 		/* fall through */
 	case dr_via_pages_locked:
-		put_user_pages_dirty_lock(vsg->pages, vsg->num_pages,
-					  (vsg->direction =3D=3D DMA_FROM_DEVICE));
+		unpin_user_pages_dirty_lock(vsg->pages, vsg->num_pages,
+					   (vsg->direction =3D=3D DMA_FROM_DEVICE));
 		/* fall through */
 	case dr_via_pages_alloc:
 		vfree(vsg->pages);
diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.=
c
index 2c287ced3439..119a147da904 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -54,7 +54,7 @@ static void __ib_umem_release(struct ib_device *dev, stru=
ct ib_umem *umem, int d
=20
 	for_each_sg_page(umem->sg_head.sgl, &sg_iter, umem->sg_nents, 0) {
 		page =3D sg_page_iter_page(&sg_iter);
-		put_user_pages_dirty_lock(&page, 1, umem->writable && dirty);
+		unpin_user_pages_dirty_lock(&page, 1, umem->writable && dirty);
 	}
=20
 	sg_free_table(&umem->sg_head);
diff --git a/drivers/infiniband/hw/hfi1/user_pages.c b/drivers/infiniband/h=
w/hfi1/user_pages.c
index 9a94761765c0..3b505006c0a6 100644
--- a/drivers/infiniband/hw/hfi1/user_pages.c
+++ b/drivers/infiniband/hw/hfi1/user_pages.c
@@ -118,7 +118,7 @@ int hfi1_acquire_user_pages(struct mm_struct *mm, unsig=
ned long vaddr, size_t np
 void hfi1_release_user_pages(struct mm_struct *mm, struct page **p,
 			     size_t npages, bool dirty)
 {
-	put_user_pages_dirty_lock(p, npages, dirty);
+	unpin_user_pages_dirty_lock(p, npages, dirty);
=20
 	if (mm) { /* during close after signal, mm can be NULL */
 		atomic64_sub(npages, &mm->pinned_vm);
diff --git a/drivers/infiniband/hw/mthca/mthca_memfree.c b/drivers/infiniba=
nd/hw/mthca/mthca_memfree.c
index 8269ab040c21..78a48aea3faf 100644
--- a/drivers/infiniband/hw/mthca/mthca_memfree.c
+++ b/drivers/infiniband/hw/mthca/mthca_memfree.c
@@ -482,7 +482,7 @@ int mthca_map_user_db(struct mthca_dev *dev, struct mth=
ca_uar *uar,
=20
 	ret =3D pci_map_sg(dev->pdev, &db_tab->page[i].mem, 1, PCI_DMA_TODEVICE);
 	if (ret < 0) {
-		put_user_page(pages[0]);
+		unpin_user_page(pages[0]);
 		goto out;
 	}
=20
@@ -490,7 +490,7 @@ int mthca_map_user_db(struct mthca_dev *dev, struct mth=
ca_uar *uar,
 				 mthca_uarc_virt(dev, uar, i));
 	if (ret) {
 		pci_unmap_sg(dev->pdev, &db_tab->page[i].mem, 1, PCI_DMA_TODEVICE);
-		put_user_page(sg_page(&db_tab->page[i].mem));
+		unpin_user_page(sg_page(&db_tab->page[i].mem));
 		goto out;
 	}
=20
@@ -556,7 +556,7 @@ void mthca_cleanup_user_db_tab(struct mthca_dev *dev, s=
truct mthca_uar *uar,
 		if (db_tab->page[i].uvirt) {
 			mthca_UNMAP_ICM(dev, mthca_uarc_virt(dev, uar, i), 1);
 			pci_unmap_sg(dev->pdev, &db_tab->page[i].mem, 1, PCI_DMA_TODEVICE);
-			put_user_page(sg_page(&db_tab->page[i].mem));
+			unpin_user_page(sg_page(&db_tab->page[i].mem));
 		}
 	}
=20
diff --git a/drivers/infiniband/hw/qib/qib_user_pages.c b/drivers/infiniban=
d/hw/qib/qib_user_pages.c
index 7fc4b5f81fcd..342e3172ca40 100644
--- a/drivers/infiniband/hw/qib/qib_user_pages.c
+++ b/drivers/infiniband/hw/qib/qib_user_pages.c
@@ -40,7 +40,7 @@
 static void __qib_release_user_pages(struct page **p, size_t num_pages,
 				     int dirty)
 {
-	put_user_pages_dirty_lock(p, num_pages, dirty);
+	unpin_user_pages_dirty_lock(p, num_pages, dirty);
 }
=20
 /**
diff --git a/drivers/infiniband/hw/qib/qib_user_sdma.c b/drivers/infiniband=
/hw/qib/qib_user_sdma.c
index 1a3cc2957e3a..a67599b5a550 100644
--- a/drivers/infiniband/hw/qib/qib_user_sdma.c
+++ b/drivers/infiniband/hw/qib/qib_user_sdma.c
@@ -317,7 +317,7 @@ static int qib_user_sdma_page_to_frags(const struct qib=
_devdata *dd,
 		 * the caller can ignore this page.
 		 */
 		if (put) {
-			put_user_page(page);
+			unpin_user_page(page);
 		} else {
 			/* coalesce case */
 			kunmap(page);
@@ -631,7 +631,7 @@ static void qib_user_sdma_free_pkt_frag(struct device *=
dev,
 			kunmap(pkt->addr[i].page);
=20
 		if (pkt->addr[i].put_page)
-			put_user_page(pkt->addr[i].page);
+			unpin_user_page(pkt->addr[i].page);
 		else
 			__free_page(pkt->addr[i].page);
 	} else if (pkt->addr[i].kvaddr) {
@@ -706,7 +706,7 @@ static int qib_user_sdma_pin_pages(const struct qib_dev=
data *dd,
 	/* if error, return all pages not managed by pkt */
 free_pages:
 	while (i < j)
-		put_user_page(pages[i++]);
+		unpin_user_page(pages[i++]);
=20
 done:
 	return ret;
diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/=
hw/usnic/usnic_uiom.c
index 600896727d34..bd9f944b68fc 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.c
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
@@ -75,7 +75,7 @@ static void usnic_uiom_put_pages(struct list_head *chunk_=
list, int dirty)
 		for_each_sg(chunk->page_list, sg, chunk->nents, i) {
 			page =3D sg_page(sg);
 			pa =3D sg_phys(sg);
-			put_user_pages_dirty_lock(&page, 1, dirty);
+			unpin_user_pages_dirty_lock(&page, 1, dirty);
 			usnic_dbg("pa: %pa\n", &pa);
 		}
 		kfree(chunk);
diff --git a/drivers/infiniband/sw/siw/siw_mem.c b/drivers/infiniband/sw/si=
w/siw_mem.c
index e53b07dcfed5..e2061dc0b043 100644
--- a/drivers/infiniband/sw/siw/siw_mem.c
+++ b/drivers/infiniband/sw/siw/siw_mem.c
@@ -63,7 +63,7 @@ struct siw_mem *siw_mem_id2obj(struct siw_device *sdev, i=
nt stag_index)
 static void siw_free_plist(struct siw_page_chunk *chunk, int num_pages,
 			   bool dirty)
 {
-	put_user_pages_dirty_lock(chunk->plist, num_pages, dirty);
+	unpin_user_pages_dirty_lock(chunk->plist, num_pages, dirty);
 }
=20
 void siw_umem_release(struct siw_umem *umem, bool dirty)
diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2=
-core/videobuf-dma-sg.c
index 162a2633b1e3..13b65ed9e74c 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -349,8 +349,8 @@ int videobuf_dma_free(struct videobuf_dmabuf *dma)
 	BUG_ON(dma->sglen);
=20
 	if (dma->pages) {
-		put_user_pages_dirty_lock(dma->pages, dma->nr_pages,
-					  dma->direction =3D=3D DMA_FROM_DEVICE);
+		unpin_user_pages_dirty_lock(dma->pages, dma->nr_pages,
+					    dma->direction =3D=3D DMA_FROM_DEVICE);
 		kfree(dma->pages);
 		dma->pages =3D NULL;
 	}
diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/g=
oldfish/goldfish_pipe.c
index 635a8bc1b480..bf523df2a90d 100644
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@ -360,8 +360,8 @@ static int transfer_max_buffers(struct goldfish_pipe *p=
ipe,
=20
 	*consumed_size =3D pipe->command_buffer->rw_params.consumed_size;
=20
-	put_user_pages_dirty_lock(pipe->pages, pages_count,
-				  !is_write && *consumed_size > 0);
+	unpin_user_pages_dirty_lock(pipe->pages, pages_count,
+				    !is_write && *consumed_size > 0);
=20
 	mutex_unlock(&pipe->lock);
 	return 0;
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type=
1.c
index 18aa36b56896..c48ac1567f14 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -328,7 +328,7 @@ static int put_pfn(unsigned long pfn, int prot)
 	if (!is_invalid_reserved_pfn(pfn)) {
 		struct page *page =3D pfn_to_page(pfn);
=20
-		put_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
+		unpin_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
 		return 1;
 	}
 	return 0;
diff --git a/fs/io_uring.c b/fs/io_uring.c
index 15715eeebaec..0253a4d8fdc8 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -3328,7 +3328,7 @@ static int io_sqe_buffer_unregister(struct io_ring_ct=
x *ctx)
 		struct io_mapped_ubuf *imu =3D &ctx->user_bufs[i];
=20
 		for (j =3D 0; j < imu->nr_bvecs; j++)
-			put_user_page(imu->bvec[j].bv_page);
+			unpin_user_page(imu->bvec[j].bv_page);
=20
 		if (ctx->account_mem)
 			io_unaccount_mem(ctx->user, imu->nr_bvecs);
@@ -3473,7 +3473,7 @@ static int io_sqe_buffer_register(struct io_ring_ctx =
*ctx, void __user *arg,
 			 * release any pages we did get
 			 */
 			if (pret > 0)
-				put_user_pages(pages, pret);
+				unpin_user_pages(pages, pret);
 			if (ctx->account_mem)
 				io_unaccount_mem(ctx->user, nr_pages);
 			kvfree(imu->bvec);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 253ec2d15f36..9d005381e1b2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1093,18 +1093,18 @@ static inline void put_page(struct page *page)
  * made against the page. ("gup-pinned" is another term for the latter).
  *
  * With this scheme, pin_user_pages() becomes special: such pages are mark=
ed as
- * distinct from normal pages. As such, the put_user_page() call (and its
+ * distinct from normal pages. As such, the unpin_user_page() call (and it=
s
  * variants) must be used in order to release gup-pinned pages.
  *
  * Choice of value:
  *
  * By making GUP_PIN_COUNTING_BIAS a power of two, debugging of page refer=
ence
- * counts with respect to pin_user_pages() and put_user_page() becomes sim=
pler,
- * due to the fact that adding an even power of two to the page refcount h=
as the
- * effect of using only the upper N bits, for the code that counts up usin=
g the
- * bias value. This means that the lower bits are left for the exclusive u=
se of
- * the original code that increments and decrements by one (or at least, b=
y much
- * smaller values than the bias value).
+ * counts with respect to pin_user_pages() and unpin_user_page() becomes
+ * simpler, due to the fact that adding an even power of two to the page
+ * refcount has the effect of using only the upper N bits, for the code th=
at
+ * counts up using the bias value. This means that the lower bits are left=
 for
+ * the exclusive use of the original code that increments and decrements b=
y one
+ * (or at least, by much smaller values than the bias value).
  *
  * Of course, once the lower bits overflow into the upper bits (and this i=
s
  * OK, because subtraction recovers the original values), then visual insp=
ection
@@ -1119,10 +1119,10 @@ static inline void put_page(struct page *page)
  */
 #define GUP_PIN_COUNTING_BIAS (1UL << 10)
=20
-void put_user_page(struct page *page);
-void put_user_pages_dirty_lock(struct page **pages, unsigned long npages,
-			       bool make_dirty);
-void put_user_pages(struct page **pages, unsigned long npages);
+void unpin_user_page(struct page *page);
+void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages=
,
+				 bool make_dirty);
+void unpin_user_pages(struct page **pages, unsigned long npages);
=20
 /**
  * page_dma_pinned() - report if a page is pinned for DMA.
@@ -2673,7 +2673,7 @@ struct page *follow_page(struct vm_area_struct *vma, =
unsigned long address,
 #define FOLL_ANON	0x8000	/* don't do file mappings */
 #define FOLL_LONGTERM	0x10000	/* mapping lifetime is indefinite: see below=
 */
 #define FOLL_SPLIT_PMD	0x20000	/* split huge pmd before returning */
-#define FOLL_PIN	0x40000	/* pages must be released via put_user_page() */
+#define FOLL_PIN	0x40000	/* pages must be released via unpin_user_page */
=20
 /*
  * FOLL_PIN and FOLL_LONGTERM may be used in various combinations with eac=
h
@@ -2708,7 +2708,7 @@ struct page *follow_page(struct vm_area_struct *vma, =
unsigned long address,
  * Direct IO). This lets the filesystem know that some non-file-system ent=
ity is
  * potentially changing the pages' data. In contrast to FOLL_GET (whose pa=
ges
  * are released via put_page()), FOLL_PIN pages must be released, ultimate=
ly, by
- * a call to put_user_page().
+ * a call to unpin_user_page().
  *
  * FOLL_PIN is similar to FOLL_GET: both of these pin pages. They use diff=
erent
  * and separate refcounting mechanisms, however, and that means that each =
has
@@ -2716,7 +2716,7 @@ struct page *follow_page(struct vm_area_struct *vma, =
unsigned long address,
  *
  *     FOLL_GET: get_user_pages*() to acquire, and put_page() to release.
  *
- *     FOLL_PIN: pin_user_pages*() to acquire, and put_user_pages to relea=
se.
+ *     FOLL_PIN: pin_user_pages*() to acquire, and unpin_user_pages to rel=
ease.
  *
  * FOLL_PIN and FOLL_GET are mutually exclusive for a given function call.
  * (The underlying pages may experience both FOLL_GET-based and FOLL_PIN-b=
ased
@@ -2726,7 +2726,7 @@ struct page *follow_page(struct vm_area_struct *vma, =
unsigned long address,
  * FOLL_PIN should be set internally by the pin_user_pages*() APIs, never
  * directly by the caller. That's in order to help avoid mismatches when
  * releasing pages: get_user_pages*() pages must be released via put_page(=
),
- * while pin_user_pages*() pages must be released via put_user_page().
+ * while pin_user_pages*() pages must be released via unpin_user_page().
  *
  * Please see Documentation/vm/pin_user_pages.rst for more information.
  */
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 0485cba38d23..d66c1fb9d45e 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -245,7 +245,7 @@ enum node_stat_item {
 	NR_WRITTEN,		/* page writings since bootup */
 	NR_KERNEL_MISC_RECLAIMABLE,	/* reclaimable non-slab kernel pages */
 	NR_FOLL_PIN_REQUESTED,	/* via: pin_user_page(), gup flag: FOLL_PIN */
-	NR_FOLL_PIN_RETURNED,	/* pages returned via put_user_page() */
+	NR_FOLL_PIN_RETURNED,	/* pages returned via unpin_user_page() */
 	NR_VM_NODE_STAT_ITEMS
 };
=20
diff --git a/mm/gup.c b/mm/gup.c
index b06434185e33..ac5b4c365827 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -113,15 +113,15 @@ static bool __put_devmap_managed_user_page(struct pag=
e *page)
 #endif /* CONFIG_DEV_PAGEMAP_OPS */
=20
 /**
- * put_user_page() - release a dma-pinned page
+ * unpin_user_page() - release a dma-pinned page
  * @page:            pointer to page to be released
  *
  * Pages that were pinned via pin_user_pages*() must be released via eithe=
r
- * put_user_page(), or one of the put_user_pages*() routines. This is so t=
hat
- * such pages can be separately tracked and uniquely handled. In particula=
r,
- * interactions with RDMA and filesystems need special handling.
+ * unpin_user_page(), or one of the unpin_user_pages*() routines. This is =
so
+ * that such pages can be separately tracked and uniquely handled. In
+ * particular, interactions with RDMA and filesystems need special handlin=
g.
  */
-void put_user_page(struct page *page)
+void unpin_user_page(struct page *page)
 {
 	page =3D compound_head(page);
=20
@@ -139,10 +139,10 @@ void put_user_page(struct page *page)
=20
 	__update_proc_vmstat(page, NR_FOLL_PIN_RETURNED, 1);
 }
-EXPORT_SYMBOL(put_user_page);
+EXPORT_SYMBOL(unpin_user_page);
=20
 /**
- * put_user_pages_dirty_lock() - release and optionally dirty gup-pinned p=
ages
+ * unpin_user_pages_dirty_lock() - release and optionally dirty gup-pinned=
 pages
  * @pages:  array of pages to be maybe marked dirty, and definitely releas=
ed.
  * @npages: number of pages in the @pages array.
  * @make_dirty: whether to mark the pages dirty
@@ -152,19 +152,19 @@ EXPORT_SYMBOL(put_user_page);
  *
  * For each page in the @pages array, make that page (or its head page, if=
 a
  * compound page) dirty, if @make_dirty is true, and if the page was previ=
ously
- * listed as clean. In any case, releases all pages using put_user_page(),
- * possibly via put_user_pages(), for the non-dirty case.
+ * listed as clean. In any case, releases all pages using unpin_user_page(=
),
+ * possibly via unpin_user_pages(), for the non-dirty case.
  *
- * Please see the put_user_page() documentation for details.
+ * Please see the unpin_user_page() documentation for details.
  *
  * set_page_dirty_lock() is used internally. If instead, set_page_dirty() =
is
  * required, then the caller should a) verify that this is really correct,
  * because _lock() is usually required, and b) hand code it:
- * set_page_dirty_lock(), put_user_page().
+ * set_page_dirty_lock(), unpin_user_page().
  *
  */
-void put_user_pages_dirty_lock(struct page **pages, unsigned long npages,
-			       bool make_dirty)
+void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages=
,
+				 bool make_dirty)
 {
 	unsigned long index;
=20
@@ -175,7 +175,7 @@ void put_user_pages_dirty_lock(struct page **pages, uns=
igned long npages,
 	 */
=20
 	if (!make_dirty) {
-		put_user_pages(pages, npages);
+		unpin_user_pages(pages, npages);
 		return;
 	}
=20
@@ -203,21 +203,21 @@ void put_user_pages_dirty_lock(struct page **pages, u=
nsigned long npages,
 		 */
 		if (!PageDirty(page))
 			set_page_dirty_lock(page);
-		put_user_page(page);
+		unpin_user_page(page);
 	}
 }
-EXPORT_SYMBOL(put_user_pages_dirty_lock);
+EXPORT_SYMBOL(unpin_user_pages_dirty_lock);
=20
 /**
- * put_user_pages() - release an array of gup-pinned pages.
+ * unpin_user_pages() - release an array of gup-pinned pages.
  * @pages:  array of pages to be marked dirty and released.
  * @npages: number of pages in the @pages array.
  *
- * For each page in the @pages array, release the page using put_user_page=
().
+ * For each page in the @pages array, release the page using unpin_user_pa=
ge().
  *
- * Please see the put_user_page() documentation for details.
+ * Please see the unpin_user_page() documentation for details.
  */
-void put_user_pages(struct page **pages, unsigned long npages)
+void unpin_user_pages(struct page **pages, unsigned long npages)
 {
 	unsigned long index;
=20
@@ -227,9 +227,9 @@ void put_user_pages(struct page **pages, unsigned long =
npages)
 	 * single operation to the head page should suffice.
 	 */
 	for (index =3D 0; index < npages; index++)
-		put_user_page(pages[index]);
+		unpin_user_page(pages[index]);
 }
-EXPORT_SYMBOL(put_user_pages);
+EXPORT_SYMBOL(unpin_user_pages);
=20
 #ifdef CONFIG_MMU
 static struct page *no_page_table(struct vm_area_struct *vma,
@@ -1956,7 +1956,7 @@ static void __maybe_unused undo_dev_pagemap(int *nr, =
int nr_start,
=20
 		ClearPageReferenced(page);
 		if (flags & FOLL_PIN)
-			put_user_page(page);
+			unpin_user_page(page);
 		else
 			put_page(page);
 	}
diff --git a/mm/gup_benchmark.c b/mm/gup_benchmark.c
index 1ac089ad815f..76d32db48af8 100644
--- a/mm/gup_benchmark.c
+++ b/mm/gup_benchmark.c
@@ -35,7 +35,7 @@ static void put_back_pages(int cmd, struct page **pages, =
unsigned long nr_pages)
=20
 	case PIN_FAST_BENCHMARK:
 	case PIN_BENCHMARK:
-		put_user_pages(pages, nr_pages);
+		unpin_user_pages(pages, nr_pages);
 		break;
 	}
 }
diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
index fd20ab675b85..de41e830cdac 100644
--- a/mm/process_vm_access.c
+++ b/mm/process_vm_access.c
@@ -126,8 +126,8 @@ static int process_vm_rw_single_vec(unsigned long addr,
 		pa +=3D pinned_pages * PAGE_SIZE;
=20
 		/* If vm_write is set, the pages need to be made dirty: */
-		put_user_pages_dirty_lock(process_pages, pinned_pages,
-					  vm_write);
+		unpin_user_pages_dirty_lock(process_pages, pinned_pages,
+					    vm_write);
 	}
=20
 	return rc;
diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
index d071003b5e76..ac182c38f7b0 100644
--- a/net/xdp/xdp_umem.c
+++ b/net/xdp/xdp_umem.c
@@ -212,7 +212,7 @@ static int xdp_umem_map_pages(struct xdp_umem *umem)
=20
 static void xdp_umem_unpin_pages(struct xdp_umem *umem)
 {
-	put_user_pages_dirty_lock(umem->pgs, umem->npgs, true);
+	unpin_user_pages_dirty_lock(umem->pgs, umem->npgs, true);
=20
 	kfree(umem->pgs);
 	umem->pgs =3D NULL;
--=20
2.24.0

