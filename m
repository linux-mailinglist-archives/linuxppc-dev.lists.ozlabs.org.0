Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E41117B3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 00:10:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WzRy4X3JzDqSG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 10:10:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65;
 helo=hqnvemgate26.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="Yr7rnMyP"; 
 dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wz5Q54FVzDqFM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 09:54:02 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed07f0002>; Mon, 09 Dec 2019 14:53:52 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:53:57 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 09 Dec 2019 14:53:57 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:53:57 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:53:56 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:53:56 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed0830002>; Mon, 09 Dec 2019 14:53:55 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 07/26] vfio: fix FOLL_LONGTERM use,
 simplify get_user_pages_remote() call
Date: Mon, 9 Dec 2019 14:53:25 -0800
Message-ID: <20191209225344.99740-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1575932032; bh=8L6xDPC0B530xp/MTT0aA3xB5v7i2RtCewyab6Z4Hgg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Yr7rnMyP9nuJBW/roKy+70R1QH1xPYt7cT5b3NmcMit5wvFElqNAZ7Snz2sWvvVy7
 6Yh3d6zgXNGmtvZqjsmA6es64h9a8u6TMyLPhBHDlW3o5G5JGlJZUzT4G2YQN0ElhJ
 M74Lu94G7MHDwiXBP5nzKgBnvuwLPWrxJzr7w/VhBmvI+iYPpkH1Oe2UoxZusyZWW8
 dxWo9gbaLViTIo2IDCzCFGedH7Tm1vD787dlT3Ez73wIHQ1uuw+4NEad9sRDLADDLO
 NV7lshKCHkEyy8n9++u3nJk2vzho4m56YWzJMlqbY9aI5KV88eqDR10FBgoMHHIPkv
 ETlsss72YMETA==
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
 Jason Gunthorpe <jgg@ziepe.ca>, Jason
 Gunthorpe <jgg@mellanox.com>, Vlastimil Babka <vbabka@suse.cz>,
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

Update VFIO to take advantage of the recently loosened restriction on
FOLL_LONGTERM with get_user_pages_remote(). Also, now it is possible to
fix a bug: the VFIO caller is logically a FOLL_LONGTERM user, but it
wasn't setting FOLL_LONGTERM.

Also, remove an unnessary pair of calls that were releasing and
reacquiring the mmap_sem. There is no need to avoid holding mmap_sem
just in order to call page_to_pfn().

Also, now that the the DAX check ("if a VMA is DAX, don't allow long
term pinning") is in the internals of get_user_pages_remote() and
__gup_longterm_locked(), there's no need for it at the VFIO call site.
So remove it.

Tested-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jerome Glisse <jglisse@redhat.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type=
1.c
index 2ada8e6cdb88..b800fc9a0251 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -322,7 +322,6 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned=
 long vaddr,
 {
 	struct page *page[1];
 	struct vm_area_struct *vma;
-	struct vm_area_struct *vmas[1];
 	unsigned int flags =3D 0;
 	int ret;
=20
@@ -330,33 +329,14 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsign=
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
@@ -366,7 +346,7 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned=
 long vaddr,
 		if (is_invalid_reserved_pfn(*pfn))
 			ret =3D 0;
 	}
-
+done:
 	up_read(&mm->mmap_sem);
 	return ret;
 }
--=20
2.24.0

