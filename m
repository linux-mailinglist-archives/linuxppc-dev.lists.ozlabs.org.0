Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6CF8537
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 01:31:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BpZs1dVGzF4jl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 11:31:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="a5xgZrZr"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bp2w4lVszF4M9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 11:07:20 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f77d0000>; Mon, 11 Nov 2019 16:06:21 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:17 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 16:07:17 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:16 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:15 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7b20002>; Mon, 11 Nov 2019 16:07:15 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 11/23] IB/{core, hw, umem}: set FOLL_PIN,
 FOLL_LONGTERM via pin_longterm_pages*()
Date: Mon, 11 Nov 2019 16:06:48 -0800
Message-ID: <20191112000700.3455038-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573517181; bh=5nX/THDsrOXdU0b+XUET79+1RnNMMrvnZjBYt5DvngE=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=a5xgZrZr5Ib7OOgqqc8Afi9jpUPyK56KbytbYrThxUv8xQEpN1Z7ds54HklxwiErC
 2a+eH+pyET6Ra5wmbMV30IhV9k8m/4coaT9MWdeSfc0bua65zKIlk5fNkhm47pT5OU
 3YhmDNhefK8KVEyQhIubU9/lEkKlTfAqsaoKPiuLwgPp5SCIYnJkWGWuto63+etHXF
 FPu9Nkq1mJwv5xk6jTOf9QRU2FhNTp9H5k/GdHw7uv2p0Duzf/AaiIdIlJgmhUmEsl
 aIsTSFlvuyEufThNWAB/0+w9bl69hWNYGCbCeKVrvvf4T6J5NYaL2l4MqMhUlzDh+a
 QeeMzl+55wD2g==
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

Convert infiniband to use the new wrapper calls, and stop
explicitly setting FOLL_LONGTERM at the call sites.

The new pin_longterm_*() calls replace get_user_pages*()
calls, and set both FOLL_LONGTERM and a new FOLL_PIN
flag. The FOLL_PIN flag requires that the caller must
return the pages via put_user_page*() calls, but
infiniband was already doing that as part of an earlier
commit.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/infiniband/core/umem.c              | 10 ++++-----
 drivers/infiniband/core/umem_odp.c          | 24 ++++++++++-----------
 drivers/infiniband/hw/hfi1/user_pages.c     |  4 ++--
 drivers/infiniband/hw/mthca/mthca_memfree.c |  3 +--
 drivers/infiniband/hw/qib/qib_user_pages.c  |  8 +++----
 drivers/infiniband/hw/qib/qib_user_sdma.c   |  2 +-
 drivers/infiniband/hw/usnic/usnic_uiom.c    |  9 ++++----
 drivers/infiniband/sw/siw/siw_mem.c         |  5 ++---
 8 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.=
