Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87035EE537
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 17:53:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Jlf3Cb3zF3Ds
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 03:53:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jglisse@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="FA5pznYb"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476JjP3YD6zDrDT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 03:51:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572886294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXrEUfVJUcd1erXFQw9FjfdFZzoYFLyJ24kgJsiz4yg=;
 b=FA5pznYbTukMnXNxUYEsr2a+sllUt2kUWtAghROFSu5I3R1caZebkFMC7bhvO3LvtAkDE/
 Q+vG1DDObqg4RQRmF1Ui4k8QwslEzxZl3u5pAyodA4YKKyO29NUXIZJsgk++a/ZANOwxAf
 057fbnJH43/COtEdZ8dXVklRKI09/xQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-zE3MYcgnMCiZjQzFEos_IQ-1; Mon, 04 Nov 2019 11:51:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AF6E8017DD;
 Mon,  4 Nov 2019 16:51:26 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E86D5C1B2;
 Mon,  4 Nov 2019 16:51:20 +0000 (UTC)
Date: Mon, 4 Nov 2019 11:51:18 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 02/18] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191104165118.GB5134@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-3-jhubbard@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-3-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: zE3MYcgnMCiZjQzFEos_IQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 03, 2019 at 01:17:57PM -0800, John Hubbard wrote:
> There are four locations in gup.c that have a fair amount of code
> duplication. This means that changing one requires making the same
> changes in four places, not to mention reading the same code four
> times, and wondering if there are subtle differences.
>=20
> Factor out the common code into static functions, thus reducing the
> overall line count and the code's complexity.
>=20
> Also, take the opportunity to slightly improve the efficiency of the
> error cases, by doing a mass subtraction of the refcount, surrounded
> by get_page()/put_page().
>=20
> Also, further simplify (slightly), by waiting until the the successful
> end of each routine, to increment *nr.
>=20
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Good cleanup.

Reviewed-by: J=E9r=F4me Glisse <jglisse@redhat.com>

> ---
>  mm/gup.c | 104 ++++++++++++++++++++++++-------------------------------
>  1 file changed, 45 insertions(+), 59 deletions(-)
>=20
> diff --git a/mm/gup.c b/mm/gup.c
> index 85caf76b3012..199da99e8ffc 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1969,6 +1969,34 @@ static int __gup_device_huge_pud(pud_t pud, pud_t =
*pudp, unsigned long addr,
>  }
>  #endif
> =20
> +static int __record_subpages(struct page *page, unsigned long addr,
> +=09=09=09     unsigned long end, struct page **pages, int nr)
> +{
> +=09int nr_recorded_pages =3D 0;
> +
> +=09do {
> +=09=09pages[nr] =3D page;
> +=09=09nr++;
> +=09=09page++;
> +=09=09nr_recorded_pages++;
> +=09} while (addr +=3D PAGE_SIZE, addr !=3D end);
> +=09return nr_recorded_pages;
> +}
> +
> +static void put_compound_head(struct page *page, int refs)
> +{
> +=09/* Do a get_page() first, in case refs =3D=3D page->_refcount */
> +=09get_page(page);
> +=09page_ref_sub(page, refs);
> +=09put_page(page);
> +}
> +
> +static void __huge_pt_done(struct page *head, int nr_recorded_pages, int=
 *nr)
