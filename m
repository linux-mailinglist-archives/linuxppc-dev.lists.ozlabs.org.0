Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD913371C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 00:12:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sp7D65gzzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 10:12:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqnvemgate24.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="rh11n4oa"; 
 dkim-atps=neutral
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47snY15sMBzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 09:46:12 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1509f80001>; Tue, 07 Jan 2020 14:45:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 07 Jan 2020 14:46:00 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 07 Jan 2020 14:46:00 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 22:46:00 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 22:46:00 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e150a270005>; Tue, 07 Jan 2020 14:45:59 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v12 01/22] mm/gup: factor out duplicate code from four routines
Date: Tue, 7 Jan 2020 14:45:37 -0800
Message-ID: <20200107224558.2362728-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107224558.2362728-1-jhubbard@nvidia.com>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578437112; bh=3UN+pZEMmKNfRZpugUWk2xqc0GntLXSHLik6fdzsQds=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=rh11n4oaBxWFqT8lK+qes4B5xBWDrco6QyD2M2yDm+QCE+vBQ16klE+qS3zQfGzXq
 +qKyTBawgNO5qGQ7ZIXXKfnm4o4JYFvrI9UhRPq3mm7KLBpYIbTL8lzOpAFMxs5WZu
 gONM+uwb608m3ELiQ8GQLAxmAkxyvlQggWH8XGBLcI1kYFai16CTU1o7a5A084zOg3
 rrnPIrSCakAKg5jxbHBxvOTGHf5ZZi16qF4+V2nMym+rgt0MPHjAcqTlB2OnPTyKBP
 MQ1luy1XuSDr1oKu91qrUiCF1gb/vfw5L46WA/jsyc34Ll0oadvtnbj9JQWBIrH/6x
 G98kFBFiMKA2g==
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
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are four locations in gup.c that have a fair amount of code
duplication. This means that changing one requires making the same
changes in four places, not to mention reading the same code four
times, and wondering if there are subtle differences.

Factor out the common code into static functions, thus reducing the
overall line count and the code's complexity.

Also, take the opportunity to slightly improve the efficiency of the
error cases, by doing a mass subtraction of the refcount, surrounded
by get_page()/put_page().

Also, further simplify (slightly), by waiting until the the successful
end of each routine, to increment *nr.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Cc: Kirill A. Shutemov <kirill@shutemov.name>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup.c | 95 ++++++++++++++++++++++++--------------------------------
 1 file changed, 40 insertions(+), 55 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 7646bf993b25..d56c6d6b85d3 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1978,6 +1978,29 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *p=
udp, unsigned long addr,
 }
 #endif
=20
+static int record_subpages(struct page *page, unsigned long addr,
+			   unsigned long end, struct page **pages)
+{
+	int nr;
+
+	for (nr =3D 0; addr !=3D end; addr +=3D PAGE_SIZE)
+		pages[nr++] =3D page++;
+
+	return nr;
+}
+
+static void put_compound_head(struct page *page, int refs)
+{
+	VM_BUG_ON_PAGE(page_ref_count(page) < refs, page);
+	/*
+	 * Calling put_page() for each ref is unnecessarily slow. Only the last
+	 * ref needs a put_page().
+	 */
+	if (refs > 1)
+		page_ref_sub(page, refs - 1);
+	put_page(page);
+}
+
 #ifdef CONFIG_ARCH_HAS_HUGEPD
 static unsigned long hugepte_addr_end(unsigned long addr, unsigned long en=
d,
 				      unsigned long sz)
