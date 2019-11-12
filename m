Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B78D9F8523
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 01:23:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BpPr3T4FzF3DS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 11:23:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="SJ2uh291"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bp2r1mb5zF4Lw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 11:07:15 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7780003>; Mon, 11 Nov 2019 16:06:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:12 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 16:07:12 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:12 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:11 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7ae0000>; Mon, 11 Nov 2019 16:07:11 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
Date: Mon, 11 Nov 2019 16:06:45 -0800
Message-ID: <20191112000700.3455038-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573517177; bh=LHd6nlstYt/+WO2arS2xO7M4BDaQ4oXhsosl4/alSFg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=SJ2uh291o0n2KAathWWaARa6MvN+m/A73UL04mBGFpYz9dwZwEu2YOKZK/z6oR36f
 S4MmrBohFcW7M4U4sGwLAQQaa4ErNxr5zszFsv1ppGBtK5nFe0oidXZ1r/1d+C5hHD
 7OdWLPmiW5F6FVC/3nIr5wwa+GbS2yQdK9nseWpjIMdx642Wxvb5Kkid/PLVxBV3h0
 OGPpdpsgYBaWnEIgbpCi7rX0MmoFtgOyBhqm3y6VOtt9bGAvDRddLo4gcp8LgfWb9W
 RGx06m/cZaFaW7nNL6zPl1lRK04yV8Qj7tUjurbVty1S8No3Te9OtVs5tQeXtoroeI
 mB7ag0CyWpHAw==
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

Thanks to Jason Gunthorpe for pointing out a clean way to fix this.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jerome Glisse <jglisse@redhat.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 30 +++++++++++++-----------------
 mm/gup.c                        | 13 ++++++++-----
 2 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type=
1.c
index d864277ea16f..017689b7c32b 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -348,24 +348,20 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsign=
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
+	ret =3D get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
+				    page, vmas, NULL);
+	/*
+	 * The lifetime of a vaddr_get_pfn() page pin is
+	 * userspace-controlled. In the fs-dax case this could
+	 * lead to indefinite stalls in filesystem operations.
+	 * Disallow attempts to pin fs-dax pages via this
+	 * interface.
+	 */
+	if (ret > 0 && vma_is_fsdax(vmas[0])) {
+		ret =3D -EOPNOTSUPP;
+		put_page(page[0]);
 	}
+
 	up_read(&mm->mmap_sem);
=20
 	if (ret =3D=3D 1) {
diff --git a/mm/gup.c b/mm/gup.c
index 933524de6249..cfe6dc5fc343 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1167,13 +1167,16 @@ long get_user_pages_remote(struct task_struct *tsk,=
 struct mm_struct *mm,
 		struct vm_area_struct **vmas, int *locked)
 {
 	/*
-	 * FIXME: Current FOLL_LONGTERM behavior is incompatible with
+	 * Current FOLL_LONGTERM behavior is incompatible with
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
+	}
=20
 	return __get_user_pages_locked(tsk, mm, start, nr_pages, pages, vmas,
 				       locked,
--=20
2.24.0