> +{
> +=09*nr +=3D nr_recorded_pages;
> +=09SetPageReferenced(head);
> +}
> +
>  #ifdef CONFIG_ARCH_HAS_HUGEPD
>  static unsigned long hugepte_addr_end(unsigned long addr, unsigned long =
end,
>  =09=09=09=09      unsigned long sz)
> @@ -1998,33 +2026,20 @@ static int gup_hugepte(pte_t *ptep, unsigned long=
 sz, unsigned long addr,
>  =09/* hugepages are never "special" */
>  =09VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
> =20
> -=09refs =3D 0;
>  =09head =3D pte_page(pte);
> -
>  =09page =3D head + ((addr & (sz-1)) >> PAGE_SHIFT);
> -=09do {
> -=09=09VM_BUG_ON(compound_head(page) !=3D head);
> -=09=09pages[*nr] =3D page;
> -=09=09(*nr)++;
> -=09=09page++;
> -=09=09refs++;
> -=09} while (addr +=3D PAGE_SIZE, addr !=3D end);
> +=09refs =3D __record_subpages(page, addr, end, pages, *nr);
> =20
>  =09head =3D try_get_compound_head(head, refs);
> -=09if (!head) {
> -=09=09*nr -=3D refs;
> +=09if (!head)
>  =09=09return 0;
> -=09}
> =20
>  =09if (unlikely(pte_val(pte) !=3D pte_val(*ptep))) {
> -=09=09/* Could be optimized better */
> -=09=09*nr -=3D refs;
> -=09=09while (refs--)
> -=09=09=09put_page(head);
> +=09=09put_compound_head(head, refs);
>  =09=09return 0;
>  =09}
> =20
> -=09SetPageReferenced(head);
> +=09__huge_pt_done(head, refs, nr);
>  =09return 1;
>  }
> =20
> @@ -2071,29 +2086,19 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, =
unsigned long addr,
>  =09=09=09=09=09     pages, nr);
>  =09}
> =20
> -=09refs =3D 0;
>  =09page =3D pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
> -=09do {
> -=09=09pages[*nr] =3D page;
> -=09=09(*nr)++;
> -=09=09page++;
> -=09=09refs++;
> -=09} while (addr +=3D PAGE_SIZE, addr !=3D end);
> +=09refs =3D __record_subpages(page, addr, end, pages, *nr);
> =20
>  =09head =3D try_get_compound_head(pmd_page(orig), refs);
> -=09if (!head) {
> -=09=09*nr -=3D refs;
> +=09if (!head)
>  =09=09return 0;
> -=09}
> =20
>  =09if (unlikely(pmd_val(orig) !=3D pmd_val(*pmdp))) {
> -=09=09*nr -=3D refs;
> -=09=09while (refs--)
> -=09=09=09put_page(head);
> +=09=09put_compound_head(head, refs);
>  =09=09return 0;
>  =09}
> =20
> -=09SetPageReferenced(head);
> +=09__huge_pt_done(head, refs, nr);
>  =09return 1;
>  }
> =20
> @@ -2114,29 +2119,19 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, =
unsigned long addr,
>  =09=09=09=09=09     pages, nr);
>  =09}
> =20
> -=09refs =3D 0;
>  =09page =3D pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
> -=09do {
> -=09=09pages[*nr] =3D page;
> -=09=09(*nr)++;
> -=09=09page++;
> -=09=09refs++;
> -=09} while (addr +=3D PAGE_SIZE, addr !=3D end);
> +=09refs =3D __record_subpages(page, addr, end, pages, *nr);
> =20
>  =09head =3D try_get_compound_head(pud_page(orig), refs);
> -=09if (!head) {
> -=09=09*nr -=3D refs;
> +=09if (!head)
>  =09=09return 0;
> -=09}
> =20
>  =09if (unlikely(pud_val(orig) !=3D pud_val(*pudp))) {
> -=09=09*nr -=3D refs;
> -=09=09while (refs--)
> -=09=09=09put_page(head);
> +=09=09put_compound_head(head, refs);
>  =09=09return 0;
>  =09}
> =20
> -=09SetPageReferenced(head);
> +=09__huge_pt_done(head, refs, nr);
>  =09return 1;
>  }
> =20
> @@ -2151,29 +2146,20 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, =
unsigned long addr,
>  =09=09return 0;
> =20
>  =09BUILD_BUG_ON(pgd_devmap(orig));
> -=09refs =3D 0;
> +
>  =09page =3D pgd_page(orig) + ((addr & ~PGDIR_MASK) >> PAGE_SHIFT);
> -=09do {
> -=09=09pages[*nr] =3D page;
> -=09=09(*nr)++;
> -=09=09page++;
> -=09=09refs++;
> -=09} while (addr +=3D PAGE_SIZE, addr !=3D end);
> +=09refs =3D __record_subpages(page, addr, end, pages, *nr);
> =20
>  =09head =3D try_get_compound_head(pgd_page(orig), refs);
> -=09if (!head) {
> -=09=09*nr -=3D refs;
> +=09if (!head)
>  =09=09return 0;
> -=09}
> =20
>  =09if (unlikely(pgd_val(orig) !=3D pgd_val(*pgdp))) {
> -=09=09*nr -=3D refs;
> -=09=09while (refs--)
> -=09=09=09put_page(head);
> +=09=09put_compound_head(head, refs);
>  =09=09return 0;
>  =09}
> =20
> -=09SetPageReferenced(head);
> +=09__huge_pt_done(head, refs, nr);
>  =09return 1;
>  }
> =20
> --=20
> 2.23.0
>=20

