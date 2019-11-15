Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A383AFD543
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 06:57:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DngJ6YnpzF4g0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 16:57:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="rwUonDg3"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DnbL1h0wzF7FZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 16:53:49 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dce3d6c0004>; Thu, 14 Nov 2019 21:53:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 14 Nov 2019 21:53:45 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 14 Nov 2019 21:53:45 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:44 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:44 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 15 Nov 2019 05:53:44 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dce3d680001>; Thu, 14 Nov 2019 21:53:44 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 09/24] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
Date: Thu, 14 Nov 2019 21:53:25 -0800
Message-ID: <20191115055340.1825745-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115055340.1825745-1-jhubbard@nvidia.com>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573797229; bh=XXf2z9E2h3nJJ7tPIWwXlNkpRCBL//VvkhnOWbGoZcM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=rwUonDg3bS6p3OTkVtQ/BxqDFsc2SMppCPjGoA5RRSly5W3pODI1lWv9RPN+e7maF
 hadz8DNQL31FH0q5V0FTvZSQo74LK49ArrDIPS8ZLlW40HzcEay37nqU+TwhJZtX/m
 /vn0jufbYSaVuIsOsTaOHOug1QA+6CKU3YExpMdWUtZI0T0tltZhObXAuIWTtethmQ
 QqaAQ3pwRmBrfaADML3Lyl4PLixfpflCQMXvWxM4RVyuWfL3LfFdUmj0DEWUVIpdol
 RCa/QHsN4JN1fsEJQ/QPWo2uLvtSm8qyJs3ri3jv3hgDqouuPIbi4pNmb6VVXrzXYb
 KblarMInI2chg==
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
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
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

As it says in the updated comment in gup.c: current FOLL_LONGTERM
behavior is incompatible with FAULT_FLAG_ALLOW_RETRY because of the
FS DAX check requirement on vmas.

However, the corresponding restriction in get_user_pages_remote() was
slightly stricter than is actually required: it forbade all
FOLL_LONGTERM callers, but we can actually allow FOLL_LONGTERM callers
that do not set the "locked" arg.

Update the code and comments accordingly, and update the VFIO caller
to take advantage of this, fixing a bug as a result: the VFIO caller
is logically a FOLL_LONGTERM user.

Also, remove an unnessary pair of calls that were releasing and
reacquiring the mmap_sem. There is no need to avoid holding mmap_sem
just in order to call page_to_pfn().

Also, move the DAX check ("if a VMA is DAX, don't allow long term
pinning") from the VFIO call site, all the way into the internals
of get_user_pages_remote() and __gup_longterm_locked(). That is:
get_user_pages_remote() calls __gup_longterm_locked(), which in turn
calls check_dax_vmas(). It's lightly explained in the comments as well.

Thanks to Jason Gunthorpe for pointing out a clean way to fix this,
and to Dan Williams for helping clarify the DAX refactoring.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jerome Glisse <jglisse@redhat.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 30 +++++-------------------------
 mm/gup.c                        | 27 ++++++++++++++++++++++-----
 2 files changed, 27 insertions(+), 30 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type=
1.c
index d864277ea16f..c7a111ad9975 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -340,7 +340,6 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned=
 long vaddr,
 {
 	struct page *page[1];
 	struct vm_area_struct *vma;
-	struct vm_area_struct *vmas[1];
 	unsigned int flags =3D 0;
 	int ret;
=20
@@ -348,33 +347,14 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsign=
ed long vaddr,
 		flags |=3D FOLL_WRITE;
=20
 	down_read(&mm->mmap_sem);
-	if (mm =3D=3D current->mm) {
-		ret =3D get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
-				     vmas);
-	} else {
-		ret =3D get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
-					    vmas, NULL);
-		/*
-		 * The lifetime of a vaddr_get_pfn() page pin is
-		 * userspace-controlled. In the fs-dax case this could
-		 * lead to indefinite stalls in filesystem operations.
-		 * Disallow attempts to pin fs-dax pages via this
-		 * interface.
-		 */
-		if (ret > 0 && vma_is_fsdax(vmas[0])) {
-			ret =3D -EOPNOTSUPP;
-			put_page(page[0]);
-		}
-	}
-	up_read(&mm->mmap_sem);
-
+	ret =3D get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
+				    page, NULL, NULL);
 	if (ret =3D=3D 1) {
 		*pfn =3D page_to_pfn(page[0]);
-		return 0;
+		ret =3D 0;
+		goto done;
 	}
=20
-	down_read(&mm->mmap_sem);
-
 	vaddr =3D untagged_addr(vaddr);
=20
 	vma =3D find_vma_intersection(mm, vaddr, vaddr + 1);
@@ -384,7 +364,7 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned=
 long vaddr,
 		if (is_invalid_reserved_pfn(*pfn))
 			ret =3D 0;
 	}
-
+done:
 	up_read(&mm->mmap_sem);
 	return ret;
 }
diff --git a/mm/gup.c b/mm/gup.c
index b859bd4da4d7..6cf613bfe7dc 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -29,6 +29,13 @@ struct follow_page_context {
 	unsigned int page_mask;
 };
=20
+static __always_inline long __gup_longterm_locked(struct task_struct *tsk,
+						  struct mm_struct *mm,
+						  unsigned long start,
+						  unsigned long nr_pages,
+						  struct page **pages,
+						  struct vm_area_struct **vmas,
+						  unsigned int flags);
 /*
  * Return the compound head page with ref appropriately incremented,
  * or NULL if that failed.
@@ -1167,13 +1174,23 @@ long get_user_pages_remote(struct task_struct *tsk,=
 struct mm_struct *mm,
 		struct vm_area_struct **vmas, int *locked)
 {
 	/*
-	 * FIXME: Current FOLL_LONGTERM behavior is incompatible with
+	 * Parts of FOLL_LONGTERM behavior are incompatible with
 	 * FAULT_FLAG_ALLOW_RETRY because of the FS DAX check requirement on
-	 * vmas.  As there are no users of this flag in this call we simply
-	 * disallow this option for now.
+	 * vmas. However, this only comes up if locked is set, and there are
+	 * callers that do request FOLL_LONGTERM, but do not set locked. So,
+	 * allow what we can.
 	 */
-	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
-		return -EINVAL;
+	if (gup_flags & FOLL_LONGTERM) {
+		if (WARN_ON_ONCE(locked))
+			return -EINVAL;
+		/*
+		 * This will check the vmas (even if our vmas arg is NULL)
+		 * and return -ENOTSUPP if DAX isn't allowed in this case:
+		 */
+		return __gup_longterm_locked(tsk, mm, start, nr_pages, pages,
+					     vmas, gup_flags | FOLL_TOUCH |
+					     FOLL_REMOTE);
+	}
=20
 	return __get_user_pages_locked(tsk, mm, start, nr_pages, pages, vmas,
 				       locked,
--=20
2.24.0

