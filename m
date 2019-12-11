Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9344E11A30D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 04:32:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XjCs6TW6zDqjg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 14:32:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqnvemgate24.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="fKedKOWK"; 
 dkim-atps=neutral
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XhMY3N7czDqf3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 13:53:43 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df05a190002>; Tue, 10 Dec 2019 18:53:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 10 Dec 2019 18:53:35 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 10 Dec 2019 18:53:35 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 02:53:34 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 11 Dec 2019 02:53:34 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df05a2d0000>; Tue, 10 Dec 2019 18:53:33 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 20/25] powerpc: book3s64: convert to pin_user_pages() and
 put_user_page()
Date: Tue, 10 Dec 2019 18:53:13 -0800
Message-ID: <20191211025318.457113-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211025318.457113-1-jhubbard@nvidia.com>
References: <20191211025318.457113-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576032794; bh=ZC502pnG3lzyZPc0rKFPYTMvPQMW7bt9uWUpRzgAdGk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=fKedKOWKlEjG2jyPhFKMdzrR++wUcbANBWq5feSrewLbb83bWkn1hHUYv8XVYC6pj
 JLS3nsfDqsgBr2ddjA7wgLgUEgdtD38gvy/9tyl/ddAk49KAXPvIIQouylAemgrp4X
 5kw/KpUP1KsVCINrnTOiK/pL60/mdjsLzz9o9y9d28Lm9ha4FEiVQMcKgLh3m90inR
 U33+PFeh85sc0M7HSoF5WTfOD4/uMBA0ziiYNagCIA3PNkzh6AM3ysMqjGU7mZL0iT
 LOtYnVoxLbznfec4PU8NPFMBgZBIfrIv0lUptVo6sz4ZvRD+yIh7R/d0jUZP3WyQwV
 +HmVZkSX92KZw==
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

1. Convert from get_user_pages() to pin_user_pages().

2. As required by pin_user_pages(), release these pages via
put_user_page().

Cc: Jan Kara <jack@suse.cz>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 arch/powerpc/mm/book3s64/iommu_api.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s6=
4/iommu_api.c
index 56cc84520577..a86547822034 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -103,7 +103,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, uns=
igned long ua,
 	for (entry =3D 0; entry < entries; entry +=3D chunk) {
 		unsigned long n =3D min(entries - entry, chunk);
=20
-		ret =3D get_user_pages(ua + (entry << PAGE_SHIFT), n,
+		ret =3D pin_user_pages(ua + (entry << PAGE_SHIFT), n,
 				FOLL_WRITE | FOLL_LONGTERM,
 				mem->hpages + entry, NULL);
 		if (ret =3D=3D n) {
@@ -167,9 +167,8 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, uns=
igned long ua,
 	return 0;
=20
 free_exit:
-	/* free the reference taken */
-	for (i =3D 0; i < pinned; i++)
-		put_page(mem->hpages[i]);
+	/* free the references taken */
+	put_user_pages(mem->hpages, pinned);
=20
 	vfree(mem->hpas);
 	kfree(mem);
@@ -215,7 +214,8 @@ static void mm_iommu_unpin(struct mm_iommu_table_group_=
mem_t *mem)
 		if (mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY)
 			SetPageDirty(page);
=20
-		put_page(page);
+		put_user_page(page);
+
 		mem->hpas[i] =3D 0;
 	}
 }
--=20
2.24.0