c
index 3d664a2539eb..7f03f72e6dce 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -271,11 +271,11 @@ struct ib_umem *ib_umem_get(struct ib_udata *udata, u=
nsigned long addr,
 	sg =3D umem->sg_head.sgl;
=20
 	while (npages) {
-		ret =3D get_user_pages_fast(cur_base,
-					  min_t(unsigned long, npages,
-						PAGE_SIZE /
-						sizeof(struct page *)),
-					  gup_flags | FOLL_LONGTERM, page_list);
+		ret =3D pin_longterm_pages_fast(cur_base,
+					      min_t(unsigned long, npages,
+						    PAGE_SIZE /
+						    sizeof(struct page *)),
+					      gup_flags, page_list);
 		if (ret < 0)
 			goto umem_release;
=20
diff --git a/drivers/infiniband/core/umem_odp.c b/drivers/infiniband/core/u=
mem_odp.c
index 163ff7ba92b7..b0ae039f884d 100644
--- a/drivers/infiniband/core/umem_odp.c
+++ b/drivers/infiniband/core/umem_odp.c
@@ -495,9 +495,8 @@ EXPORT_SYMBOL(ib_umem_odp_release);
  * The function returns -EFAULT if the DMA mapping operation fails. It ret=
urns
  * -EAGAIN if a concurrent invalidation prevents us from updating the page=
.
  *
- * The page is released via put_user_page even if the operation failed. Fo=
r
- * on-demand pinning, the page is released whenever it isn't stored in the
- * umem.
+ * The page is released via put_page even if the operation failed. For on-=
demand
+ * pinning, the page is released whenever it isn't stored in the umem.
  */
 static int ib_umem_odp_map_dma_single_page(
 		struct ib_umem_odp *umem_odp,
@@ -542,7 +541,7 @@ static int ib_umem_odp_map_dma_single_page(
 	}
=20
 out:
-	put_user_page(page);
+	put_page(page);
=20
 	if (remove_existing_mapping) {
 		ib_umem_notifier_start_account(umem_odp);
@@ -639,13 +638,14 @@ int ib_umem_odp_map_dma_pages(struct ib_umem_odp *ume=
m_odp, u64 user_virt,
 		/*
 		 * Note: this might result in redundent page getting. We can
 		 * avoid this by checking dma_list to be 0 before calling
-		 * get_user_pages. However, this make the code much more
-		 * complex (and doesn't gain us much performance in most use
-		 * cases).
+		 * get_user_pages. However, this makes the code much
+		 * more complex (and doesn't gain us much performance in most
+		 * use cases).
 		 */
 		npages =3D get_user_pages_remote(owning_process, owning_mm,
-				user_virt, gup_num_pages,
-				flags, local_page_list, NULL, NULL);
+					       user_virt, gup_num_pages,
+					       flags, local_page_list, NULL,
+					       NULL);
 		up_read(&owning_mm->mmap_sem);
=20
 		if (npages < 0) {
@@ -665,7 +665,7 @@ int ib_umem_odp_map_dma_pages(struct ib_umem_odp *umem_=
odp, u64 user_virt,
 					ret =3D -EFAULT;
 					break;
 				}
-				put_user_page(local_page_list[j]);
+				put_page(local_page_list[j]);
 				continue;
 			}
=20
@@ -692,8 +692,8 @@ int ib_umem_odp_map_dma_pages(struct ib_umem_odp *umem_=
odp, u64 user_virt,
 			 * ib_umem_odp_map_dma_single_page().
 			 */
 			if (npages - (j + 1) > 0)
-				put_user_pages(&local_page_list[j+1],
-					       npages - (j + 1));
+				release_pages(&local_page_list[j+1],
+					      npages - (j + 1));
 			break;
 		}
 	}
diff --git a/drivers/infiniband/hw/hfi1/user_pages.c b/drivers/infiniband/h=
w/hfi1/user_pages.c
index 469acb961fbd..9b55b0a73e29 100644
--- a/drivers/infiniband/hw/hfi1/user_pages.c
+++ b/drivers/infiniband/hw/hfi1/user_pages.c
@@ -104,9 +104,9 @@ int hfi1_acquire_user_pages(struct mm_struct *mm, unsig=
ned long vaddr, size_t np
 			    bool writable, struct page **pages)
 {
 	int ret;
-	unsigned int gup_flags =3D FOLL_LONGTERM | (writable ? FOLL_WRITE : 0);
+	unsigned int gup_flags =3D (writable ? FOLL_WRITE : 0);
=20
-	ret =3D get_user_pages_fast(vaddr, npages, gup_flags, pages);
+	ret =3D pin_longterm_pages_fast(vaddr, npages, gup_flags, pages);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/infiniband/hw/mthca/mthca_memfree.c b/drivers/infiniba=
nd/hw/mthca/mthca_memfree.c
index edccfd6e178f..beec7e4b8a96 100644
--- a/drivers/infiniband/hw/mthca/mthca_memfree.c
+++ b/drivers/infiniband/hw/mthca/mthca_memfree.c
@@ -472,8 +472,7 @@ int mthca_map_user_db(struct mthca_dev *dev, struct mth=
ca_uar *uar,
 		goto out;
 	}
=20
-	ret =3D get_user_pages_fast(uaddr & PAGE_MASK, 1,
-				  FOLL_WRITE | FOLL_LONGTERM, pages);
+	ret =3D pin_longterm_pages_fast(uaddr & PAGE_MASK, 1, FOLL_WRITE, pages);
 	if (ret < 0)
 		goto out;
=20
diff --git a/drivers/infiniband/hw/qib/qib_user_pages.c b/drivers/infiniban=
d/hw/qib/qib_user_pages.c
index 6bf764e41891..684a14e14d9b 100644
--- a/drivers/infiniband/hw/qib/qib_user_pages.c
+++ b/drivers/infiniband/hw/qib/qib_user_pages.c
@@ -108,10 +108,10 @@ int qib_get_user_pages(unsigned long start_page, size=
_t num_pages,
=20
 	down_read(&current->mm->mmap_sem);
 	for (got =3D 0; got < num_pages; got +=3D ret) {
-		ret =3D get_user_pages(start_page + got * PAGE_SIZE,
-				     num_pages - got,
-				     FOLL_LONGTERM | FOLL_WRITE | FOLL_FORCE,
-				     p + got, NULL);
+		ret =3D pin_longterm_pages(start_page + got * PAGE_SIZE,
+					 num_pages - got,
+					 FOLL_WRITE | FOLL_FORCE,
+					 p + got, NULL);
 		if (ret < 0) {
 			up_read(&current->mm->mmap_sem);
 			goto bail_release;
diff --git a/drivers/infiniband/hw/qib/qib_user_sdma.c b/drivers/infiniband=
/hw/qib/qib_user_sdma.c
index 05190edc2611..fd86a9d19370 100644
--- a/drivers/infiniband/hw/qib/qib_user_sdma.c
+++ b/drivers/infiniband/hw/qib/qib_user_sdma.c
@@ -670,7 +670,7 @@ static int qib_user_sdma_pin_pages(const struct qib_dev=
data *dd,
 		else
 			j =3D npages;
=20
-		ret =3D get_user_pages_fast(addr, j, FOLL_LONGTERM, pages);
+		ret =3D pin_longterm_pages_fast(addr, j, 0, pages);
 		if (ret !=3D j) {
 			i =3D 0;
 			j =3D ret;
diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/=
hw/usnic/usnic_uiom.c
index 62e6ffa9ad78..6b90ca1c3771 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.c
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
@@ -141,11 +141,10 @@ static int usnic_uiom_get_pages(unsigned long addr, s=
ize_t size, int writable,
 	ret =3D 0;
=20
 	while (npages) {
-		ret =3D get_user_pages(cur_base,
-				     min_t(unsigned long, npages,
-				     PAGE_SIZE / sizeof(struct page *)),
-				     gup_flags | FOLL_LONGTERM,
-				     page_list, NULL);
+		ret =3D pin_longterm_pages(cur_base,
+					 min_t(unsigned long, npages,
+					     PAGE_SIZE / sizeof(struct page *)),
+					 gup_flags, page_list, NULL);
=20
 		if (ret < 0)
 			goto out;
diff --git a/drivers/infiniband/sw/siw/siw_mem.c b/drivers/infiniband/sw/si=
w/siw_mem.c
index e99983f07663..20e663d7ada8 100644
--- a/drivers/infiniband/sw/siw/siw_mem.c
+++ b/drivers/infiniband/sw/siw/siw_mem.c
@@ -426,9 +426,8 @@ struct siw_umem *siw_umem_get(u64 start, u64 len, bool =
writable)
 		while (nents) {
 			struct page **plist =3D &umem->page_chunk[i].plist[got];
=20
-			rv =3D get_user_pages(first_page_va, nents,
-					    foll_flags | FOLL_LONGTERM,
-					    plist, NULL);
+			rv =3D pin_longterm_pages(first_page_va, nents,
+						foll_flags, plist, NULL);
 			if (rv < 0)
 				goto out_sem_up;
=20
--=20
2.24.0

