Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD48FED5EB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2019 22:44:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 475qFg4TSfzF5Bf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 08:44:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="F+q+2Nm2"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 475pgl03GSzF4Sd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 08:18:26 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbf441d0000>; Sun, 03 Nov 2019 13:18:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 03 Nov 2019 13:18:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 03 Nov 2019 13:18:15 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 3 Nov
 2019 21:18:15 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 3 Nov 2019 21:18:15 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dbf44160003>; Sun, 03 Nov 2019 13:18:14 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 02/18] mm/gup: factor out duplicate code from four routines
Date: Sun, 3 Nov 2019 13:17:57 -0800
Message-ID: <20191103211813.213227-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103211813.213227-1-jhubbard@nvidia.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572815902; bh=kaGNIHbfja+uY6cKXyOxb4P0f0fYoWBJW4uSclr3zkQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=F+q+2Nm2ah/6kNgKZO4cO9APqojvmMVAYoNWjgqqiwuDdQ8AP4EoxEyVuWbTt8N2x
 0+gD4dEhHTWFLjxwoxODmXiRboHOHRebRhnxK6rrF/aN6FezATSRMkoofDhN+Kuzhc
 98lFHWFikPv2z7wfnG6mSw5YYZPL8XOTsZfY+FbjSEBKpSjlQnNQMjobgvNx0k8n70
 il61zIlP+u2wVU/NhvddF6W54orHnMnHFeueINqCQkIh5mazHUKZlAPnI7TOBul3P0
 2tFEv+/R43mvXKPVCaEFILRD5ZM9jAljSrGESHyz+w6X9AmZw/Frq+aOpSSUHsEtTl
 ds+UW1ym+06oQ==
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

Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup.c | 104 ++++++++++++++++++++++++-------------------------------
 1 file changed, 45 insertions(+), 59 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 85caf76b3012..199da99e8ffc 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1969,6 +1969,34 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *p=
udp, unsigned long addr,
 }
 #endif
=20
+static int __record_subpages(struct page *page, unsigned long addr,
+			     unsigned long end, struct page **pages, int nr)
+{
+	int nr_recorded_pages =3D 0;
+
+	do {
+		pages[nr] =3D page;
+		nr++;
+		page++;
+		nr_recorded_pages++;
+	} while (addr +=3D PAGE_SIZE, addr !=3D end);
+	return nr_recorded_pages;
+}
+
+static void put_compound_head(struct page *page, int refs)
+{
+	/* Do a get_page() first, in case refs =3D=3D page->_refcount */
+	get_page(page);
+	page_ref_sub(page, refs);
+	put_page(page);
+}
+
+static void __huge_pt_done(struct page *head, int nr_recorded_pages, int *=
nr)
+{
+	*nr +=3D nr_recorded_pages;
+	SetPageReferenced(head);
+}
+
 #ifdef CONFIG_ARCH_HAS_HUGEPD
 static unsigned long hugepte_addr_end(unsigned long addr, unsigned long en=
d,
 				      unsigned long sz)
@@ -1998,33 +2026,20 @@ static int gup_hugepte(pte_t *ptep, unsigned long s=
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
+	refs =3D __record_subpages(page, addr, end, pages, *nr);
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
-	SetPageReferenced(head);
+	__huge_pt_done(head, refs, nr);
 	return 1;
 }
=20
@@ -2071,29 +2086,19 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, un=
signed long addr,
 					     pages, nr);
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
+	refs =3D __record_subpages(page, addr, end, pages, *nr);
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
-	SetPageReferenced(head);
+	__huge_pt_done(head, refs, nr);
 	return 1;
 }
=20
@@ -2114,29 +2119,19 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, un=
signed long addr,
 					     pages, nr);
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
+	refs =3D __record_subpages(page, addr, end, pages, *nr);
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
-	SetPageReferenced(head);
+	__huge_pt_done(head, refs, nr);
 	return 1;
 }
=20
@@ -2151,29 +2146,20 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, un=
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
+	refs =3D __record_subpages(page, addr, end, pages, *nr);
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
-	SetPageReferenced(head);
+	__huge_pt_done(head, refs, nr);
 	return 1;
 }
=20
--=20
2.23.0