@@ -2007,32 +2030,20 @@ static int gup_hugepte(pte_t *ptep, unsigned long s=
z, unsigned long addr,
 	/* hugepages are never "special" */
 	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
=20
-	refs =3D 0;
 	head =3D pte_page(pte);
-
 	page =3D head + ((addr & (sz-1)) >> PAGE_SHIFT);
-	do {
-		VM_BUG_ON(compound_head(page) !=3D head);
-		pages[*nr] =3D page;
-		(*nr)++;
-		page++;
-		refs++;
-	} while (addr +=3D PAGE_SIZE, addr !=3D end);
+	refs =3D record_subpages(page, addr, end, pages + *nr);
=20
 	head =3D try_get_compound_head(head, refs);
-	if (!head) {
-		*nr -=3D refs;
+	if (!head)
 		return 0;
-	}
=20
 	if (unlikely(pte_val(pte) !=3D pte_val(*ptep))) {
-		/* Could be optimized better */
-		*nr -=3D refs;
-		while (refs--)
-			put_page(head);
+		put_compound_head(head, refs);
 		return 0;
 	}
=20
+	*nr +=3D refs;
 	SetPageReferenced(head);
 	return 1;
 }
@@ -2079,28 +2090,19 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, un=
signed long addr,
 		return __gup_device_huge_pmd(orig, pmdp, addr, end, pages, nr);
 	}
=20
-	refs =3D 0;
 	page =3D pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
-	do {
-		pages[*nr] =3D page;
-		(*nr)++;
-		page++;
-		refs++;
-	} while (addr +=3D PAGE_SIZE, addr !=3D end);
+	refs =3D record_subpages(page, addr, end, pages + *nr);
=20
 	head =3D try_get_compound_head(pmd_page(orig), refs);
-	if (!head) {
-		*nr -=3D refs;
+	if (!head)
 		return 0;
-	}
=20
 	if (unlikely(pmd_val(orig) !=3D pmd_val(*pmdp))) {
-		*nr -=3D refs;
-		while (refs--)
-			put_page(head);
+		put_compound_head(head, refs);
 		return 0;
 	}
=20
+	*nr +=3D refs;
 	SetPageReferenced(head);
 	return 1;
 }
@@ -2120,28 +2122,19 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, un=
signed long addr,
 		return __gup_device_huge_pud(orig, pudp, addr, end, pages, nr);
 	}
=20
-	refs =3D 0;
 	page =3D pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
-	do {
-		pages[*nr] =3D page;
-		(*nr)++;
-		page++;
-		refs++;
-	} while (addr +=3D PAGE_SIZE, addr !=3D end);
+	refs =3D record_subpages(page, addr, end, pages + *nr);
=20
 	head =3D try_get_compound_head(pud_page(orig), refs);
-	if (!head) {
-		*nr -=3D refs;
+	if (!head)
 		return 0;
-	}
=20
 	if (unlikely(pud_val(orig) !=3D pud_val(*pudp))) {
-		*nr -=3D refs;
-		while (refs--)
-			put_page(head);
+		put_compound_head(head, refs);
 		return 0;
 	}
=20
+	*nr +=3D refs;
 	SetPageReferenced(head);
 	return 1;
 }
@@ -2157,28 +2150,20 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, un=
signed long addr,
 		return 0;
=20
 	BUILD_BUG_ON(pgd_devmap(orig));
-	refs =3D 0;
+
 	page =3D pgd_page(orig) + ((addr & ~PGDIR_MASK) >> PAGE_SHIFT);
-	do {
-		pages[*nr] =3D page;
-		(*nr)++;
-		page++;
-		refs++;
-	} while (addr +=3D PAGE_SIZE, addr !=3D end);
+	refs =3D record_subpages(page, addr, end, pages + *nr);
=20
 	head =3D try_get_compound_head(pgd_page(orig), refs);
-	if (!head) {
-		*nr -=3D refs;
+	if (!head)
 		return 0;
-	}
=20
 	if (unlikely(pgd_val(orig) !=3D pgd_val(*pgdp))) {
-		*nr -=3D refs;
-		while (refs--)
-			put_page(head);
+		put_compound_head(head, refs);
 		return 0;
 	}
=20
+	*nr +=3D refs;
 	SetPageReferenced(head);
 	return 1;
 }
--=20
2.24.1

